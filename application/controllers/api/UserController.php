<?php

use chriskacerguis\RestServer\RestController;

class UserController extends RestController
{
    protected $authUser;

    public function __construct()
    {
        parent::__construct();

        $this->load->model('UserModel');
        $this->load->library('form_validation');

        $this->authUser = requireJwt();
    }

    public function index_get()
    {
        try {
            requireRole(['Admin', 'Editor', 'User']);

            $limit = $this->get('limit') ? $this->get('limit') : 10;
            $page = $this->get('page') ? $this->get('page') : 1;

            $username = $this->get('username') ? $this->get('username') : '';
            $role = $this->get('role') ? $this->get('role') : '';

            $offset = ($page - 1) * $limit;

            $users = $this->UserModel->getAllUsers($limit, $offset, $username, $role);

            $totalUsers = $this->UserModel->countAllUsers($username, $role);

            if (!$users) {
                return $this->response([
                    'status' => false,
                    'message' => 'No users found.'
                ], RestController::HTTP_NOT_FOUND);
            }

            $totalPages = ceil($totalUsers / $limit);

            return $this->response([
                'status' => true,
                'pagination' => [
                    'current_page' => $page,
                    'total_pages' => $totalPages,
                    'total_users' => $totalUsers,
                    'limit' => $limit
                ],
                'data' => array_map(function ($user) {
                    unset($user->password);
                    return $user;
                }, $users),
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
            requireRole(['Admin']);

            $this->form_validation->set_rules('username', 'Username', 'required|is_unique[users.username]');
            $this->form_validation->set_rules('password', 'Password', 'required|min_length[8]');
            $this->form_validation->set_rules('role', 'Role', 'required|in_list[Admin,Editor,User]');

            if ($this->form_validation->run() == FALSE) {
                return $this->response([
                    'status' => false,
                    'message' => validation_errors()
                ], RestController::HTTP_BAD_REQUEST);
            }

            $data = [
                'username' => htmlspecialchars($this->input->post('username'), ENT_QUOTES),
                'password' => password_hash($this->input->post('password'), PASSWORD_DEFAULT),
                'role' => htmlspecialchars($this->input->post('role'), ENT_QUOTES),
            ];

            $createdUser = $this->UserModel->createUser($data);

            if (!$createdUser) {
                return $this->response([
                    'status' => false,
                    'message' => 'User could not be created.'
                ], RestController::HTTP_INTERNAL_SERVER_ERROR);
            }

            return $this->response([
                'status' => true,
                'message' => 'User created successfully.'
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

            $user = $this->UserModel->getUser($id);

            if (!$user) {
                return $this->response([
                    'status' => false,
                    'message' => 'User not found.'
                ], RestController::HTTP_NOT_FOUND);
            }

            return $this->response([
                'status' => true,
                'data' => [
                    'id' => $user->id,
                    'username' => $user->username,
                    'role' => $user->role,
                ]
            ], RestController::HTTP_OK);
        } catch (Exception $e) {
            return $this->response([
                'status' => false,
                'message' => $e->getMessage()
            ], RestController::HTTP_NOT_FOUND);
        }
    }

    public function update_put($id)
    {
        try {
            requireRole(['Admin']);

            $user = $this->UserModel->getUser($id);

            if (!$user) {
                return $this->response([
                    'status' => false,
                    'message' => 'User not found.'
                ], RestController::HTTP_NOT_FOUND);
            }

            $putData = $this->put();
            if (empty($putData)) {
                parse_str(file_get_contents("php://input"), $putData);
            }

            $this->form_validation->set_data($putData);

            $this->form_validation->set_rules('username', 'Username', 'required|is_unique[users.username.id.' . $id . ']');
            $this->form_validation->set_rules('password', 'Password', 'required|min_length[8]');
            $this->form_validation->set_rules('role', 'Role', 'required|in_list[Admin,Editor,User]');

            if ($this->form_validation->run() == FALSE) {
                return $this->response([
                    'status' => false,
                    'message' => validation_errors()
                ], RestController::HTTP_BAD_REQUEST);
            }

            $data = [
                'username' => htmlspecialchars($putData['username'], ENT_QUOTES),
                'password' => password_hash($putData['password'], PASSWORD_DEFAULT),
                'role' => htmlspecialchars($putData['role'], ENT_QUOTES),
            ];

            $updatedUser = $this->UserModel->updateUser($id, $data);

            if (!$updatedUser) {
                return $this->response([
                    'status' => false,
                    'message' => 'User could not be updated.'
                ], RestController::HTTP_INTERNAL_SERVER_ERROR);
            }

            return $this->response([
                'status' => true,
                'message' => 'User updated successfully.'
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

            $user = $this->UserModel->getUser($id);

            if (!$user) {
                return $this->response([
                    'status' => false,
                    'message' => 'User not found.'
                ], RestController::HTTP_NOT_FOUND);
            }

            $deletedUser = $this->UserModel->deleteUser($id);

            if (!$deletedUser) {
                return $this->response([
                    'status' => false,
                    'message' => 'Failed to delete the user.'
                ], RestController::HTTP_INTERNAL_SERVER_ERROR);
            }

            return $this->response([
                'status' => true,
                'message' => 'User deleted successfully.'
            ], RestController::HTTP_OK);
        } catch (Exception $e) {
            return $this->response([
                'status' => false,
                'message' => $e->getMessage()
            ], RestController::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
}
