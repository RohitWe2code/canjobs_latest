<?php

defined('BASEPATH') OR exit('No direct script access allowed');

// require APPPATH.'libraries/REST_Controller.php';
require APPPATH.'controllers/api/My_REST_Controller.php';

class Payment_gateway_controller extends My_REST_Controller{
  public function __construct(){
  parent::__construct();
  Header('Access-Control-Allow-Origin: *'); //for allow any domain, insecure
  Header('Access-Control-Allow-Headers: *'); //for allow any headers, insecure
  Header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE'); //
  if ( "OPTIONS" === $_SERVER['REQUEST_METHOD'] ) {
      die();
  }
    $this->load->database();
    $this->load->model(array("employer_model","admin_model","common_model","payment_gateway_model"));
    $this->load->library("form_validation");
    $this->load->library('Authorization_Token');
    $this->load->helper("security");
    $this->load->helper('url');

    // $headers = $this->input->request_headers(); 
		// $this->decodedToken = $this->authorization_token->validateToken($headers['Authorization']);
    // // print_r($this->decodedToken);die;   
    //    if (!$this->decodedToken || $this->decodedToken['status'] != "1") {
    //         $err = array(
    //             'status'=>false,
    //             'message'=>'Unauthorised Token',
    //             'data'=>[]
    //         );
    //         echo json_encode($err);
    //         exit;
    //       }
    //       $this->admin_id = $this->decodedToken['data']->admin_id ?? null;
    //       $this->employee_id = $this->decodedToken['data']->employee_id ?? null;
    //       $this->company_id = $this->decodedToken['data']->company_id ?? null;
    //       $this->user_type = $this->decodedToken['data']->user_type ?? null;
    //       $this->admin_email = $this->decodedToken['data']->email ?? null;
    //       $this->admin_email_static = 'aashi.we2code@gmail.com';
    //       $this->admin_name_static = 'Aashi';
        }
    public function addRazorPayReciept_post(){
      $data = json_decode(file_get_contents("php://input"));
        if(isset($data->user_id) && isset($data->user_role) && isset($data->payment_id) && isset($data->status)){
          if(empty($data->user_id) || empty($data->user_role) || empty($data->payment_id) || empty($data->status)){
            $this->response(array(
                   "status" => 0,
                   "message" => "fields must not be empty !"
                   ) , REST_Controller::HTTP_OK);
                   return;
            }
            // $id = $data->id ?? null;
            $details = array('user_id'=>$data->user_id,
                             'user_role'=>$data->user_role,
                             'payment_id'=>$data->payment_id,
                             'payment_mode'=>"razorpay",
                             'status'=>$data->status
                            );
            // if(isset($data->is_active)){             
            //       $details['is_active'] = $data->is_active;
            // }
            
            // print_r($details);die;
          $response = $this->payment_gateway_model->add_razor_pay_reciept($details); 
          // print_r($response);die;          
            if($response){
            $this->response(array(
               "status" => 1,
               "message" => $response
               ) , REST_Controller::HTTP_OK);
               // activity log
                // $insert_id = $this->db->insert_id();
                // if($insert_id){
                // $para['status'] = 28; // "job lmia substage inserted"
                // $para['action_id'] = $data->job_id ?? NULL;
                // $para['action_type'] = 'jobs';
                // }else{
                //     $para['status'] = 29; // "job lmia substage updated"
                //     $para['action_id'] = $data->job_id ?? NULL;
                //     $para['action_type'] = 'jobs';
                // }
                // if(isset($para)){
                // $this->_log_request($para);
                // }
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
    public function getPaymentReciept_post(){
      $data = json_decode(file_get_contents("php://input"));
      
      // $details = [];
      if(isset($data->user_id) && isset($data->user_role)){
        if(empty($data->user_id) || empty($data->user_role)){
          $this->response(array(
            "status" => 0,
            "message" => "fields must not be empty !",
          ), REST_Controller::HTTP_OK);
          return;
        }
        $id = array(
              'user_id' => $data->user_id,
              'user_role' => $data->user_role
              );
      }else{
        $this->response(array(
          "status" => 0,
          "message" => "please provide id !",
        ), REST_Controller::HTTP_OK);
         return;
      }
      $filter = array(
        'lmia_status' => $data->lmia_status ?? null
      );
    
      // print_r($lmia_id);die;
      $response = $this->payment_gateway_model->get_payment_reciept($id, $filter);
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
//   public function delete_post(){
//       $data = json_decode(file_get_contents("php://input"));
//       $id = $data->id;
//       if($this->employer_model->delete_lmia_substage_job($id)){
//         $this->response(array(
//           "status" => 1,
//           "message" => "successfully deleted"
//         ), REST_Controller::HTTP_OK);
//       }else{
//         $this->response(array(
//           "status" => 0,
//           "message" => "Failed to delete"
//         ), REST_Controller::HTTP_OK);
//       }
//   }
    }