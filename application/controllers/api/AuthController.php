<?php
defined('BASEPATH') or exit('No direct script access allowed');

use chriskacerguis\RestServer\RestController;

class AuthController extends RestController
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('UserModel');
        $this->load->library('session');
    }

    public function login_post()
    {
        try {
            $username = $this->post('username');
            $password = $this->post('password');
            $recaptcha = $this->post('recaptcha');

            if (!$username || !$password || !$recaptcha) {
                return $this->response([
                    'status' => false,
                    'message' => 'Username, password, and reCAPTCHA are required.'
                ], RestController::HTTP_BAD_REQUEST);
            }

            // Validate reCAPTCHA
            $secret = '6LfDFhQrAAAAAHViQLxYkLuNMEcqBmKoOU1UbJ8E';
            $verify = file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret={$secret}&response={$recaptcha}");
            $captcha_success = json_decode($verify);

            if (!$captcha_success->success) {
                return $this->response([
                    'status' => false,
                    'message' => 'reCAPTCHA verification failed.'
                ], RestController::HTTP_BAD_REQUEST);
            }

            // Check user
            $user = $this->UserModel->getUserByUsername($username);

            if (!$user || !password_verify($password, $user['password'])) {
                return $this->response([
                    'status' => false,
                    'message' => 'Invalid username or password'
                ], RestController::HTTP_UNAUTHORIZED);
            }

            // Set session
            $this->session->set_userdata([
                'is_logged_in' => true,
                'user_id' => $user['id'],
                'username' => $user['username'],
                'role' => $user['role'],
            ]);

            // Generate JWT
            $this->load->helper('jwt_helper');
            $token = generateJwt([
                'id' => $user['id'],
                'username' => $user['username'],
                'role' => $user['role']
            ]);

            return $this->response([
                'status' => true,
                'message' => 'Login successful.',
                'data' => [
                    'token' => $token,
                    'id' => $user['id'],
                    'username' => $user['username'],
                    'role' => $user['role']
                ]
            ], RestController::HTTP_OK);
        } catch (Exception $e) {
            return $this->response([
                'status' => false,
                'message' => $e->getMessage()
            ], RestController::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function whoAmI_get()
    {
        try {
            requireJwt();

            return $this->response([
                'logged_in' => is_logged_in(),
                'role' => currentUserRole(),
                'session_data' => $this->session->userdata()
            ], RestController::HTTP_OK);
        } catch (Exception $e) {
            return $this->response([
                'status' => false,
                'message' => $e->getMessage()
            ], RestController::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function logout_get()
    {
        try {
            requireJwt();

            $this->session->sess_destroy();
            return $this->response([
                'status' => true,
                'message' => 'Logged out successfully.'
            ], RestController::HTTP_OK);
        } catch (Exception $e) {
            return $this->response([
                'status' => false,
                'message' => $e->getMessage()
            ], RestController::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
}
