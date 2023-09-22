<?php
Header('Access-Control-Allow-Origin: *'); //for allow any domain, insecure
Header('Access-Control-Allow-Headers: *'); //for allow any headers, insecure
Header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE'); //
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH.'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';


class Employee_registration extends REST_Controller{

  public function __construct(){

    parent::__construct();
    //load database
    $this->load->database();
    $this->load->model(array("employee_model"));
    $this->load->model(array("common_model"));
    $this->load->library(array("form_validation"));
    $this->load->library('Authorization_Token');
    $this->load->helper("security");
    $this->load->helper('url');
    $this->admin_email = "aashi.we2code@gmail.com";
  }
  // public function index_get(){

  // }
  public function signup_post(){
    
    $email = $this->security->xss_clean($this->input->post("email"));
    $password = $this->security->xss_clean($this->input->post("password"));
    $resume =$this->input->post("resume");
    $reffer_by =$this->input->post("reffer_by");
    $otp =$this->input->post("otp");
            // echo("resume outside: $resume <br>");

if($resume) {
              // echo("resume base 64: $resume <br>");die;
    $cv_data = base64_decode($resume);
    $file_name_for_upload = time().'.pdf';
    $file_path = FCPATH . 'uploads/' . $file_name_for_upload;
    if(file_put_contents($file_path, $cv_data)) {
        $cv = base_url() . 'uploads/' . $file_name_for_upload;
                  //  echo("link for database : $resume");

    } else {
        // File upload failed
    }
} 
    
    // form validation for inputs
    $this->form_validation->set_rules("email", "Email", "required|valid_email");
    $this->form_validation->set_rules("password", "password", "required");
    $this->form_validation->set_rules("reffer_by", "reffer_by", "required");
    $this->form_validation->set_rules("otp", "otp", "required");

    // checking form submittion have any error or not
    if($this->form_validation->run() === FALSE){

      // we have some errors
      $this->response(array(
        "status" => 0,
        "message" => "All fields are required!"
      ) , REST_Controller::HTTP_OK);
      return;
  }   
     $existing_email = $email;
     $existing_employee = $this->employee_model->get_employee_by_email($existing_email);
        if($existing_employee){
        $this->response(array(
        "status" => 0,
        "message" => "Email already exists"
        ), REST_Controller::HTTP_OK);
        return;
        }
     
// print_r($validate_otp);die;
      if(!empty($email) && !empty($password) && !empty($otp)){
        $validate_otp = $this->common_model->validate_otp($email,$otp);
        if(!$validate_otp){
        $this->response(array(
        "status" => 0,
        "message" => " incorrect otp "
        ), REST_Controller::HTTP_OK);
        return;
        }
        // all values are available
        $employee = array(
         
          "email" => $email,
          "password" => md5($password),
          "reffer_by" =>$reffer_by,
        
        );
         if(isset($cv)){
          if(!empty($cv))
            {
               $employee["resume"] = $cv;
            }
            }
            $response = $this->employee_model->insert_employee($employee);
            // print_r($response);die;
            if($response){
              $unique_id = $this->common_model->getLastRecord_email()['id'] ?? 1;
              $unique_id .= mt_rand(1000, 9999);
              // Sending email
              // Employee -----------------------------------------------------
              $email_template_id = 1;
              $eamil_detail = array('to' => $response->email ?? NULL);
              $this->common_model->email($eamil_detail, $email_template_id, $unique_id);
              // Admin --------------------------------------------------------
              $email_template_id = 8;
              $eamil_detail_admin = array('to' =>  $this->admin_email ?? NULL,
                                          'admin_name' => 'Aashi',
                                          'user_email' => $response->email ?? NULL);
              $this->common_model->email($eamil_detail_admin, $email_template_id, $unique_id);
                        // Code to send notification
                        $detail['from_id'] = 5;
                        $detail['type'] = 'manager';
                        $detail['subject'] = 'new_user_registered';
                        $detail['action_id'] = $response->employee_id ?? NULL;
                        $detail['message'] = 'A new user '.$response->email.' registered successfully';
                        // $detail['message'] = 'hey, '.$response->email.' welcome onboard';
                        $this->common_model->addNotification($detail);
              $this->response(array(
                "status" => 1,
                "message" => "Employee has been registered"
              ), REST_Controller::HTTP_OK);
              }else{
              
                $this->response(array(
                  "status" => 0,
                  "message" => "Failed to create employee"
                ), REST_Controller::HTTP_OK);
                return;
        }
      }else{
        // we have some empty field
        $this->response(array(
          "status" => 0,
          "message" => "fields must not be empty!"
        ), REST_Controller::HTTP_OK);
      }

  }
  public function login_post()
    {
      // print_r($_POST);die;
        $email = $this->security->xss_clean($this->input->post("email"));
        $password = $this->security->xss_clean($this->input->post("password"));

        $this->form_validation->set_rules('email', 'Email', 'required');
        $this->form_validation->set_rules('password', 'Pasword', 'required');
        if ($this->form_validation->run()) {
            $credentials = array('email' => $email, 'password' => md5($password)); //md5($password)
            $loginStatus = $this->employee_model->checkLogin($credentials);
            //  print_r($loginStatus);die;
            if ($loginStatus != false) {
                $userId = array('employee_id' => $loginStatus->employee_id,
                                'user_type' => 'employee');
                $bearerToken = $this->authorization_token->generateToken($userId);
                 $this->response(array(
                    "status" => 1,
                    "message" => "Successfully Logged In",
                    'employee_id'=> $loginStatus->employee_id,
                    'name'=> $loginStatus->name,
                    'email'=> $loginStatus->email,
                    'profile_photo'=> $loginStatus->profile_photo,
                    'skill'=> $loginStatus->skill,
                    'token' => $bearerToken,
                    ) , REST_Controller::HTTP_OK);
                    return;
            } else {
                $this->response(array(
                 "status" => 0,
                 "message" => "Invalid credentials !"
                 ), REST_Controller::HTTP_OK);
                 return;
            }
        } else {
          $this->response(array(
                 "status" => 0,
                 "message" => "Email-id and password are required!"
                 ), REST_Controller::HTTP_OK);
                 return;
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
             $loginStatus = $this->employee_model->checkLogin($email);
             if ($loginStatus != false) {
               $detail = array('employee_id'=>$loginStatus->employee_id,
                                'token'=> md5($loginStatus->email));
               if($this->employee_model->updatePersonal_details($detail)){
                 // Sending mail
                            $unique_id = $this->common_model->getLastRecord_email()['id'] ?? 1;
                            $unique_id .= mt_rand(1000, 9999);
                            $email_template_id = 6;
                            $email = array('to' => $loginStatus->email ?? NULL,
                                          'name' => $loginStatus->name ?? NULL,
                                          // 'token'=>$detail['token'],
                                          'reset_link' => 'https://canjobs.vercel.app/resetpassword/user:'.$detail['token']
                                         );
                            $this->common_model->email($email, $email_template_id, $unique_id);

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
              if($this->employee_model->resetPassword($reset_details)){
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
  public function signupLoginViaSocialMedia_post(){
    $data = json_decode(file_get_contents("php://input"));
    $email = $data->email;
    $existing_employee = $this->employee_model->get_employee_by_email($email);
       if(!$existing_employee){
          $employee = array('name' => $data->name,
          'email' => $email);
          if(isset($data->picture)){
            if(!empty($data->picture)){
              $employee['profile_photo'] = $data->picture;
            }
          }
        }
        // print_r(($existing_employee)->row());die;
        if(isset($existing_employee)){
          $employee_id = ($existing_employee)->row()->employee_id;
          // print_r($employee_id);die;
          if(!empty($employee_id)){
            $employee['employee_id'] = $employee_id;
           
          }
        }
        if(isset($data->type)){
          if(!empty($data->type)){
            if($data->type === "Google"){
              $employee['google'] = $data->token;
            }
            if($data->type === "Facebook"){
              $employee['facebook'] = $data->token;
            }
            if($data->type === "Linkedin"){
              $employee['linkedin'] = $data->token;
            }
          }
        }
        // print_r($employee);die;
      $response = $this->employee_model->updatePersonal_details($employee);

   
    $credentials = array('email' => $email);
    $loginStatus = $this->employee_model->checkLogin($credentials);
    //  print_r($loginStatus);die;
    if ($loginStatus != false) {
        $userId = array('employee_id' => $loginStatus->employee_id,
                        'user_type' => 'employee');
        $bearerToken = $this->authorization_token->generateToken($userId);
         $this->response(array(
            "status" => 1,
            "message" => "Successfully Logged In",
            'employee_id'=> $loginStatus->employee_id,
            'name'=> $loginStatus->name,
            'profile_photo'=> $loginStatus->profile_photo,
            'token' => $bearerToken,
            ) , REST_Controller::HTTP_OK);
            return;
    } else {
        $this->response(array(
         "status" => 0,
         "message" => "Invalid credentials !"
         ), REST_Controller::HTTP_OK);
         return;
    }
  }
}