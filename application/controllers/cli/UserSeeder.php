<?php
defined('BASEPATH') or exit('No direct script access allowed');

class UserSeeder extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();

        $this->load->model('UserModel');
    }

    public function index()
    {
        $users = [
            [
                'username' => 'admin',
                'password' => password_hash('12345678', PASSWORD_DEFAULT),
                'role'     => 'Admin',
            ],
            [
                'username' => 'editor',
                'password' => password_hash('12345678', PASSWORD_DEFAULT),
                'role'     => 'Editor',
            ],
            [
                'username' => 'user',
                'password' => password_hash('12345678', PASSWORD_DEFAULT),
                'role'     => 'User',
            ],
        ];

        foreach ($users as $user) {
            $this->db->where('username', $user['username']);
            $exists = $this->db->get('users')
                ->row();

            if (!$exists) {
                $this->UserModel->createUser($user);
                echo "'{$user['username']}' berhasil ditambahkan.\n";
            } else {
                echo "'{$user['username']}' sudah ada, dilewati.\n";
            }
        }

        for ($i = 1; $i <= 100; $i++) {
            $user = [
                'username' => 'user' . $i,
                'password' => password_hash('12345678', PASSWORD_DEFAULT),
                'role'     => $this->getRandomRole(),
            ];

            $this->UserModel->createUser($user);

            echo "'{$user['username']}' berhasil ditambahkan.\n";
        }
    }

    private function getRandomRole()
    {
        $roles = ['Admin', 'Editor', 'User'];
        return $roles[rand(0, count($roles) - 1)];
    }
}
