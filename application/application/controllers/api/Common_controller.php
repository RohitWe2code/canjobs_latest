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
    // if(!empty($this->employee_id) && $this->user_type == "employee"){
    //   $details["employee_id"] = $this->employee_id;
    // }  
    // if(!empty($this->company_id) && $this->user_type == "company"){
    //   $details["company_id"] = $this->company_id;
    // }  
    $page = $data->page ?? 1;
    $limit =$data->limit ?? 10; 

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
    $result = $this->employer_model->viewJobs($filter, $search, $limit, $offset, $sort, $details);

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
              $unique_id = $this->common_model->getLastRecord_email()['id'] ?? 1;
              $unique_id .= mt_rand(1000, 9999);
              $detail = array(
              'email' => $email,
              'subject'=>'One Time Password',
              'message'=>'Your OTP is '.$otp.' for creating account, please dont share it with anyone',
              'unique_id'=>$unique_id);
              $this->common_model->email($detail);
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
  public function sendEmail_post(){
        $last_record = $this->common_model->getLastRecord_email();
        // print_r($last_record);die;
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
          $email = json_decode($data['email_json'],true);
          $status = $this->common_model->sendMail($email);
          // print_r($email);
        }
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
    public function addUpdateEmailTemplate_put(){
         $data = json_decode(file_get_contents("php://input"));
         if(isset($data->email_type) && isset($data->subject) && isset($data->message))
         {
         if(empty($data->email_type) || empty($data->subject) || empty($data->message))
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
         $template = array('email_type'=>$data->email_type,
                            'subject'=>$data->subject,
                            'message'=>$data->message);
          $msg = "data inserted successfully";
          if(isset($data->id)){
          if(!empty($data->id)){
            $template["id"] = $data->id;
             $msg = "data updated successfully";
          }
          }
          if(isset($data->id_active)){
          if(!empty($data->id_active)){
            $template["id_active"] = $data->id_active;

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

}
