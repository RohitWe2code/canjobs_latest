<?php







defined('BASEPATH') OR exit('No direct script access allowed');







/**







*







*/







class Employee_model extends CI_Model







{







public function get_employee_by_email($email){





            $this->db->where('email', $email);

            $this->db->where('is_deleted != 1');

            $query = $this->db->get('employee');      

            if ($query->num_rows() > 0) {



                return $query;


            }

}
public function insert_employee($employee = array()){



            // return $this->db->insert('employee', $employee);
            $this->db->insert('employee', $employee);
            $inserted_id = $this->db->insert_id();
            return $inserted_data = $this->db->get_where('employee', array('employee_id' => $inserted_id))->row();

}


public function checkLogin($credentials)

{
            $this->db->where($credentials);
            $this->db->where('is_deleted = 0');
            $query = $this->db->get('employee_view');
            if($query->num_rows()==1)
            {
                return $query->row();
            }
            else{
                return false;
            }
}
public function updatePersonal_details($employee_info, $permission=NULL){
  // print_r($employee_info);die;
            if (isset($employee_info['employee_id'])) {
                      // Update operation
                      // print_r("update");die;
                      $this->db->where('employee_id', $employee_info['employee_id']);
                      $this->db->set('updated_at', 'NOW()', FALSE);
                      $query = $this->db->update('employee', $employee_info);               
                      return $query;
            }else{
                  // print_r("insert");die;
                 $res = $this->db->insert('employee',$employee_info);
                 $last_insert_id = $this->db->insert_id();
                  if($res && !empty($last_insert_id)){
                      // Creating default email and notification permission
                      $employee_permission = array(
                        'employee_id'=>$last_insert_id,
                        'email_permission'=> json_encode($permission->email_permission),
                        'notification_permission'=> json_encode($permission->notification_permission)
                      );
                      $this->db->insert('employee_setting', $employee_permission);

              }
                return $res;
              }       
}
public function addEmployee_skill($employee_skill){
  // print_r($employee_skill);die;
            $this->db->where('employee_id', $employee_skill['employee_id']);
            $this->db->where('skill', $employee_skill['skill']);
            $query = $this->db->get('employee_skill');
            if($query->num_rows() > 0){
              return 1;
            }else{
              $res = $this->db->insert('employee_skill',$employee_skill);
              return $res;
              }
} 
public function addUpdate_career($career_info){
            // print_r($career_info);die;
            if (!empty($career_info['career_id'])) {
            // $emp_id = $emp_info['employee_id'];
            // Update operation
                                $this->db->where('career_id', $career_info['career_id']);
                                $this->db->set('updated_at', 'NOW()', FALSE);
                                $res = $this->db->update('employee_career', $career_info);
                                // print_r($this->db->last_query());                
                                return $res;
            } else {
            // Add operation
            $res = $this->db->insert('employee_career', $career_info);
            // print_r($this->db->last_query());
            return $res;
            }
}
public function addUpdate_education($education_info){
            // print_r($education_info);die;
            if (!empty($education_info['education_id'])) {
                // Update operation
                    $this->db->where('education_id', $education_info['education_id']);
                    $this->db->set('updated_at', 'NOW()', FALSE);
                    $res = $this->db->update('employee_education', $education_info);
                    // print_r($this->db->last_query());
                    return $res;
              } else {
                // Add operation
                $res = $this->db->insert('employee_education', $education_info);
                // print_r($this->db->last_query());
                return $res;
                }
}
public function get_employee($employee_id){    
                $this->db->where('employee_id', $employee_id);
                $res = $this->db->get('employee')->result_array();
                //  print_r($this->db->last_query());
            //   return $res->result_array();
return  array('employee' => $res);
  }
public function get_allEmployee(){    
               $res = $this->db->get('employee');
                // print_r($this->db->last_query());
                return $res->result_array(); 
  }
public function get_employeeCareer($employee_id){
                $this->db->where('employee_id', $employee_id);
                $res = $this->db->get('employee_career')->result_array();
                //  print_r($this->db->last_query());
            //   return $res->result_array();
                return  array('career' => $res);    
  }
public function getAllEmployeeCareer(){
                // $this->db->where('employee_id', $employee_id);
                $res = $this->db->get('employee_career');
                //  print_r($this->db->last_query());
               return $res->result_array();      
  }
public function get_employeeEducation($employee_id){
                $this->db->where('employee_id', $employee_id);
                $res = $this->db->get('employee_education')->result_array();
                //  print_r($this->db->last_query());
                return  array('education' => $res);
            //   return $res->result_array();          
  }
public function getAllEmployeeEducation(){
                // $this->db->where('employee_id', $employee_id);
                $res = $this->db->get('employee_education')->result_array();
//  array('total_rows' => $total_rows, 'data' => $result);
                return  array('data' => $res);        
  }
  public function getEmployeeSkill($employee_id){     

    // $this->db->select('employee_id, GROUP_CONCAT(skill SEPARATOR ", ") AS skills');
    $this->db->where('employee_id', $employee_id);
    // $this->db->group_by('employee_id');
    $res = $this->db->get('employee_skill')->result_array();
    return  array('skill' => $res);   
} 
  public function getAllemployeeSkill(){
                $this->db->select('employee_id, GROUP_CONCAT(skill SEPARATOR ", ") AS skills');
                $this->db->group_by('employee_id');
                $res = $this->db->get('employee_skill')->result_array();
                // return $result_array = $query->result_array();
                 return  array('skill' => $res);  
  }
  public function getAllemployeeView($parameters,$filter, $search, $limit, $offset, $sort, $recommended){
// print_r($parameters);
              $where = "1=1";
              if (!empty($filter['experience'])) {
                 $experience = $this->db->escape($filter['experience']);
                  $where .= " AND experience IN ($experience)";
              }
              if (!empty($filter['skill'])) {
                  // $skill = $this->db->escape_like_str($filter['skill']);
                  // $where .= " AND skill LIKE '%$skill%' ";
                   $keyskills = explode(",", $filter['skill']);
                    $query = " AND (";
                    $conditions = array();
                    foreach ($keyskills as $skill) {
                      $conditions[] = "skill LIKE '%" . $skill . "%'";
                    }
                    $query .= implode(" OR ", $conditions);
                    // $keyskill = $this->db->escape_like_str($filter['keyskill']);
                    // $where .= "  AND keyskill LIKE '%$keyskill%'";
                    $where .= $query.")";
              }
              if (!empty($filter['education'])) {
                  $education = $this->db->escape_like_str($filter['education']);
                  $where .= " AND education LIKE '%$education%'";
              }
              if (!empty($filter['work_permit_canada'])) {
                  $work_permit_canada = $this->db->escape_like_str($filter['work_permit_canada']);
                  $where .= " AND work_permit_canada LIKE '%$work_permit_canada%'";
              }
              if (!empty($filter['interested_in'])) {
                  $interested_in = $this->db->escape_like_str($filter['interested_in']);
                  $where .= " AND interested_in LIKE '%$interested_in%'";
              }
              if (isset($filter['status']) && ($filter['status'] >= 0)) {
                  $status = $this->db->escape_like_str($filter['status']);
                  $where .= " AND status = '$status'";
              }else if(isset($filter['status']) && ($filter['status'] == -1)){
                $where .= " AND status != 0";
              }
              if(!empty($filter['start_date']) || !empty($filter['end_date'])){
                  $where .= " AND DATE(created_at) BETWEEN '".$filter['start_date']."' AND '".$filter['end_date']."' ";
              }
              if (!empty($search)) {
                  $search = $this->db->escape_like_str($search);
                  $where .= " AND (name LIKE '%$search%')";
              }
              if (!empty($sort['column_name']) && !empty($sort['sort_order'])) {
              $this->db->order_by($sort['column_name'] . ' ' . $sort['sort_order']);
              }
                if(!empty($parameters['admin_id'])){                  
                  $where .= " AND created_by_admin = ".$parameters['admin_id'];
              }
              //    if(isset($parameters['admin_id']) || isset($parameters['company_id'])){
                  
              //     $where .= " AND status != 0";
              // }
              $this->db->select($parameters['select']);
              $this->db->where($where);
              $this->db->where('is_deleted =', 0);
                if(isset($parameters['job_id'])){
                $this->db->where("employee_id NOT IN(SELECT employee_id FROM apply_on_job WHERE job_id='".$parameters['job_id']."')");
                // $total_rows = $this->db->where($where)->where('is_deleted != 1')->from('employee_view')->count_all_results();
                }
                // print_r($where);die;
                $this->db->limit($limit, $offset);
                $records = $this->db->get('employee_view')->result_array();
                // print_r($this->db->last_query());
                // print_r($records);die;

                if(!empty($recommended) && !empty($records['skill'])){
                  $providedSkills = explode(',', strtolower($recommended['job_skills']));
                   $recordSkills = $records['skill'];
                  function compareSkills($recordSkills, $providedSkills) {
                      $recordSkillsArray = array_map('trim', explode(',', strtolower($recordSkills)));
                      $matchedSkillsCount = count(array_intersect($recordSkillsArray, $providedSkills));
                      // print_r($matchedSkillsCount);die;
                      return $matchedSkillsCount * -1; // Multiply by -1 to sort in descending order
                  }
                  // Sort the Records
                  usort($records, function ($a, $b) use ($providedSkills) {
                      $aPriority = compareSkills($a['skill'], $providedSkills);
                      $bPriority = compareSkills($b['skill'], $providedSkills);
                      return $aPriority - $bPriority;
                  });
                }
                  $total_rows = $this->db->where($where)->where('is_deleted != 1')->from('employee_view')->count_all_results();



                return array('total_rows' => $total_rows ?? null, 'data' => $records);              
  }
    public function deleteEmployee($employee_id){
              $this->db->where('employee_id', $employee_id);
              $this->db->set('is_deleted', '1', FALSE);
             return $result = $this->db->update('employee');
   }
   public function deleteCareer($career_id){
                $this->db->where("career_id", $career_id);
                return $this->db->delete("employee_career");
   }
   public function deleteEducation($education_id){
                $this->db->where("education_id", $education_id);
                return $this->db->delete("employee_education");
   }
   public function deleteSkill($skill_id){
                $this->db->where("skill_id", $skill_id);
                return $this->db->delete("employee_skill");
   }
   public function getcountryList(){
                $res = $this->db->get('countries')->result_array();
                return  array('countries' => $res);
  }
   public function getStateList($country_id){    



    $this->db->where('country_id', $country_id);



    $res = $this->db->get('states')->result_array();



    return  array('state' => $res);

} 

   public function getCityList($state_id){             



    $this->db->where('state_id', $state_id);



    $res = $this->db->get('cities')->result_array();



    return  array('cities' => $res);



} 

public function resetPassword($reset_details){

  // print_r($reset_details);die;


                      $this->db->where('token', $reset_details['token']);



                      $this->db->set('updated_at', 'NOW()', FALSE);



                      $query = $this->db->update('employee', $reset_details);                    



                      return $query;

                      
}
public function getJobResponse($parameters,$filter, $search, $limit, $offset,$sort){
              $where = "1=1";
              if (!empty($filter['experience'])) {
                 $experience = $this->db->escape($filter['experience']);
                  $where .= " AND experience IN ($experience)";
              }
              if (!empty($filter['skill'])) {
                  $skill = $this->db->escape_like_str($filter['skill']);
                  $where .= " AND skill LIKE '%$skill%' ";
              }
              if (!empty($filter['education'])) {
                  $education = $this->db->escape_like_str($filter['education']);
                  $where .= " AND education LIKE '%$education%'";
              }
              if (!empty($filter['lmia_status'])) {
                  $lmia_status = $this->db->escape_like_str($filter['lmia_status']);
                  $where .= " AND lmia_status LIKE '%$lmia_status%'";
              }
              if (isset($filter['employee_status'])) {
                if($filter['employee_status'] == 0){
                  // $employee_status = $this->db->escape_like_str($filter['employee_status']);
                  $where .= " AND employee_status  = 0 ";
                }
                if($filter['employee_status'] == 1){                  
                  // $employee_status = $this->db->escape_like_str($filter['employee_status']);
                  $where .= " AND employee_status > 0 ";
                }
              }
              if (!empty($filter['employee_id'])) {
                  $employee_id = $this->db->escape_like_str($filter['employee_id']);
                  $where .= " AND ae.employee_id LIKE '%$employee_id%'";
              }
              if (isset($filter['is_reserve'])) {
                  $is_reserve = $this->db->escape_like_str($filter['is_reserve']);
                  $where .= " AND is_reserve LIKE '%$is_reserve%'";
              }
              if (!empty($filter['job_status'])) {
                  $job_status = $this->db->escape_like_str($filter['job_status']);
                  $where .= " AND job_status LIKE '%$job_status%'";
              }
                if(!empty($filter['start_date']) || !empty($filter['end_date'])){
                  $where .= " AND DATE(created_at) BETWEEN '".$filter['start_date']."' AND '".$filter['end_date']."' ";
              }
              if (!empty($search)) {
                  $search = $this->db->escape_like_str($search);
                  $where .= " AND (name LIKE '%$search%') OR (company_name LIKE '%$search%')";
              }



              if (!empty($sort['column_name']) && !empty($sort['sort_order'])) {



              $this->db->order_by($sort['column_name'] . ' ' . $sort['sort_order']);



              }

              if(isset($parameters['job_id'])){                
                
                $where .= " AND job_id = ".$parameters['job_id']." ";
                              
              }
              if(isset($parameters['admin_id'])){                
                
                $where .= " AND job_created_by_admin = ".$parameters['admin_id'];
                            
              }
              
              $this->db->select($parameters['select']);
              $this->db->from('view_applied_employee AS ae');
              $this->db->join('employee_visa AS ev', 'ev.employee_id = ae.employee_id AND ev.is_active = 1', 'LEFT');              
              $this->db->where('ae.is_deleted = ', 0);
              // $this->db->where('ae.lmia_active = ', 1);
              // $this->db->where('ev.is_active = ', 1);
              $this->db->where($where);
              $this->db->group_by('apply_id');
              $this->db->limit($limit, $offset);              
              $result = $this->db->get()->result_array();
              
              
              

              // $result = $this->db->get('view_applied_employee',$limit, $offset)->result_array();
                
                // print_r($this->db->last_query());die;
                // return $res->result_array();



                $total_rows = $this->db->where($where)->where('is_deleted != 1')->from('view_applied_employee as ae')->count_all_results();



                return array('total_rows' => $total_rows ?? null, 'data' => $result);              



  }
public function getProfileCompletePercent(){


                $res = $this->db->query("SELECT *, personal+education+Career+skill AS total 
                                        FROM view_employee_profile_percentage")->result_array();


                return $res;


  }
  public function getJobsByEmployee($info){  
//-------------------------------------------------------------------
// sql query (old)
// ------------------------------------------------------------------
// $query = "SELECT vjp.*, (SELECT lmia_status from lmia WHERE employee_id = ".$info['employee_id'].") AS employee_lmia_status
// FROM view_job_posted vjp 
// WHERE EXISTS (
//   SELECT 1
//   FROM apply_on_job aoj
//   WHERE aoj.employee_id = ".$info['employee_id']."
//   AND aoj.job_id = vjp.job_id AND aoj.is_viewed != 1
// )
// AND is_deleted = 0 AND company_deleted = 0";
//------------------------------------------------------------------
$query = "SELECT vjp.*, lmia.id, lmia.lmia_status AS employee_lmia_status
FROM view_job_posted vjp 
INNER JOIN apply_on_job aoj on aoj.job_id  = vjp.job_id
LEFT JOIN lmia ON lmia.apply_id = aoj.apply_id
WHERE EXISTS (
  SELECT 1
  FROM apply_on_job aoj
  WHERE aoj.employee_id = ".$info['employee_id']."
  AND aoj.job_id = vjp.job_id AND aoj.is_viewed != 1
)
AND is_deleted = 0 AND company_deleted = 0";
return $this->db->query($query)->result_array();
//------------------------------------------------------------------
    // $this->db->select('vjp.*');
    // $this->db->from('view_job_posted vjp');
    // $this->db->where('EXISTS (SELECT 1 FROM apply_on_job aoj WHERE aoj.employee_id = '.$info['employee_id'].' AND aoj.job_id = vjp.job_id AND aoj.is_viewed != 1)');
    // $this->db->where('vjp.is_deleted !=', 1);
    // $this->db->where('vjp.company_deleted !=', 1);
  //  return $result = $this->db->get()->result_array();

} 
public function documentsUpload($id, $file_info){
  // print_r($file_info);die;
            if (!empty($id)) {
                      // Update operation
                      $this->db->where('id', $id);
                      $this->db->set('updated_at', 'NOW()', FALSE);
                      $query = $this->db->update('employee_documents', $file_info);                    
                      return $query;
                      } 
              else{
                $employee_id = $file_info['employee_id'];
                // $type = $file_info['type'];
                $document_type = $file_info['type'];
                $this->db->where('employee_id', $employee_id);
                $this->db->where('type', $document_type);
                $query = $this->db->get('employee_documents');  
              if ($query->num_rows() > 0) {
                $row_id = $query->row_array()['id'];
                // print_r($row_id);die;
                  $this->db->where('id', $row_id);
                  $this->db->set('updated_at', 'NOW()', FALSE);
                  $query = $this->db->update('employee_documents', $file_info);                    
                  return $query;
              }else{
                // print_r("insert");die;
                $res = $this->db->insert('employee_documents',$file_info);
                return $res;
              }
              }
}
public function get_documents_uploaded($id, $details=null){

        $employee_id =  $details['employee_id'] ?? NULL;
        $type =  $details['type'] ?? NULL;
      // print_r($employee_id);die;


            if(!empty($id)){
              $this->db->where('id', $id);
            }
            if(!empty($employee_id)){
              $this->db->where('employee_id', $employee_id);
            }
            if(!empty($type)){
              $this->db->where('type', $type);
            }
            $this->db->select(" *, 
                              CASE
                                WHEN employee_documents.created_type = 'super-admin' THEN (SELECT name FROM admin WHERE admin_id = employee_documents.created_by)
                                  WHEN employee_documents.created_type = 'employee' THEN (select name FROM employee WHERE employee_id = employee_documents.created_by)
                                  WHEN employee_documents.created_type = 'company' THEN (SELECT company_name FROM employer WHERE company_id = employee_documents.created_by)
                              END AS created_by_name,
                              CASE
                                WHEN employee_documents.updated_type = 'super-admin' THEN (SELECT name FROM admin WHERE admin_id = employee_documents.updated_by)
                                  WHEN employee_documents.updated_type = 'employee' THEN (select name FROM employee WHERE employee_id = employee_documents.updated_by)
                                  WHEN employee_documents.updated_type = 'company' THEN (SELECT company_name FROM employer WHERE company_id = employee_documents.updated_by)
                              END AS updated_by_name");
            $query = $this->db->get('employee_documents');      
            //  print_r($this->db->last_query());
/*
||--------------------------------------------------------------------------------------------------------------------
            SQL Query
||--------------------------------------------------------------------------------------------------------------------
SELECT *, 
CASE
	WHEN employee_documents.created_type = 'super-admin' THEN (SELECT name FROM admin WHERE admin_id = employee_documents.created_by)
    WHEN employee_documents.created_type = 'employee' THEN (select name FROM employee WHERE employee_id = employee_documents.created_by)
    WHEN employee_documents.created_type = 'company' THEN (SELECT company_name FROM employer WHERE company_id = employee_documents.created_by)
END AS created_by_name,
CASE
	WHEN employee_documents.updated_type = 'super-admin' THEN (SELECT name FROM admin WHERE admin_id = employee_documents.updated_by)
    WHEN employee_documents.updated_type = 'employee' THEN (select name FROM employee WHERE employee_id = employee_documents.updated_by)
    WHEN employee_documents.updated_type = 'company' THEN (SELECT company_name FROM employer WHERE company_id = employee_documents.updated_by)
END AS updated_by_name
 FROM `employee_documents`
||--------------------------------------------------------------------------------------------------------------------
*/
            // if ($query->num_rows() > 0 && $query->num_rows() < 2) {
            //     return $query->row_array();
            // }
            // if ($query->num_rows() >= 2) {
                return $query->result_array();
            // }

}
 public function delete_document_uploaded($id){

                $this->db->where("id", $id);
                return $this->db->delete("employee_documents");

   }
  public function add_update_visa($id, $detail){

  if(!empty($id)){
     $this->db->where('id', $id);
                      $this->db->set('updated_at', 'NOW()', FALSE);
                      $query = $this->db->update('employee_visa', $detail);                    
                      return $res = array("msg" => "visa updated successfully",
                                          "result" => $query);
                      } 
              else{
                  $employee_id = $detail['employee_id'];
                  $status = $detail['status'] ?? NULL;
                  $newCountry = $detail['country'] ?? NULL;
                // $type = $file_info['type'];
                // $document_url = $detail['document_url'];
                $this->db->where('employee_id', $employee_id);
                $this->db->where('status', $status);
                $query = $this->db->get('employee_visa');
              if (($query->num_rows() > 0) && ($query->row_array()['country'] == $newCountry)) {
                $row_id = $query->row_array()['id'];
                // print_r($row_id);die;
                  $this->db->where('id', $row_id);
                  $this->db->set('updated_at', 'NOW()', FALSE);
                  $query = $this->db->update('employee_visa', $detail);                    
                  return $res = array("msg" => "visa updated successfully",
                                          "result" => $query);
              }else{
                // print_r("insert");die;
                $query = $this->db->insert('employee_visa',$detail);
                return $res = array("msg" => "visa inserted successfully",
                                          "result" => $query);              }
                //  $res = $this->db->insert('employee_visa',$detail);
                // return $res;
              }
}
public function get_visa($filter, $search, $limit, $offset, $sort, $details){
 
    $where = "";

    if (!empty($filter['visa_status'])) {
        $visa_status = $this->db->escape($filter['visa_status']);
        $where .= " AND ev.status = $visa_status";
    }
    if (!empty($filter['visa_country'])) {
        $visa_country = $this->db->escape($filter['visa_country']);
        $where .= " AND ev.country = $visa_country";
    }
    if (!empty($filter['interested_in'])) {
        $interested_in = $this->db->escape($filter['interested_in']);
        $where .= " AND interested_in = $interested_in";
    }
    if (!empty($filter['employee_id'])) {
        $employee_id = $this->db->escape($filter['employee_id']);
        $where .= " AND em.employee_id = $employee_id";
    }

    if (!empty($filter['job_id'])) {
        $job_id = $this->db->escape($filter['job_id']);
        $where .= " AND job_id IN ($job_id)";
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
        // print_r($order);die;
    if(!empty($filter['start_date']) || !empty($filter['end_date'])){
            $where .= " AND DATE(created_at) BETWEEN '".$filter['start_date']."' AND '".$filter['end_date']."' ";
       }
    if (!empty($search)) {
        $search = $this->db->escape_like_str($search);
        $where .= " AND (name LIKE '%$search%')";
    }
    // if(!empty($details['job_id'])){
    //     $where .= " AND job_id=".$details['job_id']." ";
    // }
    // print_r($details);
    if(!empty($details['admin_id'])){                  
        $where .= " AND created_by_admin = ".$details['admin_id'];
    }
    // if(!empty($details['company_id'])){                  
    //     $where .= " AND company_id = ".$details['company_id'];
    // }
    $q = "SELECT em.*, ev.id AS visa_id, ev.employee_id AS visa_employee_id, ev.status AS visa_status, ev.country AS visa_country, ev.created_at AS visa_created_at, ev.updated_at AS visa_updated_at FROM employee em LEFT JOIN employee_visa ev ON em.employee_id = ev.employee_id WHERE em.is_deleted = 0 AND em.employee_id IN (SELECT employee_id FROM apply_on_job WHERE apply_on_job.is_reserve = 1 AND apply_on_job.is_viewed != 1 GROUP BY employee_id HAVING COUNT(*) > 0)
			".$where." ".$order." LIMIT ".$limit." OFFSET ".$offset;
    $result = $this->db->query($q)->result_array();
//----------------------------------------------------------------------------------------------------------------
    $que = "SELECT em.*, ev.id AS visa_id, ev.employee_id AS visa_employee_id, ev.status AS visa_status, ev.country AS visa_country, ev.created_at AS visa_created_at, ev.updated_at AS visa_updated_at FROM employee em LEFT JOIN employee_visa ev ON em.employee_id = ev.employee_id WHERE em.is_deleted = 0 AND em.employee_id IN (SELECT employee_id FROM apply_on_job WHERE apply_on_job.is_reserve = 1 AND apply_on_job.is_viewed != 1 GROUP BY employee_id HAVING COUNT(*) > 0)
			".$where;
    $rows = $this->db->query($que)->result_array();
    // print_r($this->db->last_query());
    $total_rows = count($rows);
    return array('total_rows' => $total_rows, 'data' => $result);
}
public function set_employee_reserve($detail){
      // Checking if employee already reserved
      if($detail['is_reserve'] > 0){
                $employee_id = $detail['employee_id'];
    
                $this->db->where('employee_id', $employee_id);
                $this->db->where('is_viewed = 0');
                $this->db->where('is_reserve = 1');
                $query = $this->db->get('apply_on_job'); 

              if ($query->num_rows() > 0) {
                // $row_id = $query->row_array();
                // print_r($row_id);die;  
                $msg = "already reserved";                  
                  return $msg;
              }
            }  
            // If not reserve than reserve          
                // print_r("no data found");die;
                $apply_id = $detail['apply_id'];
                $this->db->where('apply_id', $apply_id);
                $this->db->set('updated_at', 'NOW()', FALSE);
                $query = $this->db->update('apply_on_job', $detail);
                // print_r($this->db->last_query());die;
                $msg ="Successfully";
                return $msg;
}
public function remove_employee_reserve($detail){
      $employee_id = $detail['employee_id'];
      $apply_id = $detail['apply_id'];
      
      // remove from is_reserve
      // $this->db->where('employee_id',$employee_id);
      $this->db->where('apply_id',$apply_id);
      $this->db->set('updated_at', 'NOW()', FALSE);
      $this->db->set('is_reserve', 0);
      $query = $this->db->update('apply_on_job');
      if($query){
      // delete lmia
      // $this->db->where('employee_id',$employee_id);
      $this->db->where('apply_id',$apply_id);
      $this->db->set('is_active', 0);
      $this->db->set('updated_at', 'NOW()', FALSE);
      $query = $this->db->update('lmia');
      // return $this->db->delete('lmia'); 
      }     
      if($query){
      // delete employee visa
      // $this->db->where('employee_id',$employee_id);
      $this->db->where('employee_id',$employee_id);
      $this->db->set('is_active', 0);
      $this->db->set('updated_at', 'NOW()', FALSE);
      return $this->db->update('employee_visa');
      }     
}
public function update_employee_setting($employee_id, $details){
      $this->db->where('employee_id',$employee_id);
      $query = $this->db->get('employee_setting');
       if ($query->num_rows() > 0) {
                $row_id = $query->row_array()['id'];
                // print_r($row_id);die; 
                $this->db->where('id', $row_id);
                $this->db->set('updated_at', 'NOW()', FALSE);
                return $this->db->update('employee_setting', $details);
                // $msg = "updated successfully";                  
                //   return $msg;
        }else{
          $details['employee_id'] = $employee_id;
          return $this->db->insert('employee_setting', $details);
        }
}
public function get_employee_setting($employee_id){
  $this->db->where('employee_id', $employee_id);
  return $this->db->get('employee_setting')->row_array();
}
}











