<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**

*

*/

class Employer_model extends CI_Model

{



public function get_employer_by_email($email){      

            $this->db->where('email', $email);

            $query = $this->db->get('employer');

            

            if ($query->num_rows() > 0) {

                return $query;

            }

}

public function insert_employer($employer = array()){

            // print_r($employee); die; 

          //  return $this->db->insert('employer', $employer);
            $this->db->insert('employer', $employer);
            $inserted_id = $this->db->insert_id();
            return $inserted_data = $this->db->get_where('employer', array('company_id' => $inserted_id))->row();


}

public function checkLogin($credentials)

{

        $this->db->where($credentials);

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

  // print_r($company_info);die;

    // $company_id = $company_info['company_id'];

   

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

  // print_r($job_detail);die;
if(isset($job_detail['job_id'])){
  // print_r("update");die;
    $job_id = $job_detail['job_id'];              

                          $this->db->select('*');

                          $this->db->where('job_id', $job_id);  

                          $query = $this->db->get('jobs');

                        //   print_r($query);die;  

                          if ($query->num_rows() == 1)  

                          {  

                                  $this->db->where('job_id', $job_id);

                                  $this->db->set('updated_at', 'NOW()', FALSE);

                                  $res = $this->db->update('jobs', $job_detail);

                                  // print_r($this->db->last_query());

                                  return $res;

                          }
                         } else {  
// print_r("insert");die;
                                  $res = $this->db->insert('jobs', $job_detail);
                                  $inserted_id = $this->db->insert_id();
            //                       $query = "SELECT e.company_name,j.job_title 
            //                                 FROM jobs as j 
            //                                 INNER JOIN employer as e 
            //                                 ON j.company_id = e.company_id
            //                                 WHERE j.job_id = $inserted_id";
            // return $inserted_data = $this->db->get_where('employer', array('company_id' => $inserted_id))->row();

                                  // print_r($this->db->last_query());

                                  // return $res;

                                  // $res = $this->db->insert('jobs', $job_detail);
// $inserted_id = $this->db->insert_id();
$query = "SELECT e.company_name, j.job_title 
          FROM jobs as j 
          INNER JOIN employer as e 
          ON j.company_id = e.company_id
          WHERE j.job_id = $inserted_id";
$inserted_data = $this->db->query($query)->row();

// or you can use $this->db->get_where() method instead of $this->db->query()
// $inserted_data = $this->db->select('e.company_name, j.job_title')
//                        ->from('jobs as j')
//                        ->join('employer as e', 'j.company_id = e.company_id')
//                        ->where('j.job_id', $inserted_id)
//                        ->get()
//                        ->row();

// print_r($this->db->last_query());

return $inserted_data;


                          }  

        

}

public function addUpdate_category($category_detail){

  // print_r($category_detail);die;

    // $company_id = $category_detail`['company_id'];

   $job_category_id = $category_detail['job_category_id'] ?? null;

      if (!empty($job_category_id)) {

                                  $this->db->where('job_category_id', $job_category_id);

                                  $this->db->set('updated_at', 'NOW()', FALSE);

                                  return $res = $this->db->update('job_category', $category_detail);


                          } else {  

                                 return $res = $this->db->insert('job_category', $category_detail);

                                  //print_r($this->db->last_query());

                                  // return $res;

                          }  

         

}

public function applyJob($candidate_detail){
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
                          if(isset($row->is_viewed) && $row->is_viewed == 0){
                            // $res = '2';
                                  return "2";
                          }
                          if (!empty($row)){  
                            // print_r(11);die;

                                  $this->db->where('apply_id', $row->apply_id);

                                  $this->db->set('is_viewed', 0);

                                  $this->db->set('updated_at', 'NOW()', FALSE);

                                  $res = $this->db->update('apply_on_job');

                                  // print_r($this->db->last_query());

                                  return $res;

                          }else{
                              // print_r(22);die;
                                 return $res = $this->db->insert('apply_on_job', $candidate_detail);
                          }

                          }  

}

// public function getAppliedCandidateList($job_id){

//                 $this->db->where('job_id', $job_id);

//                 $res = $this->db->get('apply_on_job');

//                 //  print_r($this->db->last_query());

//                return $res->result_array();

  // }
public function viewJobs($filter, $search, $limit, $offset,$sort,$details){
 
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
        $keyskill = $this->db->escape_like_str($filter['keyskill']);
        $where .= "  AND keyskill LIKE '%$keyskill%'";
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
        // $where .= " AND (job_title LIKE '%$search%')";
         $where .= " AND (job_title LIKE '%$search%' OR company_name LIKE '%$search%')";
    }
    if (!empty($sort['column_name']) && !empty($sort['sort_order'])) {
    $this->db->order_by($sort['column_name'] . ' ' . $sort['sort_order']);
    }
    if(!empty($details['job_id'])){
         $where .= " AND job_id=".$details['job_id']." ";
    }
    if(!empty($details['admin_id'])){                  
                  $where .= " AND created_by_admin = ".$details['admin_id'];
    }


    $this->db->where($where);
    $this->db->where('is_deleted != 1');
    $query = $this->db->get('view_job_posted', $limit, $offset);
    $result = $query->result_array();
    // print_r($this->db->last_query());
    $total_rows = $this->db->where($where)->where('is_deleted != 1')->from('view_job_posted')->count_all_results();
    return array('total_rows' => $total_rows, 'data' => $result);
}
      // print_r($filter); die;
      // $filterString = implode("','", $filter);
      // $employee_skill_result=array();
      // $where = "1=1";
      // if(!empty($filter['category_type']))
      // {
      //   $where .= " AND category_type IN ('$filter["category_type"]') ";
      // }
      // if(!empty($filter['job_type']))
      // {
      //   $where .= " AND job_type IN ('$filterString') ";
      // }
      // if(!empty($filter['keyskill']))
      // {
      //   $where .= " AND keyskill IN ('$filterString') ";
      // }
      // if(!empty($filter['location']))
      // {
      //   $where .= " AND location IN ('$filterString') ";
      // }
      // if($where){
      // print_r(1);die;
      //  $this->db->where($where);
      //   // $this->db->like('location', $filter);
      //   return  $this->db->get('view_job_posted')->result_array();
      // }else{
      //    print_r(0);die;
      //      $this->db->select('*');
      //       $this->db->from('view_job_posted');
      //       return $this->db->get()->result_array();
      // }
      // if (!empty($filter['category_type']) || !empty($filter['job_type']) || !empty($filter['keyskill']) || !empty($filter['location'])) 
      // {



      //   $where= '';
      //   foreach($filter as $key=>$val)
      //   {
      //     if($val=="")
      //     {
      //       unset($filter[$key]);
      //     }
        // }    
        // $filterString = implode("','", $filter);
        // $where .= " OR category_type IN ('$filterString')";
        // $where .= " OR job_type IN ('$filterString')";
        // $where .= " OR keyskill IN('$filterString')";
        // $where .= " OR location IN ('$filterString')";
        // $where = ltrim($where,' OR ');
        
       
        // $this->db->where($where);
        // // $this->db->like('location', $filter);
        // return  $this->db->get('view_job_posted')->result_array();
        //  print_r($this->db->last_query());
      // }else if (isset($_GET['employee_id'])) {
      //   // print_r($_GET['employee_id']);die;
      //     $employee_id = $_GET['employee_id'];
      //     $this->db->select('skill');
      //     $this->db->where('employee_id', $employee_id);
      //     $employee_skill_result = $this->db->get('employee_skill')->result_array();

      //     // print_r($employee_skill_result);die;
      //     if(count($employee_skill_result)>0){
      //     $jobs = array();
      //     foreach ($employee_skill_result as $employee_skill) {
      //         $employee_skill_array = explode(',', $employee_skill['skill']);
      //     }
      //     $this->db->select('*');
      //     $this->db->from('view_job_posted');
      //     $result = $this->db->get()->result_array();
      //     usort($result, function($a, $b) use ($employee_skill_array) {
      //         $a_count = count(array_intersect($employee_skill_array, explode(',', $a['keyskill'])));
      //         $b_count = count(array_intersect($employee_skill_array, explode(',', $b['keyskill'])));
      //         return $b_count - $a_count;
      //         // print_r($res); die;
      //     });
      //     }
  //  } else{
            // $this->db->select('*');
            // $this->db->from('view_job_posted');
            // return $this->db->get()->result_array();
    // }  
// print_r($result);die;

// if($result>0)
// {
//   return $result;
// }else{
//   return array();
// }
// }

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

    $where = "parent_id = $parent_id";

    if (!empty($filter)) {
        $category_type = $filter;
        $where .= " AND category_type = '$category_type' ";
    }
    if (!empty($search)) {
        $search = $this->db->escape_like_str($search);
        $where .= " AND (category_name LIKE '%$search%')";
    }
    if (!empty($sort['column_name']) && !empty($sort['sort_order'])) {
    $this->db->order_by($sort['column_name'] . ' ' . $sort['sort_order']);
    }

    $this->db->where($where);
    $this->db->where('is_deleted != 1');
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

              // $this->db->where($where);
              // $this->db->where('is_deleted !=', 1);
              // $result = $this->db->get('employer',$limit, $offset)->result_array();
              // //  return $res->result_array();
              // $total_rows = $this->db->where($where)->where('is_deleted != 1')->from('employer')->count_all_results();
              // return array('total_rows' => $total_rows, 'data' => $result);

                 
        $sql = "SELECT c.*, (
        SELECT COUNT(job_id)
        FROM jobs
        WHERE company_id = c.company_id
        ) AS vacancies
        FROM employer c
        WHERE c.is_deleted != 1";

$this->db->where($where);
$this->db->where('is_deleted !=', 1);
$this->db->select('c.*, vacancies');
// $this->db->from('(' . $sql . ') as c');
// $result = $this->db->get(null, $limit, $offset)->result_array();
$result = $this->db->get("($sql) as c", $limit, $offset)->result_array();
// print_r($this->db->last_query());
$total_rows = $this->db->where($where)->where('is_deleted != 1')->from('employer')->count_all_results();
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
  
            $this->db->where('job_id', $interview_detail['job_id']);
            $this->db->where('employee_id', $interview_detail['employee_id']);
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

      return $this->db->insert('job_interviews', $interview_detail);

}
public function getInterview($details,$filter, $search, $limit, $offset, $sort) {       
    $where = "1=1";
    // if (!empty($filter['industry'])) {
      //     $industry = $this->db->escape($filter['industry']);
      //     $where .= " AND vjp.industry = $industry";
      // }
      // if (!empty($filter['corporation'])) {
        //     $corporation = $this->db->escape($filter['corporation']);
        //     $where .= " AND vjp.corporation = $corporation";
        // }
        if (!empty($search)) {
          $search = $this->db->escape_like_str($search);
          $where .= " AND (vjp.company_name LIKE '%$search%' OR ev.name LIKE '%$search%')";
        }
        if (!empty($sort['column_name']) && !empty($sort['sort_order'])) {
          $this->db->order_by($sort['column_name'], $sort['sort_order']);
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
        // SQL query ---->
        //------------------------------------------------------------------------------------------------------
        // SELECT `ji`.*, `ev`.`name`, `ev`.`skill`, `vjp`.`job_title`, `vjp`.`company_id`, `vjp`.`company_name`
        // FROM `job_interviews` as `ji`
        // INNER JOIN `view_job_posted` as `vjp` ON `ji`.`job_id` = `vjp`.`job_id`
        // INNER JOIN `employee_view` as `ev` ON `ji`.`employee_id` = `ev`.`employee_id`
        // WHERE 1 = 1 AND `ji`.`created_by_admin` = 12
        // AND `ji`.`is_reschedule` != 1
        // AND `ji`.`is_active` != 0
        // LIMIT 10
        //-----------------------------------------------------------------------------------------------------

    $this->db->select('ji.*, ev.name, ev.skill, vjp.job_title, vjp.company_id, vjp.company_name');
    $this->db->from('job_interviews as ji');
    $this->db->join('view_job_posted as vjp', 'ji.job_id = vjp.job_id', 'inner');
    $this->db->join('employee_view as ev', 'ji.employee_id = ev.employee_id', 'inner');
    $this->db->where($where)->where('ji.is_reschedule !=', 1)->where('ji.is_active !=', 0);
    $query = $this->db->get('',$limit, $offset);
    $total_rows = $query->num_rows();
    // print_r($this->db->last_query());
    // $total_rows = $this->db->where('is_active != 0')->where('is_reschedule !=', 1)->from('job_interviews')->count_all_results();
    $res = $query->result_array();
    return array('total_rows' => $total_rows, 'data' => $res);
}


  public function addUpdateLmia($detail){

   $id = $detail['id'] ?? null;

      if (!empty($id)) {

                                  $this->db->where('id', $id);

                                  $this->db->set('updated_at', 'NOW()', FALSE);

                                  return $res = $this->db->update('lmia', $detail);


                          } else {  

                                 return $res = $this->db->insert('lmia', $detail);

                                  //print_r($this->db->last_query());

                                  // return $res;

                          }  

         

}

}



