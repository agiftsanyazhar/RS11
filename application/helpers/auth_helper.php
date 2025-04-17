<?php

defined('BASEPATH') or exit('No direct script access allowed');

// Check if user is logged in
function is_logged_in()
{
    $CI = &get_instance();
    return $CI->session->userdata('is_logged_in') === true;
}

// Get current user's role from session
function currentUserRole()
{
    $CI = &get_instance();
    return $CI->session->userdata('role');
}

// Require login and role-based access
function requireRole($roles = [])
{
    $CI = &get_instance();

    if (!is_logged_in()) {
        $CI->output
            ->set_status_header(401)
            ->set_content_type('application/json')
            ->set_output(json_encode([
                'status' => false,
                'message' => 'You must be logged in to access this resource.'
            ]))
            ->_display();
        exit;
    }

    $userRole = currentUserRole();

    if (!in_array($userRole, (array) $roles)) {
        $CI->output
            ->set_status_header(403)
            ->set_content_type('application/json')
            ->set_output(json_encode([
                'status' => false,
                'message' => 'Access denied. You do not have permission to perform this action.'
            ]))
            ->_display();
        exit;
    }
}
