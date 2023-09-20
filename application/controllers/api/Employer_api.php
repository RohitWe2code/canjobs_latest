<?php

 defined('BASEPATH') OR exit('No direct script access allowed');



// require APPPATH.'libraries/REST_Controller.php';
require APPPATH.'controllers/api/My_REST_Controller.php';

class Employer_api extends My_REST_Controller{
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
    $this->load->model(array("admin_model"));
    $this->load->library("form_validation");
    $this->load->library('Authorization_Token');
    $this->load->helper("security");
    $this->load->helper('url');

    $headers = $this->input->request_headers(); 
		$this->decodedToken = $this->authorization_token->validateToken($headers['Authorization']);
    // print_r($this->decodedToken);die;   
       if (!$this->decodedToken || $this->decodedToken['status'] != "1") {
            $err = array(
                'status'=>false,
                'message'=>'Unauthorised Token',
                'data'=>[]
            );
            echo json_encode($err);
            exit;
          }
          $this->admin_id = $this->decodedToken['data']->admin_id ?? null;
          $this->employee_id = $this->decodedToken['data']->employee_id ?? null;
          $this->company_id = $this->decodedToken['data']->company_id ?? null;
          $this->user_type = $this->decodedToken['data']->user_type ?? null;
          $this->admin_email = $this->decodedToken['data']->email ?? null;
          $this->admin_email_static = 'aashi.we2code@gmail.com';
          $this->admin_name_static = 'Aashi';
        }

  public function company_detail_put(){

    $data = json_decode(file_get_contents("php://input"));
/*
|--------------------------------------------------------------------------
| Update Company Details 
|--------------------------------------------------------------------------
*/
if(isset($data->company_id)){
if(empty($data->company_id)){
   $this->response(array(
            "status" => 0,
            "message" => "All fields are required!"
          ) , REST_Controller::HTTP_OK);
         return;
}
 $company_info["company_id"] = $data->company_id;
      // if(isset($data->company_name)  && isset($data->industry) && isset($data->corporation) && isset($data->company_start_date)  && isset($data->company_size) && isset($data->vacancy_for_post) && isset($data->about))
      // { 
      //    $error_flag = 0;     
      //   if(empty($data->company_id) || empty($data->company_name) || empty($data->industry) || empty($data->corporation) || empty($data->company_start_date) || empty($data->company_size) || empty($data->vacancy_for_post) || empty($data->about))
      //   {
      //       $error_flag = 1;
      //   }
      //    if($error_flag){
      //       $this->response(array(
      //       "status" => 0,
      //       "message" => "All fields are required!"
      //     ) , REST_Controller::HTTP_NOT_FOUND);
      //    return;
      //   }
      //   $company_info = array(
      //     "company_id" => $data->company_id,
      //     "company_name" => $data->company_name,
      //     "industry" => $data->industry,
      //     "corporation" => $data->corporation,
      //     "company_start_date" => $data->company_start_date, //yy-mm-dd
      //     "company_size" => $data->company_size,
      //     "vacancy_for_post" => $data->vacancy_for_post,
      //     "about" => $data->about
      //   );
         if(isset($data->company_name)){
                if(!empty($data->company_name)){
                  $company_info["company_name"] = $data->company_name;
                }
               }
         if(isset($data->industry)){
                if(!empty($data->industry)){
                  $company_info["industry"] = $data->industry;
                }
               }
         if(isset($data->corporation)){
                if(!empty($data->corporation)){
                  $company_info["corporation"] = $data->corporation;
                }
               }
         if(isset($data->company_start_date)){
                if(!empty($data->company_start_date)){
                  $company_info["company_start_date"] = $data->company_start_date;
                }
               }
         if(isset($data->company_size)){
                if(!empty($data->company_size)){
                  $company_info["company_size"] = $data->company_size;
                }
               }
         if(isset($data->vacancy_for_post)){
                if(!empty($data->vacancy_for_post)){
                  $company_info["vacancy_for_post"] = $data->vacancy_for_post;
                }
               }
         if(isset($data->about)){
                if(!empty($data->about)){
                  $company_info["about"] = $data->about;
                }
               }
         if(isset($data->alias)){
                if(!empty($data->alias)){
                  $company_info["alias"] = $data->alias;
                }
               }
         if(isset($data->website_url)){
                if(!empty($data->website_url)){
                  $company_info["website_url"] = $data->website_url;
                }
               }
         if(isset($data->logo)){

                if(!empty($data->logo)){
                  $image_data = $data->logo;

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
                        $company_info["logo"] = $logo;
                    } else {
                        // Unsupported file type
                        unset($company_info["logo"]);
                    }
                } else {
                    // Invalid base64-encoded image data
                     unset($company_info["logo"]);
                }
                }
               }
              //  print_r($company_info["logo"]);die;
               if(isset($data->franchise)){
                if(!empty($data->franchise)){
                  $company_info["franchise"] = $data->franchise;
                }
               }       
        if($this->employer_model->addUpdateCompanyDetails($company_info)){
            $this->response(array(
              "status" => 1,
              "message" => "Employer data updated successfully"
            ), REST_Controller::HTTP_OK);
            // activity log
                    
                    $para['status'] = 12; // "Employer details updated"
                    $para['action_id'] = $data->company_id ?? NULL;
                    $para['action_type'] = 'employer';
                   
                    $this->_log_request($para);
        }else{
          $this->response(array(
            "status" => 0,
            "messsage" => "Failed to update Employer data"
          ), REST_Controller::HTTP_OK);
        }   
      // }else{
      //   $this->response(array(
      //     "status" => 0,
      //     "message" => "All fields are needed"
      //   ), REST_Controller::HTTP_NOT_FOUND);
      // }
    }else{
    /*
    |--------------------------------------------------------------------------
    | Insert Company Details 
    |--------------------------------------------------------------------------
    */
      if(isset($data->company_name)  && isset($data->industry) && isset($data->company_size) && isset($data->vacancy_for_post))
      { 
         $error_flag = 0;     
        if(empty($data->company_name) || empty($data->industry)|| empty($data->company_size) || empty($data->vacancy_for_post))
        {
            $error_flag = 1;
        }
         if($error_flag){
            $this->response(array(
            "status" => 0,
            "message" => "All fields are required!"
          ) , REST_Controller::HTTP_OK);
         return;
        }
        $company_info = array(
          "company_name" => $data->company_name,
          "industry" => $data->industry,
          "company_size" => $data->company_size,
          "vacancy_for_post" => $data->vacancy_for_post,
        );
         if(isset($data->alias)){
                if(!empty($data->alias)){
                  $company_info["alias"] = $data->alias;
                }
               }
         if(isset($data->website_url)){
                if(!empty($data->website_url)){
                  $company_info["website_url"] = $data->website_url;
                }
               }
         if(isset($data->about)){
                if(!empty($data->about)){
                  $company_info["about"] = $data->about;
                }
               }
               if(isset($data->corporation)){
                if(!empty($data->corporation)){
                  $company_info["corporation"] = $data->corporation;
                }
               }
               if(isset($data->company_start_date)){
                if(!empty($data->company_start_date)){
                  $company_info["company_start_date"] = $data->company_start_date;
                }
               }
         if(isset($data->logo)){
                if(!empty($data->logo)){            
                  $image_data = $data->logo;
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
                        $company_info["logo"] = $logo;
                    } else {
                        // Unsupported file type
                        unset($company_info["logo"]);
                    }
                } else {
                    // Invalid base64-encoded image data
                    unset($company_info["logo"]);
                }
                }                
              }
              
                if(isset($data->franchise)){
                if(!empty($data->franchise)){
                  $company_info["franchise"] = $data->franchise;
                }
               }
                if(!empty($this->admin_id) && $this->user_type != "employee" && $this->user_type != "employer"){
                  $company_info["created_by_admin"] = $this->admin_id;
                }

        

        if($this->employer_model->addUpdateCompanyDetails($company_info)){
            $this->response(array(
              "status" => 1,
              "message" => "Employer data inserted successfully"
            ), REST_Controller::HTTP_OK);
              // activity log  
                $insert_id = $this->db->insert_id();
                    if($insert_id){                  
                    $para['status'] = 13; // "Employer details inserted"
                    $para['action_id'] = $data->company_id ?? NULL;
                    $para['action_type'] = 'employer';
                    }
                   
                    $this->_log_request($para);
        }else{
          $this->response(array(
            "status" => 0,
            "messsage" => "Failed to insert Employer data"
          ), REST_Controller::HTTP_OK);
        }    
      }else{
        $this->response(array(
          "status" => 0,
          "message" => "All fields are needed"
        ), REST_Controller::HTTP_OK);
      }
    }
   }
  public function contact_detail_put(){
      $data = json_decode(file_get_contents("php://input"));
      // print_r($data); die;
      if(isset($data->company_id) && isset($data->contact_person_name) && isset($data->email) && isset($data->contact_no) && isset($data->designation))
      { 
         $error_flag = 0;    
        if(empty($data->company_id) || empty($data->contact_person_name) || empty($data->email) || empty($data->contact_no) || empty($data->designation))
        {
            $error_flag = 1;
        }
         if($error_flag){
            $this->response(array(
            "status" => 0,
            "message" => "All fields are required!"
          ) , REST_Controller::HTTP_OK);
         return;
        }
        $contact_info = array(
          "company_id" => $data->company_id,
          "contact_person_name" => $data->contact_person_name,
          "email" => $data->email,
          "contact_no" => $data->contact_no,
          "designation" => $data->designation
        );
        if(isset($data->contact_no_other)){
          if(!empty($data->contact_no_other)){
           $contact_info['contact_no_other'] = $data->contact_no_other;
          }
        }
        if(isset($data->address)){
          if(!empty($data->address)){
           $contact_info['address'] = $data->address;
          }
        }
        if(isset($data->pin_code)){
          if(!empty($data->pin_code)){
           $contact_info['pin_code'] = $data->pin_code;
          }
        }
        if(isset($data->city)){
          if(!empty($data->city)){
           $contact_info['city'] = $data->city;
          }
        }
        if(isset($data->state)){
          if(!empty($data->state)){
           $contact_info['state'] = $data->state;
          }
        }
        if(isset($data->country)){
          if(!empty($data->country)){
           $contact_info['country'] = $data->country;
          }
        }
        if($this->employer_model->addUpdateCompanyContact($contact_info)){
            $this->response(array(
              "status" => 1,
              "message" => "contact data updated successfully"
            ), REST_Controller::HTTP_OK);
                   
                      $para['status'] = 14; // "Employer contact details updated"
                      $para['action_id'] = $data->company_id ?? NULL;
                      $para['action_type'] = 'employer';
                   
                    $this->_log_request($para);
        }else{
          $this->response(array(
            "status" => 0,
            "messsage" => "Failed to update contact data"
          ), REST_Controller::HTTP_OK);
        }     
      }else{
        $this->response(array(
          "status" => 0,
          "message" => "All fields are needed"
        ), REST_Controller::HTTP_OK);
      }
   }

  public function company_kyc_detail_put(){
      $data = json_decode(file_get_contents("php://input"));
    //   print_r($data); die;
      if(isset($data->company_id) && isset($data->pan_no)  && isset($data->name) && isset($data->pan_date) && isset($data->address) && isset($data->pincode) && isset($data->city) && isset($data->state) && isset($data->country) && isset($data->document))
      { 
             $error_flag = 0;
            if(empty($data->company_id) || empty($data->pan_no) || empty($data->name) || empty   ($data->pan_date) || empty($data->address) || empty($data->pincode) || empty   ($data->city) || empty($data->state)  || empty($data->country)){
                $error_flag = 1;
            }
               if($error_flag){
                   $this->response(array(
                   "status" => 0,
                   "message" => "All fields are required!"
                 ) , REST_Controller::HTTP_OK);
               return;
               }else{
               $kyc_detail = array(
                 "company_id" => $data->company_id,
                 "pan_no" => $data->pan_no,
                 "name" => $data->name,
                 "pan_date" => $data->pan_date,
                 "address" => $data->address, 
                 "pincode" => $data->pincode,
                 "city" => $data->city,
                 "state" => $data->state,
                 "country" => $data->country,          
               );
               if(isset($data->gstin)){
                if(!empty($data->gstin)){
                  $kyc_detail["gstin"] = $data->gstin;
                }
               }
               if(isset($data->fax_number)){
                if(!empty($data->fax_number)){
                  $kyc_detail["fax_number"] = $data->fax_number;
                }
               }
               if(isset($data->tan_number)){
                if(!empty($data->tan_number)){
                  $kyc_detail["tan_number"] = $data->tan_number;
                }
               }
                if(!empty($data->document)){                             
                  $kyc_document = str_replace('data:application/pdf;base64,', '', $data->document);
                  $kyc_document = str_replace(' ', '+', $kyc_document);
                  $binary_document = base64_decode($kyc_document);
                  $file_name_for_upload = time().'.pdf';
		              $document = base_url().'uploads/'.$file_name_for_upload;
		              file_put_contents('./uploads/'.$file_name_for_upload, $binary_document);
                  $kyc_detail["document"] = $document;
                }

// print_r($kyc_detail);die;
             $res=$this->employer_model->addUpdate_company_kycDetails($kyc_detail);
               if($res){
                if($res == 1){
                   $this->response(array(
                     "status" => 1,
                     "message" => "Employee data updated successfully"
                   ), REST_Controller::HTTP_OK);
                    $insert_id = $this->db->insert_id();
                    if($insert_id){
                      $para['status'] = 15; // "Employer kyc details inserted"
                      $para['action_id'] = $data->company_id ?? NULL;
                      $para['action_type'] = 'employer';
                    }else{
                      $para['status'] = 16; // "Employer kyc details updated"
                      $para['action_id'] = $data->company_id ?? NULL;
                      $para['action_type'] = 'employer';
                    }
                   
                    $this->_log_request($para);
                  }else{
                    $this->response(array(
                     "status" => 1,
                     "message" => "Employee data inserted successfully"
                   ), REST_Controller::HTTP_OK);
                  }
               }else{             
                 $this->response(array(
                   "status" => 0,
                   "messsage" => "Failed to update Employee data"
                 ), REST_Controller::HTTP_OK);
               }
         }  
      } else{
        $this->response(array(
          "status" => 0,
          "message" => "All fields are needed"
        ), REST_Controller::HTTP_OK);
      }
  }
   public function addJobs_put(){
      $data = json_decode(file_get_contents("php://input"));
      // print_r($data); die;
    /*
    |--------------------------------------------------------------------------
    | Update Job Details 
    |--------------------------------------------------------------------------
    */
    $job_detail = array();
        if(isset($data->job_id)){  
          if(!empty($data->job_id)){

            $job_detail["job_id"] = $data->job_id;
          }
        
          if(isset($data->company_id)){
          if(!empty($data->company_id)){
            $job_detail["company_id"] = $data->company_id;

          }
        }
          if(isset($data->job_title)){
          if(!empty($data->job_title)){
            $job_detail["job_title"] = $data->job_title;

          }
        }
          if(isset($data->experience_required)){
          if(!empty($data->experience_required)){
            $job_detail["experience_required"] = $data->experience_required;

          }
        }
          if(isset($data->salary)){
          if(!empty($data->salary)){
            $job_detail["salary"] = $data->salary;

          }
        }
          if(isset($data->location)){
          if(!empty($data->location)){
            $job_detail["location"] = $data->location;

          }
          }
          if(isset($data->industry_type)){
          if(!empty($data->industry_type)){
            $job_detail["industry_type"] = $data->industry_type;

          }
          }
          if(isset($data->apply_link)){
          if(!empty($data->apply_link)){
            $job_detail["apply_link"] = $data->apply_link;

          }
          }
          if(isset($data->job_description)){
          if(!empty($data->job_description)){
            $job_detail["job_description"] = $data->job_description;

          }
          }
          if(isset($data->your_duties)){
          if(!empty($data->your_duties)){
            $job_detail["your_duties"] = $data->your_duties;

          }
          }
          if(isset($data->requirement)){
          if(!empty($data->requirement)){
            $job_detail["requirement"] = $data->requirement;

          }
          }
          if(isset($data->department)){
          if(!empty($data->department)){
            $job_detail["department"] = $data->department;

          }
          }
          if(isset($data->job_type)){
          if(!empty($data->job_type)){
            $job_detail["job_type"] = $data->job_type;

          }
          }
          if(isset($data->education)){
          if(!empty($data->education)){
            $job_detail["education"] = $data->education;

          }
          }
          if(isset($data->language)){
          if(!empty($data->language)){
            $job_detail["language"] = $data->language;

          }
          }
          if(isset($data->keyskill)){
          if(!empty($data->keyskill)){
            $job_detail["keyskill"] = $data->keyskill;

          }
          }
          if(isset($data->employement)){
          if(!empty($data->employement)){
            $job_detail["employement"] = $data->employement;

          }
          }
          if(isset($data->job_category_id)){
          if(!empty($data->job_category_id)){
            $job_detail["job_category_id"] = $data->job_category_id;

          }
          }
          if(isset($data->lmia_status)){
          if(!empty($data->lmia_status)){
            $job_detail["lmia_status"] = $data->lmia_status;

          }
          }
          if(isset($data->role_category)){ // using No. of vacancies
          if(!empty($data->role_category)){
            $job_detail["role_category"] = $data->role_category;

          }
          }
          if(isset($data->is_featured)){ // using No. of vacancies
          if($data->is_featured >= 0){
            $job_detail["is_featured"] = $data->is_featured;

          }
          }                 
                // print_r($job_detail);die;
        if( $this->employer_model->addUpdate_job($job_detail)){
            $this->response(array(
              "status" => 1,
              "message" => "job data updated successfully"
            ), REST_Controller::HTTP_OK);  
             
                    $para['status'] = 17; // "job details updated"
                    $para['action_id'] = $data->job_id ?? NULL;
                    $para['action_type'] = 'jobs';
         
                    $this->_log_request($para);
                      
        }
        else{
          $this->response(array(
            "status" => 0,
            "messsage" => "Failed to update Employee data"
          ), REST_Controller::HTTP_OK);
        }
    }else{
    /*
    |--------------------------------------------------------------------------
    | Insert Job Details 
    |--------------------------------------------------------------------------
    */ 
      if(isset($data->company_id) && isset($data->job_title)  && isset($data->experience_required) && isset($data->location) && isset($data->apply_link) && isset($data->job_type) && isset($data->job_category_id))
      { 
         $error_flag = 0;    
        if(empty($data->company_id) || empty($data->job_title) || empty($data->experience_required) || empty($data->location) || empty($data->apply_link)|| empty($data->job_type) || empty($data->job_category_id))
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
        $job_detail = array(
          "company_id" => $data->company_id,
          "job_title" => $data->job_title,
          "experience_required" => $data->experience_required,
          "location" => $data->location, 
          "apply_link" => $data->apply_link,
          "job_type" => $data->job_type,
          "job_category_id" => $data->job_category_id,
        );
         if(isset($data->salary)){
          if(!empty($data->salary)){
            $job_detail["salary"] = $data->salary;
          }
          }
          if(isset($data->industry_type)){
            if(!empty($data->industry_type)){
              $job_detail["industry_type"] = $data->industry_type;              
            }
          }
          if(isset($data->job_description)){
           if(!empty($data->job_description)){
             $job_detail["job_description"] = $data->job_description; 
           }
           }
         if(isset($data->your_duties)){
          if(!empty($data->your_duties)){
            $job_detail["your_duties"] = $data->your_duties;
          }
          }
         if(isset($data->requirement)){
          if(!empty($data->requirement)){
            $job_detail["requirement"] = $data->requirement;
          }
          }
         if(isset($data->department)){
          if(!empty($data->department)){
            $job_detail["department"] = $data->department;
          }
          }
         if(isset($data->education)){
          if(!empty($data->education)){
            $job_detail["education"] = $data->education;
          }
          }
         if(isset($data->language)){
          if(!empty($data->language)){
            $job_detail["language"] = $data->language;
          }
          }
         if(isset($data->keyskill)){
          if(!empty($data->keyskill)){
            $job_detail["keyskill"] = $data->keyskill;
          }
          }
         if(isset($data->employement)){
          if(!empty($data->employement)){
            $job_detail["employement"] = $data->employement;
          }
          }
         if(isset($data->lmia_status)){
          if(!empty($data->lmia_status)){
            $job_detail["lmia_status"] = $data->lmia_status;
          }
          }
         if(isset($data->lmia_status)){
          if(!empty($data->lmia_status)){
            $job_detail["lmia_status"] = $data->lmia_status;

          }
          }
          if(isset($data->role_category)){  // For number of vacancies
          if(!empty($data->role_category)){
            $job_detail["role_category"] = $data->role_category;
          }
          }
          if(isset($data->is_featured)){  
          if($data->is_featured >= 0){
            $job_detail["is_featured"] = $data->is_featured;
          }
          }
          if(isset($data->is_featured)){  
          if($data->is_featured >= 0){
            $job_detail["is_featured"] = $data->is_featured;

          }
          }
          if(!empty($this->admin_id) && $this->user_type != "employee" && $this->user_type != "employer"){
                  $job_detail["created_by_admin"] = $this->admin_id;
                }             
        $response = $this->employer_model->addUpdate_job($job_detail);
        // print_r($response);die;
        if($response){
            $company_id = $response->company_id;
            // $email_template_id = 3;
            $unique_id = $this->common_model->getLastRecord_email()['id'] ?? 1;
            $unique_id .= mt_rand(1000, 9999);
            // if(isset($this->company_id)){
            //   if(!empty($this->company_id)){
                // $admin_id = 5;
          //   }
          // }
            // ------------ Sending Email and Notification -------------

            // Checking admin permission to send email and notification
            $admin_permission = $this->common_model->checkParentPermission();
            // Checking individual admin email and notification permission 
            // $permission = $this->common_model->checkAdminEmailPermission($admin_id); 
            
            // ----- Sending mail and notification : admin -----
            if(isset($admin_permission['email_employee']['job']) && $admin_permission['email_employee']['job'] == 1){
                // if(isset($permission['email_permission']->job) && $permission['email_permission']->job == 1){
                    $email_template_id = 9;
                    $admin_email = array('to'=> $this->admin_email_static,
                                        // 'to' => $this->admin_email,
                                        'admin_name'=> $this->admin_name_static,
                                        'job_title'=>$response->job_title,
                                        'company_name'=>$response->company_name,
                                        'job_description'=>$response->job_description,
                                        'job_location'=>$response->location,
                                        'website_url'=>$response->apply_link);
                    $this->common_model->email($admin_email, $email_template_id, $unique_id);
                // }
            }
            // Checking admin permission to send notification : employee
            if(isset($admin_permission['email_employee']['job']) && $admin_permission['email_employee']['job'] ==1){
                  $company_notification['from_id'] = '5';
                  $company_notification['type'] = 'manager';
                  $company_notification['subject'] = 'added_new_job';
                  $company_notification['action_id'] = $response->job_id;;
                  $company_notification['message'] = 'A new job with title-'.$response->job_title.' has been addedsuccessfully';
                  $this->common_model->addNotification($company_notification);
            }

            // ----- Sending mail and notification : Company ------
            if(isset($this->admin_email)){
              if(!empty($this->admin_email)){
                // Checking permission to send email : Employer
                $permission = $this->common_model->checkEmployerEmailPermission($company_id);            
              // Checking admin permission to send email to company
                  if(isset($admin_permission['email_employer']['job']) && $admin_permission['email_employer']['job'] == 1){
                    if(isset($permission['email_permission']->job) && $permission['email_permission']->job == 1){
                    $email_template_id = 3;
                    $company_email = array('to'=>$response->email,
                                      // 'to' => $this->admin_email,
                                      'job_title'=>$response->job_title,
                                      'company_name'=>$response->company_name,
                                      'job_description'=>$response->job_description,
                                      'job_location'=>$response->location,
                                      'website_url'=>$response->apply_link);
                    $this->common_model->email($company_email, $email_template_id, $unique_id);
                    }
                  }
                  // Checking employer permission to send notification
                  if(isset($admin_permission['notification_employer']['job']) && $admin_permission['notification_employer']['job'] == 1){
                    if(isset($permission['notification_permission']->job) && $permission['notification_permission']->job == 1){
                        $admin_notification['from_id'] = $response->company_id;
                        $admin_notification['type'] = 'company';
                        $admin_notification['subject'] = 'added_new_job';
                        $admin_notification['action_id'] = $response->job_id;;
                        $admin_notification['message'] = 'A new job with title-'.$response->job_title.' has beenadded successfully';
                        $this->common_model->addNotification($admin_notification);
                    }
                  }
          }
          }
          
            $this->response(array(
              "status" => 1,
              "message" => "job data inserted successfully"
            ), REST_Controller::HTTP_OK);
            $insert_id = $this->db->insert_id();
                    if($insert_id){
                    $para['status'] = 18; // "job details inserted"
                    $para['action_id'] = $insert_id ?? NULL;
                    $para['action_type'] = 'jobs';
         
                    $this->_log_request($para);
                    }  
                   
        }
        else{
          $this->response(array(
            "status" => 0,
            "messsage" => "Failed to insert job data"
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
   public function addCategory_put(){
    
      $data = json_decode(file_get_contents("php://input"));
      // print_r($data); die;
      $parent_id = 0;
      $category_detail = array();
       if(isset($data->category_name)){
          if(!empty($data->category_name)){
          $category_detail["category_name"]=$data->category_name;
        }
      }
       if(isset($data->category_type)){
          if(!empty($data->category_type)){
          $category_detail["category_type"]=$data->category_type;
        }
      }
      $activity_msg_cat = 1; //"category"
        if(isset($data->parent_id) && $data->parent_id > 0){
         
          $parent_id = $data->parent_id;
          $category_detail["parent_id"]=$parent_id;
          $activity_msg_cat = 2; //"category type"
      }
        $msg = "Category added successfully";
        if(isset($data->job_category_id)){
          if(!empty($data->job_category_id)){
          $category_detail["job_category_id"]=$data->job_category_id;
          $msg = "Category updated successfully";
        }
      }
        $response = $this->employer_model->addUpdate_category($category_detail);
        if($response){
          if($response === "already exist"){
            // $msg = "already exist !";
             $this->response(array(
              "status" => 1,
              "message" => "already exist !"
            ), REST_Controller::HTTP_OK);
            return;
          }
          $response = $this->employer_model->add_update_jobcategory_fiterlist($parent_id);
          $this->admin_model->getFilterList();

            $this->response(array(
              "status" => 1,
              "message" => $msg
            ), REST_Controller::HTTP_OK);
             $insert_id = $this->db->insert_id();
                    if($insert_id){
                      if($activity_msg_cat == 1){
                        $para['status'] = 30; //"category inserted"
                      }
                      if($activity_msg_cat == 2){
                        $para['status'] = 32; //"category type inserted"
                      }
                    $para['action_id'] = $data->employee_id ?? NULL;
                    $para['action_type'] = 'employee';
                    }else{
                       if($activity_msg_cat == 1){
                        $para['status'] = 31; //"category updated"
                        }
                        if($activity_msg_cat == 2){
                          $para['status'] = 33; //"category type updated"
                        }
                        $para['action_id'] = $data->employee_id ?? NULL;
                        $para['action_type'] = 'employee';
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
   public function apply_job_post(){

     $data = json_decode(file_get_contents("php://input"));
     
     $candidate_detail = array();
    if(isset($data->job_id) && isset($data->employee_id) && isset($data->status)){
       if(!empty($data->job_id) || !empty($data->employee_id)){
     $candidate_detail["job_id"] = $data->job_id;

     $candidate_detail["employee_id"] = $data->employee_id;
                            }
    $msg = "";
    if(isset($data->apply_id)){
          if(!empty($data->apply_id)){
            $candidate_detail["apply_id"] = $data->apply_id;
            $msg = "Job switched successfully";

          }
          }
    //-------------------------------------------------------------
    // Status :
    // view job = 1
    // apply job = 0
    // connect job = 2
    // save job = 3
    //-------------------------------------------------------------
          if(isset($this->admin_id)){
            if(!empty($this->admin_id)){
                  $candidate_detail["apply_by_admin_id"] = $this->admin_id;
            }
            
          }
          // echo"admin cdtn---- failed";die;
          if($data->status == 1){
            $candidate_detail["is_viewed"] = $data->status ;
            $msg = "Job viewed successfully";

          }
          if($data->status == 0){
            $candidate_detail["is_viewed"] = $data->status ;
            $msg = "Job applied successfully";

          }
          if($data->status == 2){
            $candidate_detail["is_viewed"] = $data->status ;
            $msg = "Job connected successfully";

          }
          if($data->status == 3){
            $candidate_detail["is_viewed"] = $data->status ;
            $msg = "Job saved successfully";

          }
          
          // print_r($candidate_detail);die;
          $response = $this->employer_model->applyJob($candidate_detail);
          if($response === "2"){
            $msg = "already applied on this job";
          }
          if($response === "3"){
            $msg = "already saved this job";
          }
        // print_r($response->apply_id);die;
        if($response){
          if(!empty($response->company_id)){
            $company_id = $response->company_id;
            $email_template_id = 4;
            $unique_id = $this->common_model->getLastRecord_email()['id'] ?? 1;
            $unique_id .= mt_rand(1000, 9999);
            // ---------- Sending Mail and Notification ----------
            // Checking permission - Parent
            $admin_permission = $this->common_model->checkParentPermission();
            // Checking permission - employer
            $permission = $this->common_model->checkEmployerEmailPermission($company_id);
            
              // ----- Sending mail : Company -----
              if(isset($admin_permission['email_employer']['job']) && $admin_permission['email_employer']['job'] == 1){
                if(isset($permission['email_permission']->job) && $permission['email_permission']->job == 1){
                $company_email = array('to' => $response->email ?? NULL,
                                 'job_title'=>$response->job_title,
                                 'company_name'=>$response->company_name
                                );
                $this->common_model->email($company_email, $email_template_id, $unique_id);
                }
             }
            // ----- Sending Notification : Company -----
            if(isset($admin_permission['notification_employer']['job']) && $admin_permission['notification_employer']['job'] == 1){
                $company_notification['from_id'] = $response->company_id;
                $company_notification['type'] = 'company';
                $company_notification['subject'] = 'applied_on_job';
                $company_notification['action_id'] = $response->job_id;
                $company_notification['message'] = 'A new user applied on job with title - '.$response->job_title;
                $this->common_model->addNotification($company_notification);
            }
            // Sending mail and notification to Admin
            if(isset($this->admin_email)){
            if(!empty($this->admin_email)){
              $permission = $this->common_model->checkAdminEmailPermission($company_id);
              // if(isset($admin_permission['email_employer']['job']) && $admin_permission['email_employer']['job'] == 1){
               // if(isset($permission['email_permission']->job) && $permission['email_permission']->job == 1){
              $admin_email = array('to' => $this->admin_email_static,
                                    // 'to' => $this->admin_email,
                                    'job_title'=>$response->job_title,
                                    'company_name'=>$response->company_name,
                                    'employee_name'=>$response->name,
                                    'employee_email'=>$response->email,
                                    'employee_contact_no'=>$response->contact_no,
                                    'employee_skill'=>$response->skill
                                    );
                                    // print_r($admin_email);die;
                                    $this->common_model->email($admin_email, $email_template_id, $unique_id);
              //  }
              // }
              // if(isset($admin_permission['email_employer']['job']) && $admin_permission['email_employer']['job'] == 1){
               // if(isset($permission['email_permission']->job) && $permission['email_permission']->job == 1){
                        $admin_notification['from_id'] = $this->admin_id ?? 0;
                        $admin_notification['type'] = $this->user_type;
                        $admin_notification['subject'] = 'applied_on_job';
                        $admin_notification['action_id'] = $response->job_id;;
                        $admin_notification['message'] = 'A new user applied on job with title - '.$response->job_title;
                        // $this->common_model->addNotification($admin_notification);
              //  }
              // }
            }
          }
          }
            $this->response(array(
              "status" => 1,
              "message" => $msg
            ), REST_Controller::HTTP_OK);
            
            // Activity log
            if($data->status == 0){
          //  $response->apply_id;
                    if(isset($data->apply_id)){
                      $para['status'] = 19; // "job switch"
                      $para['action_id'] = $data->apply_id ?? NULL;
                      $para['action_type'] = 'apply_on_job';
                    
                    }else{
                      $para['status'] = 20; // "apply on job"
                      $para['action_id'] =  $response->apply_id ?? NULL;
                      $para['action_type'] = 'apply_on_job';
                    }
                    if(isset($para)){
                    $this->_log_request($para);
                    }
                    return;
              }
          }else{
          $this->response(array(
            "status" => 0,
            "messsage" => "Failed to apply job"
          ), REST_Controller::HTTP_OK);
        }
      }else{
          $this->response(array(
            "status" => 0,
            "messsage" => "all fields are required !"
          ), REST_Controller::HTTP_OK);
      }
   }
   public function deleteApplyJob_post(){
      $data = json_decode(file_get_contents("php://input"));
      if(isset($data->apply_id) && isset($data->employee_id)){
        if(empty($data->apply_id) || empty($data->employee_id)){
           $this->response(array(
            "status" => 0,
            "messsage" => "fields must not be empty !"
          ), REST_Controller::HTTP_OK);
          return;
        }
      }else{
          $this->response(array(
            "status" => 0,
            "messsage" => "all fields are required !"
          ), REST_Controller::HTTP_OK);
          return;
      }
      $apply_id = $data->apply_id;
      $employee_id = $data->employee_id;
      if($this->employer_model->delete_apply_job($apply_id, $employee_id)){
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
   public function getAllJobsView_post(){
    $data = json_decode(file_get_contents("php://input"));
    $details['job_id'] =$data->job_id ?? null;
    $details['employee_id'] = 0;
    $details['manager_id'] = $data->manager_id ?? null;
    // print_r($details);die;
    if(!empty($this->admin_id) && ($this->user_type == "manager" || $this->user_type == "executive")){
      $details["manager_id"] = $this->admin_id;
    }  
    if(!empty($this->employee_id) && $this->user_type == "employee"){
      $details["employee_id"] = $this->employee_id;
    }  
    if(!empty($this->company_id) && $this->user_type == "company"){
      $details["company_id"] = $this->company_id;
    }  
    $page = $data->page ?? 1;
    $limit =$data->limit ?? 999; 

    if(!empty($this->admin_id) && $this->user_type != "super-admin" && $this->user_type != "admin"){
      $details ["admin_id"] =  $this->admin_id;
      $details["admin_type"] =  $this->user_type;
    }  

    // Get search parameter
    $search = isset($data->search) ? $data->search : '';

    // Get filter parameters

    $filter = [
    "category_id" => $data->filter_category_id ?? null,
    "job_type" => $data->filter_job_swap ?? null,
    "keyskill" => $data->filter_keyskill ?? null,
    "location" => $data->filter_location ?? null,
    "company_name" => $data->filter_company_name ?? null,
    "applied_by_self" => $data->filter_applied_by_self ?? null,
    "applied_by_admin" => $data->filter_applied_by_admin ?? null,
    "reserved_employee" => $data->filter_reserved_employee ?? null,
    // "reserved_employee" => ($data->filter_reserved_employee !== '') ? $data->filter_reserved_employee : null,
    "company_id" => $data->filter_company_id ?? null,
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
    //recommended
    $recommend_sort = '';
    if(isset($data->employee_skills)){
    if($data->employee_skills !== NULL){
      $recommend_sort = $data->employee_skills;
    }
    }
    // print_r($recommend_sort);die;
    $result = $this->employer_model->viewJobs($filter, $search, $limit, $offset, $sort, $details, $recommend_sort);
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

    public function allJobs_get(){

      // $employee_id = $this->get('employee_id');

      $jobs = $this->employer_model->getJob();

      if($jobs){



        $this->response(array(

          "status" => 1,

          "message" => "Jobs found",

          "data" => $jobs

        ), REST_Controller::HTTP_OK);

      }else{



        $this->response(array(

          "status" => 0,

          "message" => "No Jobs found",

        ), REST_Controller::HTTP_OK);

      }

  }
   public function getjob_post(){
      $data = json_decode(file_get_contents("php://input"));
      $job_id = $data->job_id;
      // print_r($job_id);die;
      $employee = $this->employer_model->getJob($job_id);
      if(count($employee) > 0){

        $this->response(array(
          "status" => 1,
          "message" => "Employees found",
          "data" => $employee
        ), REST_Controller::HTTP_OK);
      }else{

        $this->response(array(
          "status" => 0,
          "message" => "No Employee found",
          "data" => $employee
        ), REST_Controller::HTTP_OK);
      }
  }
//get job category
    public function allJobCategory_post(){
    $data = json_decode(file_get_contents("php://input"));
    $parent_id = 0;
    if(isset($data->parent_id) && $data->parent_id > 0){
      $parent_id = $data->parent_id;
    }

    $page = isset($data->page) ? $data->page : null;
    $limit = isset($data->limit) ? $data->limit : null; 

    $search = isset($data->search) ? $data->search : '';

    $filter = isset($data->filter_category_type) ? $data->filter_category_type: '';

    $sort = [
      'column_name' => $data->column_name ?? null,
      'sort_order' => $data->sort_order ?? null
    ];

    $offset = ($page - 1) * $limit;

    $result = $this->employer_model->getAllJobCategory($filter, $search, $limit, $offset,$sort,$parent_id);
    // print_r($result);die;

    if($result) {
              $this->response(array(
                "status" => 1,
                "message" => "successful",
                "total_rows" => $result['total_rows'],
                "data" => $result['data']
              ), REST_Controller::HTTP_OK);

        }else{



          $this->response(array(

            "status" => 0,

            "message" => "No job category found",


          ), REST_Controller::HTTP_OK);

        }

  }

public function allEmployer_post(){
  
  $data = json_decode(file_get_contents("php://input"));
   $user_detail = array();
    // print_r($data);die;
    if(!empty($this->admin_id) && $this->user_type != "super-admin" && $this->user_type != "admin"){
    $user_detail = array("admin_id" =>  $this->admin_id,
                          "admin_type" =>  $this->user_type);
    }
                          // print_r($user_detail);die;
    // Get pagination parameters
    $page = isset($data->page) ? $data->page : 1;
    $limit = isset($data->limit) ? $data->limit : 10; 

    // Get search parameter
    $search = isset($data->search) ? $data->search : '';

    // Get filter parameters
    $filter = [
    "industry" => $data->filter_industry ?? null,
    "corporation" => $data->filter_corporation ?? null
    ];
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
      'column_name' => $data->column_name ?? null ,
      'sort_order' => $data->sort_order ?? null
    ];

    $result = $this->employer_model->getAllEmployer($user_detail, $filter, $search, $limit, $offset, $sort);

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

          "message" => "No employer found",

        ), REST_Controller::HTTP_OK);

      }

  }

    public function getEmployer_post(){

      $data = json_decode(file_get_contents("php://input"));

      // print_r($company_id);die;

      $company_detail['company_detail']= $this->employer_model->getEmployerDetail($data->company_id);

      $company_detail['kyc_detail'] = $this->employer_model->getCompany_kyc($data->company_id);

      

      if(!empty($company_detail)){



        $this->response(array(

          "status" => 1,

          "message" => "Employer found",

          "data" => $company_detail

        ), REST_Controller::HTTP_OK);

      }else{



        $this->response(array(

          "status" => 0,

          "message" => "No employer found",

          "data" => $company_detail

        ), REST_Controller::HTTP_NOT_FOUND);

      }

  }

   public function employer_delete($company_id){

      if($this->employer_model->deleteEmployer($company_id)){

        // retruns true

        $this->response(array(

          "status" => 1,

          "message" => "company has been deleted"

        ), REST_Controller::HTTP_OK);

      }else{

        // return false

        $this->response(array(

          "status" => 0,

          "message" => "Failed to delete company"

        ), REST_Controller::HTTP_NOT_FOUND);

      }

  }

   public function jobCategory_delete($job_category_id){
      $id = array('item_id'=>2,
                  'json_item_id'=>$job_category_id);
        if($this->employer_model->deleteJobCategory($job_category_id)){
        $this->admin_model->deleteFilterList($id);
        // retruns true

        $this->response(array(

          "status" => 1,

          "message" => "job category has been deleted"

        ), REST_Controller::HTTP_OK);

      }else{

        // return false

        $this->response(array(

          "status" => 0,

          "message" => "Failed to delete job category"

        ), REST_Controller::HTTP_NOT_FOUND);

      }

  }

public function job_delete($job_id){

      if($this->employer_model->deleteJob($job_id)){

        // retruns true

        $this->response(array(

          "status" => 1,

          "message" => "job has been deleted"

        ), REST_Controller::HTTP_OK);

      }else{

        // return false

        $this->response(array(

          "status" => 0,

          "message" => "Failed to delete job"

        ), REST_Controller::HTTP_NOT_FOUND);

      }

  }
public function addUpdateInterview_post(){

      $data = json_decode(file_get_contents("php://input"));
      // print_r($data); die;      
      $interview_detail = array(); 
      if(isset($data->job_id) && isset($data->employee_id)  && isset($data->interview_date) && isset($data->created_by_admin))
      { 
         $error_flag = 0;  
        if(empty($data->job_id) || empty($data->employee_id) || empty($data->interview_date) || empty($data->created_by_admin))
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
        $interview_detail = array(
          "job_id" => $data->job_id,
          "employee_id" => $data->employee_id,
          "interview_date" => $data->interview_date,
          "created_by_admin" => $data->created_by_admin
        );
        if(isset($data->interview_status)){
          if(!empty($data->interview_status)){
             $interview_detail['status'] = $data->interview_status;
          }
        }
        $response = $this->employer_model->addUpdateInterview($interview_detail);
        // print_r($response);die;
        if($interview_detail){
          $employee_id = $data->employee_id;         
          $unique_id = $this->common_model->getLastRecord_email()['id'] ?? 1;
          $unique_id .= mt_rand(1000, 9999);
          // if($this->common_model->checkEmployeeEmailPermission($data->employee_id)){
            // Sending mail and notification to Employee
            $email_template_id = 5;
            //  $company = array('to' => $response->email ?? NULL,
            //                  'candidate_name'=>$response->name,
            //                  'interview_date'=>$response->interview_date,
            //                  'job_title'=>$response->job_title,
            //                  'company_name'=>$response->company_name);
            //  $this->common_model->email($company, $email_template_id, $unique_id);
          // }
                        $notification['from_id'] = $data->employee_id;
                        $notification['type'] = 'employee';
                        $notification['subject'] = 'interview_scheduled';
                        $notification['action_id'] = $response->job_id;
                        $notification['message'] = 'hello, '.$response->name.' you have interview scheduled on '.$response->interview_date.' for job with title - '.$response->job_title.' you have applied on, scheduled with '.$response->company_name;
                        $this->common_model->addNotification($notification);
          // if($this->common_model->checkEmployerEmailPermission($response->company_id)){
          //   // Sending mail and notification to Company
          //   $email_template_id = 10;
          //    $company = array('to' => $response->company_email ?? NULL,
          //                    'candidate_name'=>$response->name,
          //                    'interview_date'=>$response->interview_date,
          //                    'job_title'=>$response->job_title,
          //                    'company_name'=>$response->company_name);
          //   //  $this->common_model->email($company, $email_template_id, $unique_id);
          // }
                        $notification['from_id'] = $response->company_id;
                        $notification['type'] = 'company';
                        $notification['subject'] = 'interview_scheduled';
                        $notification['action_id'] = $response->job_id;
                        $notification['message'] = 'hello, '.$response->company_name.' you have interview scheduled on '.$response->interview_date.' for job with title - '.$response->job_title.', scheduled with '.$response->name;
                        $this->common_model->addNotification($notification);
        // Sending mail and notification to Super-Admin
        // if(isset($this->admin_email)){
        //     if(!empty($this->admin_email)){
        //        if($this->common_model->checkAdminEmailPermission($this->admin_id)){
                $email_template_id = 11;
              $admin_email = array('to'=> $this->admin_email_static,
                                  // 'to' => $this->admin_email,
                                    'candidate_name'=>$response->name,
                                    'interview_date'=>$response->interview_date,
                                    'job_title'=>$response->job_title,
                                    'company_name'=>$response->company_name);
                                    $this->common_model->email($admin_email, $email_template_id, $unique_id);
              //  }
                        $admin_notification['from_id'] = $this->admin_id;
                        $admin_notification['type'] = $this->user_type;
                        $admin_notification['subject'] = 'interview_scheduled';
                        $admin_notification['action_id'] = $response->job_id;;
                        $admin_notification['message'] = 'A new interview scheduled of candidate '.$response->name.' on date '.$response->interview_date.' for job title '.$response->job_title.' posted by company '.$response->company_name;
                        // $this->common_model->addNotification($admin_notification);
          //   }
          // }
            $this->response(array(
              "status" => 1,
              "message" => "data inserted successfully"
            ), REST_Controller::HTTP_OK);
           
                    $para['status'] = 21; // "interview schedule"
                    $para['action_id'] =  $response->apply_id ?? NULL;
                    $para['action_type'] = 'apply_on_job';
        
                    $this->_log_request($para);
        }
        else{



          $this->response(array(

            "status" => 0,

            "messsage" => "Failed to insert data"

          ), REST_Controller::HTTP_OK);

        } 

      }else{

        $this->response(array(

          "status" => 0,

          "message" => "All fields are required !"

        ), REST_Controller::HTTP_OK);

      }
    }
public function getInterview_post(){
      $data = json_decode(file_get_contents("php://input"));
      $filter = array();
      $details = array('id'=>$data->id ?? null,
                  'job_id'=>$data->job_id ?? null,
                  'employee_id'=>$data->employee_id ?? null,
                 );

     if(!empty($this->admin_id) && $this->user_type != "super-admin" && $this->user_type != "admin"){
      $details["admin_id"] =  $this->admin_id;
      $details["admin_type"] =  $this->user_type;
    }  

      $page =  $data->page ?? 1;
      $limit = $data->limit ?? 10; 
// print_r($limit);die;
      // Get search parameter
      $search = isset($data->search) ? $data->search : '';
      $filter['company_id'] = $data->filter_by_company_id ?? NULL;
      // Get filter parameters
if(isset($data->filter_by_time)){
      if($data->filter_by_time == "today"){
            $filter['start_date'] = date('Y-m-d');
            $filter['end_date'] = date('Y-m-d', strtotime('tomorrow'));

      }
      if($data->filter_by_time == "last_week"){
            $filter['start_date'] = date('Y-m-d', strtotime('last week'));
            $filter['end_date'] = date('Y-m-d', strtotime('last week +7days'));

      }
      if($data->filter_by_time == "next_week"){
            $filter['start_date'] = date('Y-m-d', strtotime('next week'));
            $filter['end_date'] = date('Y-m-d', strtotime('next week +7days'));
            
          }
      if($data->filter_by_time == "last_month"){
            $filter['start_date'] = date('Y-m-01', strtotime('last month'));
            $filter['end_date'] =date('Y-m-t', strtotime('last month'));
            
          }
      if($data->filter_by_time == "current_month"){
            $filter['start_date'] = date('Y-m-01', strtotime('this month'));
            $filter['end_date'] =date('Y-m-t', strtotime('this month'));
            
          }
      if($data->filter_by_time == "next_month"){
            $filter['start_date'] = date('Y-m-01', strtotime('next month'));
            $filter['end_date'] = date('Y-m-d', strtotime('next month'));
            
          }
    }
    if(isset($data->filter_by_status)){
      if(!empty($data->filter_by_status)){
      $filter["filter_by_status"]=$data->filter_by_status;
    }
  }
      // Calculate offset for pagination
      $offset = ($page - 1) * $limit;
    
      // sorting 
      $sort = [
        'column_name' => $data->column_name ?? 'id' ,
        'sort_order' => $data->sort_order ?? 'DESC'
      ];
      
      // print_r($details);die;
      $response = $this->employer_model->getInterview($details, $filter, $search, $limit, $offset, $sort);
      if($response){

        $this->response(array(
          "status" => 1,
          "message" => " Successful ",
          "data" => $response
        ), REST_Controller::HTTP_OK);
      }else{

        $this->response(array(
          "status" => 0,
          "message" => "No data found"
        ), REST_Controller::HTTP_OK);
      }
  }
// public function addUpdateLmia_put(){
    
//       $data = json_decode(file_get_contents("php://input"));
//       // print_r($data); die;
//       $detail = array();
//        if(isset($data->job_id) && isset($data->employee_id)){
//           if(!empty($data->job_id) || !empty($data->employee_id)){
//           $detail["job_id"]=$data->job_id;
//           $detail["employee_id"]=$data->employee_id;
//         }
//         if(isset($data->lmia_status)){
//            if(!empty($data->lmia_status)){
//            $detail["lmia_status"]=$data->lmia_status;
//          }
//        }
//         if(isset($data->completion_time)){
//            if(!empty($data->completion_time)){
//            $detail["expected_time_of_completion"]=$data->completion_time;
//          }
//        }     
//         $response = $this->employer_model->addUpdateLmia($detail);
//         // print_r($response['response']);die;
//         if($response){
//           $response_lmia_status = $response['response']->lmia_status ?? null;
//           $company_id = $response['response']->company_id ?? null;
//           // print_r($company_id);
//           // print_r($response_lmia_status);die;
//           if($response_lmia_status == 'Complete' || $response_lmia_status == 'Reject'){
//             // echo('if');
//             // print_r($response['status']);die;
//             if($this->common_model->checkEmployerEmailPermission($company_id)){
//               $unique_id = $this->common_model->getLastRecord_email()['id'] ?? 1;
//               $unique_id .= mt_rand(1000, 9999);
//               $email_template_id = 12;
//               $company_email = array('to'=>$response['response']->company_email,
//                                      'employee_name' =>$response['response']->name,
//                                      'company_name'=>$response['response']->company_name,
//                                     //  'job_title'=>$response->job_title,
//                                      // 'job_description'=>$response->job_description,
//                                      // 'job_location'=>$response->location,
//                                      'lmia_status'=>$response_lmia_status);
//               // $this->common_model->email($company_email, $email_template_id, $unique_id);
//             }
//                       $admin_notification['from_id'] = $company_id;
//                       $admin_notification['type'] = 'company';
//                       $admin_notification['subject'] = 'Lmia status changed';
//                       $admin_notification['action_id'] = $response['response']->employee_id;
//                       $admin_notification['message'] = 'Lmia status changed to '.$response_lmia_status.' for employee '.$response['response']->name;
//                       $this->common_model->addNotification($admin_notification);
//           }
//           // print_r('else');die;
//             $this->response(array(
//               "status" => 1,
//               "message" => $response['msg']
//             ), REST_Controller::HTTP_OK);

//             // Activity log
//             if($response['msg'] === 'Data updated successfully'){
//              $para['status'] = 22; // "lmia updated"
//                     $para['action_id'] =  $response['response']->id ?? NULL;
//                     $para['action_type'] = 'lmia';
//             }else if($response['msg'] === 'Data added successfully'){
//               $para['status'] = 23; // "lmia inserted"
//                     $para['action_id'] =  $response['response']->id ?? NULL;
//                     $para['action_type'] = 'lmia';
//             }
//         if(isset($para)){
//           $this->_log_request($para);
//         }
//         return;
//         }else{

//           $this->response(array(
//             "status" => 0,
//             "messsage" => "Failed !"
//           ), REST_Controller::HTTP_OK);
//         }
//       }else{
//          $this->response(array(
//             "status" => 0,
//             "messsage" => "All fields required !"
//           ), REST_Controller::HTTP_OK);
//       }
//    }
public function changePassword_put(){
        
        // print_r($this->uri->segment(2));die;
        $data = json_decode(file_get_contents("php://input"));
         if (isset($data->password) && isset($data->new_password) && isset($data->conf_password) && isset($this->company_id)){
               if(empty($data->password) || empty($data->new_password) || empty($data->conf_password) || empty( $this->company_id)){
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
                $status = $this->employer_model->checkLogin($check_password);
                if($status != false){
                // print_r($status);die;
                 $new_password = array('company_id'=>$status->company_id,
                                        'password'=>md5($data->new_password));
               if($this->employer_model->addUpdateCompanyDetails($new_password)){
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
    public function getAllJobsViewAdmin_post(){
    $data = json_decode(file_get_contents("php://input"));
    $details['job_id'] =$data->job_id ?? null;
    $details['employee_id'] = $data->employee_id ?? 0;
    $details['manager_id'] = $data->manager_id ?? null;
    // print_r($details);die;
    if(!empty($this->admin_id) && ($this->user_type == "manager" || $this->user_type == "executive")){
      $details["manager_id"] = $this->admin_id;
    }  
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
    $result = $this->employer_model->viewJobsAdmin($filter, $search, $limit, $offset, $sort, $details);
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
  //   public function getLmia_post(){
  //   $data = json_decode(file_get_contents("php://input"));
  //   // $details['job_id'] =$data->job_id ?? null;
  //   $details['company_id'] = $data->company_id ?? 0;
  //   // if(!empty($this->employee_id) && $this->user_type == "employee"){
  //   //   $details["employee_id"] = $this->employee_id;
  //   // }  
  //   if(!empty($this->company_id) && $this->user_type == "company"){
  //     $details["company_id"] = $this->company_id;
  //   }  
  //   $page = $data->page ?? 1;
  //   $limit =$data->limit ?? 10; 

  //   // if(!empty($this->admin_id) && $this->user_type != "super-admin" && $this->user_type != "admin"){
  //   //   $details ["admin_id"] =  $this->admin_id;
  //   //   $details["admin_type"] =  $this->user_type;
  //   // }  

  //   // Get search parameter
  //   $search = isset($data->search) ? $data->search : '';

  //   // Get filter parameters

  //   $filter = [
  //   "lmia_status" => $data->filter_by_lmia_status ?? null,
  //   "job_id" => $data->filter_by_job_id ?? null,
  //   "employee_id" => $data->filter_employee_id ?? null,
  //   // "location" => $data->filter_location ?? null,
  //   // "company_name" => $data->company_name ?? null,
  //   ];
  //   if(isset($data->filter_by_time)){
  //     if($data->filter_by_time == "today"){
  //           $filter['start_date'] = date('Y-m-d');
  //           $filter['end_date'] = date('Y-m-d', strtotime('tomorrow'));

  //     }
  //     if($data->filter_by_time == "last_week"){
  //           $filter['start_date'] = date('Y-m-d', strtotime('last week'));
  //           $filter['end_date'] = date('Y-m-d', strtotime('last week +7days'));

  //     }
     
  //     if($data->filter_by_time == "last_month"){
  //           $filter['start_date'] = date('Y-m-01', strtotime('last month'));
  //           $filter['end_date'] =date('Y-m-t', strtotime('last month'));
            
  //         }
  //     if($data->filter_by_time == "current_month"){
  //           $filter['start_date'] = date('Y-m-01', strtotime('this month'));
  //           $filter['end_date'] =date('Y-m-t', strtotime('this month'));
            
  //         }
  //   }

    
  //   // Calculate offset for pagination
  //   $offset = ($page - 1) * $limit;

  //   // sorting 
  //   $sort = [
  //     'column_name' => $data->column_name ?? "created_at" ,
  //     'sort_order' => $data->sort_order ?? "DESC"
  //   ];
  //   // print_r($sort);
  //   $result = $this->employer_model->get_lmia($filter, $search, $limit, $offset, $sort, $details);
  //   // print_r($result);die;

  //   if ($result) {
  //             $this->response(array(
  //               "status" => 1,
  //               "message" => "successful",
  //               "total_rows" => $result['total_rows'],
  //               "data" => $result['data']
  //             ), REST_Controller::HTTP_OK);

  //         }else{



  //           $this->response(array(

  //             "status" => 0,

  //             "messsage" => "No data found"

  //           ), REST_Controller::HTTP_OK);

  //         }
  //  }
     /*
    ||------------------------------------------------------------------------------------
    ||  upload response of employer, creates seperate directory for each employer by name
    ||  and upload document files.
    ||------------------------------------------------------------------------------------
  */
    public function documentsUpload_put(){
      $data = json_decode(file_get_contents("php://input"));
    //  print_r($data);die;
      $documents = [];
      // $file_info = array();
      $id = 0;
      if((isset($data->company_id) || isset($this->company_id)) && isset($data->type) && isset($data->document_file)){
          if((empty($data->company_id) && empty($this->company_id)) || empty($data->type) || empty($data->document_file)){
                  $this->response(array(
                    "status" => 0,
                    "message" => "fields must not be empty !"
                    ) , REST_Controller::HTTP_OK);
                    return;
                  }                  
                    $company_id = $data->company_id ?? $this->company_id ?? null;
                    // print_r($company_id);die;
                    $documents[$data->type] = $data->document_file;
                    
                    $response = $this->createDirectoryAndUploadDocs($company_id, $documents);
                    // print_r($response);die;
                    if (is_array($response) && count($response) > 0) {
                          $file_info = $response;
                          $file_info['company_id'] = $company_id;
                           $msg = "inserted successfully";
                   if(isset($data->id) && !empty($data->id)){
                            // if(!empty($data->id)){
                              $id = $data->id;
                              $msg = "updated successfully";
                              $file_info['updated_by'] = $this->admin_id ?? $this->company_id;
                              $file_info['updated_type'] = $this->user_type;
                            // }
                          }else{
                            $file_info['created_by'] = $this->admin_id ?? $this->company_id;
                            $file_info['created_type'] = $this->user_type;
                          }
                          if(isset($data->is_varify)){
                            
                              $file_info['is_varify'] = $data->is_varify;

                  
                          }
                          // print_r($file_info);die;
                          if($this->employer_model->documentsUpload($id, $file_info)){
                                    $this->response(array(
                                      "status" => 1,
                                      "message" => $msg
                                      ) , REST_Controller::HTTP_OK);
                                       // activity log
                                      $insert_id = $this->db->insert_id();
                                      if($insert_id){
                                      $para['status'] = 24; // "Employer document inserted"
                                      $para['action_id'] = $data->company_id ?? $this->company_id;
                                      $para['action_type'] = 'employer';
                                      }else{
                                          $para['status'] = 25; // "Employer document updated"
                                          $para['action_id'] = $data->company_id ?? $this->company_id;
                                          $para['action_type'] = 'employer';
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
                        } 
                    if($response == 1){
                      // Unsupported file type
                       $this->response(array(
                          "status" => 0,
                          "message" => "Unsupported file type !"
                          ) , REST_Controller::HTTP_OK);
                          return;
                    }
                    if($response == 2){
                      // Invalid base64-encoded data
                      $this->response(array(
                          "status" => 0,
                          "message" => "Invalid base64-encoded data !"
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
    // Verify employer documents
    public function isVarify_put(){
      $data = json_decode(file_get_contents("php://input"));
        if(isset($data->id) && isset($data->is_varify)){
          if(empty($data->id) || empty($data->is_varify)){
            $this->response(array(
                   "status" => 0,
                   "message" => "fields must not be empty !"
                   ) , REST_Controller::HTTP_OK);
                   return;
            }
                     $id = $data->id;
                     $file_info['is_varify'] = $data->is_varify;
          if($this->employer_model->documentsUpload($id, $file_info)){
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
                    "message" => "all fields required !"
                    ) , REST_Controller::HTTP_OK);
                    return;
        }
    }
  /*
    ||------------------------------------------------------------------------------------
    ||  check if directory exist with the given employer name if not than create directory
    ||  and upload document file. 
    ||------------------------------------------------------------------------------------
  */
    public function createDirectoryAndUploadDocs($id, $documents){
      $dir_name = 'employer_'.$id;
      $documents_url = [];
      // print_r(FCPATH);die;
      // echo'</n>';
      $file_path = FCPATH.'uploads/employer_documents/'.$dir_name;        
      // print_r($file_path);die;
      // Checking whether if directory not exists than create directory
      if (!file_exists($file_path)) {        
          if(!mkdir($file_path, 0777, true)){
              $this->response(array(
                    "status" => 0,
                    "message" => "failed !"
                    ) , REST_Controller::HTTP_OK);
                    return;
          }
      }
      if (file_exists($file_path)) {
        // print_r($documents);die;
        foreach($documents as $key=>$value){
          $document_name = $key;
          $base64_encoded_document = $value;
          // echo($document_name." : ".$base64_encoded_document .PHP_EOL);
                // Check if the image data is a base64-encoded string
                // $pattern = '/data:\/jpeg;base64,([A-Za-z0-9+\/=]+)/';
                if (preg_match('/^data:\/(\w+);base64,([A-Za-z0-9+\/=]+)/', $base64_encoded_document, $ext_type) || preg_match('/^data:image\/(\w+);base64,([A-Za-z0-9+\/=]+)/', $base64_encoded_document, $ext_type) || preg_match('/data:\/(.*);base64/', $base64_encoded_document, $ext_type)) {
                    $base64_encoded_document = substr($base64_encoded_document, strpos($base64_encoded_document, ',') + 1);
                // '/^data:image\/(\w+);base64,/'
                    $file_extension = strtolower($ext_type[1]);
                // print_r($file_extension);die;
                    // Check if the image type is supported
                    if (in_array($file_extension, array('jpg', 'jpeg', 'png', 'pdf', 'doc', 'docx', 'vnd.openxmlformats-officedocument.wordprocessingml.document'))) {
                        $base64_decoded_document = base64_decode($base64_encoded_document);
                    
                        $file_name_for_upload = $document_name .'_'.$id. '.' . $file_extension;
                        $file_path_for_upload = $file_path.'/'. $file_name_for_upload;
                        // print_r($file_path_for_upload);die;
                        file_put_contents($file_path_for_upload, $base64_decoded_document);
                    
                        $uploaded_document_url = base_url() . 'uploads/employer_documents/'.$dir_name.'/' . $file_name_for_upload;
                        $documents_url["document_url"] = $uploaded_document_url;
                        $documents_url["extension_type"] = $file_extension;
                        $documents_url["type"] = $document_name;
                    } else {
                        // Unsupported file type
                        unset($documents_url[$document_name]);
                        return 1;
                    }
                } else {
                    // Invalid base64-encoded image data
                 unset($documents_url[$document_name]);
                 return 2;
                }
      }
        // print_r($documents_url);die;
        $file_info = $documents_url;
        return $file_info;
      }
    }
    /*
    ||------------------------------------------------------------------------------------
    || get upload document file path and other info. 
    ||------------------------------------------------------------------------------------
  */
     public function getDocumentsUploaded_post(){
      $data = json_decode(file_get_contents("php://input"));
      
      $id = $data->id ?? null;
      $details = [];
      if(isset($data->company_id)){
        if(!empty($data->company_id)){
            $details['company_id'] = $data->company_id;
        }
      }
      if(isset($this->company_id)){
        if(!empty($this->company_id)){
            $details['company_id'] = isset($this->company_id);
        }
      }
      if(isset($data->type)){
        if(!empty($data->type)){
            $details['type'] = $data->type;
        }
      }
      // print_r($details);die;
      $documents = $this->employer_model->get_documents_uploaded($id, $details);
      if($documents){
        $this->response(array(
          "status" => 1,
          "message" => "Successfully",
          "data" => $documents
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
  public function deleteDocumentsUploaded_post(){
    $data = json_decode(file_get_contents("php://input"));
    if(isset($data->id)){
          if(empty($data->id)){
            $this->response(array(
                  "status" => 0,
                  "message" => "id must not be empty !"
                ), REST_Controller::HTTP_OK);
                 return;
              }
                     $id = $data->id;
         
    $documents = $this->employer_model->get_documents_uploaded($id);
    if($documents){
      // Explode the URL by slashes ('/') to get an array of its segments
    $segments = explode('/', $documents['document_url']);

    // Slice the desired portion (from the fouth until the last segment)
    $sliced_portion = implode('/', array_slice($segments, 4));
    $file_path = FCPATH . $sliced_portion;
    // check if file exist, if yes than unlink(Delete) the file  
    if (file_exists($file_path)) {
        unlink($file_path);
    } 
    
      if($this->employer_model->delete_document_uploaded($id)){
        $this->response(array(
          "status" => 1,
          "message" => "document has been deleted"
        ), REST_Controller::HTTP_OK);
         return;
      }else{
        $this->response(array(
          "status" => 0,
          "message" => "Failed !"
        ), REST_Controller::HTTP_OK);
         return;
      }
      }else{      
       $this->response(array(
          "status" => 0,
          "message" => "No record found !"
        ), REST_Controller::HTTP_OK);
    }
  }else{
    $this->response(array(
          "status" => 0,
          "message" => "id must be provided !"
        ), REST_Controller::HTTP_OK);
         return;
  }
  }
  //  public function addUpdateLmiaSubstagesEmployee_put(){
  //     $data = json_decode(file_get_contents("php://input"));
  //       if(isset($data->lmia_id) && isset($data->lmia_status) && isset($data->lmia_substage)){
  //         if(empty($data->lmia_id) || empty($data->lmia_status) || empty($data->lmia_substage)){
  //           $this->response(array(
  //                  "status" => 0,
  //                  "message" => "fields must not be empty !"
  //                  ) , REST_Controller::HTTP_OK);
  //                  return;
  //           }
  //           $id = $data->id ?? null;
  //           $details = array('lmia_id'=>$data->lmia_id,
  //                            'lmia_status'=>$data->lmia_status,
  //                            'lmia_substage'=>$data->lmia_substage
  //                           );
  //           if(isset($data->is_active)){
  //                 $details['is_active'] = $data->is_active;
  //           }
  //           if(isset($id)){
  //             if(!empty($id)){
  //                 $details['updated_by'] = $this->admin_id;
  //             }
  //           }else{
  //           if(isset($this->admin_id)){
  //             if(!empty($this->admin_id)){
  //                 $details['created_by'] = $this->admin_id;
  //             }
  //           }
  //         }
  //           // print_r($details);die;
  //         $response = $this->employer_model->add_update_lmia_substages_employee($id, $details); 
  //         // print_r($response);die;          
  //           if($response){
  //           $this->response(array(
  //              "status" => 1,
  //              "message" => $response
  //              ) , REST_Controller::HTTP_OK);
  //               // activity log
  //               $insert_id = $this->db->insert_id();
  //               if($insert_id){
  //               $para['status'] = 26; // "Employee lmia substage added",
  //               $para['action_id'] = $data->lmia_id ?? NULL;
  //               $para['action_type'] = 'lmia';
  //               }else{
  //                   $para['status'] = 27; // "Employee lmia substage updated"
  //                   $para['action_id'] = $data->lmia_id ?? NULL;
  //                   $para['action_type'] = 'lmia';
  //               }
  //               if(isset($para)){
  //                 $this->_log_request($para);
  //               }
  //              return;
  //           }else{
  //             $this->response(array(
  //             "status" => 0,
  //             "message" => "failed !"
  //             ) , REST_Controller::HTTP_OK);
  //             return;
  //           }
  //       }else{
  //          $this->response(array(
  //                   "status" => 0,
  //                   "message" => "all fields required !"
  //                   ) , REST_Controller::HTTP_OK);
  //                   return;
  //       }
  //   }
  //   public function getLmiaSubstagesEmployee_post(){
  //     $data = json_decode(file_get_contents("php://input"));
      
  //     // $details = [];
  //     if(isset($data->lmia_id)){
  //       if(empty($data->lmia_id)){
  //         $this->response(array(
  //           "status" => 0,
  //           "message" => "fields must not be empty !",
  //         ), REST_Controller::HTTP_OK);
  //         return;
  //       }
  //       $lmia_id = $data->lmia_id ?? null;
  //     }else{
  //       $this->response(array(
  //         "status" => 0,
  //         "message" => "please provide lmia id !",
  //       ), REST_Controller::HTTP_OK);
  //        return;
  //     }
  //     $filter = array(
  //       'lmia_status' => $data->lmia_status ?? null
  //     );
    
  //     // print_r($lmia_id);die;
  //     $response = $this->employer_model->get_lmia_substages_employee($lmia_id, $filter);
  //     // print_r($response);die;

  //     if($response){
  //       $this->response(array(
  //         "status" => 1,
  //         "message" => "Successfully",
  //         "data" => $response
  //       ), REST_Controller::HTTP_OK);
  //        return;
  //     }else{
  //       $this->response(array(
  //         "status" => 0,
  //         "message" => "No data found",
  //       ), REST_Controller::HTTP_OK);
  //        return;
  //     }
  // }
  // public function deleteLmiaSubstageEmployee_post(){
  //     $data = json_decode(file_get_contents("php://input"));
  //     $id = $data->id;
  //     if($this->employer_model->delete_lmia_substage_employee($id)){
  //       $this->response(array(
  //         "status" => 1,
  //         "message" => "successfully deleted"
  //       ), REST_Controller::HTTP_OK);
  //     }else{
  //       $this->response(array(
  //         "status" => 0,
  //         "message" => "Failed to delete"
  //       ), REST_Controller::HTTP_OK);
  //     }
  // }
  //  public function addUpdateLmiaSubstagesJob_put(){
  //     $data = json_decode(file_get_contents("php://input"));
  //       if(isset($data->job_id) && isset($data->lmia_status) && isset($data->lmia_substage)){
  //         if(empty($data->job_id) || empty($data->lmia_status) || empty($data->lmia_substage)){
  //           $this->response(array(
  //                  "status" => 0,
  //                  "message" => "fields must not be empty !"
  //                  ) , REST_Controller::HTTP_OK);
  //                  return;
  //           }
  //           $id = $data->id ?? null;
  //           $details = array('job_id'=>$data->job_id,
  //                            'lmia_status'=>$data->lmia_status,
  //                            'lmia_substage'=>$data->lmia_substage
  //                           );
  //           if(isset($data->is_active)){             
  //                 $details['is_active'] = $data->is_active;
  //           }
  //           if(isset($id)){
  //             if(!empty($id)){
  //                 $details['updated_by'] = $this->admin_id;
  //             }
  //           }else{
  //           if(isset($this->admin_id)){
  //             if(!empty($this->admin_id)){
  //                 $details['created_by'] = $this->admin_id;
  //             }
  //           }
  //         }
  //           // print_r($details);die;
  //         $response = $this->employer_model->add_update_lmia_substages_job($id, $details); 
  //         // print_r($response);die;          
  //           if($response){
  //           $this->response(array(
  //              "status" => 1,
  //              "message" => $response
  //              ) , REST_Controller::HTTP_OK);
  //              // activity log
  //               $insert_id = $this->db->insert_id();
  //               if($insert_id){
  //               $para['status'] = 28; // "job lmia substage inserted"
  //               $para['action_id'] = $data->job_id ?? NULL;
  //               $para['action_type'] = 'jobs';
  //               }else{
  //                   $para['status'] = 29; // "job lmia substage updated"
  //                   $para['action_id'] = $data->job_id ?? NULL;
  //                   $para['action_type'] = 'jobs';
  //               }
  //               if(isset($para)){
  //               $this->_log_request($para);
  //               }
  //              return;
  //           }else{
  //             $this->response(array(
  //             "status" => 0,
  //             "message" => "failed !"
  //             ) , REST_Controller::HTTP_OK);
  //             return;
  //           }
  //       }else{
  //          $this->response(array(
  //                   "status" => 0,
  //                   "message" => "all fields required !"
  //                   ) , REST_Controller::HTTP_OK);
  //                   return;
  //       }
  //   }
  //   public function getLmiaSubstagesjob_post(){
  //     $data = json_decode(file_get_contents("php://input"));
      
  //     // $details = [];
  //     if(isset($data->job_id)){
  //       if(empty($data->job_id)){
  //         $this->response(array(
  //           "status" => 0,
  //           "message" => "fields must not be empty !",
  //         ), REST_Controller::HTTP_OK);
  //         return;
  //       }
  //       $job_id = $data->job_id ?? null;
  //     }else{
  //       $this->response(array(
  //         "status" => 0,
  //         "message" => "please provide job id !",
  //       ), REST_Controller::HTTP_OK);
  //        return;
  //     }
  //     $filter = array(
  //       'lmia_status' => $data->lmia_status ?? null
  //     );
    
  //     // print_r($lmia_id);die;
  //     $response = $this->employer_model->get_lmia_substages_job($job_id, $filter);
  //     // print_r($response);die;

  //     if($response){
  //       $this->response(array(
  //         "status" => 1,
  //         "message" => "Successfully",
  //         "data" => $response
  //       ), REST_Controller::HTTP_OK);
  //        return;
  //     }else{
  //       $this->response(array(
  //         "status" => 0,
  //         "message" => "No data found",
  //       ), REST_Controller::HTTP_OK);
  //        return;
  //     }
  // }    
  // public function deleteLmiaSubstageJob_post(){
  //     $data = json_decode(file_get_contents("php://input"));
  //     $id = $data->id;
  //     if($this->employer_model->delete_lmia_substage_job($id)){
  //       $this->response(array(
  //         "status" => 1,
  //         "message" => "successfully deleted"
  //       ), REST_Controller::HTTP_OK);
  //     }else{
  //       $this->response(array(
  //         "status" => 0,
  //         "message" => "Failed to delete"
  //       ), REST_Controller::HTTP_OK);
  //     }
  // }
   public function updateEmployerSetting_put(){
        $data = json_decode(file_get_contents("php://input"));
         if (isset($data->company_id) || isset($this->company_id)){
               if(empty($data->company_id) && empty($this->company_id)){
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
               $company_id = $data->company_id ?? $this->company_id;
               $details = array();
               if(isset($data->email_permission)){
               if(!empty($data->email_permission)){

                $details['email_permission'] = json_encode($data->email_permission);
               }
               }
              //  print_r($details);
               $response = $this->employer_model->update_employer_setting($company_id, $details);
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
     public function getEmployerSetting_post(){
        $data = json_decode(file_get_contents("php://input"));
          if (isset($data->company_id) || isset($this->company_id)){
               if(empty($data->company_id) && empty($this->company_id)){
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
               $company_id = $data->company_id ?? $this->company_id;
              //  $details = array();
              //  if(isset($data->email_permission)){
              //  if($data->email_permission >= 0){
              //   $details['email_permission'] = $data->email_permission;
              //  }
              //  }
               $response = $this->employer_model->get_employer_setting($company_id);
              //  print_r($response);die;
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
 