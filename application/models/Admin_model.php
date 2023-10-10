<?php



defined('BASEPATH') OR exit('No direct script access allowed');



class Admin_model extends CI_Model



{



public function get_employee($search,$filter){



}







public function get_admin_by_email($data){
  $email = $data->email;
  // print_r($email);die;
  $this->db->where('email', $email);
  $this->db->where('is_deleted = 0');
  if(!empty($data->admin_id)){
  $this->db->where('admin_id <>', $data->admin_id);
  }
  $query = $this->db->get('admin');
  // print_r($this->db->last_query());
  if ($query->num_rows() > 0) {
      return $query;
  }
}



public function checkLogin($credentials)
{
        $this->db->where($credentials);
        $this->db->where('is_deleted != 1');
        $query = $this->db->get('admin');
        if($query->num_rows()==1)
        {
            return $query->row();
        }
        else 
        {
            return false;
        }
}



public function addUpdateAdmin($admin, $id = NULL){
  // if (!empty($admin['admin_id'])) {
  if (!empty($id)) {
    // Update operation
                        // $this->db->where('admin_id', $admin['admin_id']);
                        $this->db->where('admin_id', $id);
                        $this->db->set('updated_at', 'NOW()', FALSE);
                        $res = $this->db->update('admin', $admin);
                        // print_r($this->db->last_query());            
                        return $res;
    }else{
    // Add operation
    $res = $this->db->insert('admin', $admin);
    // print_r($this->db->last_query());
    return $res;
    }      
}
public function add_follow_up_employee($followup_detail){
           return $this->db->insert('employee_follow_up', $followup_detail); 
}
public function add_follow_up_employer($followup_detail){
           return $this->db->insert('employer_follow_up', $followup_detail);        
}
public function get_follow_up_employee($id, $search, $filter, $sort, $limit, $offset){  
                if(empty($id)){ 
                  // get last follow up of each employee                                       
                  $this->db->where('id IN (SELECT MAX(id) FROM employee_follow_up GROUP BY employee_id)'); 
                }else{
                  // get all follow up of perticular employee
                  $this->db->where('efp.employee_id', $id); 
                } 
                if(!empty($search)) {
                  $this->db->like('name', $search);
                  }            
                if(!empty($filter['employee_name'])) {
                  $employee_name = $filter['employee_name'];
                  $this->db->like('name', $employee_name, 'both');
                  }            
                if (!empty($filter['next_followup_date'])) {
                  $next_followup_date = $filter['next_followup_date'];
                  $this->db->where('next_followup_date', $next_followup_date);
                  }
                if (!empty($filter['status'])) {
                  $status = $filter['status'];
                  $this->db->where('efp.status', $status);
                  }
                if (!empty($sort['column_name']) && !empty($sort['sort_order'])) {
                  if ($sort['column_name'] === 'name') {
                      // sorting by 'name'.
                      $this->db->order_by('name', $sort['sort_order']);
                  }else{
                      $this->db->order_by('efp.'.$sort['column_name'] . ' ' . $sort['sort_order']);
                  }
                } 
                $this->db->select("efp.*, e.name, e.profile_photo");
                $this->db->join('employee e','e.employee_id = efp.employee_id','left'); 
                $this->db->limit($limit, $offset);              
                $result = $this->db->get('employee_follow_up efp')->result_array();
                // print_r($this->db->last_query());
                // $total_rows = $this->db->where($where)->where('is_deleted !=', 1)->from('view_applied_employee')->count_all_results();
                $total_rows = $this->db->count_all_results();
              return array('total_rows' => $total_rows, 'data' => $result);
  }

public function get_follow_up_employer($id, $search, $filter, $sort, $limit, $offset){ 
                if(empty($id)){                                        
                  $this->db->where('id IN (SELECT MAX(id) FROM employer_follow_up GROUP BY company_id)'); 
                }else{
                  $this->db->where('efp.company_id', $id); 
                } 
                if(!empty($search)) {
                  $this->db->like('company_name', $search);
                  }                                              
                if(!empty($filter['employer_name'])) {
                  $employer_name = $filter['employer_name'];
                  $this->db->like('company_name', $employer_name, 'both');
                  }
                if (!empty($filter['next_followup_date'])) {
                  $next_followup_date = $filter['next_followup_date'];
                  $this->db->where('next_followup_date', $next_followup_date);
                  }
                if (!empty($filter['status'])) {
                  $status = $filter['status'];
                  $this->db->where('efp.status', $status);
                  }
                if (!empty($sort['column_name']) && !empty($sort['sort_order'])) {
                   if ($sort['column_name'] === 'company_name') {
                      // sorting by 'company_name'.
                      $this->db->order_by('company_name', $sort['sort_order']);
                   }else{
                      $this->db->order_by('efp.'.$sort['column_name'] . ' ' . $sort['sort_order']);
                   }
                  }
                  $this->db->select("efp.*, e.company_name, e.logo");
                  $this->db->join('employer e','e.company_id = efp.company_id','left');
                $this->db->limit($limit, $offset);
                $result = $this->db->get('employer_follow_up efp')->result_array();
                // print_r($this->db->last_query());
                $total_rows = $this->db->count_all_results();
                return array('total_rows' => $total_rows, 'data' => $result);
  }

public function getAllAdmin($details, $filter, $search, $limit, $offset, $sort){

  $where = "1=1";

              if (!empty($filter)) {

                 $admin_type = $this->db->escape($filter);

                  $where .= " AND admin_type = $admin_type ";

              }

              if (!empty($search)) {

                  $search = $this->db->escape_like_str($search);

                  $where .= " AND (name LIKE '%$search%')";

              }

              if (!empty($sort['column_name']) && !empty($sort['sort_order'])) {

              $this->db->order_by($sort['column_name'] . ' ' . $sort['sort_order']);

              }
              if(!empty($details['admin_id'])){                
                $where .= " AND admin_type = 'executive' OR admin_id = ".$details['admin_id'];                
              }
              //  if(!empty($details['admin_id'])){                
              //   $where .= " AND created_by_admin = ".$details['admin_id'];                
              // }



              $this->db->where($where);

              $this->db->where('is_deleted =', 0);

              $result = $this->db->get('admin',$limit, $offset)->result_array();

              //  return $res->result_array();

              $total_rows = $this->db->where($where)->where('is_deleted != 1')->from('admin')->count_all_results();

              return array('total_rows' => $total_rows, 'data' => $result);

               
}
public function getAllfollowupView($details, $filter, $search, $limit, $offset, $sort){

  $where = "1=1";

              if (!empty($filter['job_title'])) {

                 $job_title = $this->db->escape($filter['job_title']);

                  $where .= " AND job_title = $job_title ";

              }
              if (!empty($filter['company_name'])) {

                 $company_name = $this->db->escape($filter['company_name']);

                  $where .= " AND company_name = $company_name ";

              }
              if (!empty($filter['experience'])) {

                 $experience = $this->db->escape($filter['experience']);

                  $where .= " AND experience = $experience ";

              }

              if (!empty($search)) {

                  $search = $this->db->escape_like_str($search);

                  $where .= " AND (name LIKE '%$search%')";

              }

              if (!empty($sort['column_name']) && !empty($sort['sort_order'])) {

              $this->db->order_by($sort['column_name'] . ' ' . $sort['sort_order']);

              }
              if(!empty($details['admin_id'])){                
                $where .= " AND created_by_admin = ".$details['admin_id'];                
              }



              $this->db->where($where);

              $this->db->where('is_deleted !=', 1);

              $result = $this->db->get('view_applied_employee',$limit, $offset)->result_array();

              //  return $res->result_array();

              $total_rows = $this->db->where($where)->where('is_deleted !=', 1)->from('view_applied_employee')->count_all_results();

              return array('total_rows' => $total_rows, 'data' => $result);

  }

public function getAdmin($admin_id){             

  $this->db->where('admin_id', $admin_id);

  $this->db->where('is_deleted=0');

  $query = $this->db->get('admin');

  return $result_array = $query->result_array();

   

} 

public function deleteAdmin($admin_id){



  $this->db->where('admin_id', $admin_id);

  $this->db->set('is_deleted', '1', FALSE);

return $result = $this->db->update('admin');    

}
public function addUpdateFilterList($list){
$id = $list['id'] ?? null;

  if (!empty($id)) {
    // Update operation
            $this->db->where('id', $id);
            $query = $this->db->get('list');        

            if ($query->num_rows() > 0) {
                $row = $query->row();
                $json_list = json_decode($row->json, true);
                $list_item = $list['json'];
                $searchValue = strtolower($list_item);
                $lowercaseArray = array_map('strtolower', $json_list); //convert to lower case to resolve case sensitivity
                if (in_array($searchValue, $lowercaseArray)) { //Search for json_item if already exist
                    return "already exist";
                } else {
                array_push($json_list, $list_item);
                $json_updated = json_encode($json_list);
                $this->db->where('id', $row->id);
                $this->db->set('json', $json_updated);
                $this->db->set('updated_at', 'NOW()', FALSE);
                $res = $this->db->update('list');     
                // print_r($this->db->last_query());die;
                 return $res;

            }  
          }         

                      
    } 

}
public function getFilterList($list_id = null){

if(!empty($list_id)){

                $this->db->where('id',$list_id);
}

               $res = $this->db->get('list')->result_array();
// print_r($res);die;
$result = array();
foreach($res as $record) {
    $key = $record['item_name'];
    $value = json_decode($record['json'],true);
    $itmarr = array();
    foreach($value as $itmkey=>$itmval)
    {
      $itmarr[] = array("id"=>$itmkey,"value"=>$itmval);
    }

    $result[$key] = $itmarr;
}

$stringData = json_encode($result);
      
      // Write the string to the file
      $filename = "filterList/filterList.json";
      $file = fopen($filename, "w");
      fwrite($file, $stringData);
      fclose($file);
      
      // Force download the file
      header("Content-Type: application/octet-stream");
      header("Content-Transfer-Encoding: Binary");
      header("Content-disposition: attachment; filename=\"" . basename($filename) . "\"");
      // readfile($filename);
      // exit;
return $result;
                // print_r($this->db->last_query());
  }

public function deleteFilterList($id){
$json_item_id = $id['json_item_id'] ?? null;
            $this->db->where('id', $id['item_id']);
            $query = $this->db->get('list');        
            // print_r($query->result_array());die;
            if ($query->num_rows() > 0) {
                $row = $query->row();
                $data = json_decode($row->json, true);
                unset($data[$json_item_id]); 
                // print_r($data);die;
                $json_updated = json_encode($data);
                $this->db->where('id', $row->id);
                $this->db->set('json', $json_updated);
                $this->db->set('updated_at', 'NOW()', FALSE);
                $res = $this->db->update('list');     
                // print_r($this->db->last_query());die;
                 return $res;
 

}
}
// public function getSummaryCounts(){
                      
//             $res = array();

//             $query = "SELECT COUNT(job_id) as posted_jobs FROM `view_job_posted` WHERE is_active = 1 AND is_deleted != 1";
//             $res['posted_jobs'] = $this->db->query($query)->row_array()['posted_jobs'];

//             $query = "SELECT COUNT(employee_id) AS total_applicants FROM employee WHERE is_deleted != 1";
//             $res['total_applicants'] = $this->db->query($query)->row_array()['total_applicants'];
           
//             $query = "SELECT COUNT(DISTINCT(employee_id)) AS applied_applicant FROM view_applied_employee WHERE is_deleted != 1";
//             $res['applied_applicant'] = $this->db->query($query)->row_array()['applied_applicant'];

//             $query = "SELECT COUNT(employee_id) AS placed FROM `employee` where is_posted = 1";
//             $res['placed'] = $this->db->query($query)->row_array()['placed'];

//             $query = "SELECT COUNT(company_id) AS total_company FROM employer WHERE is_deleted != 1";
//             $res['total_company'] = $this->db->query($query)->row_array()['total_company'];
           
//             $query = "SELECT COUNT(company_id) AS active_company FROM employer WHERE is_deleted != 1 AND is_active != 0";
//             $res['active_company'] = $this->db->query($query)->row_array()['active_company'];
            
//             $query = "SELECT COUNT(id) AS total_interviews FROM job_interviews WHERE is_reschedule != 1";
//             $res['total_interviews'] = $this->db->query($query)->row_array()['total_interviews'];
           
//             $query = "SELECT COUNT(id) AS interview_complete FROM job_interviews WHERE status = 'complete'";
//             $res['interview_complete'] = $this->db->query($query)->row_array()['interview_complete'];
            
//             $query = "SELECT COUNT(DISTINCT CONCAT(job_id, '_', employee_id)) AS total_follow_up 
//                       FROM follow_up";
//             $res['total_follow_up'] = $this->db->query($query)->row_array()['total_follow_up'];
          
//           $query = "SELECT COUNT(id) AS  FROM follow_up WHERE next_followup_date = '0000-00-00'";
//             $res['total_follow_up'] = $this->db->query($query)->row_array()['total_follow_up'];

//             $query = "SELECT COUNT(id) AS total_lmia FROM lmia WHERE is_active !=0";
//             $res['total_lmia'] = $this->db->query($query)->row_array()['total_lmia'];
            
//             $query = "SELECT COUNT(id) lmia_reject FROM lmia WHERE lmia_status = 'Reject' AND is_active !=0";
//             $res['lmia_reject'] = $this->db->query($query)->row_array()['lmia_reject'];
           
//             $query = "SELECT COUNT(id) lmia_pending FROM lmia WHERE lmia_status = 'Pending' AND is_active !=0";
//             $res['lmia_pending'] = $this->db->query($query)->row_array()['lmia_pending'];
            
//             $query = "SELECT COUNT(id) lmia_approved FROM lmia WHERE lmia_status = 'Approved' AND is_active !=0";
//             $res['lmia_approved'] = $this->db->query($query)->row_array()['lmia_approved'];

//             $query = "SELECT COUNT(apply_id) AS total_response FROM `view_applied_employee` WHERE is_viewed != 1 AND is_deleted != 1";
//             $total_response = $this->db->query($query)->row_array()['total_response'];

//             $query = "SELECT COUNT(apply_id) AS jobs_viewed FROM `view_applied_employee` WHERE is_deleted != 1";
//             $jobs_viewed = $this->db->query($query)->row_array()['jobs_viewed'];

//             $applied_rate = ($jobs_viewed != 0) ? ($total_response / $jobs_viewed * 100) : 0;
//             $res['total_response'] = $total_response;
//             $res['jobs_viewed'] = $jobs_viewed;
//             $res['applied_rate'] = $applied_rate;

//             return $res;


//   }
  public function getAllLastFollowup($id, $filter, $search, $limit, $offset, $sort){

        // print_r($sort);die;
        $where = "";
        if(!empty($filter['start_date']) || !empty($filter['end_date'])){
                  $where .= " AND DATE(fu.created_at) BETWEEN '".$filter['start_date']."' AND '".$filter['end_date']."' ";
              }
        if(isset($id['admin_id'])){                
               
               $where .= " AND admin_id = ".$id['admin_id'];
                           
             }      

              $query = "SELECT vae.apply_id,vae.name,vae.job_title,vae.company_id,vae.company_name,fu.*
                        FROM follow_up AS fu
                        INNER JOIN view_applied_employee AS vae ON vae.employee_id = fu.employee_id 
                        AND vae.job_id = fu.job_id
                        WHERE fu.id IN (SELECT MAX(id) FROM follow_up GROUP BY employee_id, job_id) 
                        AND vae.is_deleted != 1 
                        AND vae.is_viewed != 1 ".$where." ORDER BY ".$sort['column_name'] ." ". $sort['sort_order'];

              $res = $this->db->query($query)->result_array();

              $query = "SELECT COUNT(fu.id) AS total_rows
                        FROM follow_up AS fu
                        INNER JOIN view_applied_employee AS vae ON vae.employee_id = fu.employee_id AND vae.job_id = fu.job_id
                        WHERE fu.id IN (SELECT MAX(id) FROM follow_up GROUP BY employee_id, job_id) AND vae.is_deleted != 1 AND vae.is_viewed != 1".$where;

              $total_rows = $this->db->query($query)->row_array()['total_rows'];

              return array('total_rows' => $total_rows, 'data' => $res);



  }

public function resetPassword($reset_details){

  // print_r($reset_details);die;


                      $this->db->where('token', $reset_details['token']);



                      $this->db->set('updated_at', 'NOW()', FALSE);



                      $query = $this->db->update('admin', $reset_details);                    



                      return $query;

                      
}
 public function add_update_miscellaneous_substage($id, $detail){
// print_r($detail);die;
  if(!empty($id)){
     $this->db->where('id', $id);
                      $this->db->set('updated_at', 'NOW()', FALSE);
                      $query = $this->db->update('substages_miscellaneous', $detail);                    
                      return $query;
                      } 
              else{
                $misc_id = $detail['misc_id'];
                $type = $detail['type'];
                $status = $detail['status'];
                $substage = $detail['substage'];
                if($status === 'file decision'){
                  $this->db->where('misc_id', $misc_id);
                  $this->db->where('type', $type);
                  $this->db->where('status', $status);
                }else{
                  $this->db->where('misc_id', $misc_id);
                  $this->db->where('type', $type);
                  $this->db->where('status', $status);
                  $this->db->where('substage', $substage);
                }
                
                $query = $this->db->get('substages_miscellaneous');  
              if ($query->num_rows() > 0) {
                $row_id = $query->row_array()['id'];
                // print_r($row_id);die;
                  $this->db->where('id', $row_id);
                  $this->db->set('updated_at', 'NOW()', FALSE);
                  $query = $this->db->update('substages_miscellaneous', $detail);                    
                  return $query;
              }else{
                // print_r("insert");die;
                $res = $this->db->insert('substages_miscellaneous',$detail);
                return $res;
              }
              }
}
public function get_miscellaneous_substage($id, $filter, $sort){
                
                if (!empty($id)) {            
                  $this->db->where('id',$id);
                  }
                if (!empty($filter['misc_id'])) {
                  $misc_id = $filter['misc_id'];
                  $this->db->where('misc_id', $misc_id);
                  }
                if (!empty($filter['type'])) {
                  $type = $filter['type'];
                  $this->db->where('type', $type);
                  }
                if (!empty($sort['column_name']) && !empty($sort['sort_order'])) {
                  $this->db->order_by($sort['column_name'] . ' ' . $sort['sort_order']);
                  }
                
                $result = $this->db->get('substages_miscellaneous')->result_array();
                $total_rows = count($result);
                return array('total_rows' => $total_rows, 'data' => $result);
                // print_r($this->db->last_query());
  }
  public function delete_miscellaneous_substage(){
                $this->db->where("id", $id);
                return $this->db->delete("substages_miscellaneous");
  }
public function get_activity_log($id, $filter, $sort, $limit, $offset){
                
                if (!empty($id)) {            
                  $this->db->where('id',$id);
                  }
                if (!empty($filter['misc_id'])) {
                  $misc_id = $filter['misc_id'];
                  $this->db->where('misc_id', $misc_id);
                  }
                if (!empty($filter['type'])) {
                  $type = $filter['type'];
                  $this->db->where('type', $type);
                  }
                if (!empty($sort['column_name']) && !empty($sort['sort_order'])) {
                  $this->db->order_by($sort['column_name'] . ' ' . $sort['sort_order']);
                  }
                $this->db->select("*,
                                  CASE
                                    WHEN activity_log.user_type IN ('super-admin', 'manager', 'admin') THEN(SELECT name FROM admin WHERE admin_id = activity_log.`user_id` )
                                    WHEN activity_log.user_type = 'employee' THEN(SELECT name FROM employee WHERE employee_id = activity_log.user_id)
                                    WHEN activity_log.user_type = 'employer' THEN(SELECT company_name FROM employer WHERE company_id = activity_log.user_id)
                                  END AS created_by,
                                  CASE
                                    WHEN activity_log.action_type = 'employee' THEN(SELECT name FROM employee WHERE employee_id = activity_log.action_id )
                                  END AS employee_name,
                                   CASE
                                    WHEN activity_log.action_type = 'employer' THEN(SELECT company_name FROM employer WHERE company_id = activity_log.action_id )
                                  END AS employer_name,
                                  CASE
                                      WHEN activity_log.action_type = 'jobs' THEN(SELECT job_title FROM jobs WHERE job_id = activity_log.action_id )
                                  END AS job_title,
                                  CASE
                                      WHEN activity_log.action_type = 'apply_on_job' THEN(SELECT job_title FROM view_applied_employee WHERE apply_id = activity_log.action_id )
                                  END AS applied_job,
                                  CASE
                                      WHEN activity_log.action_type = 'apply_on_job' THEN(SELECT name FROM view_applied_employee WHERE apply_id = activity_log.action_id )
                                  END AS applied_employee_name,
                                  CASE
                                      WHEN activity_log.action_type = 'lmia' THEN(SELECT job_title FROM view_applied_employee WHERE apply_id = activity_log.action_id )
                                  END AS lmia_job_title,
                                  CASE
                                      WHEN activity_log.action_type = 'lmia' THEN(SELECT name FROM view_applied_employee WHERE apply_id = activity_log.action_id )
                                  END AS lmia_employee_name");
                $this->db->limit($limit, $offset);            
                $result = $this->db->get('activity_log')->result_array();
                // print_r($this->db->last_query());
                $total_rows = count($result);
                return array('total_rows' => $total_rows, 'data' => $result);

/*
||---------------------------------------------------------------------------------------------------------------------------------
||        SQL QUERY
||---------------------------------------------------------------------------------------------------------------------
    SELECT *,
    CASE
      WHEN activity_log.user_type IN ('super-admin', 'manager', 'admin') THEN(SELECT name FROM admin WHERE admin_id = activity_log.`user_id` )
      WHEN activity_log.user_type = 'employee' THEN(SELECT name FROM employee WHERE employee_id = activity_log.user_id)
      WHEN activity_log.user_type = 'employer' THEN(SELECT company_name FROM employer WHERE company_id = activity_log.user_id)
    END AS created_by,
    CASE
      WHEN activity_log.action_type = 'employee' THEN(SELECT name FROM employee WHERE employee_id = activity_log.action_id )
    END AS employee_name,
     CASE
      WHEN activity_log.action_type = 'employer' THEN(SELECT company_name FROM employer WHERE company_id = activity_log.action_id )
    END AS employer_name,
    CASE
        WHEN activity_log.action_type = 'jobs' THEN(SELECT job_title FROM jobs WHERE job_id = activity_log.action_id )
    END AS job_title,
    CASE
        WHEN activity_log.action_type = 'apply_on_job' THEN(SELECT job_title FROM view_applied_employee WHERE apply_id = activity_log.action_id )
    END AS applied_job,
    CASE
        WHEN activity_log.action_type = 'apply_on_job' THEN(SELECT name FROM view_applied_employee WHERE apply_id = activity_log.action_id )
    END AS applied_employee_name,
    CASE
        WHEN activity_log.action_type = 'lmia' THEN(SELECT job_title FROM view_applied_employee WHERE apply_id = activity_log.action_id )
    END AS lmia_job_title,
    CASE
        WHEN activity_log.action_type = 'lmia' THEN(SELECT name FROM view_applied_employee WHERE apply_id = activity_log.action_id )
    END AS lmia_employee_name
    FROM `activity_log`
||---------------------------------------------------------------------------------------------------------------------
 */
  }
   public function assign_job_to_manager($job_id, $manager_id){
        $this->db->where('job_id', $job_id);
        $this->db->set('manager_id', $manager_id);
        $this->db->set('updated_at', 'NOW()', FALSE);
        return $this->db->update('jobs');
    }
public function update_admin_setting($admin_id, $details){
      $this->db->where('admin_id',$admin_id);
      $query = $this->db->get('admin_setting');
       if ($query->num_rows() > 0) {
                $row_id = $query->row_array()['admin_id'];
                // print_r($row_id);die; 
                $this->db->where('admin_id', $row_id);
                $this->db->set('updated_at', 'NOW()', FALSE);
                return $this->db->update('admin_setting', $details);
                // $msg = "updated successfully";                  
                //   return $msg;
        }else{
          $details['admin_id'] = $admin_id;
          return $this->db->insert('admin_setting', $details);
        }
}
public function get_Admin_setting($admin_id){
  $this->db->where('admin_id', $admin_id);
  // $this->db->select('admin_id, name, admin_type, is_active, is_deleted, email_permission');
  return $this->db->get('admin_setting')->row_array();
}
}