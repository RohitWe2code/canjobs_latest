<?php
Header('Access-Control-Allow-Origin: *'); //for allow any domain, insecure
Header('Access-Control-Allow-Headers: *'); //for allow any headers, insecure
Header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE'); //
defined('BASEPATH') OR exit('No direct script access allowed');

// require APPPATH.'libraries/REST_Controller.php';
require APPPATH.'controllers/api/My_REST_Controller.php';

class Email_controller extends My_REST_Controller{

  public function __construct(){

    parent::__construct();
    //load database
    $this->load->database();
    $this->load->model(array("common_model"));
    $this->load->library(array("Authorization_Token","email"));
    // $this->load->library('Authorization_Token');
    // $this->load->library('email');
    $this->load->helper(array("security"));
    // $this->load->helper('url');
 
    // $headers = getallheaders(); 
	// $this->decodedToken = $this->authorization_token->validateToken($headers['Authorization']);
    // // print_r($this->decodedToken['data']);die;
    //    if (!$this->decodedToken || $this->decodedToken['status'] != "1") {   
    //         $err = array(
    //             'status'=>false,
    //             'message'=>'Unauthorised Token',
    //             'data'=>[]
    //         );
    //         echo json_encode($err);
    //         exit;
    //       }
    //     // $this->dataa = json_decode(file_get_contents("php://input"));
    //     $this->admin_id = $this->decodedToken['data']->admin_id ?? null;
    //     $this->employee_id = $this->decodedToken['data']->employee_id ?? null;
    //     $this->company_id = $this->decodedToken['data']->company_id ?? null;
    //     $this->user_type = $this->decodedToken['data']->user_type ?? null;
        }
// Retrieve mail from email table and send it to sendMail model function 
  public function sendEmail_get(){
        $last_record = $this->common_model->getLastRecord_email();
        if (isset($last_record['group_id'])) {
            $group_id = $last_record['group_id'];
        } else {
            
          $this->response(array(

            "status" => 0,

            "messsage" => "No mail Pending"

          ), REST_Controller::HTTP_OK);
          return;
        }
        $response = $this->common_model->getEmailByGroup($group_id);
        // print_r($response);die;
        foreach($response as $data){
          $template_id['id'] = intval($data['email_template_id']);
          $email_template = $this->common_model->getEmailTemplate($template_id)['data'];
          // print_r($email_template);die;
          $detail = json_decode($data['email_json'],true);
          $to = $detail['to'];
          $email_template_id = intval($data['email_template_id']);
          // var_dump($email_template_id);die;
          // $subject = $email_template['subject'];
          // check for email type
          if($email_template_id == 1) // Employee_signup welcome message 
          {
            $body = str_replace('{email_address}', $detail['to'], $email_template['message']);
          }
          if($email_template_id == 3) // post_job -> email to company 
          {
            $body = str_replace('{postjob_job_title}', $detail['job_title'], $email_template['message']);
            $body = str_replace('{postjob_company_name}', $detail['company_name'], $body);
            $body = str_replace('{job_description}', $detail['job_description'], $body);
            $body = str_replace('{job_location}', $detail['job_location'], $body);
            $body = str_replace('{website_url}', $detail['website_url'], $body);
          }
          if($email_template_id == 9) // post_job -> email to admin
          {
            $body = str_replace('{postjob_job_title}', $detail['job_title'], $email_template['message']);
            $body = str_replace('{name}', $detail['admin_name'], $body);
            $body = str_replace('{postjob_company_name}', $detail['company_name'], $body);
            $body = str_replace('{job_description}', $detail['job_description'], $body);
            $body = str_replace('{job_location}', $detail['job_location'], $body);
            $body = str_replace('{website_url}', $detail['website_url'], $body);
          }
          if($email_template_id == 4) // apply_on_job 
          {
            $body = str_replace('{apply_on_job_job_title}', $detail['job_title'], $email_template['message']);
            $body = str_replace('{apply_on_job_company_name}', $detail['company_name'], $body);
            $body = str_replace('{applyjob_applicant_name}', $detail['employee_name'], $body);
            $body = str_replace('{applyjob_applicant_email}', $detail['employee_email'], $body);
            $body = str_replace('{applyjob_applicant_contact}', $detail['employee_contact_no'], $body);
            $body = str_replace('{applyjob_applicant_skills}', $detail['employee_skill'], $body);
          }
          if($email_template_id == 5) // interview_schedule(employee)
          {
            $body = str_replace('{interview_schedule_name}', $detail['candidate_name'], $email_template['message']);
            $body = str_replace('{interview_schedule_interview_date}', $detail['interview_date'], $body);
            $body = str_replace('{interview_schedule_job_title}', $detail['job_title'], $body);
            $body = str_replace('{interview_schedule_company_name}', $detail['company_name'], $body);
          }
          if($email_template_id == 10) // interview_schedule(employer) 
          {
            $body = str_replace('{interview_schedule_name}', $detail['candidate_name'], $email_template['message']);
            $body = str_replace('{interview_schedule_interview_date}', $detail['interview_date'], $body);
            $body = str_replace('{interview_schedule_job_title}', $detail['job_title'], $body);
            $body = str_replace('{interview_schedule_company_name}', $detail['company_name'], $body);
          }
          if($email_template_id == 11) // interview_schedule(admin) 
          {
            $body = str_replace('{interview_schedule_name}', $detail['candidate_name'], $email_template['message']);
            $body = str_replace('{interview_schedule_interview_date}', $detail['interview_date'], $body);
            $body = str_replace('{interview_schedule_job_title}', $detail['job_title'], $body);
            $body = str_replace('{interview_schedule_company_name}', $detail['company_name'], $body);
          }
          if($email_template_id == 6) // forget_password 
          {
            // {token} {reset_link}
            // $body = str_replace('{token}', $detail['token'], $email_template['message']);
            $body = str_replace('{reset_link}', $detail['reset_link'],$email_template['message']);
            $body = str_replace('{name}', $detail['name'] ?? '',$body);
          }
          if($email_template_id == 7) // otp_signup 
          {
            $body = str_replace('{otp}', $detail['otp'], $email_template['message']);
          }
          if($email_template_id == 8) // User_registration to admin 
          {
            $body = str_replace('{admin_name}', $detail['admin_name'], $email_template['message']);
            $body = str_replace('{user_email_address}', $detail['user_email'], $body);
          }
          if($email_template_id == 12) // User_registration to admin 
          {
            $body = str_replace('{company_name}', $detail['company_name'], $email_template['message']);
            $body = str_replace('{employee_name}', $detail['employee_name'], $body);
            $body = str_replace('{lmia_status}', $detail['lmia_status'], $body);
          }
          $subject = $email_template['subject'];
          // print_r($to);
          // print_r($subject);
          // print_r($body);die;
          $status = $this->common_model->sendMail($to, $subject, $body);
        }
        // print_r($status);die;
        if($status){
          $query = " UPDATE `email` SET status = 'SENT' WHERE group_id = ".$group_id;
          $res = $this->db->query($query);
          // print_r($res);die;
          $this->response(array(

              "status" => 1,

              "message" => "email sent successfully"

            ), REST_Controller::HTTP_OK);
        }
        else{
          $this->response(array(

            "status" => 0,

            "messsage" => "Failed !"

          ), REST_Controller::HTTP_OK);
        } 
  }
public function addUpdateEmailTemplate_put(){
         $data = json_decode(file_get_contents("php://input"));
         if(isset($data->subject) && isset($data->message))
         {
          $error_flag = 0;
         if(empty($data->subject) || empty($data->message))
         {
           $error_flag = 1;
         }
          if($error_flag){

            $this->response(array(

            "status" => 0,

            "message" => "Fields must not be empty!"

          ) , REST_Controller::HTTP_OK);

         return;

        }
         $template = array( 'subject'=>$data->subject,
                            'message'=>$data->message);
          $msg = "data inserted successfully";
          if(isset($data->id)){
          if(!empty($data->id)){
            $template["id"] = $data->id;
             $msg = "data updated successfully";
          }
          }
          if(isset($data->is_active)){
          if(!empty($data->is_active)){
            $template["is_active"] = $data->is_active;

          }
          }
          if($this->common_model->addUpdateEmailTemplate($template))
          {
          $this->response(array(

              "status" => 1,

              "message" =>  $msg

            ), REST_Controller::HTTP_OK);

      
        }
        else{
          $this->response(array(

            "status" => 0,

            "messsage" => "Failed to update data"

          ), REST_Controller::HTTP_OK);

        }


         }else{

        $this->response(array(

          "status" => 0,

          "message" => "All fields are required !"

        ), REST_Controller::HTTP_OK);

      }
    }
public function getEmailTemplate_post(){

    // $headers = $this->input->request_headers(); 
		// $this->decodedToken = $this->authorization_token->validateToken($headers['Authorization']);
    // // print_r($this->decodedToken);die;
    // // $this->admin_id = $this->decodedToken['data']->admin_id ?? null;
    // // $this->employee_id = $this->decodedToken['data']->employee_id ?? null;
    // // $this->company_id = $this->decodedToken['data']->company_id ?? null;
    // $user_type = $this->decodedToken['data']->user_type ?? null;
    // $id = $this->decodedToken['data']->admin_id ?? null;
    // $id = $this->decodedToken['data']->employee_id ?? $id;
    // $id = $this->decodedToken['data']->company_id ?? $id;

      //  if (!$this->decodedToken || $this->decodedToken['status'] != "1") {

      //       $err = array(

      //           'status'=>false,

      //           'message'=>'Unauthorised Token',

      //           'data'=>[]

      //       );
      //       echo json_encode($err);

      //       exit;
      //     }

       $data = json_decode(file_get_contents("php://input"));
       $id = array();
       if(isset($data->id)){
        if(!empty($data->id)){
        $id['id'] = $data->id;
        }
       }
      $template = $this->common_model->getEmailTemplate($id);
      //  print_r($template);die;
      if($template){



        $this->response(array(

          "status" => 1,
          "message" => "Data found",
          "Data" => $template

        ), REST_Controller::HTTP_OK);

      }else{



        $this->response(array(

          "status" => 0,

          "message" => "No data found",

        ), REST_Controller::HTTP_OK);

      }
    }
 public function emailTemplateTest_post(){
      $data = json_decode(file_get_contents("php://input"));
      // echo($data);
      $to = $data->email_id;
      $email_template_id['id'] = $data->email_template_id;
      $email_template = $this->common_model->getEmailTemplate($email_template_id)['data'];
      $subject = $email_template['subject'];
      $body = $email_template['message'];
      // print_r($to);
      // print_r($subject);
      // print_r($body);die;
      $status = $this->common_model->sendMail($to, $subject, $body);
    // print_r($status);die;
    if($status){
      $this->response(array(

          "status" => 1,

          "message" => "email sent successfully"

        ), REST_Controller::HTTP_OK);
    }
    else{
      $this->response(array(

        "status" => 0,

        "messsage" => "Failed !"

      ), REST_Controller::HTTP_OK);
    } 
    }
public function sendEmailTest_post(){
      $data = json_decode(file_get_contents("php://input"));
      // echo($data);
      if(isset($data->to) && isset($data->subject) && isset($data->body)){
        if(empty($data->to) || empty($data->subject) || empty($data->body)){
            $this->response(array(
            "status" => 0,
            "message" => "Fields must not be empty!"
          ) , REST_Controller::HTTP_OK);
         return;
        }
      }else{
         $this->response(array(
          "status" => 0,
          "message" => "All fields are required !"
        ), REST_Controller::HTTP_OK);
        return;
      }
      $to = $data->to;
      $subject = $data->subject;
      $body = $data->body;
    //   $subject = $email_template['subject'];
    //   $body = $email_template['message'];
      // print_r($to);
      // print_r($subject);
      // print_r($body);die;
      $status = $this->common_model->sendMail($to, $subject, $body);
    // print_r($status);die;
    if($status){
      $this->response(array(

          "status" => 1,

          "message" => "email sent successfully"

        ), REST_Controller::HTTP_OK);
    }
    else{
      $this->response(array(

        "status" => 0,

        "messsage" => "Failed !"

      ), REST_Controller::HTTP_OK);
    } 
    }
}