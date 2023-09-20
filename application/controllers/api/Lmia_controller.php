<?php
Header('Access-Control-Allow-Origin: *'); //for allow any domain, insecure
Header('Access-Control-Allow-Headers: *'); //for allow any headers, insecure
Header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE'); //
defined('BASEPATH') OR exit('No direct script access allowed');

// require APPPATH.'libraries/REST_Controller.php';
require APPPATH.'controllers/api/My_REST_Controller.php';

class Lmia_controller extends My_REST_Controller{

  public function __construct(){

    parent::__construct();
    //load database
    $this->load->database();
    $this->load->model(array("employer_model","lmia_model","common_model"));
    $this->load->library(array("Authorization_Token","email"));
    // $this->load->library('Authorization_Token');
    // $this->load->library('email');
    $this->load->helper(array("security"));
    // $this->load->helper('url');
 
    $headers = getallheaders(); 
	$this->decodedToken = $this->authorization_token->validateToken($headers['Authorization']);
    // print_r($this->decodedToken['data']);die;
       if (!$this->decodedToken || $this->decodedToken['status'] != "1") {   
            $err = array(
                'status'=>false,
                'message'=>'Unauthorised Token',
                'data'=>[]
            );
            echo json_encode($err);
            exit;
          }
        // $this->dataa = json_decode(file_get_contents("php://input"));
        $this->admin_id = $this->decodedToken['data']->admin_id ?? null;
        $this->employee_id = $this->decodedToken['data']->employee_id ?? null;
        $this->company_id = $this->decodedToken['data']->company_id ?? null;
        $this->user_type = $this->decodedToken['data']->user_type ?? null;
        }
    public function addUpdateLmia_put(){
    
      $data = json_decode(file_get_contents("php://input"));
      // print_r($data); die;
      $detail = array();
       if(isset($data->apply_id)){
          if(!empty($data->apply_id)){
          $detail["apply_id"]=$data->apply_id;
          // $detail["employee_id"]=$data->employee_id;
        }
        if(isset($data->lmia_status)){
           if(!empty($data->lmia_status)){
           $detail["lmia_status"]=$data->lmia_status;
         }
       }
        if(isset($data->completion_time)){
           if(!empty($data->completion_time)){
           $detail["expected_time_of_completion"]=$data->completion_time;
         }
       }     
        $response = $this->lmia_model->addUpdateLmia($detail);
        // print_r($response['response']);die;
        if($response){
          $response_lmia_status = $response['response']->lmia_status ?? null;
          $company_id = $response['response']->company_id ?? null;
          
          // Checking specific status to send email and notification
          if($response_lmia_status == 'candidate placement' || $response_lmia_status == 'decision'){
            
            // Sending email to employee
            // Checking admin permission to send email to employee
            $admin_permission = $this->common_model->checkParentPermission();
            if(isset($admin_permission['email_employee']['lmia']) && $admin_permission['email_employee']['lmia'] == 1){
            // Checking employee permission to send email
              $permission = $this->common_model->checkEmployerEmailPermission($company_id);            
              if(isset($permission['email_permission']->lmia) && $permission['email_permission']->lmia == 1){
                $unique_id = $this->common_model->getLastRecord_email()['id'] ?? 1;
                $unique_id .= mt_rand(1000, 9999);
                $email_template_id = 12;
                $company_email = array('to'=>$response['response']->company_email,
                                      'employee_name' =>$response['response']->name,
                                      'company_name'=>$response['response']->company_name,
                                      //  'job_title'=>$response->job_title,
                                      // 'job_description'=>$response->job_description,
                                      // 'job_location'=>$response->location,
                                      'lmia_status'=>$response_lmia_status);
                $this->common_model->email($company_email, $email_template_id, $unique_id);
              }
          }
          // Checking admin permission to send notification to employee
          if(isset($admin_permission['notification_employee']['lmia']) && $admin_permission['notification_employee']['lmia'] == 1){
            // Checking employee permission to send notification
            if(isset($permission['notification_permission']->lmia) && $permission['notification_permission']->lmia == 1){
                      $admin_notification['from_id'] = $company_id;
                      $admin_notification['type'] = 'company';
                      $admin_notification['subject'] = 'Lmia status changed';
                      $admin_notification['action_id'] = $response['response']->employee_id;
                      $admin_notification['message'] = 'Lmia status changed to '.$response_lmia_status.' for employee '.$response['response']->name;
                      $this->common_model->addNotification($admin_notification);
          }
        }
        }
            $this->response(array(
              "status" => 1,
              "message" => $response['msg']
            ), REST_Controller::HTTP_OK);

            // Activity log
            if($response['msg'] === 'Data updated successfully'){
             $para['status'] = 22; // "lmia updated"
                    $para['action_id'] =  $response['response']->id ?? NULL;
                    $para['action_type'] = 'lmia';
            }else if($response['msg'] === 'Data added successfully'){
              $para['status'] = 23; // "lmia inserted"
                    $para['action_id'] =  $response['response']->id ?? NULL;
                    $para['action_type'] = 'lmia';
            }
        if(isset($para)){
          $this->_log_request($para);
        }
        return;
        }else{

          $this->response(array(
            "status" => 0,
            "messsage" => "Failed !"
          ), REST_Controller::HTTP_OK);
        }
      }else{
         $this->response(array(
            "status" => 0,
            "messsage" => "All fields required !"
          ), REST_Controller::HTTP_OK);
      }
   }
   public function getLmia_post(){
    $data = json_decode(file_get_contents("php://input"));
    // $details['job_id'] =$data->job_id ?? null;
    $details['company_id'] = $data->company_id ?? 0;
    // if(!empty($this->employee_id) && $this->user_type == "employee"){
    //   $details["employee_id"] = $this->employee_id;
    // }  
    if(!empty($this->company_id) && $this->user_type == "company"){
      $details["company_id"] = $this->company_id;
    }  
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
    "lmia_status" => $data->filter_by_lmia_status ?? null,
    "job_id" => $data->filter_by_job_id ?? null,
    "employee_id" => $data->filter_employee_id ?? null,
    // "location" => $data->filter_location ?? null,
    // "company_name" => $data->company_name ?? null,
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
    // print_r($sort);
    $result = $this->lmia_model->get_lmia($filter, $search, $limit, $offset, $sort, $details);
    // print_r($result);die;

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
   public function addUpdateLmiaSubstagesEmployee_put(){
      $data = json_decode(file_get_contents("php://input"));
        if(isset($data->lmia_id) && isset($data->lmia_status) && isset($data->lmia_substage)){
          if(empty($data->lmia_id) || empty($data->lmia_status) || empty($data->lmia_substage)){
            $this->response(array(
                   "status" => 0,
                   "message" => "fields must not be empty !"
                   ) , REST_Controller::HTTP_OK);
                   return;
            }
            $id = $data->id ?? null;
            $details = array('lmia_id'=>$data->lmia_id,
                             'lmia_status'=>$data->lmia_status,
                             'lmia_substage'=>$data->lmia_substage
                            );
            if(isset($data->is_active)){
                  $details['is_active'] = $data->is_active;
            }
            if(isset($id)){
              if(!empty($id)){
                  $details['updated_by'] = $this->admin_id;
              }
            }else{
            if(isset($this->admin_id)){
              if(!empty($this->admin_id)){
                  $details['created_by'] = $this->admin_id;
              }
            }
          }
            // print_r($details);die;
          $response = $this->lmia_model->add_update_lmia_substages_employee($id, $details); 
          // print_r($response);die;          
            if($response){
            $this->response(array(
               "status" => 1,
               "message" => $response
               ) , REST_Controller::HTTP_OK);
                // activity log
                $insert_id = $this->db->insert_id();
                if($insert_id){
                $para['status'] = 26; // "Employee lmia substage added",
                $para['action_id'] = $data->lmia_id ?? NULL;
                $para['action_type'] = 'lmia';
                }else{
                    $para['status'] = 27; // "Employee lmia substage updated"
                    $para['action_id'] = $data->lmia_id ?? NULL;
                    $para['action_type'] = 'lmia';
                }
                if(isset($para)){
                  $this->_log_request($para);
                }
               return;
            }else{
              $this->response(array(
              "status" => 0,
              "message" => "failed !"
              ) , REST_Controller::HTTP_OK);
              return;
            }
        }else{
           $this->response(array(
                    "status" => 0,
                    "message" => "all fields required !"
                    ) , REST_Controller::HTTP_OK);
                    return;
        }
    }
    public function getLmiaSubstagesEmployee_post(){
      $data = json_decode(file_get_contents("php://input"));
      
      // $details = [];
      if(isset($data->lmia_id)){
        if(empty($data->lmia_id)){
          $this->response(array(
            "status" => 0,
            "message" => "fields must not be empty !",
          ), REST_Controller::HTTP_OK);
          return;
        }
        $lmia_id = $data->lmia_id ?? null;
      }else{
        $this->response(array(
          "status" => 0,
          "message" => "please provide lmia id !",
        ), REST_Controller::HTTP_OK);
         return;
      }
      $filter = array(
        'lmia_status' => $data->lmia_status ?? null
      );
    
      // print_r($lmia_id);die;
      $response = $this->lmia_model->get_lmia_substages_employee($lmia_id, $filter);
      // print_r($response);die;

      if($response){
        $this->response(array(
          "status" => 1,
          "message" => "Successfully",
          "data" => $response
        ), REST_Controller::HTTP_OK);
         return;
      }else{
        $this->response(array(
          "status" => 0,
          "message" => "No data found",
        ), REST_Controller::HTTP_OK);
         return;
      }
  }
  public function deleteLmiaSubstageEmployee_post(){
      $data = json_decode(file_get_contents("php://input"));
      $id = $data->id;
      if($this->lmia_model->delete_lmia_substage_employee($id)){
        $this->response(array(
          "status" => 1,
          "message" => "successfully deleted"
        ), REST_Controller::HTTP_OK);
      }else{
        $this->response(array(
          "status" => 0,
          "message" => "Failed to delete"
        ), REST_Controller::HTTP_OK);
      }
  }
   public function addUpdateLmiaSubstagesJob_put(){
      $data = json_decode(file_get_contents("php://input"));
        if(isset($data->job_id) && isset($data->lmia_status) && isset($data->lmia_substage)){
          if(empty($data->job_id) || empty($data->lmia_status) || empty($data->lmia_substage)){
            $this->response(array(
                   "status" => 0,
                   "message" => "fields must not be empty !"
                   ) , REST_Controller::HTTP_OK);
                   return;
            }
            $id = $data->id ?? null;
            $details = array('job_id'=>$data->job_id,
                             'lmia_status'=>$data->lmia_status,
                             'lmia_substage'=>$data->lmia_substage
                            );
            if(isset($data->is_active)){             
                  $details['is_active'] = $data->is_active;
            }
            if(isset($id)){
              if(!empty($id)){
                  $details['updated_by'] = $this->admin_id;
              }
            }else{
            if(isset($this->admin_id)){
              if(!empty($this->admin_id)){
                  $details['created_by'] = $this->admin_id;
              }
            }
          }
            // print_r($details);die;
          $response = $this->lmia_model->add_update_lmia_substages_job($id, $details); 
          // print_r($response);die;          
            if($response){
            $this->response(array(
               "status" => 1,
               "message" => $response
               ) , REST_Controller::HTTP_OK);
               // activity log
                $insert_id = $this->db->insert_id();
                if($insert_id){
                $para['status'] = 28; // "job lmia substage inserted"
                $para['action_id'] = $data->job_id ?? NULL;
                $para['action_type'] = 'jobs';
                }else{
                    $para['status'] = 29; // "job lmia substage updated"
                    $para['action_id'] = $data->job_id ?? NULL;
                    $para['action_type'] = 'jobs';
                }
                if(isset($para)){
                $this->_log_request($para);
                }
               return;
            }else{
              $this->response(array(
              "status" => 0,
              "message" => "failed !"
              ) , REST_Controller::HTTP_OK);
              return;
            }
        }else{
           $this->response(array(
                    "status" => 0,
                    "message" => "all fields required !"
                    ) , REST_Controller::HTTP_OK);
                    return;
        }
    }
    public function getLmiaSubstagesjob_post(){
      $data = json_decode(file_get_contents("php://input"));
      
      // $details = [];
      if(isset($data->job_id)){
        if(empty($data->job_id)){
          $this->response(array(
            "status" => 0,
            "message" => "fields must not be empty !",
          ), REST_Controller::HTTP_OK);
          return;
        }
        $job_id = $data->job_id ?? null;
      }else{
        $this->response(array(
          "status" => 0,
          "message" => "please provide job id !",
        ), REST_Controller::HTTP_OK);
         return;
      }
      $filter = array(
        'lmia_status' => $data->lmia_status ?? null
      );
    
      // print_r($lmia_id);die;
      $response = $this->lmia_model->get_lmia_substages_job($job_id, $filter);
      // print_r($response);die;

      if($response){
        $this->response(array(
          "status" => 1,
          "message" => "Successfully",
          "data" => $response
        ), REST_Controller::HTTP_OK);
         return;
      }else{
        $this->response(array(
          "status" => 0,
          "message" => "No data found",
        ), REST_Controller::HTTP_OK);
         return;
      }
  }    
  public function deleteLmiaSubstageJob_post(){
      $data = json_decode(file_get_contents("php://input"));
      $id = $data->id;
      if($this->lmia_model->delete_lmia_substage_job($id)){
        $this->response(array(
          "status" => 1,
          "message" => "successfully deleted"
        ), REST_Controller::HTTP_OK);
      }else{
        $this->response(array(
          "status" => 0,
          "message" => "Failed to delete"
        ), REST_Controller::HTTP_OK);
      }
  }
    }