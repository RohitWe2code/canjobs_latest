<?php

defined('BASEPATH') OR exit('No direct script access allowed');

// require APPPATH.'libraries/REST_Controller.php';
require APPPATH.'controllers/api/My_REST_Controller.php';
require APPPATH.'libraries/razorpay-php-master/Razorpay.php';
use Razorpay\Api\Api;
use Razorpay\Api\Errors\SignatureVerificationError;

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
    //       $this->admin_email = $this->decodedToken['data']->email ?? null;
    //       $this->admin_email_static = 'aashi.we2code@gmail.com';
    //       $this->admin_name_static = 'Aashi';
        }
    public function creatRazorpayOrder_post(){
            $data = json_decode(file_get_contents("php://input"));
            $price = $data->price;
            $currency = $data->currency;
            $keyId = $this->config->item('keyId');
            $keySecret = $this->config->item('keySecret');
        
            $api = new Api($keyId, $keySecret);

            //
            // We create an razorpay order using orders api
            // Docs: https://docs.razorpay.com/docs/orders
           
            $orderData = [
                // 'receipt'         => 3456,
                'amount'          => $price * 100, // 2000 rupees in paise
                'currency'        => $currency,
                // 'payment_capture' => 1 // auto capture
            ];

            $razorpayOrder = $api->order->create($orderData);
            // print_r($razorpayOrder);die;
            $order_detail = array(
              'id' => $razorpayOrder['id'],
              'entity' => $razorpayOrder['entity'],
              'amount' => $razorpayOrder['amount'],
              'amount_paid' => $razorpayOrder['amount_paid'],
              'amount_due' => $razorpayOrder['amount_due'],
              'currency' => $razorpayOrder['currency'],
            );
            //  print_r(json_encode($order));die;
             if ($razorpayOrder) {
              $this->response(array(
                "status" => 1,
                "message" => "successful",
                "data" => $order_detail
              ), REST_Controller::HTTP_OK);
              return;
          }else{
            $this->response(array(
              "status" => 0,
              "messsage" => "No data found"
            ), REST_Controller::HTTP_OK);
            return;
          }
    }
    public function addRazorPayReciept_post(){
        $data = json_decode(file_get_contents("php://input"));
        // print_r($data);die;
        if (!empty($data->razorpayPaymentId)){
            $keyId = $this->config->item('keyId');
            $keySecret = $this->config->item('keySecret');
            $api = new Api($keyId, $keySecret);
            try
            {
                $attributes = array(
                    'razorpay_order_id' => $data->razorpay0rderId,
                    'razorpay_payment_id' => $data->razorpayPaymentId,
                    'razorpay_signature' => $data->razorpaysighature
                );

                $api->utility->verifyPaymentSignature($attributes);
            }
            catch(SignatureVerificationError $e)
            {
              $this->response(array(
                            "status" => 0,
                            "message" => $e->getMessage()
                            ) , REST_Controller::HTTP_OK);
                            return;
            }
          $amount = $data->amount/100;
          $payment_detail  = array(
            'user_id' => $this->admin_id ?? $this->employee_id ?? $this->company_id ,
            'user_role' => $this->user_type,
            'order_id' => $data->razorpay0rderId,
            'payment_id' => $data->razorpayPaymentId,
            'payment_mode' => 'razorpay',
            'amount' => $amount,
            'status' => 'success',
          );
          $response = $this->payment_gateway_model->add_razor_pay_reciept($payment_detail); 
                      //  print_r($response);die;
                      if($response){
                          $this->response(array(
                            "status" => 1,
                            "message" => "payment successful payment id : $data->razorpayPaymentId"
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
                        "message" => "payment failed !"
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