<?php
defined('BASEPATH') or exit('No direct script access allowed');

class UserController extends CI_Controller
{
    public function index()
    {
        $this->load->view('user_view');
    }

    public function create()
    {
        $this->load->view('user_create_view');
    }

    public function edit($id)
    {
        $this->load->view('user_edit_view');
    }
}
