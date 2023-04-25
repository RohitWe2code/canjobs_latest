<?php

Header('Access-Control-Allow-Origin: *'); //for allow any domain, insecure



Header('Access-Control-Allow-Headers: *'); //for allow any headers, insecure



Header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE'); //



defined('BASEPATH') OR exit('No direct script access allowed');



require APPPATH.'libraries/REST_Controller.php';



class Admin_registration extends REST_Controller{



  public function __construct(){



    parent::__construct();

    //load database

    $this->load->database();

    $this->load->model(array("admin_model"));

    $this->load->library(array("form_validation"));

    $this->load->library('Authorization_Token');

    $this->load->helper("security");

    $this->load->helper('url');

  }



  public function login_post()

    {

        $email = $this->security->xss_clean($this->input->post("email"));

        $password = $this->security->xss_clean($this->input->post("password"));



        $this->form_validation->set_rules('email', 'Email', 'required');

        $this->form_validation->set_rules('password', 'Password', 'required');

        if ($this->form_validation->run()) {

            $credentials = array('email' => $email, 'password' => md5($password)); //md5($password)

            $loginStatus = $this->admin_model->checkLogin($credentials);

            //  print_r($loginStatus);die;

            if ($loginStatus != false) {

                $userId = array('admin_id' => $loginStatus->admin_id,
                                'user_type' => $loginStatus->admin_type);

                $bearerToken = $this->authorization_token->generateToken($userId);

                $responseData = array(

                    'status' => true,

                    'message' => 'Successfully Logged In',

                    'admin_id'=>$loginStatus->admin_id,

                    'user_type'=>$loginStatus->admin_type,

                    'token' => $bearerToken,

                );

                return $this->response($responseData, 200);

            } else {

                $responseData = array(

                    'status' => false,

                    'message' => 'Invalid Credentials',

                    'data' => []

                );

                return $this->response($responseData);

            }

        } else {

            $responseData = array(

                'status' => false,

                'message' => 'Email-id and password are required!',

                'data' => []

            );

            return $this->response($responseData);

        }

    }

}