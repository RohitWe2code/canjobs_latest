<?php
Header('Access-Control-Allow-Origin: *'); //for allow any domain, insecure
Header('Access-Control-Allow-Headers: *'); //for allow any headers, insecure
Header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE'); //
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH.'libraries/REST_Controller.php';

class Employee_api extends REST_Controller{

  public function __construct(){

    parent::__construct();
    //load database
    $this->load->database();
    $this->load->model(array("employee_model"));
    $this->load->library("form_validation");
    $this->load->library('Authorization_Token');
    $this->load->helper("security");
    $this->load->helper('url');
    $this->load->library('email');
 
    $headers = getallheaders(); 
		$this->decodedToken = $this->authorization_token->validateToken($headers['Authorization']);
    // $this->decodedToken = $this->authorization_token->validateToken($headers['Authorization']);
    $this->admin_id = $this->decodedToken['data']->admin_id ?? null;
    $this->employee_id = $this->decodedToken['data']->employee_id ?? null;
    $this->company_id = $this->decodedToken['data']->company_id ?? null;
    $this->user_type = $this->decodedToken['data']->user_type ?? null;
       if (!$this->decodedToken || $this->decodedToken['status'] != "1") {
   
            $err = array(
                'status'=>false,
                'message'=>'Unauthorised Token',
                'data'=>[]
            );
            // print_r($err);
            echo json_encode($err);
            exit;
          //    return $this->response($err,401);
          //  die;
          }
        }
  
  public function employeePersonal_detail_put(){
      $data = json_decode(file_get_contents("php://input"));
      // print_r($data);

      ////// Update employee personal detail ///////////
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
       if(isset($data->posted)){
          if(!empty($data->posted)){
            $employee_info['posted'] = $data->posted;
          }
        }
       if(isset($data->posted_company_id)){
          if(!empty($data->posted_company_id)){
            $employee_info['posted_company_id'] = $data->posted_company_id;
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
        }else{

          $this->response(array(
            "status" => 0,
            "messsage" => "Failed to update Employee data"
          ), REST_Controller::HTTP_OK);
        }
    }else{
      ////////  Insert employee personal detail /////////////
      if(isset($data->name) && isset($data->email) && isset($data->contact_no) && isset($data->description) && isset($data->date_of_birth)  && isset($data->gender) && isset($data->marital_status) && isset($data->nationality) && isset($data->current_location) && isset($data->currently_located_country) && isset($data->language) && isset($data->religion) && isset($data->interested_in) && isset($data->experience)  && isset($data->work_permit_canada) && isset($data->work_permit_other_country))
      { 
         $error_flag = 0;
      
        if(empty($data->name) || empty($data->email) || empty($data->contact_no) || empty($data->description) || empty($data->date_of_birth) || empty($data->gender) || empty($data->marital_status) || empty($data->nationality) || empty($data->current_location) || empty($data->currently_located_country) || empty($data->language) || empty($data->religion) || empty($data->interested_in) || empty($data->experience) || empty($data->work_permit_canada) || empty($data->work_permit_other_country))
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
        $employee_info = array(
          
          "name" => $data->name,
          "email" => $data->email,
          "contact_no" => $data->contact_no,
          "description" => $data->description,
          "date_of_birth" => $data->date_of_birth, //yy-mm-dd
          "gender" => $data->gender,
          "marital_status" => $data->marital_status,
          "nationality" => $data->nationality,
          "current_location" => $data->current_location,
          "currently_located_country" => $data->currently_located_country,
          "language" => $data->language,
          "religion" => $data->religion,
          "interested_in" => $data->interested_in,
          "experience" => $data->experience,
          "work_permit_canada" => $data->work_permit_canada,
          "work_permit_other_country" => $data->work_permit_other_country,
        );
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
        if($this->employee_model->updatePersonal_details($employee_info)){
           $this->response(array(
              "status" => 1,
              "message" => "Employee data inserted successfully"
            ), REST_Controller::HTTP_OK);
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
      //   print_r($employee_skill); die;
        
        if($this->employee_model->addEmployee_skill($employee_skill)){

            $this->response(array(
              "status" => 1,
              "message" => "Employee data updated successfully"
            ), REST_Controller::HTTP_OK);
        }else{

          $this->response(array(
            "status" => 0,
            "messsage" => "Failed to update Employee data"
          ), REST_Controller::HTTP_OK);
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
      if(isset($data->employee_id) && isset($data->qualification)  && isset($data->university_institute) && isset($data->course) && isset($data->specialization)  && isset($data->institute_location) && isset($data->passing_year))
      { 
             $error_flag = 0;

            if(empty($data->employee_id) || empty($data->qualification) || empty($data->university_institute) || empty   ($data->course) || empty($data->specialization) || empty($data->institute_location) || empty   ($data->passing_year) ){
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
                 "specialization" => $data->specialization, 
                 "institute_location" => $data->institute_location,
                 "passing_year" => $data->passing_year,
               );
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
      if(isset($data->employee_id) && isset($data->company)  && isset($data->designation) && isset($data->company_location) && isset($data->industry)  && isset($data->functional_area) && isset($data->work_level)  && isset($data->start_date)  && isset($data->end_date))
      { 
             $error_flag = 0;

            if(empty($data->employee_id) || empty($data->company) || empty($data->designation) || empty ($data->company_location) || empty($data->industry) || empty($data->functional_area) || empty     ($data->work_level) || empty($data->start_date) || empty($data->end_date)){
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
                 "company_location" => $data->company_location,
                 "industry" => $data->industry, 
                 "functional_area" => $data->functional_area,
                 "work_level" => $data->work_level,
                 "start_date" => $data->start_date,
                 "end_date" => $data->end_date,
               );
               $msg = "Employee data inserted successfully";
                 if(isset($data->career_id)){
                   if(!empty($data->career_id)){
                     $career_info["career_id"] = $data->career_id;
                       $msg = "Employee data updated successfully";
                }
               }
                 if(isset($data->currently_work_here)){
                   if(!empty($data->currently_work_here)){
                     $career_info["currently_work_here"] = $data->currently_work_here;
                }
               }
                  // print_r($career_info); die;

               if($this->employee_model->addUpdate_career($career_info)){

                   $this->response(array(
                     "status" => 1,
                     "message" => $msg
                   ), REST_Controller::HTTP_OK);
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
    $parameters = array("select"=>"*");
   if(isset($data->user_type) && $data->user_type == "company"){
       $parameters["select"] = "`employee_id`, `name`, `description`, `date_of_birth`, `gender`, `marital_status`, `nationality`, `current_location`, `currently_located_country`, `language`, `religion`, `interested_in`, `experience`, `work_permit_canada`, `work_permit_other_country`,`profile_photo`,`education`, `specialization`, `skill`,`created_at`,`updated_at`,`is_deleted`"; 
    }
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
              'education'=>$data->filter_education ?? null
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
      'column_name' => $data->column_name ?? 'created_at',
      'sort_order' => $data->sort_order ?? 'DESC'
    ];

    // Calculate offset for pagination
    $offset = ($page - 1) * $limit;

    $result = $this->employee_model->getAllemployeeView($parameters,$filter, $search, $limit, $offset,$sort);

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
   
    $parameters = array("select"=>"*");
   if(isset($this->user_type) && $this->user_type == "company"){
       $parameters["select"] = "`apply_id`, `job_id`, `employee_id`, `name`,  `description`, `date_of_birth`, `gender`, `marital_status`, `nationality`, `current_location`, `currently_located_country`, `language`, `religion`, `interested_in`, `experience`, `work_permit_canada`, `work_permit_other_country`, `resume`, `profile_photo`, `created_at`, `created_by_admin`, `updated_at`, `is_deleted`, `education`, `specialization`, `skill`, `id`, `lmia_status`, `expected_time_of_completion`"; 
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
              'education'=>$data->filter_education ?? null
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
}





