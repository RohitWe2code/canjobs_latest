<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Agent_model extends CI_Model
{
    public function add_update_agent($id, $agent_details){

        // $this->db->where('admin_id', $id);
        // $this->db->set('updated_at', 'NOW()', FALSE);
        $insert = $this->db->insert('agent', $agent_details);
        if($insert){
            $lastInsertedId = $this->db->insert_id();
            $this->db->select("CONCAT(UPPER(SUBSTRING(name,1,1)),'-',id) AS u_id");
            $this->db->where('id', $lastInsertedId);
            $u_id = $this->db->get('agent')->row_array();
            // print_r($insert);die;
            $this->db->where('id', $lastInsertedId);
            $this->db->set('u_id', $u_id['u_id']);
            return $this->db->update('agent');
        }
    }
    public function get_agent($id, $offset, $limit){
        // $where = " admin_type = 'executive' AND (parent_id = 0 OR parent_id = $manager_id) ";
        // $this->db->where('parent_id', $manager_id);
        $where = " 1 = 1 ";
        if(!empty($id)){
            $where .= " AND id = ".$id;
        }
        $this->db->where($where);
        $this->db->where(' is_deleted = 0 ');
        $this->db->limit( $limit, $offset);
        $result = $this->db->get('agent')->result_array();
        $total_rows = $this->db->where($where)->where('is_deleted = 0 ')->from('agent')->count_all_results();
        return array('total_rows' => $total_rows, 'data' => $result);
    }
     public function delete_team_member($id){
        $this->db->where('admin_id', $id);
        $this->db->set('parent_id', 0);
        $this->db->set('updated_at', 'NOW()', FALSE);
        return $this->db->update('admin');
    }
}