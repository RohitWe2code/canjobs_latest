<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**

*

*/

class Common_model extends CI_Model

{
public function sendMail($to, $subject, $body){
      // print_r($to);
      // print_r($subject);
      // print_r($body);die;
            $this->load->library('email');
            $config = array(
            'protocol' => 'smtp',
            'smtp_host' => 'smtp.gmail.com',
            'smtp_port' => 587,
            'smtp_user' => 'rahul.verma.we2code@gmail.com',
            'smtp_pass' => 'sfbmekwihdamgxia',
            'mailtype' => 'html',
            'smtp_crypto' => 'tls',
            'charset' => 'utf-8'
            );

            $this->email->initialize($config);
            $this->email->set_newline("\r\n");
            $this->email->from('rahul.verma.we2code@gmail.com', 'CanJobs');
            $this->email->to($to);
            $this->email->subject($subject);         
            $this->email->message($body);
           return $email = $this->email->send(FALSE);
    // print_r($this->email->print_debugger());die;
    }
public function addNotification($notification){
    // print_r($notification);die;
    $this->db->insert('notification', $notification);
}
public function isReadNotification($id){
                $this->db->where('id', $id);
                $this->db->set('is_read', 1);
                $this->db->set('updated_at', 'NOW()', FALSE);
               return $this->db->update('notification');
    
}
// Getting categories from job_category table and updating in filter list  
public function getJobCategory(){
  // $query = "SELECT job_category_id, category_name, FROM `job_category` WHERE category_name != '' AND is_deleted != 1";
  // $res = $this->db->query($query)->result_array();
  // foreach($res as $data){
  //    $category[$data['job_category_id']] = $data['category_name'];
  // }
  // $json['json'] = json_encode($category);
  // //  print_r($json);die;
  // $this->db->where('id', 2);
  // $this->db->set('updated_at', 'NOW()', FALSE);
  // $query = $this->db->update('list', $json);
  //----------------------------------------------------------------------------------------
  $query = "SELECT DISTINCT(category_type) FROM `job_category` WHERE is_deleted!= 1";
  $res = $this->db->query($query)->result_array();
  // print_r($res);die;
  foreach($res as $likey => $data){
     $type[$likey] = $data['category_type'];
  }
  $json['json'] = json_encode($type);
  //  print_r($type);die;
  $this->db->where('id', 8);
  $this->db->set('updated_at', 'NOW()', FALSE);
  $query = $this->db->update('list', $json);
  return $query;
}  
public function insert_otp($detail) {
    return $res = $this->db->insert('otp',$detail);
  }
public function validate_otp($email,$otp){

            $this->db->where('email', $email);

            $this->db->where('otp',$otp);

            $this->db->order_by('id', 'DESC');

            $this->db->limit(1);

            $query = $this->db->get('otp');      

            if ($query->num_rows() > 0) {



                return $query;


            }

}
public function email($detail, $email_template_id, $unique_id){
  // print_r(json_encode($detail));die;
    $mail = array('email_template_id'=>$email_template_id,
                'email_json' =>json_encode($detail),
                'group_id' => $unique_id);
    $this->db->insert('email',$mail);
  return;
}
public function getLastRecord_email(){
  //  $query = "select id from email ORDER BY id DESC LIMIT 1";
   $query = "SELECT * FROM `email` WHERE status = 'PENDING' ORDER BY id DESC LIMIT 1";
   return $res = $this->db->query($query)->row_array();
  //  return $res['id'];
}
public function getEmailByGroup($group_id){
   $query = "SELECT * FROM `email` WHERE status = 'PENDING' AND group_id = ".$group_id;
   $res = $this->db->query($query)->result_array();
   $query = " UPDATE `email` SET status = 'PROCESSING' WHERE group_id = ".$group_id;
   $this->db->query($query);
  return $res;
  //  print_r($group_id);die;
}
public function getNotifications($from_id, $user_type){
  $this->db->where('from_id',$from_id);
  $this->db->where('type',$user_type);
  // $this->db->where('is_read != 1');
  $result = $this->db->get('notification')->result_array();
  $total_rows = $this->db->where('from_id',$from_id)->where('type',$user_type)->from('notification')->count_all_results();
    return array('total_rows' => $total_rows, 'data' => $result);

}
public function addUpdateEmailTemplate($template){
  $id = $template['id'] ?? null;
  if($id){
                $this->db->where('id', $id);
                $this->db->set('updated_at', 'NOW()', FALSE);
               return $this->db->update('email_template', $template);
  }
  // else{
  //               // Insert operation
  //               return $this->db->insert('email_template', $template);
                
  //             }
}
public function getEmailTemplate($id){
  if(!empty($id)){
      $this->db->where('id',$id['id']);
      $this->db->where('is_active != 0');
      $result = $this->db->get('email_template')->row_array();
  }else{
  // $this->db->where('type',$user_type);
  $this->db->where('is_active != 0');
  $result = $this->db->get('email_template')->result_array();
  // print_r($this->db->last_query());
}
  $total_rows = $this->db->where('is_active != 0')->from('email_template')->count_all_results();
    return array('total_rows' => $total_rows, 'data' => $result);

}
public function checkEmployeeEmailPermission($employee_id){
  $query = "SELECT * FROM `employee_setting` WHERE employee_id = ".$employee_id." AND email_permission = 1";
  $res = $this->db->query($query);
   if ($res->num_rows() > 0) {
        return true;
    } else {
        return false;
    }
}
public function checkEmployerEmailPermission($company_id){
  $query = "SELECT * FROM `employer_setting` WHERE company_id = ".$company_id."  AND email_permission = 1";
  $res = $this->db->query($query);
   if ($res->num_rows() > 0) {
        return true;
    } else {
        return false;
    }
}
public function checkAdminEmailPermission($admin_id){
  $query = "SELECT * FROM `admin` WHERE admin_id = ".$admin_id." AND is_deleted != 1 AND email_permission = 1";
  $res = $this->db->query($query);
   if ($res->num_rows() > 0) {
        return true;
    } else {
        return false;
    }
}
}


