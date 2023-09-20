<?php
Header('Access-Control-Allow-Origin: *'); //for allow any domain, insecure
// Header('Access-Control-Allow-Headers: *'); //for allow any headers, insecure
Header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE'); //
header("Access-Control-Allow-Headers: Content-Type, Content-Length, Accept-Encoding");
defined('BASEPATH') OR exit('No direct script access allowed');
require APPPATH.'libraries/REST_Controller.php';
class Admin_registration extends REST_Controller{
      public function __construct(){
        parent::__construct();

    //load database

    $this->load->database();

    $this->load->model(array("admin_model"));

    $this->load->model(array("common_model"));

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
                                'email' => $loginStatus->email,
                                'user_type' => $loginStatus->admin_type);

                $bearerToken = $this->authorization_token->generateToken($userId);

                $responseData = array(

                    'status' => true,

                    'message' => 'Successfully Logged In',

                    'admin_id'=>$loginStatus->admin_id,

                    'name'=>$loginStatus->name,

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
    public function forgetPassword_post(){
          $data = json_decode(file_get_contents("php://input"));
           if (isset($data->forget_email)){
               if(empty($data->forget_email)){
                     $this->response(array(
                    "status" => 0,
                    "message" => "Fields must not be empty !"
                    ) , REST_Controller::HTTP_OK);
                    return;
               }
             $email = array('email' => $data->forget_email);
             $loginStatus = $this->admin_model->checkLogin($email);
             if ($loginStatus != false) {
                // print_r($loginStatus);die;
               $detail = array('admin_id'=>$loginStatus->admin_id,
                                'token'=> md5($loginStatus->email));
               if($this->admin_model->addUpdateAdmin($detail)){
                             $detail['email']=$loginStatus->email;
                             $detail['subject']='Reset password';
                             $detail['message']='Hello, '.$loginStatus->name.' click on the link to reset your password http://localhost:3000/resetpassword/admin:'.$detail['token'];
                      
                      //  $employee['token'] = $token;
                           $this->common_model->sendMail($detail);
                            $this->response(array(
                            "status" => 1,
                            "message" => "Sent you a mail"
                            ) , REST_Controller::HTTP_OK);
                            return;
                       }
         
            } else {
              $this->response(array(
                    "status" => 0,
                    "message" => "No user found"
                    ) , REST_Controller::HTTP_OK);
                    return;
            }
           } else {
             $this->response(array(
                    "status" => 0,
                    "message" => "Email id required!"
                    ) , REST_Controller::HTTP_OK);
                    return;
        }
    }
  public function resetPassword_put(){
        
        // print_r($this->uri->segment(2));die;
        $data = json_decode(file_get_contents("php://input"));
         if (isset($data->password) && isset($data->conf_password) && isset($data->token)){
               if(empty($data->password) || empty($data->conf_password) || empty($data->token)){
                     $this->response(array(
                    "status" => 0,
                    "message" => "Fields must not be empty !"
                    ) , REST_Controller::HTTP_OK);
                    return;
               }
               if($data->password !== $data->conf_password){
                 $this->response(array(
                    "status" => 0,
                    "message" => "password and confirm password must be same !"
                    ) , REST_Controller::HTTP_OK);
                    return;
               }
                $reset_details = array('token' => $data->token,'password' => md5($data->password));
              if($this->admin_model->resetPassword($reset_details)){
                  $this->response(array(
                    "status" => 1,
                    "message" => "Password updated successfully"
                    ) , REST_Controller::HTTP_OK);
                    return;
            } else {
               $this->response(array(
                    "status" => 0,
                    "message" => "failed to update password"
                    ) , REST_Controller::HTTP_OK);
                    return;
               }
           } else {
              $this->response(array(
                    "status" => 0,
                    "message" => "all fields are required!"
                    ) , REST_Controller::HTTP_OK);
                    return;
        }

    }
 

}