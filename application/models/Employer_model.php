<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**

*

*/

class Employer_model extends CI_Model

{



public function get_employer_by_email($email){      

            $this->db->where('email', $email);

            $this->db->where('is_deleted != 1');

            $query = $this->db->get('employer');

            

            if ($query->num_rows() > 0) {

                return $query;

            }

}

public function insert_employer($employer = array()){

            $this->db->insert('employer', $employer);
            $inserted_id = $this->db->insert_id();
            return $inserted_data = $this->db->get_where('employer', array('company_id' => $inserted_id))->row();


}

public function checkLogin($credentials)

{

        $this->db->where($credentials);
        $this->db->where('is_deleted != 1');


        $query = $this->db->get('employer');
        // print_r($this->db->last_query());
        if($query->num_rows()==1)

        {

            return $query->row();

        }

        else 

        {

            return false;

        }

}
public function addUpdateCompanyDetails($company_info){

      if (isset( $company_info['company_id'])) {

                // Update operation

                $this->db->where('company_id', $company_info['company_id']);

                $this->db->set('updated_at', 'NOW()', FALSE);

              return $this->db->update('employer', $company_info);  
                
              } 
              else{
                // Insert operation
                return $this->db->insert('employer', $company_info);
                
              }

               

}

public function addUpdateCompanyContact($company_info){

  // print_r($company_info);die;

    $company_id = $company_info['company_id'];

                // Update operation

                $this->db->where('company_id', $company_id);

                $this->db->set('updated_at', 'NOW()', FALSE);

               return $this->db->update('employer', $company_info);                            

}

public function addUpdate_company_kycDetails($kyc_detail){

  // print_r($kyc_detail);die;

    $company_id = $kyc_detail['company_id'];

   

      if (!empty($company_id)) {

                // Update operation

                          $this->db->select('*');

                          $this->db->where('company_id', $company_id);  

                          $query = $this->db->get('company_kyc');

                        //   print_r($query);die;  

                                      

                          if ($query->num_rows() == 1)  

                          {  

                                  $this->db->where('company_id', $company_id);

                                  $this->db->set('updated_at', 'NOW()', FALSE);

                                  $res = $this->db->update('company_kyc', $kyc_detail);

                                  // print_r($this->db->last_query());

                                  return 1;

                          } else {  

                                  $res = $this->db->insert('company_kyc', $kyc_detail);

                                  // print_r($this->db->last_query());

                                  return 2;

                          }  

                } 

             

}

public function addUpdate_job($job_detail){
if(isset($job_detail['job_id'])){
    $job_id = $job_detail['job_id'];              

                          $this->db->select('*');

                          $this->db->where('job_id', $job_id);  

                          $query = $this->db->get('jobs');

                          // print_r($query->row());die;  

                          if ($query->num_rows() == 1)  

                          {  
                                  $row = $query->row();
                                 
                                  $this->db->where('job_id', $job_id);

                                  $this->db->set('updated_at', 'NOW()', FALSE);

                                  if(!empty($job_detail['keyskill'])){
                                        $existingKeySkills = $row->keyskill;
        
                                        // Append the new key skills to the existing value
                                        $newKeySkills = $existingKeySkills . ', ' . $job_detail['keyskill'];
                                        
                                        // Update the job_detail array with the new key skills
                                        $job_detail['keyskill'] = $newKeySkills;
                                        //  print_r($job_detail['keyskill']);die;
                                  }

                                  $res = $this->db->update('jobs', $job_detail);

                                  // print_r($this->db->last_query());

                                  return $res;

                          }
                         } else {  
                                  $res = $this->db->insert('jobs', $job_detail);
                                  $inserted_id = $this->db->insert_id();
                                  // print_r($this->db->last_query());
                                //   $query = "SELECT e.company_name, j.job_title 
                                //             FROM jobs as j 
                                //             INNER JOIN employer as e 
                                //             ON j.company_id = e.company_id
                                //             WHERE j.job_id = $inserted_id";
                                // return  $inserted_data = $this->db->query($query)->row();
                                 $this->db->where('job_id', $inserted_id);
                                return $query = $this->db->get('view_job_posted')->row();
                         }  

        

}

public function addUpdate_category($category_detail){

   $job_category_id = $category_detail['job_category_id'] ?? null;

      if (!empty($job_category_id)) {

                                  $this->db->where('job_category_id', $job_category_id);

                                  $this->db->set('updated_at', 'NOW()', FALSE);

                                  return $res = $this->db->update('job_category', $category_detail);


                          } else {
                            // Check if category_name OR category_type already exist  
                            $where = "1=1";
                            if(isset($category_detail['category_type'])){
                              $where .= " AND category_type = '".$category_detail['category_type']."' ";
                            }
                            if(isset($category_detail['category_name']) && isset($category_detail['category_type'])){
                              $where .= " AND category_name = '".$category_detail['category_name']."' AND category_type = '".$category_detail['category_type']."' ";
                            }
                            // print_r($where);die;
                            $this->db->where($where);
                            $this->db->where('is_deleted != 1');
                            $query = $this->db->get('job_category');
                             if ($query->num_rows() > 0) {
                                  return $msg = "already exist";
                              } else {
                                // If not exist than insert data
                                return $res = $this->db->insert('job_category', $category_detail);
                              } 


                          }  

         

}

public function applyJob($candidate_detail){
 $is_viewed = $candidate_detail["is_viewed"] ?? '';
//  print_r($is_viewed);die;
  if (!empty($candidate_detail['apply_id'])) {

                                  $this->db->where('apply_id', $candidate_detail['apply_id']);

                                  $this->db->set('updated_at', 'NOW()', FALSE);

                                  return $res = $this->db->update('apply_on_job', $candidate_detail);


                          } else  { 
                            
                          $this->db->select('*');

                          $this->db->where('job_id', $candidate_detail['job_id']);

                          $this->db->where('employee_id', $candidate_detail['employee_id']);  

                          $query = $this->db->get('apply_on_job');
                          $row = $query->row();
                          // print_r($row);die;
                          if (!empty($row)){  
                            // print_r(11);die;
                              if($row->is_viewed == 0 || $row->is_viewed == 2){
                                  return "2";
                              }
                              if($row->is_viewed == 3 &&  $is_viewed == 3){
                                  return "3";
                              }
                                  $this->db->where('apply_id', $row->apply_id);

                                  $this->db->set('is_viewed', $is_viewed);

                                  $this->db->set('updated_at', 'NOW()', FALSE);

                                  $res = $this->db->update('apply_on_job');

                                  // print_r($this->db->last_query());
                                  //  print_r($row->job_id);die;
                                  return $inserted_data = $this->db->get_where('view_job_posted', array('job_id' => $row->job_id))->row();
                                  // return $res;

                          }else{
                              // print_r(22);die;
                                  $res = $this->db->insert('apply_on_job', $candidate_detail);
                                  return $inserted_data = $this->db->get_where('view_job_posted', array('job_id' =>  $candidate_detail['job_id']))->row();
                          }

                          }  

}

public function viewJobs($filter, $search, $limit, $offset,$sort,$details, $recommend_sort){
 
    $where = "1=1";

    if (!empty($filter['category_id'])) {
        $category_id = $this->db->escape($filter['category_id']);
        $where .= " AND job_category_id = $category_id";
    }

    if (!empty($filter['job_type'])) {
        $job_type = $this->db->escape($filter['job_type']);
        $where .= " AND job_type IN ($job_type)";
    }

    if (!empty($filter['keyskill'])) {
      // Print each comma-separated value separately
      $keyskills = explode(",", $filter['keyskill']);
      $query = " AND ";
      $conditions = array();
      foreach ($keyskills as $skill) {
        $conditions[] = "keyskill LIKE '%" . $skill . "%'";
      }
      $query .= implode(" OR ", $conditions);
      // $keyskill = $this->db->escape_like_str($filter['keyskill']);
      // $where .= "  AND keyskill LIKE '%$keyskill%'";
      $where .= $query;
      // print_r($where);die;
    }

    if (!empty($filter['location'])) {
        $location = $this->db->escape_like_str($filter['location']);
        $where .= " AND location LIKE '%$location%'";
    }
    if (!empty($filter['company_name'])) {
        $company_name = $this->db->escape_like_str($filter['company_name']);
        $where .= " AND company_name = '$company_name'";
    }
    if(!empty($filter['start_date']) || !empty($filter['end_date'])){
            $where .= " AND DATE(created_at) BETWEEN '".$filter['start_date']."' AND '".$filter['end_date']."' ";
       }
    if (!empty($search)) {
        $search = $this->db->escape_like_str($search);
        $where .= " AND (job_title LIKE '%$search%' OR company_name LIKE '%$search%')";
    }
    if(!empty($details['job_id'])){
        $where .= " AND job_id=".$details['job_id']." ";
    }
    if(!empty($details['admin_id'])){                  
        $where .= " AND created_by_admin = ".$details['admin_id'];
    }
    if(!empty($details['company_id'])){                  
        $where .= " AND company_id = ".$details['company_id'];
    }
    
  //  $result = $this->db->query("SELECT vjp.*,(SELECT COUNT(*) FROM apply_on_job WHERE (vjp.job_id = apply_on_job.job_id) AND (apply_on_job.employee_id = ".$details['employee_id'].") AND apply_on_job.is_viewed  != 1) AS is_applied FROM view_job_posted AS vjp WHERE ".$where." AND vjp.is_deleted != 1 AND company_deleted != 1 ORDER BY ".$sort['column_name']." ".$sort['sort_order']." LIMIT ".$limit." OFFSET ".$offset)->result_array();
//----------------------------------------------------------------------------------------------------------------
$this->db->select('vjp.*, 
    (SELECT COUNT(*) FROM apply_on_job WHERE (vjp.job_id = apply_on_job.job_id) AND (apply_on_job.employee_id = '.$details['employee_id'].') AND apply_on_job.is_viewed != 1) AS is_applied');
$this->db->from('view_job_posted AS vjp');
$this->db->where($where);
$this->db->where('vjp.is_deleted !=', 1);
$this->db->where('vjp.company_deleted !=', 1);
$this->db->order_by($sort['column_name'], $sort['sort_order']);
$this->db->limit($limit, $offset);
$records = $this->db->get()->result_array();
if(!empty($recommend_sort)){
  $providedSkills = explode(',', strtolower($recommend_sort));
  // echo "recommend_sort-------chk ";
  // print_r($records);die;
  // Implement Custom Sorting Function
function compareSkills($recordSkills, $providedSkills) {
    $recordSkillsArray = array_map('trim', explode(',', strtolower($recordSkills)));
    $matchedSkillsCount = count(array_intersect($recordSkillsArray, $providedSkills));
    return $matchedSkillsCount * -1; // Multiply by -1 to sort in descending order
}

// Sort the Records
usort($records, function ($a, $b) use ($providedSkills) {
    $aPriority = compareSkills($a['keyskill'], $providedSkills);
    $bPriority = compareSkills($b['keyskill'], $providedSkills);
    return $aPriority - $bPriority;
});
}
// echo '----Else----';die;
//----------------------------------------------------------------------------------------------------------------

    // $this->db->where($where);
    // $this->db->where('is_deleted != 1');
    // $query = $this->db->get('view_job_posted', $limit, $offset);
    // $result = $query->result_array();
    // print_r($this->db->last_query());
    $total_rows = $this->db->where($where)->where('is_deleted != 1')->where('company_deleted != 1')->from('view_job_posted')->count_all_results();
    return array('total_rows' => $total_rows, 'data' => $records);
}

public function getJob($job_id = null){

                if($job_id != null){
                  $this->db->where('job_id', $job_id);
                }
                $this->db->where('is_deleted !=', 1);
                $res = $this->db->get('jobs');

                //  print_r($this->db->last_query());

              return $res->result_array();
               

  }

public function getAllJobCategory($filter, $search, $limit, $offset,$sort,$parent_id){

    $where = "1=1";

    if($parent_id > 0){
      $where .= " AND job_category.parent_id > 0 ";
    }
    else{
       $this->db->where('job_category.parent_id = 0');
    }
    if (!empty($filter)) {
        $category_type = $filter;
        $where .= " AND job_category.category_type = '$category_type' ";
    }
    if (!empty($search)) {
        $search = $this->db->escape_like_str($search);
        $where .= " AND (job_category.category_name LIKE '%$search%')";
    }
    if (!empty($sort['column_name']) && !empty($sort['sort_order'])) {
    $this->db->order_by('job_category.'.$sort['column_name'] . ' ' . $sort['sort_order']);
    }
    if($parent_id > 0){
      //==========================================================================================================
      // $query = " SELECT job_category.*, p.category_type as parent_type FROM job_category LEFT JOIN job_category as p ON job_category.parent_id = p.job_category_id where job_category.parent_id > 0 ";
      //==========================================================================================================
        $this->db->select('job_category.*, p.category_type as parent_type');
        $this->db->join('job_category as p', 'job_category.parent_id = p.job_category_id', 'left');
    }
    $this->db->where($where);
    $this->db->where('job_category.is_deleted != 1');
    $query = $this->db->get('job_category', $limit, $offset);
    $result = $query->result_array();
    // print_r($this->db->last_query());    
    $total_rows = $this->db->where($where)->where('is_deleted != 1')->from('job_category')->count_all_results();
    return array('total_rows' => $total_rows, 'data' => $result);
  }



public function getAllEmployer($user_type, $filter, $search, $limit, $offset, $sort){
              
              $where = "1=1";
              if (!empty($filter['industry'])) {
                 $industry = $this->db->escape($filter['industry']);
                  $where .= " AND industry = $industry ";
              }
              if (!empty($filter['corporation'])) {
                  $corporation = $this->db->escape($filter['corporation']);
                  $where .= " AND corporation = $corporation ";
              }
               if(!empty($filter['start_date']) || !empty($filter['end_date'])){
                  $where .= " AND DATE(created_at) BETWEEN '".$filter['start_date']."' AND '".$filter['end_date']."' ";
              }
              if (!empty($search)) {
                  $search = $this->db->escape_like_str($search);
                  $where .= " AND (company_name LIKE '%$search%' OR contact_person_name LIKE '%$search%')";
                }
                if (!empty($sort['column_name']) && !empty($sort['sort_order'])) {
                  $this->db->order_by($sort['column_name'] . ' ' . $sort['sort_order']);
                }
                if(!empty($user_type['admin_id'])){
                  
                  $where .= " AND created_by_admin =".$user_type['admin_id']." ";
              }

                 
//         $sql = "SELECT c.*, (
//         SELECT COUNT(job_id)
//         FROM jobs
//         WHERE company_id = c.company_id
//         ) AS vacancies
//         FROM employer c
//         WHERE c.is_deleted != 1";

// $this->db->where($where);
// $this->db->where('is_deleted !=', 1);
// $this->db->select('c.*, vacancies');
// $result = $this->db->get("($sql) as c", $limit, $offset)->result_array();
$this->db->where($where);
$this->db->where('is_deleted !=', 1);
// $this->db->select('c.*, vacancies');
$result = $this->db->get("view_employer", $limit, $offset)->result_array();
// print_r($this->db->last_query());
$total_rows = $this->db->where($where)->where('is_deleted != 1')->from('view_employer')->count_all_results();
return array('total_rows' => $total_rows, 'data' => $result);

               
  }

public function getEmployerDetail($company_id){
                $this->db->where('company_id', $company_id);
                $res = $this->db->get('employer');
                //  print_r($this->db->last_query());
               return $res->result_array();
               
  }

public function getCompany_kyc($company_id){
                $this->db->where('company_id', $company_id);
                $res = $this->db->get('company_kyc');
                //  print_r($this->db->last_query());
               return $res->result_array();
               
  }

public function deleteEmployer($company_id){



                $this->db->where('company_id', $company_id);

                $this->db->set('is_deleted', '1', FALSE);

             return $result = $this->db->update('employer');    

   }

public function deleteJobCategory($job_category_id){



                $this->db->where('job_category_id', $job_category_id);

                $this->db->set('is_deleted', '1', FALSE);

             return $result = $this->db->update('job_category');    

   }

public function deleteJob($job_id){



                $this->db->where('job_id', $job_id);

                $this->db->set('is_deleted', '1', FALSE);

             return $result = $this->db->update('jobs');    

   }

public function resetPassword($reset_details){

  // print_r($reset_details);die;


                      $this->db->where('token', $reset_details['token']);



                      $this->db->set('updated_at', 'NOW()', FALSE);



                      $query = $this->db->update('employer', $reset_details);                    



                      return $query;

                      
}
public function addUpdateInterview($interview_detail){
  $job_id = $interview_detail['job_id'];
  $employee_id = $interview_detail['employee_id'];
            $this->db->where('job_id', $job_id);
            $this->db->where('employee_id', $employee_id);
            $this->db->order_by('id', 'desc');
            $query = $this->db->get('job_interviews', 1);        

            if ($query->num_rows() > 0) {
                $row = $query->row();
                $this->db->set('is_reschedule',1);
                $this->db->set('is_active', 0);
                $this->db->where('id', $row->id);
                $this->db->update('job_interviews');     
                // print_r($this->db->last_query());die;
              
            }

      $res = $this->db->insert('job_interviews', $interview_detail);
      if($res){
        // print_r($job_id);
        // print_r($employee_id);
        $query = "SELECT *,
        (SELECT email FROM employer WHERE company_id = view_applied_employee.company_id) AS company_email
        FROM view_applied_employee WHERE job_id = '". $job_id."' AND employee_id ='".$employee_id."'";
        return $this->db->query($query)->row();
        // return $for_mail = $this->db->get_where('view_applied_employee', array('job_id' => $job_id,'employee_id' => $employee_id))->row();
        // print_r($this->db->last_query());
        
      }
      // print_r($res);die;

}
public function getInterview($details,$filter, $search, $limit, $offset, $sort) {       
    $where = "1=1";
        if (!empty($search)) {
          $search = $this->db->escape_like_str($search);
          $where .= " AND (vjp.company_name LIKE '%$search%' OR ev.name LIKE '%$search%')";
        }
        if (!empty($sort['column_name']) && !empty($sort['sort_order'])) {
          $this->db->order_by($sort['column_name'], $sort['sort_order']);
        }else{
          // SELECT * FROM `job_interviews` ORDER BY DATE(`interview_date`) = CURDATE() DESC, interview_date
          $this->db->order_by("DATE(ji.interview_date) = CURDATE() DESC, ji.interview_date");
        }

         if(!empty($details['admin_id'])){
                  
                  $where .= " AND ji.created_by_admin = ".$details['admin_id'];
        }
        if (!empty($details['id'])) {
             $where .= " AND ji.id = ".$details['id'];
        }
         if(!empty($details['job_id'])){
             $where .= " AND ji.job_id = ".$details['job_id'];
        }
         if(!empty($details['employee_id'])){
             $where .= " AND ji.employee_id = ".$details['employee_id'];
        }
         if(!empty($filter['start_date']) || !empty($filter['end_date'])){
             $where .= " AND ji.interview_date` BETWEEN '".$filter['start_date']."' AND '".$filter['end_date']."' ";
        }
         if(!empty($filter['filter_by_status'])){
             $where .= " AND ji.status` = '".$filter['filter_by_status']."' ";
        }

    $this->db->select('ji.*, ev.name, ev.skill, vjp.job_title, vjp.company_id, vjp.company_name');
    $this->db->from('job_interviews as ji');
    $this->db->join('view_job_posted as vjp', 'ji.job_id = vjp.job_id', 'inner');
    $this->db->join('employee_view as ev', 'ji.employee_id = ev.employee_id', 'inner');
    $this->db->where($where)->where('ji.is_reschedule !=', 1)->where('ji.is_active !=', 0);
    $query = $this->db->get('',$limit, $offset)->result_array();
    // print_r($this->db->last_query());
    // Total_row count --------------------------------------------------------------------------
    $this->db->select('ji.*, ev.name, ev.skill, vjp.job_title, vjp.company_id, vjp.company_name');
    $this->db->from('job_interviews as ji');
    $this->db->join('view_job_posted as vjp', 'ji.job_id = vjp.job_id', 'inner');
    $this->db->join('employee_view as ev', 'ji.employee_id = ev.employee_id', 'inner');
    $total_rows = $this->db->where($where)->where('ji.is_reschedule !=', 1)->where('ji.is_active !=', 0)->count_all_results();
    return array('total_rows' => $total_rows, 'data' => $query);
}


  public function addUpdateLmia($detail){

  //  $id = $detail['id'] ?? null;
            $job_id = $detail['job_id'] ?? NULL;
            $employee_id = $detail['employee_id'] ?? NULL;
            $this->db->where('job_id', $job_id);
            $this->db->where('employee_id', $employee_id);
            $query = $this->db->get('lmia');        

            if ($query->num_rows() > 0) {
                $row = $query->row();  
                if($row->lmia_status == $detail['lmia_status']){     // If new status and old status are same than return
                  return array('msg' => "Please provide different status, already exist");
                }
                $this->db->where('id', $row->id);
        
                $this->db->set('updated_at', 'NOW()', FALSE);
        
                $res = $this->db->update('lmia', $detail);
                if($res){
                  $query = "SELECT *,
                  (SELECT email FROM employer WHERE company_id=view_applied_employee.company_id) AS company_email 
                  FROM view_applied_employee WHERE job_id = '". $job_id."' AND employee_id ='".$employee_id."'";
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
                                  FROM view_applied_employee WHERE job_id = '". $job_id."' AND employee_id ='".$employee_id."'";
                                  $response = $this->db->query($query)->row();

                                  return array('response' => $response, 'msg' => "Data added successfully");
                                  }
                                  // return "Data added successfully";

                          }  

         

}
public function add_update_jobcategory_fiterlist($parent_id){
   /*
    |------------------------------------------------------------------------------
    | Getting Category Type from job_category table and updating in json List
    |------------------------------------------------------------------------------
    */
    if($parent_id == 0){
    $category_type = $this->db->query("SELECT job_category_id ,category_type FROM `job_category` WHERE is_deleted != 1 AND parent_id = 0")->result_array();
     $category_list = array();
    foreach($category_type as $data){
        $category_list[$data['job_category_id']] = $data['category_type'];
      }
      $category_list_json = json_encode($category_list);
      // print_r($category_list_json);die;
      $this->db->where('id', 8);
      $this->db->set('json', $category_list_json);
      $this->db->set('updated_at', 'NOW()', FALSE);
      $this->db->update('list');
    }
    /*
    |------------------------------------------------------------------------------
    | Getting Category Name from job_category table and updating in json List
    |------------------------------------------------------------------------------
    */
    if($parent_id > 0){
    $category_name = $this->db->query("SELECT DISTINCT  job_category_id,category_name
                                       FROM job_category
                                       WHERE is_deleted != 1 AND category_name IS NOT NULL")->result_array();
    // print_r($category_name);die;
    $category_list = array();
    foreach($category_name as $data){
        $category_list[$data['job_category_id']] = $data['category_name'];
      }
      $category_list_json = json_encode($category_list);
      // print_r($category_list_json);die;
      $this->db->where('id', 2);
      $this->db->set('json', $category_list_json);
      $this->db->set('updated_at', 'NOW()', FALSE);
      $this->db->update('list');
    }
}
public function viewJobsAdmin($filter, $search, $limit, $offset,$sort,$details){
 
    $where = "";

    if (!empty($filter['category_id'])) {
        $category_id = $this->db->escape($filter['category_id']);
        $where .= " AND job_category_id = $category_id";
    }

    if (!empty($filter['job_type'])) {
        $job_type = $this->db->escape($filter['job_type']);
        $where .= " AND job_type IN ($job_type)";
    }

    if (!empty($filter['keyskill'])) {
      // Print each comma-separated value separately
      $keyskills = explode(",", $filter['keyskill']);
      $query = " AND ";
      $conditions = array();
      foreach ($keyskills as $skill) {
        $conditions[] = "keyskill LIKE '%" . $skill . "%'";
      }
      $query .= implode(" OR ", $conditions);
      $where .= $query;
    }

    if (!empty($filter['location'])) {
        $location = $this->db->escape_like_str($filter['location']);
        $where .= " AND location LIKE '%$location%'";
    }
    if (!empty($filter['company_name'])) {
        $company_name = $this->db->escape_like_str($filter['company_name']);
        $where .= " AND company_name = '$company_name'";
    }
    if(!empty($filter['start_date']) || !empty($filter['end_date'])){
            $where .= " AND DATE(created_at) BETWEEN '".$filter['start_date']."' AND '".$filter['end_date']."' ";
       }
    if (!empty($search)) {
        $search = $this->db->escape_like_str($search);
        $where .= " AND (job_title LIKE '%$search%' OR company_name LIKE '%$search%')";
    }
    if(!empty($details['job_id'])){
        $where .= " AND job_id=".$details['job_id']." ";
    }
    // if(!empty($details['admin_id'])){                  
    //     $where .= " AND created_by_admin = ".$details['admin_id'];
    // }
    // if(!empty($details['company_id'])){                  
    //     $where .= " AND company_id = ".$details['company_id'];
    // }
//----------------------------------------------------------------------------------------------------------------
// $this->db->select('vjp.*, 
//     (SELECT COUNT(*) FROM apply_on_job WHERE (vjp.job_id = apply_on_job.job_id) AND (apply_on_job.employee_id = '.$details['employee_id'].') AND apply_on_job.is_viewed != 1) AS is_applied');
// $this->db->from('view_job_posted AS vjp');
// $this->db->where($where);
// $this->db->where('vjp.is_deleted !=', 1);
// $this->db->where('vjp.company_deleted !=', 1);
// $this->db->order_by($sort['column_name'], $sort['sort_order']);
// $this->db->limit($limit, $offset);
// $result = $this->db->get()->result_array();

//----------------------------------------------------------------------------------------------------------------
 $q = "SELECT *
			FROM view_job_posted
			WHERE job_id NOT IN (
			SELECT job_id
			FROM apply_on_job
			WHERE employee_id = ".$details['employee_id']."
			 AND is_viewed = 0)
       AND is_deleted = 0
       AND company_deleted = 0
			".$where." LIMIT ".$limit." OFFSET ".$offset;
$result = $this->db->query($q)->result_array();
//----------------------------------------------------------------------------------------------------------------
    $que = "SELECT *
			FROM view_job_posted
			WHERE job_id NOT IN (
			SELECT job_id
			FROM apply_on_job
			WHERE employee_id = ".$details['employee_id']."
			 AND is_viewed = 0)
       AND is_deleted = 0
       AND company_deleted = 0
			".$where;
$rows = $this->db->query($que)->result_array();
    // $this->db->where($where);
    // $this->db->where('is_deleted != 1');
    // $query = $this->db->get('view_job_posted', $limit, $offset);
    // $result = $query->result_array();
    // print_r($this->db->last_query());
    // $total_rows = $this->db->where($where)->where('is_deleted != 1')->where('company_deleted != 1')->from('view_job_posted')->count_all_results();
    $total_rows =count($rows);
    return array('total_rows' => $total_rows, 'data' => $result);
}

}



