<?php

defined('BASEPATH') OR exit('No direct script access allowed');
/**
*
*/
class Lmia_model extends CI_Model

{
public function addUpdateLmia($detail){

  //  $id = $detail['id'] ?? null;
            $apply_id = $detail['apply_id'] ?? NULL;
            $this->db->where('apply_id', $apply_id);
            // $employee_id = $detail['employee_id'] ?? NULL;
            // $this->db->where('employee_id', $employee_id);
            $query = $this->db->get('lmia');        

            if ($query->num_rows() > 0) {
                $row = $query->row();
                // print_r($row);die;
                if(($row->lmia_status == $detail['lmia_status']) && ($row->is_active == 1)){ 
                  // If new status and old status are same than return
                  return array('msg' => "Please provide different status, already exist");
                }
                $this->db->where('id', $row->id);
                if(isset($detail['is_active'])){}else{
                  $this->db->set('is_active', 1);
                }
                $this->db->set('updated_at', 'NOW()', FALSE);
        
                $res = $this->db->update('lmia', $detail);
                if($res){
                  $query = "SELECT *,
                  (SELECT email FROM employer WHERE company_id=view_applied_employee.company_id) AS company_email 
                  FROM view_applied_employee WHERE apply_id = '". $apply_id."'";
                  $response = $this->db->query($query)->row();

                return array('response' => $response, 'msg' => "Data updated successfully");
              }
             
                // return "Data updated successfully";
             } else {  

                                  
                                  $res = $this->db->insert('lmia', $detail);

                                  //print_r($this->db->last_query());
                                  if($res){
                                  $query = "SELECT *,
                                  (SELECT email FROM employer WHERE company_id=view_applied_employee.company_id) AS company_email 
                                  FROM view_applied_employee WHERE apply_id = '". $apply_id."'";
                                  $response = $this->db->query($query)->row();

                                  return array('response' => $response, 'msg' => "Data added successfully");
                                  }
                                  // return "Data added successfully";

                          }          

}
public function get_lmia($filter, $search, $limit, $offset, $sort, $details){
 
    $where = "";

    if (!empty($filter['lmia_status'])) {
        $lmia_status = $this->db->escape($filter['lmia_status']);
        $where .= " AND lmia_status = $lmia_status";
    }

    if (!empty($filter['job_id'])) {
        $job_id = $this->db->escape($filter['job_id']);
        $where .= " AND job_id IN ($job_id)";
    }
    if (!empty($filter['employee_id'])) {
        $employee_id = $this->db->escape($filter['employee_id']);
        $where .= " AND employee_id IN ($employee_id)";
    }

    // if (!empty($filter['keyskill'])) {
    //   // Print each comma-separated value separately
    //   $keyskills = explode(",", $filter['keyskill']);
    //   $query = " AND ";
    //   $conditions = array();
    //   foreach ($keyskills as $skill) {
    //     $conditions[] = "keyskill LIKE '%" . $skill . "%'";
    //   }
    //   $query .= implode(" OR ", $conditions);
    //   $where .= $query;
    // }

    // if (!empty($filter['location'])) {
    //     $location = $this->db->escape_like_str($filter['location']);
    //     $where .= " AND location LIKE '%$location%'";
    // }
    // if (!empty($filter['company_name'])) {
    //     $company_name = $this->db->escape_like_str($filter['company_name']);
    //     $where .= " AND company_name = '$company_name'";
    // }
    if (!empty($sort['column_name']) && !empty($sort['sort_order'])) {
          // $this->db->order_by($sort['column_name'], $sort['sort_order']);
          $order = " ORDER BY ". $sort['column_name'] ." ". $sort['sort_order'];
        }
    if(!empty($filter['start_date']) || !empty($filter['end_date'])){
            $where .= " AND DATE(created_at) BETWEEN '".$filter['start_date']."' AND '".$filter['end_date']."' ";
       }
    if (!empty($search)) {
        $search = $this->db->escape_like_str($search);
        $where .= " AND (job_title LIKE '%$search%' OR company_name LIKE '%$search%')";
    }
    // if(!empty($details['job_id'])){
    //     $where .= " AND job_id=".$details['job_id']." ";
    // }
    // if(!empty($details['admin_id'])){                  
    //     $where .= " AND created_by_admin = ".$details['admin_id'];
    // }
    if(!empty($details['company_id'])){                  
        $where .= " AND company_id = ".$details['company_id'];
    }
    $q = "SELECT `id`,`lmia_status`,`expected_time_of_completion`,`job_id`,`job_title`,`company_id`,`company_name`,`employee_id`,`name`,`email`,`contact_no`,`date_of_birth`,`description`,`gender`,`marital_status`,`nationality`,`current_location`,`currently_located_country`,`language`,`interested_in`,`experience`,`resume`,`profile_photo`,`education`,`specialization`,`skill` FROM `view_applied_employee` WHERE id IS NOT NULL AND is_deleted = 0
		".$where." ".$order." LIMIT ".$limit." OFFSET ".$offset;
    $result = $this->db->query($q)->result_array();
//----------------------------------------------------------------------------------------------------------------
    $que = "SELECT `id`,`lmia_status`,`expected_time_of_completion`,`job_id`,`job_title`,`employee_id`,`name`,`company_id`,`company_name` FROM `view_applied_employee` WHERE id IS NOT NULL AND is_deleted = 0
			".$where;
    $rows = $this->db->query($que)->result_array();
    // print_r($this->db->last_query());
    $total_rows =count($rows);
    return array('total_rows' => $total_rows, 'data' => $result);
}
public function add_update_lmia_substages_employee($id, $details){
  // print_r($id);
  // print_r($details);die;
            if (!empty($id)) {
                      // Update operation
                      $this->db->where('id', $id);
                      $this->db->set('updated_at', 'NOW()', FALSE);
                      $query = $this->db->update('lmia_substages_employee', $details);                    
                      return "updated successfully";
                      } 
              else{
                $lmia_id = $details['lmia_id'];
                $lmia_status = $details['lmia_status'];
                $lmia_substage = $details['lmia_substage'];

                if($lmia_status === "decision"){
                  $this->db->where('lmia_id', $lmia_id);
                  $this->db->where('lmia_status', $lmia_status);
                }else{
                $this->db->where('lmia_id', $lmia_id);
                $this->db->where('lmia_status', $lmia_status);
                $this->db->where('lmia_substage', $lmia_substage);
                }
                $query = $this->db->get('lmia_substages_employee');  
              if ($query->num_rows() > 0) {
                $row_id = $query->row_array()['id'];
                // print_r($row_id);die;
                 if($query->row_array()['lmia_substage'] == $lmia_substage){
                  return "already exist";
                }
                  $this->db->where('id', $row_id);
                  $this->db->set('updated_at', 'NOW()', FALSE);
                  $query = $this->db->update('lmia_substages_employee', $details);                    
                  return "updated successfully";
              }else{
                // print_r("insert");die;
                $res = $this->db->insert('lmia_substages_employee',$details);
                return "insert successfully";
              }
              }
}
public function get_lmia_substages_employee($lmia_id, $filter){
  /*
  ||--------------------------------------------------------------------------------------
  ||  SQL query to join with "view_applied_employee"
  ||--------------------------------------------------------------------------------------
      SELECT ls.*, vae.* FROM view_applied_employee AS vae 
      JOIN lmia_substages_employee AS ls ON vae.id = ls.lmia_id 
  ||-------------------------------------------------------------------------------------- 
  */
       
  // $sql = "SELECT ls.id, lmia.job_id, lmia.employee_id, ls.lmia_id, ls.lmia_substage,lmia.lmia_status, lmia.is_active, ls.created_by, ls.updated_by, ls.created_at, ls.updated_at, lmia.created_at AS lmia_created_at,lmia.updated_at AS lmia_updated_at FROM lmia_substages_employee AS ls LEFT JOIN lmia ON lmia.id = ls.lmia_id
  // WHERE ls.lmia_id = ".$lmia_id;
  // $result = $this->db->query($sql)->result_array(); 
  if(isset($filter['lmia_status'])){
      $this->db->where('lmia_status', $filter['lmia_status']);
    }
  $this->db->where('lmia_id', $lmia_id);
  $result = $this->db->get('lmia_substages_employee')->result_array(); 
     
  $total_rows = count($result);
    return array('total_rows' => $total_rows, 'data' => $result);
}
public function delete_lmia_substage_employee($id){
                $this->db->where("id", $id);
                return $this->db->delete("lmia_substages_employee");
   }
public function add_update_lmia_substages_job($id, $details){
  // print_r($id);
  // print_r($details);die;
            if (!empty($id)) {
                      // Update operation
                      $this->db->where('id', $id);
                      $this->db->set('updated_at', 'NOW()', FALSE);
                      $query = $this->db->update('lmia_substages_job', $details);                    
                      return "updated successfully";
                      } 
              else{
                $job_id = $details['job_id'];
                $lmia_status = $details['lmia_status'];
                $lmia_substage = $details['lmia_substage'];
                if($lmia_status === "decision"){
                  $this->db->where('job_id', $job_id);
                  $this->db->where('lmia_status', $lmia_status);
                }else{
                  $this->db->where('job_id', $job_id);
                  $this->db->where('lmia_status', $lmia_status);
                  $this->db->where('lmia_substage', $lmia_substage);
                }
                $query = $this->db->get('lmia_substages_job');  
                // print_r($this->db->last_query());die;
              if ($query->num_rows() > 0) {
                $row_id = $query->row_array()['id'];
                // print_r($row_id);die;
                // if($query->row_array()['lmia_substage'] == $lmia_substage){
                //   return "already exist";
                // }
                  $this->db->where('id', $row_id);
                  $this->db->set('updated_at', 'NOW()', FALSE);
                  $query = $this->db->update('lmia_substages_job', $details);                    
                  return "updated successfully";
              }else{
                // print_r("insert");die;
                $res = $this->db->insert('lmia_substages_job',$details);
                return "insert successfully";
              }
              }
}
public function get_lmia_substages_job($job_id, $filter){
 
  if(isset($filter['lmia_status'])){
      $this->db->where('lmia_status', $filter['lmia_status']);
    }
  $this->db->where('job_id', $job_id);
  $result = $this->db->get('lmia_substages_job')->result_array(); 
     
  $total_rows = count($result);
    return array('total_rows' => $total_rows, 'data' => $result);
}
public function delete_lmia_substage_job($id){
                $this->db->where("id", $id);
                return $this->db->delete("lmia_substages_job");
   }
}