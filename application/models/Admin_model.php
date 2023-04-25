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



public function addUpdateAdmin($admin){

  // print_r($admin['id']);die;

  if (!empty($admin['admin_id'])) {

    // Update operation

                        $this->db->where('admin_id', $admin['admin_id']);

                        $this->db->set('updated_at', 'NOW()', FALSE);

                        $res = $this->db->update('admin', $admin);

                        // print_r($this->db->last_query());

                 

                        return $res;

    } 

    else {

    // Add operation

    $res = $this->db->insert('admin', $admin);

    // print_r($this->db->last_query());

    return $res;

    }           



}



public function addFollowup($followup_detail){



           return $this->db->insert('follow_up', $followup_detail);            



}



public function getFollowup($id){



                $this->db->where('job_id',$id['job_id']);
                $this->db->where('employee_id',$id['employee_id']);
                $res = $this->db->get('follow_up',)->result_array();
                return array('followup'=>$res);



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
              //  if(!empty($details['admin_id'])){                
              //   $where .= " AND created_by_admin = ".$details['admin_id'];                
              // }



              $this->db->where($where);

              $this->db->where('is_deleted !=', 1);

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


  if (!empty($list['id'])) {
    // Update operation
            $this->db->where('id', $list['id']);
            $query = $this->db->get('list');        

            if ($query->num_rows() > 0) {
                $row = $query->row();
                $json_list = json_decode($row->json, true);
                $list_item = $list['json'];
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
public function getFilterList($list_id){

if(!empty($list_id)){

                $this->db->where('id',$list_id);
}

              return $res = $this->db->get('list')->result_array();



                // print_r($this->db->last_query());


  }

public function deleteFilterList($id){
$json_item_id = $id['json_item_id'];
            $this->db->where('id', $id['item_id']);
            $query = $this->db->get('list');        

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
public function getSummaryCounts(){
                      
            $res = array();

            $query = "SELECT COUNT(job_id) as posted_jobs FROM `view_job_posted` WHERE is_active = 1 AND is_deleted != 1";
            $res['posted_jobs'] = $this->db->query($query)->row_array()['posted_jobs'];

            $query = "SELECT COUNT(apply_id) AS total_applicants FROM `view_applied_employee` WHERE is_viewed != 1 AND is_deleted != 1";
            $total_applicants = $this->db->query($query)->row_array()['total_applicants'];

            $query = "SELECT COUNT(apply_id) AS jobs_viewed FROM `view_applied_employee` WHERE is_deleted != 1";
            $jobs_viewed = $this->db->query($query)->row_array()['jobs_viewed'];

            $applied_rate = ($jobs_viewed != 0) ? ($total_applicants / $jobs_viewed * 100) : 0;
            $res['total_applicants'] = $total_applicants;
            $res['jobs_viewed'] = $jobs_viewed;
            $res['applied_rate'] = $applied_rate;

            return $res;


  }
  public function getAllLastFollowup($id){

        $id['admin'] ?? null;

              $query = "SELECT * FROM follow_up WHERE id IN (SELECT MAX(id) FROM follow_up GROUP BY employee_id,job_id) ";

              $res = $this->db->query($query)->result_array();

              $query = "SELECT COUNT(id) AS total_rows FROM follow_up WHERE id IN (SELECT MAX(id) FROM follow_up GROUP BY employee_id,job_id) ";

              $total_rows = $this->db->query($query)->result_array();

              return array('total_rows' => $total_rows, 'data' => $res);



  }


}