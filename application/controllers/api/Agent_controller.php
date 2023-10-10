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
    $this->load->library(array("form_validation"));
    $this->load->helper(array("security","url"));
    
  //   $headers = $this->input->request_headers(); 
	// $this->decodedToken = $this->authorization_token->validateToken($headers['Authorization']);
  // print_r($this->decodedToken);die;
  //     if (!$this->decodedToken || $this->decodedToken['status'] != "1") {  
  //           $err = array(
  //               'status'=>false,
  //               'message'=>'Unauthorised Token',               
  //           );          
  //           echo json_encode($err);
  //           exit;         
  //         }
  //   $this->admin_id = $this->decodedToken['data']->admin_id ?? null;
  //   $this->employee_id = $this->decodedToken['data']->employee_id ?? null;
  //   $this->user_type = $this->decodedToken['data']->user_type ?? null;
  }
public function signup_post(){
    // print_r($this->input->post());
    $email = $this->security->xss_clean($this->input->post("email"));
    $password = $this->security->xss_clean($this->input->post("password"));
    $name = $this->security->xss_clean($this->input->post("name"));
    $otp = $this->security->xss_clean($this->input->post("otp"));
    // $reffer_by =$this->input->post("reffer_by");
    // $permission = $this->input->post("permission");
    // $permission = json_decode($permission);
    
// form validation for inputs
    $this->form_validation->set_rules("email", "Email", "required|valid_email");
    $this->form_validation->set_rules("password", "password", "required");
    $this->form_validation->set_rules("name", "name", "required");
    $this->form_validation->set_rules("otp", "otp", "required");
    // $this->form_validation->set_rules("reffer_by", "reffer_by", "required");
    // $this->form_validation->set_rules("permission", "permission", "required");

// checking form submittion have any error or not
    if($this->form_validation->run() === FALSE){
      $this->response(array(
        "status" => 0,
        "message" => "All fields are required!"
      ) , REST_Controller::HTTP_OK);
      return;
  }
// Checking if email exist   
    //  $existing_email = $email;
     $existing_email = $this->agent_model->agent_email_exist($email);
        if($existing_email){
        $this->response(array(
        "status" => 0,
        "message" => "Email already exists"
        ), REST_Controller::HTTP_OK);
        return;
        }
     
// Validate otp
        $validate_otp = $this->common_model->validate_otp($email,$otp);
        if(!$validate_otp){
        $this->response(array(
        "status" => 0,
        "message" => " incorrect otp "
        ), REST_Controller::HTTP_OK);
        return;
        }
      
// all values are available
        $agent_details = array(         
          "name" => $name,
          "email" => $email,
          "password" => md5($password)       
        );
          // if(!empty($reffer_by))
          //   {
          //      $agent_details["reffer_by"] = $reffer_by;
          //   }
          //   if(!empty($resume)) {
          //     // echo("resume base 64: $resume <br>");die;
          //     $cv_data = base64_decode($resume);
          //     $file_name_for_upload = time().'.pdf';
          //     $file_path = FCPATH . 'uploads/' . $file_name_for_upload;
          //     if(file_put_contents($file_path, $cv_data)) {
          //         $cv = base_url() . 'uploads/' . $file_name_for_upload;
          //         $agent_details["resume"] = $cv;
          //     } else {
          //         // File upload failed
          //     }
          //   } 
            $response = $this->agent_model->insert_agent($agent_details);
              // if($response){
                // Creating default email and notification permission
              //   $agent_details_permission = array(
              //     'agent_details_id'=>$response->agent_details_id,
              //     'email_permission'=> json_encode($permission->email_permission),
              //     'notification_permission'=> json_encode($permission->notification_permission)
              //   );
              //   $this->db->insert('agent_details_setting', $agent_details_permission);

              // }
            // print_r($response);die;
            if($response){
              // $unique_id = $this->common_model->getLastRecord_email()['id'] ?? 1;
              // $unique_id .= mt_rand(1000, 9999);
              // // Sending email
              // // agent_details -----------------------------------------------------
              // $email_template_id = 1;
              // $eamil_detail = array('to' => $response->email ?? NULL);
              // $this->common_model->email($eamil_detail, $email_template_id, $unique_id);
              // // Admin --------------------------------------------------------
              // $email_template_id = 8;
              // $eamil_detail_admin = array('to' =>  $this->admin_email ?? NULL,
              //                             'admin_name' => 'Aashi',
              //                             'user_email' => $response->email ?? NULL);
              // $this->common_model->email($eamil_detail_admin, $email_template_id, $unique_id);
              //           // Code to send notification
              //           $detail['from_id'] = 5;
              //           $detail['type'] = 'manager';
              //           $detail['subject'] = 'new_user_registered';
              //           $detail['action_id'] = $response->employee_id ?? NULL;
              //           $detail['message'] = 'A new user '.$response->email.' registered successfully';
              //           // $detail['message'] = 'hey, '.$response->email.' welcome onboard';
              //           $this->common_model->addNotification($detail);
              $this->response(array(
                "status" => 1,
                "message" => "created successfully"
              ), REST_Controller::HTTP_OK);
              }else{
              
                $this->response(array(
                  "status" => 0,
                  "message" => "Failed !"
                ), REST_Controller::HTTP_OK);
                return;
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
        }else{
          $this->response(array(
            "status" => 0,
            "message" => "Id and password are required!"
          ), REST_Controller::HTTP_OK);
          return;
        }
        $credentials = array('email' => $email, 'password' => md5($password)); //md5($password)
        $loginStatus = $this->agent_model->validate_agent($credentials);
            //  print_r($loginStatus);die;
        if ($loginStatus == false) {
           $this->response(array(
             "status" => 0,
             "message" => "Invalid credentials !"
             ), REST_Controller::HTTP_OK);
             return;
            }
        $userId = array('id' => $loginStatus->id,
                        'user_type' => 'agent');
        $bearerToken = $this->authorization_token->generateToken($userId);
         $this->response(array(
            "status" => 1,
            "message" => "Successfully Logged In",
            'id'=> $loginStatus->id,
            // 'name'=> $loginStatus->name,
            'email'=> $loginStatus->email,
            'user_type'=> 'agent',
            'token' => $bearerToken,
            ) , REST_Controller::HTTP_OK);
            return;    
  }
public function addUpadateAgent_put(){
  $user = $this->validateToken();
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
      if(isset($data->name)){  
        if(empty($data->name)){
      // if(isset($data->name) && isset($data->email) && isset($data->contact_no) && isset($data->address) && isset($data->city) && isset($data->state) && isset($data->country)){  
      //   if(empty($data->name) || empty($data->email) || empty($data->contact_no) || empty($data->address) || empty($data->city) || empty($data->state) || empty($data->country)){
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
            // 'email' => $data->email,
            // 'contact_no' => $data->contact_no,
            // 'address' => $data->address,
            // 'city' => $data->city,
            // 'state' => $data->state,
            // 'country' => $data->country,
        );
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
      }
        // print_r($msg);die;
        
        $response = $this->agent_model->add_update_agent($id, $agent_details);
        
        // print_r($response);die;
     if($response){
        if($response === "Duplicate entry. Email already exists"){
          $this->response(array(
              "status" => 1,
              "message" => $response
            ), REST_Controller::HTTP_OK);
            return;
        }
            $this->response(array(
              "status" => 1,
              "message" => $msg
            ), REST_Controller::HTTP_OK);
            return;
        }else{
          $this->response(array(
            "status" => 0,
            "messsage" => "Failed"
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
public function getAgent_post(){
  $user = $this->validateToken();
  // print_r($user['data']->user_type);die;
  $user_type = $user['data']->user_type;
   if($user_type === 'super-admin' || $user_type === 'admin' || $user_type === 'agent'){
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
      'column_name' => (isset($data->column_name) && $data->column_name !== null && $data->column_name !== "") ? $data->column_name : "created_at" ,
      'sort_order' => (isset($data->sort_order) && $data->sort_order !== null && $data->sort_order !== "") ? $data->sort_order : "DESC"
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
  $user = $this->validateToken();
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