<?php

use chriskacerguis\RestServer\RestController;

class ArticleController extends RestController
{
    protected $authUser;

    public function __construct()
    {
        parent::__construct();

        $this->load->model('ArticleModel');
        $this->load->library('form_validation');
        $this->load->library('upload');

        $this->authUser = requireJwt();
    }

    public function index_get()
    {
        try {
            requireRole(['Admin', 'Editor', 'User']);

            // Get pagination parameters from the query string
            $limit = $this->get('limit') ? $this->get('limit') : 10;
            $page = $this->get('page') ? $this->get('page') : 1;

            // Get search and filter parameters
            $title = $this->get('title') ? $this->get('title') : '';
            $category = $this->get('category') ? $this->get('category') : '';

            // Calculate the offset based on the page number
            $offset = ($page - 1) * $limit;

            $articles = $this->ArticleModel->getAllArticles($limit, $offset, $title, $category);

            $totalArticles = $this->ArticleModel->countAllArticles($title, $category);

            if (!$articles) {
                return $this->response([
                    'status' => false,
                    'message' => 'No articles found.'
                ], RestController::HTTP_NOT_FOUND);
            }

            $totalPages = ceil($totalArticles / $limit);

            return $this->response([
                'status' => true,
                'pagination' => [
                    'current_page' => $page,
                    'total_pages' => $totalPages,
                    'total_articles' => $totalArticles,
                    'limit' => $limit
                ],
                'data' => $articles,
            ], RestController::HTTP_OK);
        } catch (Exception $e) {
            return $this->response([
                'status' => false,
                'message' => $e->getMessage()
            ], RestController::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function store_post()
    {
        try {
            requireRole(['Admin', 'Editor']);

            $this->form_validation->set_rules('title', 'Title', 'required|min_length[3]|max_length[255]');
            $this->form_validation->set_rules('content', 'Content', 'required|min_length[5]');
            $this->form_validation->set_rules('category', 'Category', 'required');

            if ($this->form_validation->run() == FALSE) {
                return $this->response([
                    'status' => false,
                    'message' => validation_errors()
                ], RestController::HTTP_BAD_REQUEST);
            }

            $uploadData = null;
            $fileName = null;

            if (isset($_FILES['uploaded_file'])) {
                // Upload configuration
                $config['upload_path'] = FCPATH . 'assets/uploads/';
                $config['allowed_types'] = 'jpg|jpeg|png|pdf';
                $config['max_size'] = 2048;
                $config['encrypt_name'] = TRUE;

                // Initialize the upload library with the config
                $this->upload->initialize($config);

                // Upload the file
                if (!$this->upload->do_upload('uploaded_file')) {
                    return $this->response([
                        'status' => false,
                        'message' => $this->upload->display_errors()
                    ], RestController::HTTP_BAD_REQUEST);
                }

                // Get file data
                $uploadData = $this->upload->data();
                $fileName = $uploadData['file_name'];
            }

            $data = [
                'title' => htmlspecialchars($this->input->post('title'), ENT_QUOTES),
                'content' => htmlspecialchars($this->input->post('content'), ENT_QUOTES),
                'category' => htmlspecialchars($this->input->post('category'), ENT_QUOTES),
                'uploaded_file' => $fileName,
                'created_by' => $this->authUser->id,
            ];

            $createdArticle = $this->ArticleModel->createArticle($data);

            if (!$createdArticle) {
                return $this->response([
                    'status' => false,
                    'message' => 'Article could not be created.'
                ], RestController::HTTP_INTERNAL_SERVER_ERROR);
            }

            return $this->response([
                'status' => true,
                'message' => 'Article created successfully.'
            ], RestController::HTTP_CREATED);
        } catch (Exception $e) {
            return $this->response([
                'status' => false,
                'message' => $e->getMessage()
            ], RestController::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function show_get($id)
    {
        try {
            requireRole(['Admin', 'Editor', 'User']);

            $article = $this->ArticleModel->getArticle($id);

            if (!$article) {
                return $this->response([
                    'status' => false,
                    'message' => 'Article not found.'
                ], RestController::HTTP_NOT_FOUND);
            }

            return $this->response([
                'status' => true,
                'data' => $article
            ], RestController::HTTP_OK);
        } catch (Exception $e) {
            return $this->response([
                'status' => false,
                'message' => $e->getMessage()
            ], RestController::HTTP_NOT_FOUND);
        }
    }

    public function updatePut_put($id)
    {
        try {
            requireRole(['Admin', 'Editor']);

            $article = $this->ArticleModel->getArticle($id);

            if (!$article) {
                return $this->response([
                    'status' => false,
                    'message' => 'Article not found.'
                ], RestController::HTTP_NOT_FOUND);
            }

            // Force GET raw PUT data
            $putData = $this->put();
            if (empty($putData)) {
                parse_str(file_get_contents("php://input"), $putData);
            }

            // Validation
            $this->form_validation->set_data($putData);

            $this->form_validation->set_rules('title', 'Title', 'required|min_length[3]|max_length[255]');
            $this->form_validation->set_rules('content', 'Content', 'required|min_length[5]');
            $this->form_validation->set_rules('category', 'Category', 'required');

            if ($this->form_validation->run() == FALSE) {
                return $this->response([
                    'status' => false,
                    'message' => validation_errors()
                ], RestController::HTTP_BAD_REQUEST);
            }

            $filePath = FCPATH . 'assets/uploads/' . $article->uploaded_file;

            if (file_exists($filePath) && is_file($filePath)) {
                if (!unlink($filePath)) {
                    return $this->response([
                        'status' => false,
                        'message' => 'Failed to delete the file.'
                    ], RestController::HTTP_INTERNAL_SERVER_ERROR);
                }
            }

            $uploadData = null;
            $fileName = null;

            if (isset($_FILES['uploaded_file'])) {
                $config['upload_path'] = FCPATH . 'assets/uploads/';
                $config['allowed_types'] = 'jpg|jpeg|png|pdf';
                $config['max_size'] = 2048;
                $config['encrypt_name'] = TRUE;

                $this->upload->initialize($config);

                if (!$this->upload->do_upload('uploaded_file')) {
                    return $this->response([
                        'status' => false,
                        'message' => $this->upload->display_errors()
                    ], RestController::HTTP_BAD_REQUEST);
                }

                $uploadData = $this->upload->data();
                $fileName = $uploadData['file_name'];
            }

            $data = [
                'title' => htmlspecialchars($this->put('title'), ENT_QUOTES),
                'content' => htmlspecialchars($this->put('content'), ENT_QUOTES),
                'category' => htmlspecialchars($this->put('category'), ENT_QUOTES),
                'uploaded_file' => $fileName,
            ];

            $updatedArticle = $this->ArticleModel->updateArticle($id, $data);

            if (!$updatedArticle) {
                return $this->response([
                    'status' => false,
                    'message' => 'Article could not be updated.'
                ], RestController::HTTP_INTERNAL_SERVER_ERROR);
            }

            return $this->response([
                'status' => true,
                'message' => 'Article updated successfully.'
            ], RestController::HTTP_OK);
        } catch (Exception $e) {
            return $this->response([
                'status' => false,
                'message' => $e->getMessage()
            ], RestController::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function updatePost_post($id)
    {
        try {
            requireRole(['Admin', 'Editor']);

            $article = $this->ArticleModel->getArticle($id);

            if (!$article) {
                return $this->response([
                    'status' => false,
                    'message' => 'Article not found.'
                ], RestController::HTTP_NOT_FOUND);
            }

            $this->form_validation->set_rules('title', 'Title', 'required|min_length[3]|max_length[255]');
            $this->form_validation->set_rules('content', 'Content', 'required|min_length[5]');
            $this->form_validation->set_rules('category', 'Category', 'required');

            if ($this->form_validation->run() == FALSE) {
                return $this->response([
                    'status' => false,
                    'message' => validation_errors()
                ], RestController::HTTP_BAD_REQUEST);
            }

            $filePath = FCPATH . 'assets/uploads/' . $article->uploaded_file;

            if (file_exists($filePath) && is_file($filePath)) {
                if (!unlink($filePath)) {
                    return $this->response([
                        'status' => false,
                        'message' => 'Failed to delete the file.'
                    ], RestController::HTTP_INTERNAL_SERVER_ERROR);
                }
            }

            $uploadData = null;
            $fileName = null;

            if (isset($_FILES['uploaded_file'])) {
                $config['upload_path'] = FCPATH . 'assets/uploads/';
                $config['allowed_types'] = 'jpg|jpeg|png|pdf';
                $config['max_size'] = 2048;
                $config['encrypt_name'] = TRUE;

                $this->upload->initialize($config);

                if (!$this->upload->do_upload('uploaded_file')) {
                    return $this->response([
                        'status' => false,
                        'message' => $this->upload->display_errors()
                    ], RestController::HTTP_BAD_REQUEST);
                }

                $uploadData = $this->upload->data();
                $fileName = $uploadData['file_name'];
            }

            $data = [
                'title' => htmlspecialchars($this->input->post('title'), ENT_QUOTES),
                'content' => htmlspecialchars($this->input->post('content'), ENT_QUOTES),
                'category' => htmlspecialchars($this->input->post('category'), ENT_QUOTES),
                'uploaded_file' => $fileName,
                'created_by' => $this->authUser->id,
            ];

            $updatedArticle = $this->ArticleModel->updateArticle($id, $data);

            if (!$updatedArticle) {
                return $this->response([
                    'status' => false,
                    'message' => 'Article could not be updated.'
                ], RestController::HTTP_INTERNAL_SERVER_ERROR);
            }

            return $this->response([
                'status' => true,
                'message' => 'Article updated successfully.'
            ], RestController::HTTP_OK);
        } catch (Exception $e) {
            return $this->response([
                'status' => false,
                'message' => $e->getMessage()
            ], RestController::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function delete_delete($id)
    {
        try {
            requireRole(['Admin']);

            $article = $this->ArticleModel->getArticle($id);

            if (!$article) {
                return $this->response([
                    'status' => false,
                    'message' => 'Article not found.'
                ], RestController::HTTP_NOT_FOUND);
            }

            $filePath = FCPATH . 'assets/uploads/' . $article->uploaded_file;

            if (file_exists($filePath) && is_file($filePath)) {
                if (!unlink($filePath)) {
                    return $this->response([
                        'status' => false,
                        'message' => 'Failed to delete the file.'
                    ], RestController::HTTP_INTERNAL_SERVER_ERROR);
                }
            }

            $deletedArticle = $this->ArticleModel->deleteArticle($id);

            if (!$deletedArticle) {
                return $this->response([
                    'status' => false,
                    'message' => 'Failed to delete the article.'
                ], RestController::HTTP_INTERNAL_SERVER_ERROR);
            }

            return $this->response([
                'status' => true,
                'message' => 'Article deleted successfully.'
            ], RestController::HTTP_OK);
        } catch (Exception $e) {
            return $this->response([
                'status' => false,
                'message' => $e->getMessage()
            ], RestController::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
}
