<?php
Header('Access-Control-Allow-Origin: *'); //for allow any domain, insecure
Header('Access-Control-Allow-Headers: *'); //for allow any headers, insecure
Header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE'); //
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH.'libraries/REST_Controller.php';

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
  }

  public function signup_post(){
    
    $email = $this->security->xss_clean($this->input->post("email"));
    $password = $this->security->xss_clean($this->input->post("password"));
    $resume =$this->input->post("cv");
    $otp =$this->input->post("otp");

if($resume) {
    // Decode the base64 encoded PDF data
    $cv_data = base64_decode($resume);
    // Set the file name
    $file_name_for_upload = time().'.pdf';
    // Set the file path
    $file_path = FCPATH . 'uploads/' . $file_name_for_upload;
    // Write the file to the server
    if(file_put_contents($file_path, $cv_data)) {
        // File was successfully uploaded
        $cv = base_url() . 'uploads/' . $file_name_for_upload;
       
    } else {
        // File upload failed
    }
} 
    
    // form validation for inputs
    $this->form_validation->set_rules("email", "Email", "required|valid_email");
    $this->form_validation->set_rules("password", "password", "required");
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
              // $candidate_email = $response->email;
              $unique_id = $this->common_model->getLastRecord_email()['id'] ?? 1;
              $unique_id .= mt_rand(1000, 9999);
               $detail = array('from_id'=> $response->employee_id,
              'type'=>'employee',
              'email' => $response->email,
              'subject'=>'Welcome',
              'message'=>'hey, '.$response->email.' welcome onboard.',
              'unique_id'=>$unique_id);
              $this->common_model->email($detail);
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
                            $unique_id = $this->common_model->getLastRecord_email()['id'] ?? 1;
                            $unique_id .= mt_rand(1000, 9999);
                            $detail['email']=$loginStatus->email;
                            $detail['subject']='Reset password';
                            $detail['message']='Hello, '.$loginStatus->name.' click on the link to reset your password http://localhost:3000/resetpassword/user:'.$detail['token'];
                            $detail['unique_id']=$unique_id;
                      //  $employee['token'] = $token;
                           $this->common_model->email($detail);
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
  
}