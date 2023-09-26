<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Agent_model extends CI_Model
{
    public function add_update_agent($id, $agent_details){
        if(!empty($id)){
            $this->db->where('id', $id);
            $this->db->set('updated_at', 'NOW()', FALSE);
            $insert = $this->db->update('agent', $agent_details);
            $this->writeJsonFile();
            return $insert;
        }
    
        $insert = $this->db->insert('agent', $agent_details);
        $error = $this->db->error();
             if ($error['code'] == 1062) {
                // DATABASE ERROR : Handle the duplicate entry error.
                return $message = "Duplicate entry. Email already exists";
                } 
        if($insert){
            $lastInsertedId = $this->db->insert_id();
            $this->db->select("CONCAT(UPPER(SUBSTRING(name,1,1)),'-',id) AS u_id");
            $this->db->where('id', $lastInsertedId);
            $u_id = $this->db->get('agent')->row_array();
            // print_r($insert);die;
            $this->db->where('id', $lastInsertedId);
            $this->db->set('u_id', $u_id['u_id']);
            $update = $this->db->update('agent');
            $this->writeJsonFile();
            return $update;
        }
    }
    public function get_agent($id, $search, $sort, $offset, $limit){
        
        $where = " 1 = 1 ";
        if(!empty($id)){
            $where .= " AND id = ".$id;
        }
        if(!empty($search)){
            $where .= " AND ((name LIKE '%$search%') OR (u_id LIKE '%$search%')) ";
        }
        
        $this->db->where($where);
        $this->db->where(' is_deleted = 0 ');
        $this->db->order_by($sort['column_name'], $sort['sort_order']);
        $this->db->limit( $limit, $offset);
        $result = $this->db->get('agent')->result_array();
        // print_r($this->db->last_query());die;
        $total_rows = $this->db->where($where)->where('is_deleted = 0 ')->from('agent')->count_all_results();
        return array('total_rows' => $total_rows, 'data' => $result);
    }
     public function delete_agent($id){
        $this->db->where('id', $id);
        $this->db->set('is_deleted', 1);
        $this->db->set('updated_at', 'NOW()', FALSE);
        return $this->db->update('agent');
    }
    public function writeJsonFile(){
        $this->db->select('id, u_id, name');
        $this->db->where('is_deleted = 0 ');
        $array_list = $this->db->get('agent')->result_array();
        $json_list = json_encode($array_list);
        // print_r($json_list);die;
        $filename = "filterList/agentList.json";
        $file = fopen($filename, "w");
        fwrite($file, $json_list);
        fclose($file);
        
        // Force download the file
        // header("Content-Type: application/octet-stream");
        // header("Content-Transfer-Encoding: Binary");
        // header("Content-disposition: attachment; filename=\"" . basename($filename) . "\"");
    }
}