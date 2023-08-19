<?php

 defined('BASEPATH') OR exit('No direct script access allowed');



require APPPATH.'libraries/REST_Controller.php';



class Common_controller extends REST_Controller{



  public function __construct(){



  parent::__construct();

Header('Access-Control-Allow-Origin: *'); //for allow any domain, insecure
Header('Access-Control-Allow-Headers: *'); //for allow any headers, insecure
Header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE'); //
if ( "OPTIONS" === $_SERVER['REQUEST_METHOD'] ) {
    die();
}
// header("Access-Control-Allow-Headers: Content-Type, Content-Length, Accept-Encoding");
    //load database

    $this->load->database();

    $this->load->model(array("employer_model"));

    $this->load->model(array("common_model"));
    
    $this->load->library('Authorization_Token');

    $this->load->helper("security");

    $this->load->helper('url');

  }
  public function getalljobs_post(){
    $data = json_decode(file_get_contents("php://input"));
    // $details['job_id'] =$data->job_id ?? null;
    $details['employee_id'] = 0;
    $recommend_sort = array();
    // if(!empty($this->employee_id) && $this->user_type == "employee"){
    //   $details["employee_id"] = $this->employee_id;
    // }  
    // if(!empty($this->company_id) && $this->user_type == "company"){
    //   $details["company_id"] = $this->company_id;
    // }  
    $page = $data->page ?? 1;
    $limit =$data->limit ?? 1000; 

    // if(!empty($this->admin_id) && $this->user_type != "super-admin" && $this->user_type != "admin"){
    //   $details ["admin_id"] =  $this->admin_id;
    //   $details["admin_type"] =  $this->user_type;
    // }  

    // Get search parameter
    $search = isset($data->search) ? $data->search : '';

    // Get filter parameters

    $filter = [
    "category_id" => $data->filter_category_id ?? null,
    "job_type" => $data->filter_job_swap ?? null,
    "keyskill" => $data->filter_keyskill ?? null,
    "location" => $data->filter_location ?? null,
    "company_name" => $data->company_name ?? null,
    ];
    if(isset($data->filter_by_time)){
      if($data->filter_by_time == "today"){
            $filter['start_date'] = date('Y-m-d');
            $filter['end_date'] = date('Y-m-d', strtotime('tomorrow'));

      }
      if($data->filter_by_time == "last_week"){
            $filter['start_date'] = date('Y-m-d', strtotime('last week'));
            $filter['end_date'] = date('Y-m-d', strtotime('last week +7days'));

      }
     
      if($data->filter_by_time == "last_month"){
            $filter['start_date'] = date('Y-m-01', strtotime('last month'));
            $filter['end_date'] =date('Y-m-t', strtotime('last month'));
            
          }
      if($data->filter_by_time == "current_month"){
            $filter['start_date'] = date('Y-m-01', strtotime('this month'));
            $filter['end_date'] =date('Y-m-t', strtotime('this month'));
            
          }
    }

    
    // Calculate offset for pagination
    $offset = ($page - 1) * $limit;

    // sorting 
    $sort = [
      'column_name' => $data->column_name ?? "created_at" ,
      'sort_order' => $data->sort_order ?? "DESC"
    ];
// print_r($sort);die;
    $result = $this->employer_model->viewJobs($filter, $search, $limit, $offset, $sort, $details, $recommend_sort);

    if ($result) {
              $this->response(array(
                "status" => 1,
                "message" => "successful",
                "total_rows" => $result['total_rows'],
                "data" => $result['data']
              ), REST_Controller::HTTP_OK);

          }else{



            $this->response(array(

              "status" => 0,

              "messsage" => "No data found"

            ), REST_Controller::HTTP_OK);

          }

   }
  // Generate otp
  public function generateOtp_post(){
           $data = json_decode(file_get_contents("php://input"));
           $otp = mt_rand(100000, 999999);
           $email = $data->email;
           $detail = array('email' => $email,
                            'otp' => $otp);
          if ($this->common_model->insert_otp($detail)) {
            // Sending mail
              $unique_id = $this->common_model->getLastRecord_email()['id'] ?? 1;
              $unique_id .= mt_rand(1000, 9999); // unique id for grouping in table
              $email_template_id = 7;
              $email = array('to' => $email ?? NULL,
                             'otp'=>$otp
                            );
              $this->common_model->email($email, $email_template_id, $unique_id);
              $this->response(array(
                "status" => 1,
                "message" => "successful",
              ), REST_Controller::HTTP_OK);         
              return;
          }else{
            $this->response(array(

              "status" => 0,

              "messsage" => "failed !"

            ), REST_Controller::HTTP_OK);
          }           
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
   public function getNotifications_get(){

    $headers = $this->input->request_headers(); 
		$this->decodedToken = $this->authorization_token->validateToken($headers['Authorization']);
    // print_r($this->decodedToken);die;
    // $this->admin_id = $this->decodedToken['data']->admin_id ?? null;
    // $this->employee_id = $this->decodedToken['data']->employee_id ?? null;
    // $this->company_id = $this->decodedToken['data']->company_id ?? null;
    $user_type = $this->decodedToken['data']->user_type ?? null;
    $id = $this->decodedToken['data']->admin_id ?? null;
    $id = $this->decodedToken['data']->employee_id ?? $id;
    $id = $this->decodedToken['data']->company_id ?? $id;

       if (!$this->decodedToken || $this->decodedToken['status'] != "1") {

            $err = array(

                'status'=>false,

                'message'=>'Unauthorised Token',

                'data'=>[]

            );
            echo json_encode($err);

            exit;
          }


      $notifications = $this->common_model->getNotifications($id, $user_type);

      if($notifications){



        $this->response(array(

          "status" => 1,
          "message" => "Data found",
          "Data" => $notifications

        ), REST_Controller::HTTP_OK);

      }else{



        $this->response(array(

          "status" => 0,

          "message" => "No data found",

        ), REST_Controller::HTTP_OK);

      }
    }
     public function isReadNotification_put(){
         $data = json_decode(file_get_contents("php://input"));
         if(isset($data->id))
         {
          $error_flag = 0;
         if(empty($data->id))
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
         $id = $data->id;
          if($this->common_model->isReadNotification($id))
          {
          $this->response(array(

              "status" => 1,

              "message" =>  "Successful"

            ), REST_Controller::HTTP_OK);

      
        }
        else{
          $this->response(array(

            "status" => 0,

            "messsage" => "Failed"

          ), REST_Controller::HTTP_OK);

        }


         }else{

        $this->response(array(

          "status" => 0,

          "message" => "All fields are required !"

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
    public function linkedinLogin_post($value='')
    {
      error_reporting(0);
      $code = $_POST['code'];
      $ch = curl_init();
      $url = 'https://www.linkedin.com/oauth/v2/accessToken?code='.$code.'&grant_type=authorization_code&client_id=78mhwjaumkvtbm&client_secret=ZoZKbJgORl0vYJFr&redirect_uri=http://localhost:3000/';
      $curlConfig = array(
          CURLOPT_URL            => $url,
          CURLOPT_POST           => true,
          CURLOPT_RETURNTRANSFER => true,
          CURLOPT_POSTFIELDS     => array(
              'field1' => 'some date',
              'field2' => 'some other data',
          )
      );
      curl_setopt_array($ch, $curlConfig);
      $result = curl_exec($ch);
      $res = json_decode($result,true);
      if(isset($res['access_token']))
      {
      $authToken = $res['access_token'];
      // echo "authToken===============";
      // print_r($authToken);
      curl_close($ch);
      $ch = curl_init();
      // $url = 'https://api.linkedin.com/v2/emailAddress';
      // $url = 'https://api.linkedin.com/v2/emailAddress?q=members&projection=(elements*(handle~))';
      // $url = 'https://api.linkedin.com/v2/me?projection=(id,firstName,lastName,profilePicture(displayImage~:playableStreams))';
      // $url = 'https://api.linkedin.com/v2/me?fields=id,firstName,lastName,headline,profilePicture,industry,positions,educations';
      $url = 'https://api.linkedin.com/v2/userinfo';
       $authorization = "Authorization: Bearer ".$authToken;
      curl_setopt($ch, CURLOPT_URL, $url);
      curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json' , $authorization ));
      curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "GET");
      curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
      curl_setopt($ch, CURLOPT_POSTFIELDS,array());
      curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
      $result = curl_exec($ch);
      curl_close($ch);
      // return json_decode($result);
      // echo "<hr>";
      // echo "final result ===============";
      // print_r($result);
      // curl_close($ch);
      
      $this->response(array(

          "status" => 1,

          "data" => json_decode($result,true),

        ), REST_Controller::HTTP_OK);
    }else{
      $this->response(array(

          "status" => 0,

          "data" => $result,

        ), REST_Controller::HTTP_OK);
    }
    }
    public function testEmail_post(){
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
}
