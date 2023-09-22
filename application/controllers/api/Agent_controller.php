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
    $msg = "created successfully";
    $id = '';
    if(isset($data->id) && !empty($data->id)){
      /*
    ||-------------------------------------------------------------------------------------------------
    ||  Update
    ||-------------------------------------------------------------------------------------------------
     */
        $msg = "updated successfully";
        $id = $data->id;
        if(isset($data->name)){
          if(!empty($data->name)){
            $agent_details['name'] = $data->name;
          }
        }
        if(isset($data->email)){
          if(!empty($data->email)){
            $agent_details['email'] = $data->email;
          }
        }
        if(isset($data->contact_no)){
          if(!empty($data->contact_no)){
            $agent_details['contact_no'] = $data->contact_no;
          }
        }
        if(isset($data->address)){
          if(!empty($data->address)){
            $agent_details['address'] = $data->address;
          }
        }
        if(isset($data->city)){
          if(!empty($data->city)){
            $agent_details['city'] = $data->city;
          }
        }
        if(isset($data->state)){
          if(!empty($data->state)){
            $agent_details['state'] = $data->state;
          }
        }
        if(isset($data->country)){
          if(!empty($data->country)){
            $agent_details['country'] = $data->country;
          }
        }
        if(isset($data->type)){
          if(!empty($data->type)){
            $agent_details['type'] = $data->type;
          }
        }
        if(isset($data->profile_image)){
          if(!empty($data->profile_image)){
                     $image_data = $data->profile_image;

                // Check if the image data is a base64-encoded string
                if (preg_match('/^data:image\/(\w+);base64,/', $image_data, $image_type)) {
                    $image_data = substr($image_data, strpos($image_data, ',') + 1);
                
                    $file_extension = strtolower($image_type[1]);
                
                    // Check if the image type is supported
                    if (in_array($file_extension, array('jpg', 'jpeg', 'png', 'gif'))) {
                        $image_data = base64_decode($image_data);
                    
                        $file_name_for_upload = time() . '.' . $file_extension;
                        $file_path_for_upload = './uploads/' . $file_name_for_upload;
                        file_put_contents($file_path_for_upload, $image_data);
                    
                        $logo = base_url() . 'uploads/' . $file_name_for_upload;
                       $agent_details["profile_image"] = $logo;
                    } else {
                        // Unsupported file type
                       unset($agent_details["profile_image"]);
                    }
                } else {
                    // Invalid base64-encoded image data
                 unset($agent_details["profile_image"]);
                }
              }
            }
      }else{
        /*
    ||-------------------------------------------------------------------------------------------------
    ||  Create
    ||-------------------------------------------------------------------------------------------------
     */
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
        if(isset($data->profile_image)){
          if(!empty($data->profile_image)){
                     $image_data = $data->profile_image;

                // Check if the image data is a base64-encoded string
                if (preg_match('/^data:image\/(\w+);base64,/', $image_data, $image_type)) {
                    $image_data = substr($image_data, strpos($image_data, ',') + 1);
                
                    $file_extension = strtolower($image_type[1]);
                
                    // Check if the image type is supported
                    if (in_array($file_extension, array('jpg', 'jpeg', 'png', 'gif'))) {
                        $image_data = base64_decode($image_data);
                    
                        $file_name_for_upload = time() . '.' . $file_extension;
                        $file_path_for_upload = './uploads/' . $file_name_for_upload;
                        file_put_contents($file_path_for_upload, $image_data);
                    
                        $logo = base_url() . 'uploads/' . $file_name_for_upload;
                       $agent_details["profile_image"] = $logo;
                    } else {
                        // Unsupported file type
                       unset($agent_details["profile_image"]);
                    }
                } else {
                    // Invalid base64-encoded image data
                 unset($agent_details["profile_image"]);
                }
          }
        }
      }
        // print_r($msg);die;
     if($this->agent_model->add_update_agent($id, $agent_details)){
            $this->response(array(
              "status" => 1,
              "message" => $msg
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

    $search = $data->search ?? '';
    // $filter = array('executive'=> $data->filter_executive ?? null);
    $sort = [
      'column_name' => $data->column_name ?? 'created_at',
      'sort_order' => $data->sort_order ?? 'DESC'
    ];
    // print_r($id);die;
      $response = $this->agent_model->get_agent($id, $search, $sort, $offset, $limit);
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
public function deleteAgent_post(){
  if(isset($this->admin_id) && ($this->user_type === 'super-admin' || $this->user_type === 'admin' || $this->user_type === 'manager')){

     $data = json_decode(file_get_contents("php://input"));
    //  print_r($data);die;
      if(isset($data->id)){  
        if(empty($data->id)){
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
        $id = $data->id ;
        // print_r($id);die;
     if($this->agent_model->delete_agent($id)){
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