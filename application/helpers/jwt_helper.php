<?php

defined('BASEPATH') or exit('No direct script access allowed');

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

// Generate JWT token
function generateJwt($payload)
{
    $CI = &get_instance();
    $CI->load->config('jwt');

    $key = $CI->config->item('jwt_key');
    $algorithm = $CI->config->item('jwt_algorithm');
    $expiry = $CI->config->item('jwt_token_expiry');

    $payload['iat'] = time();
    $payload['exp'] = time() + $expiry;

    return JWT::encode($payload, $key, $algorithm);
}

// Decode JWT token
function decodeJwt($token)
{
    $CI = &get_instance();
    $CI->load->config('jwt');

    $key = $CI->config->item('jwt_key');
    $algorithm = $CI->config->item('jwt_algorithm');

    return JWT::decode($token, new Key($key, $algorithm));
}

// Get Bearer token from Authorization header
function getBearerToken()
{
    $headers = apache_request_headers();
    if (!empty($headers['Authorization'])) {
        if (preg_match('/Bearer\s(\S+)/', $headers['Authorization'], $matches)) {
            return $matches[1];
        }
    }
    return null;
}

// Middleware: Require valid JWT
function requireJwt()
{
    $CI = &get_instance();
    $token = getBearerToken();

    if (!$token) {
        $CI->output
            ->set_status_header(401)
            ->set_content_type('application/json')
            ->set_output(json_encode([
                'status' => false,
                'message' => 'Unauthorized: No token provided.'
            ]))
            ->_display();
        exit;
    }

    try {
        $decoded = decodeJwt($token);
        return $decoded;
    } catch (Exception $e) {
        $CI->output
            ->set_status_header(401)
            ->set_content_type('application/json')
            ->set_output(json_encode([
                'status' => false,
                'message' => 'Unauthorized: Invalid token.'
            ]))
            ->_display();
        exit;
    }
}
