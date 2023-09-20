<?php
Header('Access-Control-Allow-Origin: *'); //for allow any domain, insecure
Header('Access-Control-Allow-Headers: *'); //for allow any headers, insecure
Header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE'); //
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH.'libraries/REST_Controller.php';
class Setting_controller extends REST_Controller{
  public function __construct(){
    parent::__construct();
    $this->load->database();
    $this->load->model(array("setting_model","common_model"));
    $this->load->library(array("form_validation","Authorization_Token"));
    $this->load->helper(array("security","url"));
    
    $headers = $this->input->request_headers(); 
		$this->decodedToken = $this->authorization_token->validateToken($headers['Authorization']);
      if (!$this->decodedToken || $this->decodedToken['status'] != "1") {  
            $err = array(
                'status'=>false,
                'message'=>'Unauthorised Token',               
            );          
            echo json_encode($err);
            exit;         
          }
    $this->admin_id = $this->decodedToken['data']->admin_id ?? null;
    $this->employee_id = $this->decodedToken['data']->employee_id ?? null;
    $this->user_type = $this->decodedToken['data']->user_type ?? null;
  }
public function updateParentSetting_put(){
    if(isset($this->admin_id) && ($this->user_type === 'super-admin' || $this->user_type === 'admin')){
        $data = json_decode(file_get_contents("php://input"));
         if (isset($data->type) || isset($data->permission)){
               if(empty($data->type) && empty($data->permission)){
                     $this->response(array(
                    "status" => 0,
                    "message" => "Fields must not be empty !"
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
            //    $admin_id = $data->admin_id ?? $this->admin_id;
               $details = array('type'=>$data->type,
                                'permission'=>json_encode($data->permission)
                                );
            //    if(isset($data->email_permission)){
            //    if(!empty($data->email_permission)){
            //     $details['email_permission'] = json_encode($data->email_permission);
            //    }
            //    }
            //    if(isset($data->notification_permission)){
            //    if(!empty($data->notification_permission)){
            //     $details['notification_permission'] = json_encode($data->notification_permission);
            //    }
            //    }
               $response = $this->setting_model->update_parent_setting($details);
              //  print_r($response);die;
               if($response){
                  $this->response(array(
                    "status" => 1,
                    "message" => "successfully"
                    ) , REST_Controller::HTTP_OK);
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
                "message" => "Not valid admin !"
                ) , REST_Controller::HTTP_OK);
                return;
    }
    }
     public function getParentSetting_post(){
        if(isset($this->admin_id) && ($this->user_type === 'super-admin' || $this->user_type === 'admin')){
        $data = json_decode(file_get_contents("php://input"));
        //   if (isset($data->type)){
        //        if(empty($data->type)){
        //              $this->response(array(
        //             "status" => 0,
        //             "message" => "Fields must not be empty !"
        //             ) , REST_Controller::HTTP_OK);
        //             return;
        //        }
        //       } else {
        //       $this->response(array(
        //             "status" => 0,
        //             "message" => "all fields are required!"
        //             ) , REST_Controller::HTTP_OK);
        //             return;
        // }
            //    $type = $data->type;
               $details = array();
               if(isset($data->type)){
               if(!empty($data->type)){
                $details['type'] = $data->type;
               }
               }
               $response = $this->setting_model->get_parent_setting($details);
              //  print_r(json_decode($response["email_permission"]));die;
               if($response){
                  $this->response(array(
                    "status" => 1,
                    "data" => $response
                    ) , REST_Controller::HTTP_OK);
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
                "message" => "Not valid admin !"
                ) , REST_Controller::HTTP_OK);
                return;
    }  
}
}