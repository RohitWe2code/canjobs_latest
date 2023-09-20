<?php
require APPPATH.'libraries/REST_Controller.php'; // Include the REST_Controller library

class My_REST_Controller extends REST_Controller {
    public function __construct() {
        parent::__construct();
        // Load necessary libraries and models here
    }

    // Override the methods you need
     protected function _log_request($para = false) {
                // print_r($para);die;

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
