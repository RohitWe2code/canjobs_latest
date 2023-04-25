<?php







defined('BASEPATH') OR exit('No direct script access allowed');







/**







*







*/







class Employee_model extends CI_Model







{







public function get_employee_by_email($email){







            //  $email = $employee['email'];







    // print_r($email); die;







      







            $this->db->where('email', $email);







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







            $query = $this->db->get('employee');





            if($query->num_rows()==1)







            {







                return $query->row();







            }







            else 







            {







                return false;







            }







}















public function updatePersonal_details($employee_info){







  // print_r($emp_info);die;







  







            if (isset($employee_info['employee_id'])) {







                      // Update operation







                      // print_r("update");die;







                      $this->db->where('employee_id', $employee_info['employee_id']);







                      $this->db->set('updated_at', 'NOW()', FALSE);







                      $query = $this->db->update('employee', $employee_info);                    







                      return $query;







                      } 



              else{



                  // print_r("insert");die;



                 $res = $this->db->insert('employee',$employee_info);







                return $res;



              }







                    







}















public function addEmployee_skill($employee_skill){







            $res = $this->db->insert('employee_skill',$employee_skill);







            return $res;







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







            } 







            else {







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







              }







                else {







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



    // return $result_array = $query->result_array();

    return  array('skill' => $res);



     



} 















  public function getAllemployeeSkill(){







                // Build the query







                $this->db->select('employee_id, GROUP_CONCAT(skill SEPARATOR ", ") AS skills');







                $this->db->group_by('employee_id');







                $res = $this->db->get('employee_skill')->result_array();







                // return $result_array = $query->result_array();

                 return  array('skill' => $res);







         







  }







  public function getAllemployeeView($parameters,$filter, $search, $limit, $offset,$sort){



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







              $this->db->select($parameters['select']);



              $this->db->where($where);



                $this->db->where('is_deleted !=', 1);



                // if(isset($parameters['job_id'])){



                // $this->db->where("employee_id IN(SELECT employee_id FROM apply_on_job WHERE job_id='".$parameters['job_id']."')");

                // // $total_rows = $this->db->where($where)->where('is_deleted != 1')->from('employee_view')->count_all_results();

                // }



                $result = $this->db->get('employee_view',$limit, $offset)->result_array();



                // print_r($this->db->last_query());



                // return $res->result_array();



                  $total_rows = $this->db->where($where)->where('is_deleted != 1')->from('employee_view')->count_all_results();



                return array('total_rows' => $total_rows ?? null, 'data' => $result);              



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
                // $this->db->where("job_id",$parameters['job_id']);                
              }
              if(isset($parameters['admin_id'])){
                
                
                $where .= " AND created_by_admin = ".$parameters['admin_id'];
                // $this->db->where("job_id",$parameters['job_id']);                
              }
              
              $this->db->select($parameters['select']);

              
              
              
              $this->db->where('is_deleted !=', 1);
              
              
              
              
              $this->db->where($where);

              $result = $this->db->get('view_applied_employee',$limit, $offset)->result_array();
                
                // print_r($this->db->last_query());


                // return $res->result_array();



                $total_rows = $this->db->where($where)->where('is_deleted != 1')->from('view_applied_employee')->count_all_results();



                return array('total_rows' => $total_rows ?? null, 'data' => $result);              



  }


}











