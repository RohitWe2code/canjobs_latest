<?php

defined('BASEPATH') OR exit('No direct script access allowed');
/**
*
*/
class Payment_gateway_model extends CI_Model

{
    public function add_razor_pay_reciept($details){
  // print_r($id);
  // print_r($details);die;
            //     $job_id = $details['job_id'];
            //     $lmia_status = $details['lmia_status'];
            //     $lmia_substage = $details['lmia_substage'];
            //     if($lmia_status === "decision"){
            //       $this->db->where('job_id', $job_id);
            //       $this->db->where('lmia_status', $lmia_status);
            //     }else{
            //       $this->db->where('job_id', $job_id);
            //       $this->db->where('lmia_status', $lmia_status);
            //       $this->db->where('lmia_substage', $lmia_substage);
            //     }
            //     $query = $this->db->get('lmia_substages_job');  
            //     // print_r($this->db->last_query());die;
            //   if ($query->num_rows() > 0) {
            //     $row_id = $query->row_array()['id'];
            //     // print_r($row_id);die;
            //     // if($query->row_array()['lmia_substage'] == $lmia_substage){
            //     //   return "already exist";
            //     // }
            //       $this->db->where('id', $row_id);
            //       $this->db->set('updated_at', 'NOW()', FALSE);
            //       $query = $this->db->update('lmia_substages_job', $details);                    
            //       return "updated successfully";
            //   }else{
                // print_r("insert");die;
                $res = $this->db->insert('payment_reciept',$details);
                return "insert successfully";
            //   }
}
public function get_payment_reciept($id, $filter){
 
//   if(isset($filter['lmia_status'])){
//       $this->db->where('lmia_status', $filter['lmia_status']);
//     }
  $this->db->where('user_id', $id['user_id']);
  $this->db->where('user_role', $id['user_role']);
  $this->db->order_by('id', 'DESC');
  // $this->db->limit(10, 5);
  $result = $this->db->get('payment_reciept')->result_array(); 
     
  $total_rows = count($result);
    return array('total_rows' => $total_rows, 'data' => $result);
}

// public function delete_lmia_substage_job($id){
//                 $this->db->where("id", $id);
//                 return $this->db->delete("lmia_substages_job");
//    }
}