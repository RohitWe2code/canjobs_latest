<?php
Header('Access-Control-Allow-Origin: *'); //for allow any domain, insecure
Header('Access-Control-Allow-Headers: *'); //for allow any headers, insecure
Header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE'); //
defined('BASEPATH') OR exit('No direct script access allowed');

// require APPPATH.'libraries/REST_Controller.php';
require APPPATH.'controllers/api/My_REST_Controller.php';

class Employee_api extends My_REST_Controller{

  public function __construct(){

    parent::__construct();
    $this->load->database();
    $this->load->model(array("employee_model","common_model"));
    $this->load->library(array("form_validation","Authorization_Token","email"));
    $this->load->helper(array("security","url"));
 
    $headers = getallheaders(); 
    if(isset($headers['Authorization']) && !empty($headers['Authorization'])){
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
        }else{
           $err = array(
                'status'=>false,
                'message'=>'No Token Found',
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
  
public function employeePersonal_detail_put(){
      $data = json_decode(file_get_contents("php://input"));
      // print_r($data);
/* 
|| -------- Update employee personal detail ----------
*/
if(isset($data->employee_id)){
  $employee_info = array();
   if(!empty($data->employee_id)){
      $employee_info['employee_id'] = $data->employee_id;
          }
       if(isset($data->name)){
          if(!empty($data->name)){
            $employee_info['name'] = $data->name;
          }
        }
       if(isset($data->contact_no)){
          if(!empty($data->contact_no)){
            $employee_info['contact_no'] = $data->contact_no;
          }
        }
       if(isset($data->description)){
          if(!empty($data->description)){
            $employee_info['description'] = $data->description;
          }
        }
       if(isset($data->date_of_birth)){
          if(!empty($data->date_of_birth)){
            $employee_info['date_of_birth'] = $data->date_of_birth;
          }
        }
       if(isset($data->gender)){
          if(!empty($data->gender)){
            $employee_info['gender'] = $data->gender;
          }
        }
       if(isset($data->marital_status)){
          if(!empty($data->marital_status)){
            $employee_info['marital_status'] = $data->marital_status;
          }
        }
       if(isset($data->nationality)){
          if(!empty($data->nationality)){
            $employee_info['nationality'] = $data->nationality;
          }
        }
       if(isset($data->current_location)){
          if(!empty($data->current_location)){
            $employee_info['current_location'] = $data->current_location;
          }
        }
       if(isset($data->currently_located_country)){
          if(!empty($data->currently_located_country)){
            $employee_info['currently_located_country'] = $data->currently_located_country;
          }
        }
       if(isset($data->language)){
          if(!empty($data->language)){
            $employee_info['language'] = $data->language;
          }
        }
       if(isset($data->religion)){
          if(!empty($data->religion)){
            $employee_info['religion'] = $data->religion;
          }
        }
       if(isset($data->interested_in)){
          if(!empty($data->interested_in)){
            $employee_info['interested_in'] = $data->interested_in;
          }
        }
       if(isset($data->experience)){
          if(!empty($data->experience)){
            $employee_info['experience'] = $data->experience;
          }
        }
       if(isset($data->work_permit_canada)){
          if(!empty($data->work_permit_canada)){
            $employee_info['work_permit_canada'] = $data->work_permit_canada;
          }
        }
       if(isset($data->work_permit_other_country)){
          if(!empty($data->work_permit_other_country)){
            $employee_info['work_permit_other_country'] = $data->work_permit_other_country;
          }
        }
       if(isset($data->status)){
          if(!empty($data->status)){
            $employee_info['status'] = $data->status;
          }
        }
       if(isset($data->lmia_status)){
          if(!empty($data->lmia_status)){
            $employee_info['lmia_status'] = $data->lmia_status;
          }
        }
       if(isset($data->expected_time_of_completion)){
          if(!empty($data->expected_time_of_completion)){
            $employee_info['expected_time_of_completion'] = $data->expected_time_of_completion;
          }
        }
       if(isset($data->is_featured)){
          if($data->is_featured >= 0){
            $employee_info['is_featured'] = $data->is_featured;
          }
        }
       if(isset($data->job_status)){
          if(!empty($data->job_status)){
            $employee_info['job_status'] = $data->job_status;
          }
        }
       if(isset($data->posted_job_id)){
          if(!empty($data->posted_job_id)){
            $employee_info['posted_job_id'] = $data->posted_job_id;
          }
        }
       if(isset($data->date_of_posting)){
          if(!empty($data->date_of_posting)){
            $employee_info['date_of_posting'] = $data->date_of_posting;
          }
        }
       if(isset($data->designation)){
          if(!empty($data->designation)){
            $employee_info['designation'] = $data->designation;
          }
        }
       if(isset($data->reffer_by)){
          if(!empty($data->reffer_by)){
            $employee_info['reffer_by'] = $data->reffer_by;
          }
        }
        //  echo("resume : $data->resume");
        if(isset($data->resume)){
          if(!empty($data->resume)){
            $resumeBase64Encoded = $data->resume;
            if (preg_match('/^data:application\/(\w+);base64,/', $resumeBase64Encoded, $ext_type)) {
              $resumeBase64Encoded = substr($resumeBase64Encoded, strpos($resumeBase64Encoded, ',') + 1);
            $file_extension = strtolower($ext_type[1]);
                   $cv_data = base64_decode($resumeBase64Encoded);
                   $file_name_for_upload = time().'.'.$file_extension;
                   $file_path = FCPATH . 'uploads/' . $file_name_for_upload;
                   if(file_put_contents($file_path, $cv_data)) {
                       $cv = base_url() . 'uploads/' . $file_name_for_upload;
                   }
             $employee_info["resume"] = $cv;
                  }else{
                     unset($employee_info["resume"]);
                  }
          }
        }
        // print_r($employee_info);die;
         if(isset($data->profile_photo)){
          if(!empty($data->profile_photo)){
                     $image_data = $data->profile_photo;

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
                       $employee_info["profile_photo"] = $logo;
                    } else {
                        // Unsupported file type
                       unset($employee_info["profile_photo"]);
                    }
                } else {
                    // Invalid base64-encoded image data
                 unset($employee_info["profile_photo"]);
                }

          }
        }
        // print_r($employee_info); die;
           
        if($this->employee_model->updatePersonal_details($employee_info)){
            $this->response(array(
              "status" => 1,
              "message" => "Employee data updated successfully"
            ), REST_Controller::HTTP_OK);
            // activity log
            $para['status'] = 1; // "Employee updated"
            $para['action_id'] = $data->employee_id;
            $para['action_type'] = 'employee';
              
            $this->_log_request($para);
        }else{

          $this->response(array(
            "status" => 0,
            "messsage" => "Failed to update Employee data"
          ), REST_Controller::HTTP_OK);
        }
    }else{
      /*
      || ----------  Insert employee personal detail -----------
      */
      if(isset($data->name) && isset($data->email) && isset($data->contact_no) && isset($data->date_of_birth)  && isset($data->gender) && isset($data->marital_status) && isset($data->nationality) && isset($data->current_location) && isset($data->language) && isset($data->interested_in) && isset($data->experience)  && isset($data->work_permit_canada) && isset($data->reffer_by) && isset($data->permission))
      { 
         $error_flag = 0;
      
        if(empty($data->name) || empty($data->email) || empty($data->contact_no) || empty($data->date_of_birth) || empty($data->gender) || empty($data->marital_status) || empty($data->nationality) || empty($data->current_location) || empty($data->language) || empty($data->interested_in) || empty($data->experience) || empty($data->work_permit_canada) || empty($data->reffer_by) || empty($data->permission))
        {
            $error_flag = 1;
        }
         if($error_flag){
            $this->response(array(
            "status" => 0,
            "message" => "Fields must not be empty !"
          ) , REST_Controller::HTTP_OK);
         return;
        }
        
        // print_r($data->permission->notification_permission);die;
        $permission = json_decode($data->permission);
        $employee_info = array(
          
          "name" => $data->name,
          "email" => $data->email,
          "contact_no" => $data->contact_no,
          "date_of_birth" => $data->date_of_birth, //yy-mm-dd
          "gender" => $data->gender,
          "marital_status" => $data->marital_status,
          "nationality" => $data->nationality,
          "current_location" => $data->current_location,
          "currently_located_country" => $data->currently_located_country,
          "language" => $data->language,
          "interested_in" => $data->interested_in,
          "experience" => $data->experience,
          "work_permit_canada" => $data->work_permit_canada,
          "reffer_by" => $data->reffer_by
        );
        if(isset($data->is_featured)){
          if(!empty($data->is_featured)){
                    $employee_info['is_featured'] = $data->is_featured;
          }
        }
        if(isset($data->description)){
          if(!empty($data->description)){
                    $employee_info['description'] = $data->description;
          }
        }
        if(isset($data->religion)){
          if(!empty($data->religion)){
                    $employee_info['religion'] = $data->religion;
          }
        }
        if(isset($data->work_permit_other_country)){
          if(!empty($data->work_permit_other_country)){
                    $employee_info['work_permit_other_country'] = $data->work_permit_other_country;
          }
        }
        if(isset($data->status)){
          if(!empty($data->status)){
                    $employee_info['status'] = $data->status;
          }
        }
        if(isset($data->resume)){
          if(!empty($data->resume)){
          
                // Decode the base64 encoded PDF data
                   $cv_data = base64_decode($data->resume);
                   // Set the file name
                   $file_name_for_upload = time().'.pdf';
                   // Set the file path
                   $file_path = FCPATH . 'uploads/' . $file_name_for_upload;
                   // Write the file to the server
                   if(file_put_contents($file_path, $cv_data)) {
                       // File was successfully uploaded
                       $cv = base_url() . 'uploads/' . $file_name_for_upload;
                   }

             $employee_info["resume"] = $cv;
          }
        }
         if(isset($data->profile_photo)){
          if(!empty($data->profile_photo)){
                    $image_data = $data->profile_photo;

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
                       $employee_info["profile_photo"] = $logo;
                    } else {
                        // Unsupported file type
                        $employee_info["profile_photo"] = null;
                    }
                } else {
                    // Invalid base64-encoded image data
                   $employee_info["profile_photo"] = null;
                }
          }
        }
          if(!empty($this->admin_id) && $this->user_type != "employee" && $this->user_type != "employer"){
                  $employee_info["created_by_admin"] = $this->admin_id;

                }
        // print_r($employee_info); die;
        if($this->employee_model->updatePersonal_details($employee_info, $permission)){
           $this->response(array(
              "status" => 1,
              "message" => "Employee data inserted successfully"
            ), REST_Controller::HTTP_OK);
            // activity log
            $para['status'] = 2; // "Employee inserted"
            $para['action_id'] = $this->db->insert_id() ?? NULL;
            $para['action_type'] = 'employee';
              
            $this->_log_request($para);
        }else{

          $this->response(array(
            "status" => 0,
            "messsage" => "Failed to insert Employee data"
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
   // POST: Employee Skills
  public function employeeSkill_post(){
      $data = json_decode(file_get_contents("php://input"));
      // print_r($data); die;
      if(isset($data->employee_id) && isset($data->skill))
      {      
        if(empty($data->employee_id) || empty($data->skill))
        {
            $this->response(array(
            "status" => 0,
            "message" => "Fields must not be empty !"
          ) , REST_Controller::HTTP_OK);
         return;
        }
        $employee_skill = array(
          "employee_id" => $data->employee_id,
          "skill" => $data->skill,
        );
        $response = $this->employee_model->addEmployee_skill($employee_skill);
          // var_dump($response); die;
        if($response){
            if($response === 1){
              $this->response(array(
              "status" => 0,
              "message" => "already exist !"
            ), REST_Controller::HTTP_OK);
            return;
            }
            $this->response(array(
              "status" => 1,
              "message" => "Employee data updated successfully"
            ), REST_Controller::HTTP_OK);
             // activity log
            $para['status'] = 3; // "Employee skill inserted"
            $para['action_id'] = $data->employee_id ?? NULL;
            $para['action_type'] = 'employee';
              
            $this->_log_request($para);
            return;
        }else{

          $this->response(array(
            "status" => 0,
            "messsage" => "Failed to update Employee data"
          ), REST_Controller::HTTP_OK);
          return;
        }
      
      }else{

        $this->response(array(
          "status" => 0,
          "message" => "All fields are needed"
        ), REST_Controller::HTTP_OK);
      }
   }

  public function employeeEducation_detail_put(){
      $data = json_decode(file_get_contents("php://input"));
      // print_r($data);
      if(isset($data->employee_id) && isset($data->qualification)  && isset($data->university_institute) && isset($data->course) && isset($data->passing_year))
      { 
             $error_flag = 0;

            if(empty($data->employee_id) || empty($data->qualification) || empty($data->university_institute) || empty   ($data->course) || empty   ($data->passing_year) ){
                $error_flag = 1;
            }
               if($error_flag){
                   $this->response(array(
                   "status" => 0,
                   "message" => "Fields must not be empty!"
                 ) , REST_Controller::HTTP_OK);
               return;
               }
               else{
               $education_info = array(
                 "employee_id" => $data->employee_id,
                 "qualification" => $data->qualification,
                 "university_institute" => $data->university_institute,
                 "course" => $data->course,
                 "passing_year" => $data->passing_year,
               );
               if(isset($data->specialization)){
                 if(!empty($data->specialization)){
                   $education_info["specialization"] = $data->specialization;
                  }
                }
                if(isset($data->institute_location)){
                  if(!empty($data->institute_location)){
                    $education_info["institute_location"] = $data->institute_location;
                  }
                }
                $msg = "Employee data inserted successfully";
               if(isset($data->education_id)){
                if(!empty($data->education_id)){
                  $education_info["education_id"] = $data->education_id;
                   $msg = "Employee data updated successfully";
                }
               }
                  // print_r($education_info); die;
               if($this->employee_model->addUpdate_education($education_info)){
               
                   $this->response(array(
                     "status" => 1,
                     "message" => $msg
                   ), REST_Controller::HTTP_OK);
                    // activity log
                    $insert_id = $this->db->insert_id();
                    if($insert_id){
                    $para['status'] = 4; // "Employee education details inserted"
                    $para['action_id'] = $data->employee_id ?? NULL;
                    $para['action_type'] = 'employee';
                    }else{
                        $para['status'] = 5; // "Employee education details updated"
                        $para['action_id'] = $data->employee_id ?? NULL;
                        $para['action_type'] = 'employee';
                    }
                    $this->_log_request($para);
               }else{
               
                 $this->response(array(
                   "status" => 0,
                   "messsage" => "Failed to update Employee data"
                 ), REST_Controller::HTTP_OK);
               }
         }  
      }else{

        $this->response(array(
          "status" => 0,
          "message" => "All fields are required"
        ), REST_Controller::HTTP_OK);
      }
  }
  public function employeeCareer_detail_put(){
      $data = json_decode(file_get_contents("php://input"));
      // print_r($data);
      if(isset($data->employee_id) && isset($data->company)  && isset($data->designation) && isset($data->start_date))
      { 
             $error_flag = 0;

            if(empty($data->employee_id) || empty($data->company) || empty($data->designation) || empty($data->start_date)){
                $error_flag = 1;
            }
               if($error_flag){
                   $this->response(array(
                   "status" => 0,
                   "message" => "Fields must not be empty !"
                 ) , REST_Controller::HTTP_OK);
               return;
               }
               else{
               $career_info = array(
                 "employee_id" => $data->employee_id,
                 "company" => $data->company,
                 "designation" => $data->designation,
                 "start_date" => $data->start_date,
                //  "end_date" => $data->end_date,
               );
               if(isset($data->company_location)){
                 if(!empty($data->company_location)){
                   $career_info["company_location"] = $data->company_location;
              }
             }
               if(isset($data->industry)){
                 if(!empty($data->industry)){
                   $career_info["industry"] = $data->industry;
              }
             }
               if(isset($data->functional_area)){
                 if(!empty($data->functional_area)){
                   $career_info["functional_area"] = $data->functional_area;
              }
             }
               if(isset($data->work_level)){
                 if(!empty($data->work_level)){
                   $career_info["work_level"] = $data->work_level;
              }
             }
               if(isset($data->currently_work_here)){
                 if($data->currently_work_here >= 0){
                   $career_info["currently_work_here"] = $data->currently_work_here;
              }
             }
               if(isset($data->end_date)){
                 if(!empty($data->end_date)){
                   $career_info["end_date"] = $data->end_date;
              }
             }
               $msg = "Employee data inserted successfully";
                 if(isset($data->career_id)){
                   if(!empty($data->career_id)){
                     $career_info["career_id"] = $data->career_id;
                       $msg = "Employee data updated successfully";
                }
               }
                  // print_r($career_info); die;

               if($this->employee_model->addUpdate_career($career_info)){

                   $this->response(array(
                     "status" => 1,
                     "message" => $msg
                   ), REST_Controller::HTTP_OK);
                   // activity log
                    $insert_id = $this->db->insert_id();
                    if($insert_id){
                    $para['status'] = 6; // "Employee career details inserted"
                    $para['action_id'] = $data->employee_id ?? NULL;
                    $para['action_type'] = 'employee';
                    }else{
                        $para['status'] = 7; // "Employee career details updated"
                        $para['action_id'] = $data->employee_id ?? NULL;
                        $para['action_type'] = 'employee';
                    }
                    $this->_log_request($para);
               }else{

                 $this->response(array(
                   "status" => 0,
                   "messsage" => "Error"
                 ), REST_Controller::HTTP_OK);
               }
            }
      }else {

        $this->response(array(
          "status" => 0,
          "message" => "All fields are needed"
        ), REST_Controller::HTTP_OK);
      }
  }
  // POST: Get employee details
  public function employeeDetail_post(){
  $data = json_decode(file_get_contents("php://input"));
   $employee_id = $data->employee_id;
      $personal_detail = $this->employee_model->get_employee($employee_id);
      $career_detail = $this->employee_model->get_employeeCareer($employee_id);
      $education_detail = $this->employee_model->get_employeeEducation($employee_id);
      $employee_skills = $this->employee_model->getEmployeeSkill($employee_id);
      $employee_detail = array_merge($personal_detail, $career_detail,$education_detail,$employee_skills);
      if($employee_detail){

        $this->response(array(
          "status" => 1,
          "message" => "Employees found",
          "data" => $employee_detail
        ), REST_Controller::HTTP_OK);
      }else{

        $this->response(array(
          "status" => 0,
          "message" => "No Employee found",
         
        ), REST_Controller::HTTP_OK);
      }
  }
  // GET: Employee career details
  public function employeeCareer_get(){
      $employee_id = $this->get('employee_id');
     
      $employee = $this->employee_model->get_employeeCareer($employee_id);

      //print_r($query->result());

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
        ), REST_Controller::HTTP_OK);
      }
  }
  // GET: Employee Education details
  public function employeeEducation_get(){
      $employee_id = $this->get('employee_id');
      $employee = $this->employee_model->get_employeeEducation($employee_id);
    //   print_r($employee);die;
      if($employee){

        $this->response(array(
          "status" => 1,
          "message" => "Employees found",
          "data" => $employee
        ), REST_Controller::HTTP_OK);
      }else{

        $this->response(array(
          "status" => 0,
          "message" => "No Employee found",
         
        ), REST_Controller::HTTP_OK);
      }
  }
   // GET: Employee Skills
   public function employeeSkill_get(){
    $employee_id = $this->get('employee_id');
    // print_r($employee_id);die;
    $employee = $this->employee_model->getEmployeeSkill($employee_id);

    // print_r($employee); die;

    if(count($employee)>0){

      $this->response(array(
        "status" => 1,
        "message" => "employee's skill found",
        "data" => $employee
      ), REST_Controller::HTTP_OK);
    }else{

      $this->response(array(
        "status" => 0,
        "message" => "No skill found",
        "data" => $employee
      ), REST_Controller::HTTP_OK);
    }
}
   public function allEmployeeDetail_get(){
    
      $employee = $this->employee_model->get_allEmployee();

      //print_r($query->result());

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

  public function allEmployeeCareer_get(){   
      $employee = $this->employee_model->getAllEmployeeCareer();
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
    public function allEmployeeEducation_get(){
      $employee_id = $this->get('employee_id');
      $employee = $this->employee_model->getAllEmployeeEducation();

      //print_r($query->result());

      if($employee){

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
  public function allEmployeeSkill_get(){
      $employee = $this->employee_model->getAllemployeeSkill();
      // print_r($employee);die;
      if($employee){

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
  public function allEmployeeView_post(){
    $data = json_decode(file_get_contents("php://input"));
    $parameters = array("select"=> "*,
                                    (SELECT u_id FROM agent WHERE id = reffer_by) AS agent_u_id,
	                                  (SELECT name FROM agent WHERE id = reffer_by) AS agent_name");
   if(isset($this->company_id)){
    if($this->user_type == "company"){
      $parameters["company_id"] = $this->company_id;
      $parameters["select"] = "`employee_id`, `name`, `description`, `date_of_birth`, `gender`, `marital_status`, `nationality`, `current_location`, `currently_located_country`, `language`, `religion`, `interested_in`, `experience`, `work_permit_canada`, `work_permit_other_country`,`status`, `is_featured`, `profile_photo`,`education`, `specialization`, `skill`,`created_at`,`updated_at`,`is_deleted`"; 
    }
  }
  // print_r($parameters);die;
    if(isset($data->job_id)){
      $parameters["job_id"]=$data->job_id;
    }
    // if(isset($data->user_id)){
    //   $parameters["user_id"]=$data->user_id;
    // }
    if(!empty($this->admin_id) && $this->user_type != "super-admin" && $this->user_type != "admin"){
      $parameters["admin_id"] =  $this->admin_id;
      $parameters["admin_type"] =  $this->user_type;
    }  
     
    // Get pagination parameters
    $page = $data->page ?? 1;
    $limit = $data->limit ?? 10; 

    // Get search parameter
    $search = isset($data->search) ? $data->search : '';

    // Get filter parameters
    $filter = ['experience'=>$data->filter_experience ?? null,
               'skill'=>$data->filter_skill ?? null,
              'education'=>$data->filter_education ?? null,
              'interested_in'=>$data->interested_in ?? null,
              'work_permit_canada'=>$data->work_permit_canada ?? null,
              'status' => $data->filter_status ?? null,
              'reffer_by' => $data->agent_id ?? null
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

    // sorting 
    $sort = [
      // 'column_name' => $data->column_name ?? 'created_at',
      // 'sort_order' => $data->sort_order ?? 'DESC'
      'column_name' => (isset($data->column_name) && $data->column_name !== null && $data->column_name !== "") ? $data->column_name : "updated_at" ,
      'sort_order' => (isset($data->sort_order) && $data->sort_order !== null && $data->sort_order !== "") ? $data->sort_order : "DESC"
    ];

    // Calculate offset for pagination
    $offset = ($page - 1) * $limit;

    //Recommended
    $recommended = [];
    if(isset($data->job_keyskills)){
    $recommended = array("job_skills"=>$data->job_keyskills);
    }

    $result = $this->employee_model->getAllemployeeView($parameters,$filter, $search, $limit, $offset, $sort, $recommended);
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
          "message" => "No Employee found",
         
        ), REST_Controller::HTTP_OK);
      }
  }
  
  public function employee_delete($employee_id){
      if($this->employee_model->deleteEmployee($employee_id)){
        $this->response(array(
          "status" => 1,
          "message" => "Employee has been deleted"
        ), REST_Controller::HTTP_OK);
      }else{
        $this->response(array(
          "status" => 0,
          "message" => "Failed to delete employee"
        ), REST_Controller::HTTP_OK);
      }
  }
  
  public function deleteEmployeeCareer_post(){
    $data = json_decode(file_get_contents("php://input"));
      if($this->employee_model->deleteCareer($data->career_id)){
        $this->response(array(
          "status" => 1,
          "message" => "career details has been deleted"
        ), REST_Controller::HTTP_OK);
      }else{
        $this->response(array(
          "status" => 0,
          "message" => "Failed to delete career details"
        ), REST_Controller::HTTP_OK);
      }
  }
  public function deleteEmployeeEducation_post(){
    $data = json_decode(file_get_contents("php://input"));
      if($this->employee_model->deleteEducation($data->education_id)){
        $this->response(array(
          "status" => 1,
          "message" => "Education details has been deleted"
        ), REST_Controller::HTTP_OK);
      }else{
        $this->response(array(
          "status" => 0,
          "message" => "Failed to delete Education details"
        ), REST_Controller::HTTP_OK);
      }
  }
  public function deleteEmployeeSkill_post(){
    $data = json_decode(file_get_contents("php://input"));
      if($this->employee_model->deleteSkill($data->skill_id)){
        $this->response(array(
          "status" => 1,
          "message" => "skill has been deleted"
        ), REST_Controller::HTTP_OK);
      }else{
        $this->response(array(
          "status" => 0,
          "message" => "Failed to delete skill"
        ), REST_Controller::HTTP_OK);
      }
  }
  public function countryList_get(){
      $countries = $this->employee_model->getcountryList();
      if($countries){

        $this->response(array(
          "status" => 1,
          "message" => "Countries found",
          "data" => $countries
        ), REST_Controller::HTTP_OK);
      }else{

        $this->response(array(
          "status" => 0,
          "message" => "No data found",
         
        ), REST_Controller::HTTP_OK);
      }
  }
   public function getStateList_post(){
    $data = json_decode(file_get_contents("php://input"));
    $country_id = $data->country_id;
    $statelist = $this->employee_model->getStateList($country_id);
      if($statelist){
        $this->response(array(
          "status" => 1,
          "message" => "State found",
          "data" => $statelist
        ), REST_Controller::HTTP_OK);
      }else{
        $this->response(array(
          "status" => 0,
          "message" => "No data found"
        ), REST_Controller::HTTP_OK);
      }
  }
   public function getCityList_post(){
    $data = json_decode(file_get_contents("php://input"));
    $state_id = $data->state_id;
    $citylist = $this->employee_model->getCityList($state_id);
      if($citylist){
        $this->response(array(
          "status" => 1,
          "message" => "City found",
          "data" => $citylist
        ), REST_Controller::HTTP_OK);
      }else{
        $this->response(array(
          "status" => 0,
          "message" => "No data found"
        ), REST_Controller::HTTP_OK);
      }
  }
  public function getJobResponse_post(){
    $data = json_decode(file_get_contents("php://input"));
   
    $parameters = array("select"=>"ae.*, ev.id AS visa_id, ev.status AS visa_status, ev.is_active as visa_active");
   if(isset($this->user_type) && $this->user_type == "company"){
       $parameters["select"] = "`ae.apply_id`,
                                `ae.job_id`,
                                `ae.job_title`,
                                `ae.company_name`,
                                `ae.employee_id`,
                                `ae.name`,
                                `ae.description`,
                                `ae.date_of_birth`,
                                `ae.gender`,
                                `ae.marital_status`,
                                `ae.nationality`,
                                `ae.current_location`,
                                `ae.currently_located_country`,
                                `ae.language`, `religion`,
                                `ae.interested_in`,
                                `ae.experience`,
                                `ae.work_permit_canada`,
                                `ae.work_permit_other_country`,
                                `ae.resume`,
                                `ae.profile_photo`,
                                `ae.created_at`,
                                `ae.created_by_admin`,
                                `ae.updated_at`,
                                `ae.is_deleted`,
                                `ae.education`,
                                `ae.specialization`,
                                `ae.skill`,
                                `ae.id`,
                                `ae.lmia_status`,
                                `ae.expected_time_of_completion`"; 
    }
    if(!empty($this->admin_id) && $this->user_type != "super-admin" && $this->user_type != "admin"){
      $parameters["admin_id"] =  $this->admin_id;
      $parameters["admin_type"] = $this->user_type;
    }
    if(isset($data->job_id)){
      $parameters["job_id"]=$data->job_id;
    }
     
    // Get pagination parameters
    $page = $data->page ?? 1;
    $limit = $data->limit ?? 10; 

    // Get search parameter
    $search = $data->search ?? '';

    // Get filter parameters
    $filter = array('experience'=>$data->filter_experience ?? null,
                    'skill'=>$data->filter_skill ?? null,
                    'education'=>$data->filter_education ?? null,
                    'lmia_status'=>$data->filter_lmia_status ?? null,
                    'employee_status'=>$data->filter_employee_status ?? null,
                    'employee_id'=>$data->filter_employee_id ?? null,
                    'is_reserve'=>$data->filter_is_reserve ?? 0,
                    'job_status'=>$data->filter_job_status ?? null
    );
   if(isset($data->filter_by_time)){
     if($data->filter_by_time == "today"){
            $filter['start_date'] = date('Y-m-d');
            $filter['end_date'] = date('Y-m-d', strtotime('tomorrow'));

      }
    if($data->filter_by_time == "this_week"){
          $filter['start_date'] = date('Y-m-d', strtotime('this week'));
          $filter['end_date'] = date('Y-m-d', strtotime('this week +7days'));

      }
    if($data->filter_by_time == "current_month"){
          $filter['start_date'] = date('Y-m-01', strtotime('this month'));
          $filter['end_date'] =date('Y-m-t', strtotime('this month'));
          
        }
        
    if($data->filter_by_time == "last_month"){
          $filter['start_date'] = date('Y-m-01', strtotime('last month'));
          $filter['end_date'] =date('Y-m-t', strtotime('last month'));
          
        }
    if($data->filter_by_time == "last_week"){
          $filter['start_date'] = date('Y-m-d', strtotime('last week'));
          $filter['end_date'] = date('Y-m-d', strtotime('last week +7days'));
    }
    }  

    // sorting 
    $sort = [
      'column_name' => $data->column_name ?? "created_at",
      'sort_order' => $data->sort_order ?? "DESC"
    ];

    // Calculate offset for pagination
    $offset = ($page - 1) * $limit;
    // print_r($filter);die;
    $result = $this->employee_model->getJobResponse($parameters,$filter, $search, $limit, $offset,$sort);

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
          "message" => "No Employee found",
         
        ), REST_Controller::HTTP_OK);
      }
  }
  public function getProfileCompletePercent_get(){



      $percent = $this->employee_model->getProfileCompletePercent();



      if($percent){







        $this->response(array(



          "status" => 1,



          "message" => "Successfully",



          "data" => $percent



        ), REST_Controller::HTTP_OK);



      }else{







        $this->response(array(



          "status" => 0,



          "message" => "No data found",



        ), REST_Controller::HTTP_OK);
      }
  }
   public function getJobsByEmployee_post(){
    $data = json_decode(file_get_contents("php://input"));
   $info["employee_id"] = $data->employee_id;
    // if(!empty($this->admin_id) && $this->user_type != "super-admin" && $this->user_type != "admin"){
    //   $info["admin_id"] =  $this->admin_id;
    //   $info["admin_type"] = $this->user_type;
    // }
    // if(!empty($this->employee_id) && $this->user_type == "employee"){
    //   $info["employee_id"] = $this->employee_id;
    // }  
     
    // // Get pagination parameters
    // $page = $data->page ?? 1;
    // $limit = $data->limit ?? 10; 

    // Get search parameter
    // $search = $data->search ?? '';

    // Get filter parameters
    // $filter = array('experience'=>$data->filter_experience ?? null,
    //            'skill'=>$data->filter_skill ?? null,
    //           'education'=>$data->filter_education ?? null
    // );
  //  if(isset($data->filter_by_time)){
  //    if($data->filter_by_time == "today"){
  //           $filter['start_date'] = date('Y-m-d');
  //           $filter['end_date'] = date('Y-m-d', strtotime('tomorrow'));

  //     }
  //   if($data->filter_by_time == "this_week"){
  //         $filter['start_date'] = date('Y-m-d', strtotime('this week'));
  //         $filter['end_date'] = date('Y-m-d', strtotime('this week +7days'));

  //     }
  //   if($data->filter_by_time == "current_month"){
  //         $filter['start_date'] = date('Y-m-01', strtotime('this month'));
  //         $filter['end_date'] =date('Y-m-t', strtotime('this month'));
          
  //       }
        
  //   if($data->filter_by_time == "last_month"){
  //         $filter['start_date'] = date('Y-m-01', strtotime('last month'));
  //         $filter['end_date'] =date('Y-m-t', strtotime('last month'));
          
  //       }
  //   if($data->filter_by_time == "last_week"){
  //         $filter['start_date'] = date('Y-m-d', strtotime('last week'));
  //         $filter['end_date'] = date('Y-m-d', strtotime('last week +7days'));
  //   }
  //   }  

    // sorting 
    // $sort = [
    //   'column_name' => $data->column_name ?? "created_at",
    //   'sort_order' => $data->sort_order ?? "DESC"
    // ];

    // Calculate offset for pagination
    // $offset = ($page - 1) * $limit;

    // $result = $this->employee_model->getJobResponse($parameters,$filter, $search, $limit, $offset,$sort);
    $result = $this->employee_model->getJobsByEmployee($info);

    if($result) {
              $this->response(array(
                "status" => 1,
                "message" => "successful",
                "data" => $result
              ), REST_Controller::HTTP_OK);

      }else{

        $this->response(array(
          "status" => 0,
          "message" => "No jobs found",
         
        ), REST_Controller::HTTP_OK);
      }
  }
  public function changePassword_put(){
        
        // print_r($this->uri->segment(2));die;
        $data = json_decode(file_get_contents("php://input"));
         if (isset($data->password) && isset($data->new_password) && isset($data->conf_password) && isset( $this->employee_id)){
               if(empty($data->password) || empty($data->new_password) || empty($data->conf_password) || empty( $this->employee_id)){
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
                $status = $this->employee_model->checkLogin($check_password);
                if($status != false){
                // print_r($status);die;
                 $new_password = array('employee_id'=>$status->employee_id,
                                        'password'=>md5($data->new_password));
               if($this->employee_model->updatePersonal_details($new_password)){
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
    /*
    ||------------------------------------------------------------------------------------
    ||  upload documents of employee, creates seperate directory for each employee by name
    ||  and upload document files.
    ||------------------------------------------------------------------------------------
  */
    public function documentsUpload_put(){
      $data = json_decode(file_get_contents("php://input"));
    //  print_r($data);die;
      $documents = [];
      // $file_info = [];
      $id = 0;
      if((isset($data->employee_id) || isset($this->employee_id)) && isset($data->type) && isset($data->document_file)){
          if((empty($data->employee_id) && empty($this->employee_id)) || empty($data->type) || empty($data->document_file)){
                  $this->response(array(
                    "status" => 0,
                    "message" => "fields must not be empty !"
                    ) , REST_Controller::HTTP_OK);
                    return;
                  }
                //  print_r(" this is id : $data->id");die;
                    $employee_id = $data->employee_id;
                    $documents[$data->type] = $data->document_file;
                    
                    $response = $this->createDirectoryAndUploadDocs($employee_id, $documents);
                    // print_r($response);die;
                    if (is_array($response) && count($response) > 0) {
                          $file_info = $response;
                          $file_info['employee_id'] = $employee_id;
                           $msg = "inserted successfully";
                          if(isset($data->id) && !empty($data->id)){
                            // if(!empty($data->id)){
                              // echo"this is if  ----- chk ";
                              $id = $data->id;
                              $msg = "updated successfully";
                              $file_info['updated_by'] = $this->admin_id ?? $this->employee_id;
                              $file_info['updated_type'] = $this->user_type;
                            // }
                          }else{
                            // echo"this is else --------- chk";
                            $file_info['created_by'] = $this->admin_id ?? $this->employee_id;
                            $file_info['created_type'] = $this->user_type;
                          }
                          if(isset($data->is_varify)){
                            
                              $file_info['is_varify'] = $data->is_varify;

                  
                          }
                          // print_r($file_info);die;
                          if($this->employee_model->documentsUpload($id, $file_info)){
                                    $this->response(array(
                                      "status" => 1,
                                      "message" => $msg
                                      ) , REST_Controller::HTTP_OK);
                                       // activity log
                                      $insert_id = $this->db->insert_id();
                                      if($insert_id){
                                      $para['status'] = 8; // "Employee document inserted"
                                      $para['action_id'] = $data->employee_id ?? $this->employee_id;
                                      $para['action_type'] = 'employee';
                                      }else{
                                          $para['status'] = 9; // "Employee document updated"
                                          $para['action_id'] = $data->employee_id ?? $this->employee_id;
                                          $para['action_type'] = 'employee';
                                      }
                                      $this->_log_request($para);
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
    // Verify user documents
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
          if($this->employee_model->documentsUpload($id, $file_info)){
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
    ||  check if directory exist with the given employee name if not than create directory
    ||  and upload document file. 
    ||------------------------------------------------------------------------------------
  */
    public function createDirectoryAndUploadDocs($id, $documents){
      $dir_name = 'employee_'.$id;
      $documents_url = [];
      // print_r(FCPATH);die;
      // echo'</n>';
      $file_path = FCPATH.'uploads/employee_documents/'.$dir_name;        
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
                    // echo"inside preg match ---- chk <br>";
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
                    
                        $uploaded_document_url = base_url() . 'uploads/employee_documents/'.$dir_name.'/' . $file_name_for_upload;
                        $documents_url["document_url"] = $uploaded_document_url;
                        $documents_url["extension_type"] = $file_extension;
                        $documents_url["type"] = $document_name;
                    } else {
                        // Unsupported file type
                        unset($documents_url[$document_name]);
                        return 1;
                    }
                } else {
                    // echo"else ---- chk <br>";die;
                    // Invalid base64-encoded image data
                 unset($documents_url[$document_name]);
                 return 2;
                }
      }
        // echo"outside for ---- chk <br>";
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
      if(isset($data->employee_id)){
        if(!empty($data->employee_id)){
            $details['employee_id'] = $data->employee_id;
        }
      }
      if(isset($data->type)){
        if(!empty($data->type)){
            $details['type'] = $data->type;
        }
      }
      // print_r($details);die;
      $documents = $this->employee_model->get_documents_uploaded($id, $details);
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
         
    $documents = $this->employee_model->get_documents_uploaded($id);
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
    
      if($this->employee_model->delete_document_uploaded($id)){
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
   public function addUpdateVisa_put(){
    
      $data = json_decode(file_get_contents("php://input"));
      // print_r($data); die;
      $detail = array();
      $id = array();
      $msg = "created successfully";
      //  if(isset($data->employee_id) && isset($data->status)){
      //     if(!empty($data->employee_id) || !empty($data->status)){
      //     $detail["employee_id"]=$data->employee_id;
      //     $detail["status"]=$data->status;
      //   }
       if(isset($data->employee_id)){
        if(!empty($data->employee_id)){
          $detail["employee_id"]=$data->employee_id;
        }
       }
       if(isset($data->id)){
        if(!empty($data->id)){
          $id=$data->id;
          $msg = "updated successfully";
        }
       }
        if(isset($data->status)){
           if(!empty($data->status)){
           $detail["status"]=$data->status;
         }
       }
        if(isset($data->country)){
           if(!empty($data->country)){
           $detail["country"]=$data->country;
         }
       }
        if(isset($data->type)){
           if(!empty($data->type)){
           $detail["type"]=$data->type;
         }
       }     
      //  print_r($id);
      //  print_r($detail);die;
        $response = $this->employee_model->add_update_visa($id, $detail);
        // print_r($response['result']);die;
        if($response['result'] > 0){
            $this->response(array(
              "status" => 1,
              "message" => $response['msg']
            ), REST_Controller::HTTP_OK);
            // activity log
            // $para['status'] = $response['msg'];
            // $para['action_id'] = $this->dataa->employee_id;
            // $para['action_type'] = 'employee';
              
            // $this->_log_request($para);
             // activity log
              $insert_id = $this->db->insert_id();
              if($insert_id){
              $para['status'] = 10; // "Employee visa inserted"
              $para['action_id'] = $data->employee_id ?? $this->employee_id;
              $para['action_type'] = 'employee';
              }else{
                  $para['status'] = 11; // "Employee visa updated"
                  $para['action_id'] = $data->employee_id ?? $this->employee_id;
                  $para['action_type'] = 'employee';
              }
              $this->_log_request($para);
        }else{

          $this->response(array(
            "status" => 0,
            "messsage" => "Failed !"
          ), REST_Controller::HTTP_OK);
        }
      // }else{
      //    $this->response(array(
      //       "status" => 0,
      //       "messsage" => "All fields required !"
      //     ), REST_Controller::HTTP_OK);
      // }
   }
   public function getVisa_post(){
    $data = json_decode(file_get_contents("php://input"));
    // $details['job_id'] =$data->job_id ?? null;
    $details['company_id'] = $data->company_id ?? 0;
    if(!empty($this->admin_id) && $this->user_type != "super-admin" && $this->user_type != "admin"){
      $details["admin_id"] =  $this->admin_id;
      $details["admin_type"] = $this->user_type;
    }
    if(!empty($this->employee_id) && $this->user_type == "employee"){
      $details["employee_id"] = $this->employee_id;
    }  
    // if(!empty($this->company_id) && $this->user_type == "company"){
    //   $details["company_id"] = $this->company_id;
    // }  
    $page = $data->page ?? 1;
    $limit =$data->limit ?? 10; 
    
    // Get search parameter
    $search = isset($data->search) ? $data->search : '';

    // Get filter parameters
    $filter = [
    "visa_status" => $data->filter_by_visa_status ?? null,
    "visa_country" => $data->filter_by_visa_country ?? null,
    "interested_in" => $data->filter_by_interested_in ?? null,
    "employee_id" => $data->filter_by_employee_id ?? null,
    // "keyskill" => $data->filter_keyskill ?? null,
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
    // print_r($sort);die;
    $result = $this->employee_model->get_visa($filter, $search, $limit, $offset, $sort, $details);
    // print_r($result);die;
    // $this->_log_request(); // Log the API hit
    // echo"result";
    $res;
    if ($result) {
      // $res = 'successful';
      $res = array("employee_id" => $details["employee_id"] ?? null,
                    "status" => "successful");
              $this->response(array(
                "status" => 1,
                "message" => "successful",
                "total_rows" => $result['total_rows'],
                "data" => $result['data']
              ), REST_Controller::HTTP_OK);
          }else{
      $res = 'No data found';

            $this->response(array(

              "status" => 0,

              "messsage" => "No data found"

            ), REST_Controller::HTTP_OK);

          }
   }
   
   public function setEmployeeReserve_put(){
        $data = json_decode(file_get_contents("php://input"));
         if (isset($data->apply_id) && isset($data->employee_id) && isset($data->is_reserve)){
               if(empty($data->apply_id)){
                     $this->response(array(
                    "status" => 0,
                    "message" => "Fields must not be empty !"
                    ) , REST_Controller::HTTP_OK);
                    return;
               }
               $details = array('apply_id'=>$data->apply_id,
                                'employee_id'=>$data->employee_id,
                                'is_reserve'=>$data->is_reserve
                              );
               $response = $this->employee_model->set_employee_reserve($details);
              //  print_r($response);die;
               if($response){
                  $this->response(array(
                    "status" => 1,
                    "message" => $response
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
                    "message" => "all fields are required!"
                    ) , REST_Controller::HTTP_OK);
                    return;
        }
    }
    public function removeEmployeeReserve_post(){
        $data = json_decode(file_get_contents("php://input"));
         if (isset($data->employee_id) && isset($data->apply_id)){
               if(empty($data->employee_id) || empty($data->apply_id)){
                     $this->response(array(
                    "status" => 0,
                    "message" => "Fields must not be empty !"
                    ) , REST_Controller::HTTP_OK);
                    return;
               }
               $details = array('employee_id'=>$data->employee_id,
                                'apply_id'=>$data->apply_id,
                              );
               $response = $this->employee_model->remove_employee_reserve($details);
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
           } else {
              $this->response(array(
                    "status" => 0,
                    "message" => "all fields are required!"
                    ) , REST_Controller::HTTP_OK);
                    return;
        }
    }
    public function updateEmployeeSetting_put(){
        $data = json_decode(file_get_contents("php://input"));
         if (isset($data->employee_id) || isset($this->employee_id)){
               if(empty($data->employee_id) && empty($this->employee_id)){
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
               $employee_id = $data->employee_id ?? $this->employee_id;
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
               $response = $this->employee_model->update_employee_setting($employee_id, $details);
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
     public function getEmployeeSetting_post(){
        $data = json_decode(file_get_contents("php://input"));
          if (isset($data->employee_id) || isset($this->employee_id)){
               if(empty($data->employee_id) && empty($this->employee_id)){
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
               $employee_id = $data->employee_id ?? $this->employee_id;
              //  $details = array();
              //  if(isset($data->email_permission)){
              //  if($data->email_permission >= 0){
              //   $details['email_permission'] = $data->email_permission;
              //  }
              //  }
               $response = $this->employee_model->get_employee_setting($employee_id);
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





