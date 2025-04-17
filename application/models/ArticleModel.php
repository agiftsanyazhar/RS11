<?php
class ArticleModel extends CI_Model
{
    public function getAllArticles($limit = 10, $offset = 0, $title = '', $category = '')
    {
        if (!empty($title)) {
            $this->db->like('title', $title);
        }
        if (!empty($category)) {
            $this->db->where('category', $category);
        }

        $this->db->select('articles.*, users.username');
        $this->db->join('users', 'articles.created_by = users.id');
        $articles = $this->db->get('articles', $limit, $offset)
            ->result();
        return $articles;
    }

    public function getArticle($id)
    {
        $article = $this->db->get_where('articles', ['id' => $id])
            ->row();
        return $article;
    }

    public function countAllArticles($title = '', $category = '')
    {
        if (!empty($title)) {
            $this->db->like('title', $title);
        }
        if (!empty($category)) {
            $this->db->where('category', $category);
        }

        return $this->db->count_all_results('articles');
    }

    public function createArticle($data)
    {
        $createArticle = $this->db->insert('articles', $data);
        return $createArticle;
    }

    public function updateArticle($id, $data)
    {
        $updateArticle = $this->db->update('articles', $data, ['id' => $id]);
        return $updateArticle;
    }

    public function deleteArticle($id)
    {
        $deleteArticle = $this->db->delete('articles', ['id' => $id]);
        return $deleteArticle;
    }
}
