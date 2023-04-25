<?php

Header('Access-Control-Allow-Origin: *'); //for allow any domain, insecure

Header('Access-Control-Allow-Headers: *'); //for allow any headers, insecure

Header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE');

defined('BASEPATH') OR exit('No direct script access allowed');







require APPPATH.'libraries/REST_Controller.php';







class Admin_api extends REST_Controller{







  public function __construct(){







    parent::__construct();



    //load database



    $this->load->database();



    $this->load->model(array("admin_model"));



    $this->load->library(array("form_validation"));



    $this->load->library('Authorization_Token');



    $this->load->helper("security");



    $this->load->helper('url');
    
    $headers = $this->input->request_headers(); 
		$this->decodedToken = $this->authorization_token->validateToken($headers['Authorization']);
    $this->admin_id = $this->decodedToken['data']->admin_id ?? null;
   echo $this->user_type = $this->decodedToken['data']->user_type ?? null;
      if (!$this->decodedToken || $this->decodedToken['status'] != "1") {
   
            $err = array(
                'status'=>false,
                'message'=>'Unauthorised Token',
               
            );
          
            echo json_encode($err);
            exit;
         
          }



  }

  public function addAdmin_put(){

     $data = json_decode(file_get_contents("php://input"));  

    // $admin_id= $data->admin_id;

    //  $existing_email = $data->email;



     $existing_admin = $this->admin_model->get_admin_by_email($data);



        if($existing_admin){



        $this->response(array(



        "status" => 0,



        "message" => "Admin already exists"



        ), REST_Controller::HTTP_OK);



        return;



        }

if(empty($data->admin_id)){

  // print_r(11);die;

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



          ) , REST_Controller::HTTP_NOT_FOUND);



         return;



        }



        // all values are available



        $admin = array(  



          "name" => $data->name,



          "email" => $data->email,



          "password" => md5($data->password),



          "admin_type" => $data->admin_type,



        );

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



          ), REST_Controller::HTTP_INTERNAL_SERVER_ERROR);



          return;



        }



      }else{



        // we have some empty field



        $this->response(array(



          "status" => 0,



          "message" => "All fields are needed!"



        ), REST_Controller::HTTP_NOT_FOUND);



      }

    }else{

      //  print_r(1);die;

        if(isset($data->name) && isset($data->email) && isset($data->admin_type))



        { 



        $error_flag=0; 



    if(empty($data->name) || empty($data->email) || empty($data->admin_type)){



         $error_flag = 1;



        }



         if($error_flag){



            $this->response(array(



            "status" => 0,



            "message" => "All fields are required!"



          ) , REST_Controller::HTTP_NOT_FOUND);



         return;



        }



        // all values are available



        $admin = array(



          "admin_id" => $data->admin_id,

          

          "name" => $data->name,



          "email" => $data->email,



          "admin_type" => $data->admin_type,



        



        );



        // print_r($admin); die;



        if($this->admin_model->addUpdateAdmin($admin)){







          $this->response(array(



            "status" => 1,



            "message" => "admin updated successfully"



          ), REST_Controller::HTTP_OK);



          return;



        }else{







          $this->response(array(



            "status" => 0,



            "message" => "Failed to create admin"



          ), REST_Controller::HTTP_INTERNAL_SERVER_ERROR);



          return;



        }



      }else{



        // we have some empty field



        $this->response(array(



          "status" => 0,



          "message" => "All fields are needed!"



        ), REST_Controller::HTTP_NOT_FOUND);



      }

    }



    }



  public function followUp_post(){



     $data = json_decode(file_get_contents("php://input"));



    //  print_r($data);die;



      if(isset($data->admin_id) && isset($data->job_id)  && isset($data->employee_id) && isset($data->remark))



      { 



         $error_flag = 0;



      



        if(empty($data->admin_id) || empty($data->job_id) || empty($data->employee_id) || empty($data->remark))



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



          "admin_id" => $data->admin_id,



          "job_id" => $data->job_id,



          "employee_id" => $data->employee_id,



          "remark" => $data->remark,



        );



        if(isset($data->next_date)){



          if(!empty($data->next_date)){



            $followup_detail["next_followup_date"]=$data->next_date;



          }



        }



        // print_r($followup_detail);die;



     if($this->admin_model->addFollowup($followup_detail)){







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


public function getfollowup_post(){



    $data = json_decode(file_get_contents("php://input"));



    $id = array(



      "job_id" => $data->job_id,



      "employee_id" => $data->employee_id



    );



    // print_r($id);die;



      $employee = $this->admin_model->getFollowup($id);



      if($employee){







        $this->response(array(



          "status" => 1,



          "message" => "Successfully",



          "data" => $employee



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

  if($this->admin_model->addUpdateFilterList($list)){



    // retruns true



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
      // print_r($job_id);die;
      $employee = $this->admin_model->getFilterList($list_id);
      // print_r(json_encode($employee));die;
      if($employee){

        $this->response(array(
          "status" => 1,
          "message" => " Successful ",
          "data" => $employee
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



    // retruns true



    $this->response(array(



      "status" => 1,



      "message" => "List item has been deleted"



    ), REST_Controller::HTTP_OK);



  }else{



    // return false



    $this->response(array(



      "status" => 0,



      "message" => "Failed to delete list item"



    ), REST_Controller::HTTP_OK);



  }

}
 public function getToken_post(){

      // $data = json_decode(file_get_contents("php://input"));
     
//  print_r($user_type);die;
if(!empty($this->user_type) && $this->user_type == "super-admin" || $this->user_type == "admin"){
  $id = array('admin_id' =>$this->admin_id);
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
    public function getSummaryCounts_get(){



    // $data = json_decode(file_get_contents("php://input"));



    // $id = array(



    //   "job_id" => $this->get('job_id'),



    //   "employee_id" => $this->get('employee_id'),



    // );



    // print_r($id);die;



      $counts = $this->admin_model->getSummaryCounts();



      if($counts){







        $this->response(array(



          "status" => 1,



          "message" => "Successfully",



          "data" => $counts



        ), REST_Controller::HTTP_OK);



      }else{







        $this->response(array(



          "status" => 0,



          "message" => "No data found",



        ), REST_Controller::HTTP_OK);



      }



  }
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


}

   