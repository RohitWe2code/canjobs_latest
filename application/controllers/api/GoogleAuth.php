<?php
defined('BASEPATH') or exit('No direct script access allowed');

class GoogleAuth extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('google');
    }

    public function index()
    {
        redirect($this->google->getAuthUrl());
    }

    public function callback()
    {
        $code = $this->input->get('code');

        if ($code) {
            $userInfo = $this->google->authenticate($code);

            if ($userInfo) {
                // Process the authenticated user's information
                // e.g., store it in the database or log the user in
                var_dump($userInfo);
            } else {
                echo 'Failed to authenticate with Google.';
            }
        } else {
            echo 'Invalid authorization code.';
        }
    }
}
