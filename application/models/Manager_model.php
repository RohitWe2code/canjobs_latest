<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Manager_model extends CI_Model
{
    public function add_update_team($id, $parent_id){
        $this->db->where('admin_id', $id);
        $this->db->set('parent_id', $parent_id);
        $this->db->set('updated_at', 'NOW()', FALSE);
        return $this->db->update('admin');
    }
    public function get_team($manager_id, $offset, $limit){
        $where = " admin_type = 'executive' AND (parent_id = 0 OR parent_id = $manager_id) ";
        // $this->db->where('parent_id', $manager_id);
        $this->db->where($where);
        $this->db->where('is_deleted = 0 ');
        $this->db->limit( $limit, $offset);
        $result = $this->db->get('admin')->result_array();
        $total_rows = $this->db->where($where)->where('is_deleted = 0 ')->from('admin')->count_all_results();
        return array('total_rows' => $total_rows, 'data' => $result);
    }
     public function delete_team_member($id){
        $this->db->where('admin_id', $id);
        $this->db->set('parent_id', 0);
        $this->db->set('updated_at', 'NOW()', FALSE);
        return $this->db->update('admin');
    }
}