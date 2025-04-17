<?php
defined('BASEPATH') or exit('No direct script access allowed');

class ArticleController extends CI_Controller
{
    public function index()
    {
        $this->load->view('article_view');
    }

    public function create()
    {
        $this->load->view('article_create_view');
    }

    public function edit($id)
    {
        $this->load->view('article_edit_view');
    }
}
