<?php

Header('Access-Control-Allow-Origin: *'); //for allow any domain, insecure
Header('Access-Control-Allow-Headers: *'); //for allow any headers, insecure
Header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE'); //
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH.'controllers/api/My_REST_Controller.php';

class Agent_controller extends My_REST_Controller{
  public function __construct(){
    parent::__construct();
    $this->load->database();
    $this->load->model(array("agent_model","common_model"));
    $this->load->library(array("Authorization_Token"));
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
public function addUpadateAgent_put(){
    if(isset($this->admin_id) && ($this->user_type === 'super-admin' || $this->user_type === 'admin' || $this->user_type === 'manager')){

     $data = json_decode(file_get_contents("php://input"));
    //  print_r($data);die;
      if(isset($data->name) && isset($data->email) && isset($data->contact_no) && isset($data->address) && isset($data->city) && isset($data->state) && isset($data->country)){  
        if(empty($data->name) || empty($data->email) || empty($data->contact_no) || empty($data->address) || empty($data->city) || empty($data->state) || empty($data->country)){
            $this->response(array(
            "status" => 0,
            "message" => "fields must not be empty !"
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
        $agent_details = array(
            'name' => $data->name,
            'email' => $data->email,
            'contact_no' => $data->contact_no,
            'address' => $data->address,
            'city' => $data->city,
            'state' => $data->state,
            'country' => $data->country,
        );
        if(isset($data->type)){
          if(!empty($data->type)){
            $agent_details['type'] = $data->type;
          }
        }
        $id = '';
        // print_r($id);die;
     if($this->agent_model->add_update_agent($id, $agent_details)){
            $this->response(array(
              "status" => 1,
              "message" => "successfully"
            ), REST_Controller::HTTP_OK);
        }else{
          $this->response(array(
            "status" => 0,
            "messsage" => "Failed"
          ), REST_Controller::HTTP_OK);
        } 
     }else{
     $this->response(array(
            "status" => 0,
            "messsage" => "Invalid user !"
          ), REST_Controller::HTTP_OK);
          return;
        }        
}
public function getAgent_post(){
   if(isset($this->admin_id) && ($this->user_type === 'super-admin' || $this->user_type === 'admin' || $this->user_type === 'manager')){
    $data = json_decode(file_get_contents("php://input"));
    // if(isset($data->id)){
    //     if(empty($data->id)){
    //      $this->response(array(
    //       "status" => 0,
    //       "message" => "fields must not be empty !"
    //     ), REST_Controller::HTTP_OK);
    //     return;
    //     }
    // }else{
    //         $this->response(array(
    //           "status" => 0,
    //           "message" => "All fields are required !"
    //         ), REST_Controller::HTTP_OK);
    //         return;
    //       }
    $id = '';
    if(isset($data->id)){
        if(!empty($data->id)){
            $id = $data->id;
        }
    }

    $page =  $data->page ?? 1;
    $limit = $data->limit ?? 10; 
    $offset = ($page - 1) * $limit;
    // $filter = array('executive'=> $data->filter_executive ?? null);
    // $sort = [
    //   'column_name' => $data->column_name ?? 'next_followup_date',
    //   'sort_order' => $data->sort_order ?? 'DESC'
    // ];
    // print_r($id);die;
      $response = $this->agent_model->get_agent($id, $offset, $limit);
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
    }else{
     $this->response(array(
            "status" => 0,
            "messsage" => "Invalid user !"
          ), REST_Controller::HTTP_OK);
          return;
    } 
}
public function deleteTeamMember_put(){
  if(isset($this->admin_id) && ($this->user_type === 'super-admin' || $this->user_type === 'admin' || $this->user_type === 'manager')){

     $data = json_decode(file_get_contents("php://input"));
    //  print_r($data);die;
      if(isset($data->executive_id)){  
        if(empty($data->executive_id)){
            $this->response(array(
            "status" => 0,
            "message" => "fields must not be empty !"
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
        $id = $data->executive_id ;
        // print_r($id);die;
     if($this->manager_model->delete_team_member($id)){
            $this->response(array(
              "status" => 1,
              "message" => "successfully"
            ), REST_Controller::HTTP_OK);
        }else{
          $this->response(array(
            "status" => 0,
            "messsage" => "Failed"
          ), REST_Controller::HTTP_OK);
        } 
  }else{
     $this->response(array(
            "status" => 0,
            "messsage" => "Invalid user !"
          ), REST_Controller::HTTP_OK);
          return;
        } 
  }       
}