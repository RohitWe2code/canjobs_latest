<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**

*

*/

class Common_model extends CI_Model

{
public function sendMail($user_info){
        // print_r($user_email);die;
        $body = $user_info['message'];
            $this->load->library('email');
            $config = array(
            'protocol' => 'smtp',
            'smtp_host' => 'smtp.gmail.com',
            'smtp_port' => 587,
            'smtp_user' => 'ashish.we2code@gmail.com',
            'smtp_pass' => 'nczaguozpagczmjv',
            'mailtype' => 'html',
            'smtp_crypto' => 'tls',
            'charset' => 'utf-8'
            );

            $this->email->initialize($config);
            $this->email->set_newline("\r\n");
            $this->email->from('ashish.we2code@gmail.com', 'Your Name');
            $this->email->to($user_info['to']);
            $this->email->subject($user_info['subject']);
           $mail_body = <<<EOD
   <!doctype html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Simple Transactional Email</title>
    <style>
@media only screen and (max-width: 620px) {
  table.body h1 {
    font-size: 28px !important;
    margin-bottom: 10px !important;
  }

  table.body p,
table.body ul,
table.body ol,
table.body td,
table.body span,
table.body a {
    font-size: 16px !important;
  }

  table.body .wrapper,
table.body .article {
    padding: 10px !important;
  }

  table.body .content {
    padding: 0 !important;
  }

  table.body .container {
    padding: 0 !important;
    width: 100% !important;
  }

  table.body .main {
    border-left-width: 0 !important;
    border-radius: 0 !important;
    border-right-width: 0 !important;
  }

  table.body .btn table {
    width: 100% !important;
  }

  table.body .btn a {
    width: 100% !important;
  }

  table.body .img-responsive {
    height: auto !important;
    max-width: 100% !important;
    width: auto !important;
  }
}
@media all {
  .ExternalClass {
    width: 100%;
  }

  .ExternalClass,
.ExternalClass p,
.ExternalClass span,
.ExternalClass font,
.ExternalClass td,
.ExternalClass div {
    line-height: 100%;
  }

  .apple-link a {
    color: inherit !important;
    font-family: inherit !important;
    font-size: inherit !important;
    font-weight: inherit !important;
    line-height: inherit !important;
    text-decoration: none !important;
  }

  #MessageViewBody a {
    color: inherit;
    text-decoration: none;
    font-size: inherit;
    font-family: inherit;
    font-weight: inherit;
    line-height: inherit;
  }

  .btn-primary table td:hover {
    background-color: #34495e !important;
  }

  .btn-primary a:hover {
    background-color: #34495e !important;
    border-color: #34495e !important;
  }
}
</style>
  </head>
  <body style="background-color: #f6f6f6; font-family: sans-serif; -webkit-font-smoothing: antialiased; font-size: 14px; line-height: 1.4; margin: 0; padding: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;">
    <span class="preheader" style="color: transparent; display: none; height: 0; max-height: 0; max-width: 0; opacity: 0; overflow: hidden; mso-hide: all; visibility: hidden; width: 0;">This is preheader text. Some clients will show this text as a preview.</span>
    <table role="presentation" border="0" cellpadding="0" cellspacing="0" class="body" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f6f6f6; width: 100%;" width="100%" bgcolor="#f6f6f6">
      <tr>
        <td style="font-family: sans-serif; font-size: 14px; vertical-align: top;" valign="top">&nbsp;</td>
        <td class="container" style="font-family: sans-serif; font-size: 14px; vertical-align: top; display: block; max-width: 580px; padding: 10px; width: 580px; margin: 0 auto;" width="580" valign="top">
          <div class="content" style="box-sizing: border-box; display: block; margin: 0 auto; max-width: 580px; padding: 10px;">

            <!-- START CENTERED WHITE CONTAINER -->
            <table role="presentation" class="main" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background: #ffffff; border-radius: 3px; width: 100%;" width="100%">

              <!-- START MAIN CONTENT AREA -->
              <tr>
                <td class="wrapper" style="font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;" valign="top">
                  <table role="presentation" border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;" width="100%">
                    <tr>
                      <td style="font-family: sans-serif; font-size: 14px; vertical-align: top;" valign="top">
                        <p style="font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;">Hi there,</p>
                        <p style="font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;">$body</p>
                        <table role="presentation" border="0" cellpadding="0" cellspacing="0" class="btn btn-primary" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; box-sizing: border-box; width: 100%;" width="100%">
                          <tbody>
                            <tr>
                              <td align="left" style="font-family: sans-serif; font-size: 14px; vertical-align: top; padding-bottom: 15px;" valign="top">
                                <table role="presentation" border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: auto;">
                                 
                                </table>
                              </td>
                            </tr>
                          </tbody>
                        </table>
                        <p style="font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;">This is a really simple email template. Its sole purpose is to get the recipient to click the button with no distractions.</p>
                        <p style="font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;">Good luck! Hope it works.</p>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>

            <!-- END MAIN CONTENT AREA -->
            </table>
            <!-- END CENTERED WHITE CONTAINER -->

            <!-- START FOOTER -->
            <div class="footer" style="clear: both; margin-top: 10px; text-align: center; width: 100%;">
              <table role="presentation" border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;" width="100%">
                <tr>
                  <td class="content-block" style="font-family: sans-serif; vertical-align: top; padding-bottom: 10px; padding-top: 10px; color: #999999; font-size: 12px; text-align: center;" valign="top" align="center">
                    <span class="apple-link" style="color: #999999; font-size: 12px; text-align: center;">Canjobs Inc, 3 Abbey Road, Montreal CA 94102</span>
                    <br> Don't like these emails? <a href="http://i.imgur.com/CScmqnj.gif" style="text-decoration: underline; color: #999999; font-size: 12px; text-align: center;">Unsubscribe</a>.
                  </td>
                </tr>
                <tr>
                  <td class="content-block powered-by" style="font-family: sans-serif; vertical-align: top; padding-bottom: 10px; padding-top: 10px; color: #999999; font-size: 12px; text-align: center;" valign="top" align="center">
                    Powered by <a href="http://htmlemail.io" style="color: #999999; font-size: 12px; text-align: center; text-decoration: none;">HTMLemail</a>.
                  </td>
                </tr>
              </table>
            </div>
            <!-- END FOOTER -->

          </div>
        </td>
        <td style="font-family: sans-serif; font-size: 14px; vertical-align: top;" valign="top">&nbsp;</td>
      </tr>
    </table>
  </body>
</html>

EOD;
            
            $this->email->message($mail_body);
            $email = $this->email->send(FALSE);
    // print_r($this->email->print_debugger());die;
    }
public function addNotification($data){
    // print_r($data);die;
    $notify = array('from_id'=>$data['from_id'],
                    'type'=>$data['type'],
                    'message'=> $data['message']);
    $this->db->insert('notification', $notify);
}
// Getting categories from job_category table and updating in filter list  
public function getJobCategory(){
  // $query = "SELECT job_category_id, category_name, FROM `job_category` WHERE category_name != '' AND is_deleted != 1";
  // $res = $this->db->query($query)->result_array();
  // foreach($res as $data){
  //    $category[$data['job_category_id']] = $data['category_name'];
  // }
  // $json['json'] = json_encode($category);
  // //  print_r($json);die;
  // $this->db->where('id', 2);
  // $this->db->set('updated_at', 'NOW()', FALSE);
  // $query = $this->db->update('list', $json);
  //----------------------------------------------------------------------------------------
  $query = "SELECT DISTINCT(category_type) FROM `job_category` WHERE is_deleted!= 1";
  $res = $this->db->query($query)->result_array();
  // print_r($res);die;
  foreach($res as $likey => $data){
     $type[$likey] = $data['category_type'];
  }
  $json['json'] = json_encode($type);
   print_r($type);die;
  $this->db->where('id', 8);
  $this->db->set('updated_at', 'NOW()', FALSE);
  $query = $this->db->update('list', $json);
  return $query;
}  
public function insert_otp($detail) {
    return $res = $this->db->insert('otp',$detail);
  }
public function validate_otp($email,$otp){

            $this->db->where('email', $email);

            $this->db->where('otp',$otp);

            $this->db->order_by('id', 'DESC');

            $this->db->limit(1);

            $query = $this->db->get('otp');      

            if ($query->num_rows() > 0) {



                return $query;


            }

}
public function email($detail){
    $json = array('to'=>$detail['to'],
                'subject' => $detail['subject'],
                'message' => $detail['message']);
    $mail['email_json'] = json_encode($json);
    $mail['group_id'] = $detail['unique_id'];
    $this->db->insert('email',$mail);
  return;
}
public function getLastRecord_email(){
  //  $query = "select id from email ORDER BY id DESC LIMIT 1";
   $query = "SELECT * FROM `email` WHERE status = 'PENDING' ORDER BY id DESC LIMIT 1";
   return $res = $this->db->query($query)->row_array();
  //  return $res['id'];
}
public function getEmailByGroup($group_id){
   $query = "SELECT * FROM `email` WHERE status = 'PENDING' AND group_id = ".$group_id;
   $res = $this->db->query($query)->result_array();
   $query = " UPDATE `email` SET status = 'SENT' WHERE group_id = ".$group_id;
   $this->db->query($query);
  return $res;
  //  print_r($group_id);die;
}
public function getNotifications($from_id, $user_type){
  $this->db->where('from_id',$from_id);
  $this->db->where('type',$user_type);
  // $this->db->where('is_read != 1');
  $result = $this->db->get('notification')->result_array();
  $total_rows = $this->db->where('from_id',$from_id)->where('type',$user_type)->from('notification')->count_all_results();
    return array('total_rows' => $total_rows, 'data' => $result);

}
public function addUpdateEmailTemplate($template){
  if($template['id']){
                $this->db->where('email_template', $template['id']);
                $this->db->set('updated_at', 'NOW()', FALSE);
               return $this->db->update('email_template', $template);
  }else{
                // Insert operation
                return $this->db->insert('email_template', $template);
                
              }
}
}
?>

