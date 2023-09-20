<?php

Header('Access-Control-Allow-Origin: *'); //for allow any domain, insecure

Header('Access-Control-Allow-Headers: *'); //for allow any headers, insecure

Header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE'); //

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH.'libraries/REST_Controller.php';
class Admin_api extends REST_Controller{
  public function __construct(){
    parent::__construct();
    $this->load->database();
    $this->load->model(array("admin_model","common_model"));
    // $this->load->model(array("common_model"));
    $this->load->library(array("form_validation","Authorization_Token"));
    // $this->load->library('Authorization_Token');
    $this->load->helper("security");
    $this->load->helper('url');
    
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

  public function addAdmin_put(){
     $data = json_decode(file_get_contents("php://input")); 
     if(empty($data->admin_id)){
    // ------------ Insert admin ------------
     $existing_admin = $this->admin_model->get_admin_by_email($data);
        if($existing_admin){
        $this->response(array(
        "status" => 0,
        "message" => "Admin already exists"
        ), REST_Controller::HTTP_OK);
        return;
        }
        if(isset($data->name) && isset($data->email)  && isset($data->password) && isset($data->admin_type))
        { 
        $error_flag=0; 
    if(empty($data->name) || empty($data->email) || empty($data->password) || empty($data->admin_type)){
         $error_flag = 1;
        }
         if($error_flag){
            $this->response(array(
            "status" => 0,
            "message" => "All fields are required!"
          ) , REST_Controller::HTTP_OK);
         return;
        }
        // all values are available
        $admin = array(
          "name" => $data->name,
          "email" => $data->email,
          "password" => md5($data->password),
          "admin_type" => $data->admin_type,
        );
        if(isset($data->contact_no)){
          if(!empty($data->contact_no)){
              $admin['contact_no'] = $data->contact_no;
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
                       $admin["profile_image"] = $logo;
                    } else {
                        // Unsupported file type
                       unset($admin["profile_image"]);
                    }
                } else {
                    // Invalid base64-encoded image data
                 unset($admin["profile_image"]);
                }

          }
        }
        // print_r($admin); die;
        if($this->admin_model->addUpdateAdmin($admin)){
          $this->response(array(
            "status" => 1,
            "message" => "admin added successfully"
          ), REST_Controller::HTTP_OK);
          return;
        }else{
          $this->response(array(
            "status" => 0,
            "message" => "Failed to create admin"
          ), REST_Controller::HTTP_OK);
          return;
        }
      }else{
        // we have some empty field
        $this->response(array(
          "status" => 0,
          "message" => "All fields are needed!"
        ), REST_Controller::HTTP_OK);
      }
    }else{
      // ------------ Update admin ------------
        $id = $data->admin_id;
        if(isset($data->name)){
          if(!empty($data->name)){
              $admin['name'] = $data->name;
          }
        }
        if(isset($data->email)){
          if(!empty($data->email)){
              $admin['email'] = $data->email;
          }
        }
        if(isset($data->admin_type)){
          if(!empty($data->admin_type)){
              $admin['admin_type'] = $data->admin_type;
          }
        }
         if(isset($data->contact_no)){
          if(!empty($data->contact_no)){
              $admin['contact_no'] = $data->contact_no;
          }
        }
        if(isset($data->is_active)){
          $admin['is_active'] = $data->is_active;
        }
        if(isset($data->is_deleted)){
          $admin['is_active'] = $data->is_active;
        }
        if(isset($data->email_permission)){
             $admin['email_permission'] = $data->email_permission;
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
                       $admin["profile_image"] = $logo;
                    } else {
                        // Unsupported file type
                       unset($admin["profile_image"]);
                    }
                } else {
                    // Invalid base64-encoded image data
                 unset($admin["profile_image"]);
                }
          }
        }
        // print_r($admin); die;
        if($this->admin_model->addUpdateAdmin($admin, $id)){
          $this->response(array(
            "status" => 1,
            "message" => "admin updated successfully"
          ), REST_Controller::HTTP_OK);
          return;
        }else{
          $this->response(array(
            "status" => 0,
            "message" => "Failed !"
          ), REST_Controller::HTTP_OK);
          return;
        }
      // }else{
      //   // we have some empty field
      //   $this->response(array(
      //     "status" => 0,
      //     "message" => "All fields are needed!"
      //   ), REST_Controller::HTTP_OK);
      // }
    }
    }
  public function addFollowUpEmployee_post(){

     $data = json_decode(file_get_contents("php://input"));
    //  print_r($data);die;
      if(isset($data->employee_id) && isset($data->remark))
      { 
         $error_flag = 0;  
        if(empty($data->employee_id) || empty($data->remark))
        {

            $error_flag = 1;

        }
         if($error_flag){
            $this->response(array(
            "status" => 0,
            "message" => "All fields are required!"
          ) , REST_Controller::HTTP_NOT_FOUND);
         return;
        }
        $followup_detail = array(
          "employee_id" => $data->employee_id,
          "remark" => $data->remark,
        );
        if(!empty($this->admin_id)){
          $followup_detail['created_by'] =  $this->admin_id;
          $followup_detail['type'] = $this->user_type;
        }  
        if(isset($data->next_date)){
          if(!empty($data->next_date)){
            $followup_detail["next_followup_date"]=$data->next_date;
          }
        }
        if(isset($data->subject)){
          if(!empty($data->subject)){
            $followup_detail["subject"]=$data->subject;
          }
        }
        // print_r($followup_detail);die;
     if($this->admin_model->add_follow_up_employee($followup_detail)){
            $this->response(array(
              "status" => 1,
              "message" => "follow up updated successfully"
            ), REST_Controller::HTTP_OK);
        }else{
          $this->response(array(
            "status" => 0,
            "messsage" => "Failed to update follow up"
          ), REST_Controller::HTTP_OK);
        }  
      }else{
        $this->response(array(
          "status" => 0,
          "message" => "All fields are needed"
        ), REST_Controller::HTTP_OK);
      }
}
public function addFollowUpEmployer_post(){

     $data = json_decode(file_get_contents("php://input"));
    //  print_r($data);die;
      if(isset($data->company_id) && isset($data->remark))
      { 
         $error_flag = 0;  
        if(empty($data->company_id) || empty($data->remark))
        {

            $error_flag = 1;

        }
         if($error_flag){
            $this->response(array(
            "status" => 0,
            "message" => "All fields are required!"
          ) , REST_Controller::HTTP_NOT_FOUND);
         return;
        }
        $followup_detail = array(
          "company_id" => $data->company_id,
          "remark" => $data->remark,
        );
        if(!empty($this->admin_id)){
          $followup_detail['created_by'] =  $this->admin_id;
          $followup_detail['type'] = $this->user_type;
        }  
        if(isset($data->next_date)){
          if(!empty($data->next_date)){
            $followup_detail["next_followup_date"]=$data->next_date;
          }
        }
        if(isset($data->subject)){
          if(!empty($data->subject)){
            $followup_detail["subject"]=$data->subject;
          }
        }
        // print_r($followup_detail);die;
     if($this->admin_model->add_follow_up_employer($followup_detail)){
            $this->response(array(
              "status" => 1,
              "message" => "follow up updated successfully"
            ), REST_Controller::HTTP_OK);
        }else{
          $this->response(array(
            "status" => 0,
            "messsage" => "Failed to update follow up"
          ), REST_Controller::HTTP_OK);
        }  
      }else{
        $this->response(array(
          "status" => 0,
          "message" => "All fields are needed"
        ), REST_Controller::HTTP_OK);
      }
}

public function viewFollowup_post(){



    // $admin_detail = $this->admin_model->getAllAdmin();

 $data = json_decode(file_get_contents("php://input"));

    // print_r($data);die;

    // Get pagination parameters
    $details = array();
    if(!empty($this->admin_id) && $this->user_type != "super-admin" && $this->user_type != "admin"){
      $details = array("admin_id" =>  $this->admin_id,
                          "admin_type" =>  $this->user_type);
    }  
    $page = isset($data->page) ? $data->page : 1;

    $limit = isset($data->limit) ? $data->limit : 10; 



    // Get search parameter

    $search = isset($data->search) ? $data->search : '';



    // Get filter parameters



    $filter = ['job_title'=>$data->filter_job_type ?? null,
              'company_name'=>$data->filter_company_name ?? null,
              'experience'=>$data->filter_experience ?? null,
];

    

    // Calculate offset for pagination

    $offset = ($page - 1) * $limit;



    // sorting 

    $sort = [

      'column_name' => $data->column_name ?? null ,

      'sort_order' => $data->sort_order ?? null

    ];



    $result = $this->admin_model->getAllfollowupView($details, $filter, $search, $limit, $offset, $sort);



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



        "message" => "No data found",



      ), REST_Controller::HTTP_OK);



    }



}


public function getFollowUpEmployee_post(){
    $data = json_decode(file_get_contents("php://input"));
    $id = array();
    if(isset($data->employee_id)){
      $id['employee_id'] = $data->employee_id;
    }
   
    $filter = array('next_followup_date'=> $data->next_followup_date ?? null);
    $sort = [
      'column_name' => $data->column_name ?? 'next_followup_date',
      'sort_order' => $data->sort_order ?? 'DESC'
    ];
    // print_r($id);die;
      $response = $this->admin_model->get_follow_up_employee($id, $filter, $sort);
      if($response){
        $this->response(array(
          "status" => 1,
          "message" => "Successfully",
          "data" => $response
        ), REST_Controller::HTTP_OK);
      }else{
        $this->response(array(
          "status" => 0,
          "message" => "No data found",
        ), REST_Controller::HTTP_OK);
      }
  }
  public function getFollowUpEmployer_post(){
    $data = json_decode(file_get_contents("php://input"));
    $id = array();
    if(isset($data->company_id)){
      $id['company_id'] = $data->company_id;
    }
    $filter = array('next_followup_date'=> $data->next_followup_date ?? null);
     $sort = [
      'column_name' => $data->column_name ?? 'next_followup_date',
      'sort_order' => $data->sort_order ?? 'DESC'
    ];
    // print_r($id);die;
      $response = $this->admin_model->get_follow_up_employer($id, $filter, $sort);
      if($response){
        $this->response(array(
          "status" => 1,
          "message" => "Successfully",
          "data" => $response
        ), REST_Controller::HTTP_OK);
      }else{
        $this->response(array(
          "status" => 0,
          "message" => "No data found",
        ), REST_Controller::HTTP_OK);
      }
  }


   public function allAdmin_post(){



    // $admin_detail = $this->admin_model->getAllAdmin();

 $data = json_decode(file_get_contents("php://input"));
 $details = array();
 if(!empty($this->admin_id) && $this->user_type != "super-admin" && $this->user_type != "admin"){
      $details = array("admin_id" =>  $this->admin_id,
                          "admin_type" =>  $this->user_type);
    }  
    // print_r($data);die;

    // Get pagination parameters

    $page = isset($data->page) ? $data->page : 1;

    $limit = isset($data->limit) ? $data->limit : 10; 



    // Get search parameter

    $search = isset($data->search) ? $data->search : '';



    // Get filter parameters



    $filter = $data->filter_admin_type ?? null;

    

    // Calculate offset for pagination

    $offset = ($page - 1) * $limit;



    // sorting 

    $sort = [

      'column_name' => $data->column_name ?? null ,

      'sort_order' => $data->sort_order ?? null

    ];



    $result = $this->admin_model->getAllAdmin($details, $filter, $search, $limit, $offset, $sort);



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



        "message" => "No data found",



      ), REST_Controller::HTTP_NOT_FOUND);



    }



}



public function admin_post(){

  $data = json_decode(file_get_contents("php://input"));

  $admin_id = $data->admin_id;

  // print_r();die;

 

  $admin_detail = $this->admin_model->getAdmin($admin_id);



  //print_r($query->result());



  if(count($admin_detail) > 0){



    $this->response(array(

      "status" => 1,

      "message" => "admin data found",

      "data" =>$admin_detail

    ), REST_Controller::HTTP_OK);

  }else{



    $this->response(array(

      "status" => 0,

      "message" => "No data found",

      "data" => $admin_detail

    ), REST_Controller::HTTP_OK);

  }

}

public function deleteAdmin_post(){

  $data = json_decode(file_get_contents("php://input"));

  $admin_id = $data->admin_id;

  if($this->admin_model->deleteAdmin($admin_id)){



    // retruns true



    $this->response(array(



      "status" => 1,



      "message" => "admin has been deleted"



    ), REST_Controller::HTTP_OK);



  }else{



    // return false



    $this->response(array(



      "status" => 0,



      "message" => "Failed to delete admin"



    ), REST_Controller::HTTP_OK);



  }



}

public function addUpdatefilterList_put(){

  $data = json_decode(file_get_contents("php://input"));
  // var_dump(($data));die;

  if(isset($data->id)){
      if(!empty($data->id)){
          $msg = "filter item added successfully";
          $list = array('id'=>$data->id,
                        'json'=>$data->json_item
          );
         
      }
  }
$response = $this->admin_model->addUpdateFilterList($list);
// print_r($response);die;
  if($response){

      if($response === "already exist"){
        $this->response(array(



          "status" => 1,
    
    
    
          "message" => "item already exist !"
    
    
    
        ), REST_Controller::HTTP_OK);
        return;
      }

    // retruns true
    $this->admin_model->getFilterList();

    $this->response(array(



      "status" => 1,



      "message" => $msg



    ), REST_Controller::HTTP_OK);



  }else{



    // return false



    $this->response(array(



      "status" => 0,



      "message" => "Error"



    ), REST_Controller::HTTP_OK);



  }



}
 public function getFilterList_post(){
      $data = json_decode(file_get_contents("php://input"));
      $list_id = $data->list_id ?? null;
      // $this->common_model->getJobCategory(); // updating categories from job_category table to list
      $res = $this->admin_model->getFilterList($list_id);
      // print_r($res);die;     
      if($res){
         $this->response(array(
        "status" => 1,
        "message" => "Successful",
        "data" => $res
      ), REST_Controller::HTTP_OK);

      }else{

        $this->response(array(
          "status" => 0,
          "message" => "No data found"
        ), REST_Controller::HTTP_OK);
      }
  }
  public function deleteFilterListItem_post(){

  $data = json_decode(file_get_contents("php://input"));

  $id = array('item_id'=>$data->id,
              'json_item_id'=>$data->json_item_id);

  if($this->admin_model->deleteFilterList($id)){


    $this->response(array(



      "status" => 1,



      "message" => "List item has been deleted"



    ), REST_Controller::HTTP_OK);



  }else{


    $this->response(array(



      "status" => 0,



      "message" => "Failed to delete list item"



    ), REST_Controller::HTTP_OK);



  }

}
 public function getToken_post(){

    $data = json_decode(file_get_contents("php://input"));
     
//  print_r($user_type);die;
if(!empty($this->user_type) && $this->user_type == "super-admin" || $this->user_type == "admin"){
  $id = array('admin_id' =>$data->admin_id);
  // print_r('if');die;
  
  $loginStatus = $this->admin_model->checkLogin($id);
  // print_r($loginStatus);die;
  
              if ($loginStatus != false) {
  
                  $userId = array('admin_id' => $loginStatus->admin_id,
                                  'user_type' => $loginStatus->admin_type);
  
                  $bearerToken = $this->authorization_token->generateToken($userId);
                    $this->response(array(

                            "status" => 1,

                            "message" => "successful",

                            "admin_id"=>$loginStatus->admin_id,

                            "user_type"=>$loginStatus->admin_type,

                            "token" => $bearerToken,

                    ), REST_Controller::HTTP_OK);
  
              } else {
                    $this->response(array(

                            "status" => 1,

                            "message" => "Invalid Credentials",

                    ), REST_Controller::HTTP_OK);
              
              }

    }
    else{
         $this->response(array(
        
          "status" => 0,
        
          "message" => "Unauthorized admin",
        
        ), REST_Controller::HTTP_OK);
      
    }
       
    }
  //   public function getSummaryCounts_get(){



  //     $counts = $this->admin_model->getSummaryCounts();



  //     if($counts){







  //       $this->response(array(



  //         "status" => 1,



  //         "message" => "Successfully",



  //         "data" => $counts



  //       ), REST_Controller::HTTP_OK);



  //     }else{







  //       $this->response(array(



  //         "status" => 0,



  //         "message" => "No data found",



  //       ), REST_Controller::HTTP_OK);



  //     }



  // }
  public function getAllLastFollowup_post(){



    // $admin_detail = $this->admin_model->getAllAdmin();

 $data = json_decode(file_get_contents("php://input"));

    // print_r($data);die;

    // Get pagination parameters
    $id = array();
    if(!empty($this->admin_id) && $this->user_type != "super-admin" && $this->user_type != "admin"){
      $id = array("admin_id" =>  $this->admin_id,
                          "admin_type" =>  $this->user_type);
    }  
    // print_r($id);die;
    $page = isset($data->page) ? $data->page : 1;

    $limit = isset($data->limit) ? $data->limit : 10; 



    // Get search parameter

    $search = isset($data->search) ? $data->search : '';



    // Get filter parameters



    $filter = array();
 if(isset($data->filter_by_time)){
      if($data->filter_by_time == "today"){
            $filter['start_date'] = date('Y-m-d');
            $filter['end_date'] = date('Y-m-d', strtotime('tomorrow'));

      }
      if($data->filter_by_time == "this_week"){
            $filter['start_date'] = date('Y-m-d', strtotime('this week'));
            $filter['end_date'] = date('Y-m-d', strtotime('this week +7days'));

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


    $result = $this->admin_model->getAllLastFollowup($id, $filter, $search, $limit, $offset, $sort);



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



        "message" => "No data found",



      ), REST_Controller::HTTP_OK);



    }



}
public function changePassword_put(){
        
        // print_r($this->uri->segment(2));die;
        $data = json_decode(file_get_contents("php://input"));
         if (isset($data->password) && isset($data->new_password) && isset($data->conf_password) && isset($this->admin_id)){
               if(empty($data->password) || empty($data->new_password) || empty($data->conf_password) || empty($this->admin_id)){
                     $this->response(array(
                    "status" => 0,
                    "message" => "Fields must not be empty !"
                    ) , REST_Controller::HTTP_OK);
                    return;
               }
               if($data->new_password !== $data->conf_password){
                 $this->response(array(
                    "status" => 0,
                    "message" => "new password and confirm password must be same !"
                    ) , REST_Controller::HTTP_OK);
                    return;
               }
                $check_password = array('password' => md5($data->password));
                $status = $this->admin_model->checkLogin($check_password);
                if($status != false){
                // print_r($status);die;
                 $new_password = array('admin_id'=>$status->admin_id,
                                        'password'=>md5($data->new_password));
               if($this->admin_model->addUpdateAdmin($new_password)){
                  $this->response(array(
                    "status" => 1,
                    "message" => "Password updated successfully"
                    ) , REST_Controller::HTTP_OK);
                    return;
                  }else{
                     $this->response(array(
                    "status" => 0,
                    "message" => "failed !"
                    ) , REST_Controller::HTTP_OK);
                    return;
                  }
            } else {
               $this->response(array(
                    "status" => 0,
                    "message" => "Wrong password"
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
public function addUpdateMiscellaneousSubstage_put(){
    
    $data = json_decode(file_get_contents("php://input"));
    if (isset($data->misc_id) && isset($data->type) && isset($data->substage)){
      if(empty($data->misc_id) || empty($data->type) || empty($data->substage)){
                //  echo"in empty check";die;
                     $this->response(array(
                    "status" => 0,
                    "message" => "Fields must not be empty !"
                    ) , REST_Controller::HTTP_OK);
                    return;
               }
    }else{
         $this->response(array(
            "status" => 0,
            "messsage" => "All fields required !"
          ), REST_Controller::HTTP_OK);
          return;
      }
      $detail = array(
        'misc_id'=>$data->misc_id,
        'type'=>$data->type,
        'substage'=>$data->substage
      );
      $id = array();
      $msg = "created successfully";
      //  if(isset($data->employee_id) && isset($data->status)){
      //     if(!empty($data->employee_id) || !empty($data->status)){
      //     $detail["employee_id"]=$data->employee_id;
      //     $detail["status"]=$data->status;
      //   }
       if(isset($this->admin_id) || isset($this->employee_id)){
           if(!empty($this->admin_id) || !empty($this->employee_id)){
           $detail["created_by"] = $this->admin_id ?? $this->employee_id;
           $detail["created_type"]=$this->user_type;
         }
       }
       if(isset($data->id) && !empty($data->id)){
          $id=$data->id;
          $msg = "updated successfully";
          unset($detail['created_by']);
          unset($detail['created_type']);
          $detail["updated_by"] = $this->admin_id ?? $this->employee_id;
          $detail["updated_type"]=$this->user_type;
       }
        if(isset($data->status)){
           if(!empty($data->status)){
           $detail["status"]=$data->status;
         }
       }
      // print_r($detail);die;
        $response = $this->admin_model->add_update_miscellaneous_substage($id, $detail);
        // print_r($response['response']);die;
        if($response){
            $this->response(array(
              "status" => 1,
              "message" => $msg
            ), REST_Controller::HTTP_OK);

            // Activity log
           $insert_id =  $this->db->insert_id();
            if($insert_id){
                                      $para['status'] = 34; // "Miscellaneous Substage inserted"
                                      $para['action_id'] = $data->misc_id;
                                      $para['action_type'] = $data->type;
                                      }else{
                                          $para['status'] = 35; // "Miscellaneous Substage updated"
                                          $para['action_id'] = $data->misc_id;
                                          $para['action_type'] = $data->type;
                                      }
                                      if(isset($para)){
                                      $this->_log_request($para);
                                      }
        }else{

          $this->response(array(
            "status" => 0,
            "messsage" => "Failed !"
          ), REST_Controller::HTTP_OK);
        }
   }
   public function getMiscellaneousSubstage_post(){
      $data = json_decode(file_get_contents("php://input"));
      $id = $data->id ?? NULL;
      $filter = array(
        'misc_id' => $data->filter_by_misc_id ?? NULL,
        'type' => $data->filter_by_type ?? NULL,
      );
      $sort = array();
      $res = $this->admin_model->get_miscellaneous_substage($id, $filter, $sort);
      // print_r($res);die;     
      if($res){
         $this->response(array(
        "status" => 1,
        "message" => "Successful",
        "data" => $res
      ), REST_Controller::HTTP_OK);

      }else{

        $this->response(array(
          "status" => 0,
          "message" => "No data found"
        ), REST_Controller::HTTP_OK);
      }
  }
  public function deleteMiscellaneousSubstage_post(){

  $data = json_decode(file_get_contents("php://input"));
  if(isset($data->id)){
    if(empty($data->id)){
                  $this->response(array(
                    "status" => 0,
                    "message" => "id must not be empty !"
                    ) , REST_Controller::HTTP_OK);
                    return;
               }
    }else{
         $this->response(array(
            "status" => 0,
            "messsage" => "id required !"
          ), REST_Controller::HTTP_OK);
          return;
      }
  $id = $data->id;

  if($this->admin_model->delete_miscellaneous_substage($id)){
    $this->response(array(
      "status" => 1,
      "message" => "List item has been deleted"
    ), REST_Controller::HTTP_OK);
  }else{
    $this->response(array(
      "status" => 0,
      "message" => "Failed to delete list item"
    ), REST_Controller::HTTP_OK);
  }
}
public function getActivityLog_post(){
      $data = json_decode(file_get_contents("php://input"));
      $id = $data->id ?? NULL;

      $page = isset($data->page) ? $data->page : 1;
      $limit = isset($data->limit) ? $data->limit : 10;
      $offset = ($page - 1) * $limit;

      $filter = array(
        'misc_id' => $data->filter_by_misc_id ?? NULL,
        'type' => $data->filter_by_type ?? NULL,
      );

      $sort = array();

      $res = $this->admin_model->get_activity_log($id, $filter, $sort, $limit, $offset);
      if($res){
      // print_r($res['data']);die; 
      
      // getting activity log json 
      $filename = "filterList/activityLogMessages.json";
      $jsonContent = file_get_contents($filename);
      $data = json_decode($jsonContent, true); 

      // replacing json variables with details from activity log table
      $message = array(); 
      foreach($res['data'] as $key => $value){
        // "Employee updated"
        if($value['status'] == 1){
          $employee_updated = str_replace('{{name}}', $value['employee_name'], $data["employee_updated"]);
          $employee_updated = str_replace('{{created_by}}', $value['user_type'], $employee_updated);
          $employee_updated = str_replace('{{time}}', $value['created_at'], $employee_updated);

          $res['data'][$key]['msg'] = $employee_updated; 
          // $message[] = $employee_updated;
          // $message[] = "employee name ".$value['employee_name']." updated by ".$value['user_type']." - ".$value['created_by']." on ".$value['created_at'];
        } 
        // "Employee inserted" 
        if($value['status'] == 2){
          $employee_inserted = str_replace('{{name}}', $value['employee_name'], $data["employee_inserted"]);
          $employee_inserted = str_replace('{{created_by}}', $value['user_type'], $employee_inserted);
          $employee_inserted = str_replace('{{time}}', $value['created_at'], $employee_inserted);

          $res['data'][$key]['msg'] = $employee_inserted;
        } 
        // "Employee skill inserted" 
        if($value['status'] == 3){
          $employee_skill = str_replace('{{name}}', $value['employee_name'], $data["employee_skill"]);
          $employee_skill = str_replace('{{created_by}}', $value['user_type'], $employee_skill);
          $employee_skill = str_replace('{{time}}', $value['created_at'], $employee_skill);

          $res['data'][$key]['msg'] = $employee_skill;
        }  
        // "Employee education details inserted"
        if($value['status'] == 4){
          $employee_education_inserted = str_replace('{{name}}', $value['employee_name'], $data["employee_education_inserted"]);
          $employee_education_inserted = str_replace('{{user_type}}', $value['user_type'], $employee_education_inserted);
          $employee_education_inserted = str_replace('{{created_by}}', $value['created_by'], $employee_education_inserted);
          $employee_education_inserted = str_replace('{{time}}', $value['created_at'], $employee_education_inserted);

          $res['data'][$key]['msg'] = $employee_education_inserted;        
        } 
        // "Employee education details updated" 
        if($value['status'] == 5){
          $employee_education_updated = str_replace('{{name}}', $value['employee_name'], $data["employee_education_updated"]);
          $employee_education_updated = str_replace('{{user_type}}', $value['user_type'], $employee_education_updated);
          $employee_education_updated = str_replace('{{created_by}}', $value['created_by'], $employee_education_updated);
          $employee_education_updated = str_replace('{{time}}', $value['created_at'], $employee_education_updated);

          $res['data'][$key]['msg'] = $employee_education_updated; 
        }  
        // "Employee career details inserted"
        if($value['status'] == 6){
          $employee_career_inserted = str_replace('{{name}}', $value['employee_name'], $data["employee_career_inserted"]);
          $employee_career_inserted = str_replace('{{user_type}}', $value['user_type'], $employee_career_inserted);
          $employee_career_inserted = str_replace('{{created_by}}', $value['created_by'], $employee_career_inserted);
          $employee_career_inserted = str_replace('{{time}}', $value['created_at'], $employee_career_inserted);

          $res['data'][$key]['msg'] = $employee_career_inserted; 
        }  
        // "Employee career details updated"
        if($value['status'] == 7){
          $employee_career_updated = str_replace('{{name}}', $value['employee_name'], $data["employee_career_updated"]);
          $employee_career_updated = str_replace('{{user_type}}', $value['user_type'], $employee_career_updated);
          $employee_career_updated = str_replace('{{created_by}}', $value['created_by'], $employee_career_updated);
          $employee_career_updated = str_replace('{{time}}', $value['created_at'], $employee_career_updated);

          $res['data'][$key]['msg'] = $employee_career_updated; 
        }  
        // "Employee document inserted"
        if($value['status'] == 8){
          $employee_document_inserted = str_replace('{{name}}', $value['employee_name'], $data["employee_document_inserted"]);
          $employee_document_inserted = str_replace('{{user_type}}', $value['user_type'], $employee_document_inserted);
          $employee_document_inserted = str_replace('{{created_by}}', $value['created_by'], $employee_document_inserted);
          $employee_document_inserted = str_replace('{{time}}', $value['created_at'], $employee_document_inserted);

          $res['data'][$key]['msg'] = $employee_document_inserted; 
        }  
        // "Employee document updated"
        if($value['status'] == 9){
          $employee_document_updated = str_replace('{{name}}', $value['employee_name'], $data["employee_document_updated"]);
          $employee_document_updated = str_replace('{{user_type}}', $value['user_type'], $employee_document_updated);
          $employee_document_updated = str_replace('{{created_by}}', $value['created_by'], $employee_document_updated);
          $employee_document_updated = str_replace('{{time}}', $value['created_at'], $employee_document_updated);

          $res['data'][$key]['msg'] = $employee_document_updated;
        }  
        // "Employee visa inserted"
        if($value['status'] == 10){
          $employee_visa_inserted = str_replace('{{name}}', $value['employee_name'], $data["employee_visa_inserted"]);
          $employee_visa_inserted = str_replace('{{user_type}}', $value['user_type'], $employee_visa_inserted);
          $employee_visa_inserted = str_replace('{{created_by}}', $value['created_by'], $employee_visa_inserted);
          $employee_visa_inserted = str_replace('{{time}}', $value['created_at'], $employee_visa_inserted);

          $res['data'][$key]['msg'] = $employee_visa_inserted; 
        }
        // "Employee visa updated"
        if($value['status'] == 11){
          $employee_visa_updated = str_replace('{{name}}', $value['employee_name'], $data["employee_visa_updated"]);
          $employee_visa_updated = str_replace('{{user_type}}', $value['user_type'], $employee_visa_updated);
          $employee_visa_updated = str_replace('{{created_by}}', $value['created_by'], $employee_visa_updated);
          $employee_visa_updated = str_replace('{{time}}', $value['created_at'], $employee_visa_updated);

          $res['data'][$key]['msg'] = $employee_visa_updated; 
        }
        // "Employer details updated"
        if($value['status'] == 12){
          $employer_personal_updated = str_replace('{{name}}', $value['employer_name'], $data["employer_personal_updated"]);
          $employer_personal_updated = str_replace('{{user_type}}', $value['user_type'], $employer_personal_updated);
          $employer_personal_updated = str_replace('{{created_by}}', $value['created_by'], $employer_personal_updated);
          $employer_personal_updated = str_replace('{{time}}', $value['created_at'], $employer_personal_updated);

          $res['data'][$key]['msg'] = $employer_personal_updated;
        }
        // "Employer details inserted"
        if($value['status'] == 13){
          $employer_personal_insert = str_replace('{{name}}', $value['employer_name'], $data["employer_personal_insert"]);
          $employer_personal_insert = str_replace('{{user_type}}', $value['user_type'], $employer_personal_insert);
          $employer_personal_insert = str_replace('{{created_by}}', $value['created_by'], $employer_personal_insert);
          $employer_personal_insert = str_replace('{{time}}', $value['created_at'], $employer_personal_insert);

          $res['data'][$key]['msg'] = $employer_personal_insert;
        }
        // "Employer contact details updated"
        if($value['status'] == 14){
          $employer_contact_updated = str_replace('{{name}}', $value['employer_name'], $data["employer_contact_updated"]);
          $employer_contact_updated = str_replace('{{user_type}}', $value['user_type'], $employer_contact_updated);
          $employer_contact_updated = str_replace('{{created_by}}', $value['created_by'], $employer_contact_updated);
          $employer_contact_updated = str_replace('{{time}}', $value['created_at'], $employer_contact_updated);

          $res['data'][$key]['msg'] = $employer_contact_updated;
        }
        //  "Employer kyc details inserted"
        if($value['status'] == 15){
          $employer_kyc_inserted = str_replace('{{name}}', $value['employer_name'], $data["employer_kyc_inserted"]);
          $employer_kyc_inserted = str_replace('{{user_type}}', $value['user_type'], $employer_kyc_inserted);
          $employer_kyc_inserted = str_replace('{{created_by}}', $value['created_by'], $employer_kyc_inserted);
          $employer_kyc_inserted = str_replace('{{time}}', $value['created_at'], $employer_kyc_inserted);

          $res['data'][$key]['msg'] = $employer_kyc_inserted;
        }
        // "Employer kyc details updated"
        if($value['status'] == 16){
          $employer_kyc_updated = str_replace('{{name}}', $value['employer_name'], $data["employer_kyc_updated"]);
          $employer_kyc_updated = str_replace('{{user_type}}', $value['user_type'], $employer_kyc_updated);
          $employer_kyc_updated = str_replace('{{created_by}}', $value['created_by'], $employer_kyc_updated);
          $employer_kyc_updated = str_replace('{{time}}', $value['created_at'], $employer_kyc_updated);

          $res['data'][$key]['msg'] = $employer_kyc_updated;
        }
        // "job details updated"
        if($value['status'] == 17){
          $job_details_updated = str_replace('{{job}}', $value['job_title'], $data["job_details_updated"]);
          $job_details_updated = str_replace('{{user_type}}', $value['user_type'], $job_details_updated);
          $job_details_updated = str_replace('{{created_by}}', $value['created_by'], $job_details_updated);
          $job_details_updated = str_replace('{{time}}', $value['created_at'], $job_details_updated);

          $res['data'][$key]['msg'] = $job_details_updated; 
        }
        // "job inserted"
        if($value['status'] == 18){
          $job_inserted = str_replace('{{job}}', $value['job_title'], $data["job_inserted"]);
          $job_inserted = str_replace('{{user_type}}', $value['user_type'], $job_inserted);
          $job_inserted = str_replace('{{created_by}}', $value['created_by'], $job_inserted);
          $job_inserted = str_replace('{{time}}', $value['created_at'], $job_inserted);

          $res['data'][$key]['msg'] = $job_inserted; 
        }
        // if($value['status'] == 19){
        //   $message[] = $value['employee_name']." visa inserted by ".$value['user_type']." - ".$value['created_by']." on ".$value['created_at'];
        // }
        // "apply on job"
        if($value['status'] == 20){
          $apply_on_job = str_replace('{{name}}', $value['applied_employee_name'], $data["apply_on_job"]);
          $apply_on_job = str_replace('{{job}}', $value['applied_job'], $apply_on_job);
          $apply_on_job = str_replace('{{user_type}}', $value['user_type'], $apply_on_job);
          $apply_on_job = str_replace('{{created_by}}', $value['created_by'], $apply_on_job);
          $apply_on_job = str_replace('{{time}}', $value['created_at'], $apply_on_job);

          $res['data'][$key]['msg'] = $apply_on_job; 
        }   
        // "interview schedule"
        if($value['status'] == 21){
          $interview_scheduled = str_replace('{{name}}', $value['applied_employee_name'], $data["interview_scheduled"]);
          $interview_scheduled = str_replace('{{job}}', $value['applied_job'], $interview_scheduled);
          $interview_scheduled = str_replace('{{user_type}}', $value['user_type'], $interview_scheduled);
          $interview_scheduled = str_replace('{{created_by}}', $value['created_by'], $interview_scheduled);
          $interview_scheduled = str_replace('{{time}}', $value['created_at'], $interview_scheduled);

          $res['data'][$key]['msg'] = $interview_scheduled;
        }  
        // "lmia updated" 
        if($value['status'] == 22){
          $lmia_updated = str_replace('{{name}}', $value['lmia_employee_name'], $data["lmia_updated"]);
          $lmia_updated = str_replace('{{job}}', $value['lmia_job_title'], $lmia_updated);
          $lmia_updated = str_replace('{{user_type}}', $value['user_type'], $lmia_updated);
          $lmia_updated = str_replace('{{created_by}}', $value['created_by'], $lmia_updated);
          $lmia_updated = str_replace('{{time}}', $value['created_at'], $lmia_updated);

          $res['data'][$key]['msg'] = $lmia_updated; 
        }   
        // "lmia inserted"   
        if($value['status'] == 23){
          $lmia_inserted = str_replace('{{name}}', $value['lmia_employee_name'], $data["lmia_inserted"]);
          $lmia_inserted = str_replace('{{job}}', $value['lmia_job_title'], $lmia_inserted);
          $lmia_inserted = str_replace('{{user_type}}', $value['user_type'], $lmia_inserted);
          $lmia_inserted = str_replace('{{created_by}}', $value['created_by'], $lmia_inserted);
          $lmia_inserted = str_replace('{{time}}', $value['created_at'], $lmia_inserted);

          $res['data'][$key]['msg'] = $lmia_inserted;
        }   
        // "Employer document inserted"
        if($value['status'] == 24){
          $employer_document_inserted = str_replace('{{name}}', $value['employer_name'], $data["employer_document_inserted"]);
          $employer_document_inserted = str_replace('{{user_type}}', $value['user_type'], $employer_document_inserted);
          $employer_document_inserted = str_replace('{{created_by}}', $value['created_by'], $employer_document_inserted);
          $employer_document_inserted = str_replace('{{time}}', $value['created_at'], $employer_document_inserted);

          $res['data'][$key]['msg'] = $employer_document_inserted;
        }  
        // "Employer document updated" 
        if($value['status'] == 25){
          $employer_document_updated = str_replace('{{name}}', $value['employer_name'], $data["employer_document_updated"]);
          $employer_document_updated = str_replace('{{user_type}}', $value['user_type'], $employer_document_updated);
          $employer_document_updated = str_replace('{{created_by}}', $value['created_by'], $employer_document_updated);
          $employer_document_updated = str_replace('{{time}}', $value['created_at'], $employer_document_updated);

          $res['data'][$key]['msg'] = $employer_document_updated;
        }  
        // "Employee lmia substage inserted" 
        if($value['status'] == 26){
          $employee_lmia_sustage = str_replace('{{name}}', $value['lmia_employee_name'], $data["employee_lmia_sustage"]);
          $employee_lmia_sustage = str_replace('{{job}}', $value['lmia_job_title'], $employee_lmia_sustage);
          $employee_lmia_sustage = str_replace('{{user_type}}', $value['user_type'], $employee_lmia_sustage);
          $employee_lmia_sustage = str_replace('{{created_by}}', $value['created_by'], $employee_lmia_sustage);
          $employee_lmia_sustage = str_replace('{{time}}', $value['created_at'], $employee_lmia_sustage);

          $res['data'][$key]['msg'] = $employee_lmia_sustage;
        } 
        // Employee lmia substage updated
        if($value['status'] == 27){
          $employee_lmia_substage_updated = str_replace('{{name}}', $value['lmia_employee_name'], $data["employee_lmia_substage_updated"]);
          $employee_lmia_substage_updated = str_replace('{{job}}', $value['lmia_job_title'], $employee_lmia_substage_updated);
          $employee_lmia_substage_updated = str_replace('{{user_type}}', $value['user_type'], $employee_lmia_substage_updated);
          $employee_lmia_substage_updated = str_replace('{{created_by}}', $value['created_by'], $employee_lmia_substage_updated);
          $employee_lmia_substage_updated = str_replace('{{time}}', $value['created_at'], $employee_lmia_substage_updated);

          $res['data'][$key]['msg'] = $employee_lmia_substage_updated;
        } 
        // job lmia substage inserted
         if($value['status'] == 28){
          $job_lmia_substage_inserted = str_replace('{{job}}', $value['job_title'], $data["job_lmia_substage_inserted"]);
          $job_lmia_substage_inserted = str_replace('{{user_type}}', $value['user_type'], $job_lmia_substage_inserted);
          $job_lmia_substage_inserted = str_replace('{{created_by}}', $value['created_by'], $job_lmia_substage_inserted);
          $job_lmia_substage_inserted = str_replace('{{time}}', $value['created_at'], $job_lmia_substage_inserted);

          $res['data'][$key]['msg'] = $job_lmia_substage_inserted;
        }  
      }
      
         $this->response(array(
        "status" => 1,
        "message" => "Successful",
        "data" => $res['data']
      ), REST_Controller::HTTP_OK);

      }else{

        $this->response(array(
          "status" => 0,
          "message" => "No data found"
        ), REST_Controller::HTTP_OK);
      }
  }
public function assignJobToManager_put(){

     $data = json_decode(file_get_contents("php://input"));
    //  print_r($data);die;
      if(isset($data->manager_id) && isset($data->job_id)){  
        if(empty($data->manager_id) || empty($data->job_id)){
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
        $job_id = $data->job_id ;
        $manager_id = $data->manager_id;
      
        // if(isset($data->subject)){
        //   if(!empty($data->subject)){
        //     $team_detail["subject"]=$data->subject;
        //   }
        // }
        // print_r($id);die;
     if($this->admin_model->assign_job_to_manager($job_id, $manager_id)){
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
}
 public function updateAdminSetting_put(){
        $data = json_decode(file_get_contents("php://input"));
         if (isset($data->admin_id) || isset($this->admin_id)){
               if(empty($data->admin_id) && empty($this->admin_id)){
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
               $admin_id = $data->admin_id ?? $this->admin_id;
               $details = array();
               if(isset($data->email_permission)){
               if(!empty($data->email_permission)){
                $details['email_permission'] = json_encode($data->email_permission);
               }
               }
               if(isset($data->notification_permission)){
               if(!empty($data->notification_permission)){
                $details['notification_permission'] = json_encode($data->notification_permission);
               }
               }
               $response = $this->admin_model->update_admin_setting($admin_id, $details);
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
    }
     public function getAdminSetting_post(){
        $data = json_decode(file_get_contents("php://input"));
          if (isset($data->admin_id) || isset($this->admin_id)){
               if(empty($data->admin_id) && empty($this->admin_id)){
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
               $admin_id = $data->admin_id ?? $this->admin_id;
              //  $details = array();
              //  if(isset($data->email_permission)){
              //  if($data->email_permission >= 0){
              //   $details['email_permission'] = $data->email_permission;
              //  }
              //  }
               $response = $this->admin_model->get_Admin_setting($admin_id);
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
    }
    
}

   