<?php
require APPPATH.'libraries/REST_Controller.php'; // Include the REST_Controller library

class My_REST_Controller extends REST_Controller {
    public function __construct() {
        parent::__construct();
        // Load necessary libraries and models here
        $this->load->library('Authorization_Token');
    }
     public function validateToken(){
            // Get the Bearer token from the request headers
            $token = $this->input->get_request_header('Authorization');
            // $token = str_replace('Bearer ', '', $token);
            // Validate the token
            $token_data = $this->authorization_token->validateToken();
            // print_r($token_data);die;
            if ($token_data && $token_data['status'] == 1){
                // Token is valid, you can access the token data
                $this->admin_id = $token_data['data']->admin_id ?? null;
                $this->employee_id = $token_data['data']->employee_id ?? null;
                $this->company_id = $token_data['data']->company_id ?? null;
                $this->id = $token_data['data']->admin_id ?? $token_data['data']->employee_id ?? $token_data['data']->company_id ?? null;
                $this->user_type = $token_data['data']->user_type ?? null;
                return $this->current_user = $token_data;

            }else{
                // Token is invalid, return an error response
               $err = array(
                'status'=> $token_data['status'],
                'message'=>$token_data['message'],
                // 'data'=> $token_data
                );
                echo json_encode($err);
                exit;
            }
    }

     protected function _log_request($para = false) {
        $log_data = array(
            'user_id' => $this->decodedToken['data']->admin_id ?? $this->decodedToken['data']->employee_id ?? $this->decodedToken['data']->company_id,
            'user_type' => $this->decodedToken['data']->user_type,
            // 'timestamp' => date('Y-m-d H:i:s'),
            // 'http_method' => $this->input->method(),
            'request_api' => $this->uri->uri_string(),
            // 'response_status' => http_response_code(),
            // 'msg' => $status.' '.$this->uri->uri_string().' by '.$this->decodedToken['data']->user_type.' at '.date('Y-m-d H:i:s'),
            'ip_address' => $this->input->ip_address(),
            'status'=> $para['status'] ?? NULL,
            'action_id' => $para['action_id'] ?? NULL,
            'action_type' => $para['action_type'] ?? NULL,

        );
       
        // print_r($log_data);die;
        $this->db->insert('activity_log', $log_data);
    }
}
