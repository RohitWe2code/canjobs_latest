<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Setting_model extends CI_Model
{
    public function update_parent_setting($details){
      $this->db->where('type',$details['type']);
      $query = $this->db->get('parent_setting');
       if ($query->num_rows() > 0) {
                $row_id = $query->row_array()['id'];
                // print_r($row_id);die; 
                $this->db->where('id', $row_id);
                $this->db->set('updated_at', 'NOW()', FALSE);
                return $this->db->update('parent_setting', $details);
        }else{
        //   $details['admin_id'] = $admin_id;
          return $this->db->insert('parent_setting', $details);
        }
    }
    public function get_parent_setting($details){
    $this->db->where('type', $details['type']);
    // $this->db->select('admin_id, name, admin_type, is_active, is_deleted, email_permission');
    return $this->db->get('parent_setting')->row_array();
    }
}