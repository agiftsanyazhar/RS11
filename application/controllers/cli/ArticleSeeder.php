<?php
defined('BASEPATH') or exit('No direct script access allowed');

class ArticleSeeder extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();

        $this->load->model('ArticleModel');
    }

    public function index()
    {
        for ($i = 1; $i <= 100; $i++) {
            $article = [
                'title' => 'Sample Article ' . $i,
                'content' => 'This is the content of Sample Article ' . $i . '.',
                'category' => $this->getRandomCategory(),
                'created_by' => rand(1, 3),
            ];

            $this->ArticleModel->createArticle($article);

            echo "'{$article['title']}' berhasil ditambahkan.\n";
        }
    }

    // Helper function to get random category
    private function getRandomCategory()
    {
        $categories = ['Kesehatan', 'Pendidikan', 'Teknologi'];
        return $categories[rand(0, count($categories) - 1)];
    }
}
