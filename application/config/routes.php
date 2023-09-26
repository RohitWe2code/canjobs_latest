<?php



defined('BASEPATH') OR exit('No direct script access allowed');







/*



| -------------------------------------------------------------------------



| URI ROUTING



| -------------------------------------------------------------------------



| This file lets you re-map URI requests to specific controller functions.



|



| Typically there is a one-to-one relationship between a URL string



| and its corresponding controller class/method. The segments in a



| URL normally follow this pattern:



|



|	example.com/class/method/id/



|



| In some instances, however, you may want to remap this relationship



| so that a different class/function is called than the one



| corresponding to the URL.



|



| Please see the user guide for complete details:



|



|	https://codeigniter.com/userguide3/general/routing.html



|



| -------------------------------------------------------------------------



| RESERVED ROUTES



| -------------------------------------------------------------------------



|



| There are three reserved routes:



|



|	$route['default_controller'] = 'welcome';



|



| This route indicates which controller class should be loaded if the



| URI contains no data. In the above example, the "welcome" class



| would be loaded.



|



|	$route['404_override'] = 'errors/page_missing';



|



| This route will tell the Router which controller/method to use if those



| provided in the URL cannot be matched to a valid route.



|



|	$route['translate_uri_dashes'] = FALSE;



|



| This is not exactly a route, but allows you to automatically route



| controller and method names that contain dashes. '-' isn't a valid



| class or method name character, so it requires translation.



| When you set this option to TRUE, it will replace ALL dashes in the



| controller and method URI segments.



|



| Examples:	my-controller/index	-> my_controller/index



|		my-controller/my-method	-> my_controller/my_method



*/



$route['default_controller'] = 'welcome';



$route['404_override'] = '';



$route['translate_uri_dashes'] = FALSE;

/*
||-------------------------------------------------------------------------------------
|| ADMIN
||-------------------------------------------------------------------------------------
*/


$route['admin_login'] = 'api/Admin_registration/login';



$route['admin/getEmployeeDetail'] = 'api/employee_api/allEmployeeDetail';



$route['admin/getEmployeeSkill'] = 'api/employee_api/allEmployeeSkill';



$route['admin/getEmployeeCareer'] = 'api/employee_api/allEmployeeCareer';



$route['admin/getEmployeeEducation'] = 'api/employee_api/allEmployeeEducation';



// $route['admin/getAllJobs'] = 'api/employer_api/allJobs';



$route['admin/getAllJobsCategory'] = 'api/employer_api/allJobCategory';



$route['admin/getAllEmployer'] = 'api/employer_api/allEmployer';



$route['admin/addFollowUpEmployee'] = 'api/admin_api/addFollowUpEmployee';
$route['admin/getFollowUpEmployee'] = 'api/admin_api/getFollowUpEmployee';

$route['admin/addFollowUpEmployer'] = 'api/admin_api/addFollowUpEmployer';
$route['admin/getFollowUpEmployer'] = 'api/admin_api/getFollowUpEmployer';

$route['admin/addAdmin'] = 'api/admin_api/addAdmin';



$route['admin/getallEmployeeView'] = 'api/employee_api/allEmployeeView';

$route['admin/addCategory'] = 'api/employer_api/addCategory';

$route['admin/getAllAdmin'] = 'api/admin_api/allAdmin';



$route['admin/getAdmin'] = 'api/admin_api/admin';



$route['admin/deleteAdmin'] = 'api/admin_api/deleteAdmin';

$route['admin/getFollowupView'] = 'api/admin_api/viewFollowup';



$route['admin/addUpdatefilterList'] = 'api/admin_api/addUpdatefilterList';

$route['admin/getFilterList'] = 'api/admin_api/getFilterList';



$route['admin/deleteFilterListItem'] = 'api/admin_api/deleteFilterListItem';

$route['admin/getToken'] = 'api/admin_api/getToken';

$route['admin/getSummaryCounts'] = 'api/admin_api/getSummaryCounts';

$route['admin/getAllLastFollowup'] = 'api/admin_api/getAllLastFollowup';
$route['admin/changePassword'] = 'api/admin_api/changePassword';
$route['admin/forgetPassword'] = 'api/Admin_registration/forgetPassword';
$route['admin/resetPassword'] = 'api/Admin_registration/resetPassword';
$route['admin/updateAdminSetting'] = 'api/admin_api/updateAdminSetting';
$route['admin/getAdminSetting'] = 'api/admin_api/getAdminSetting';


/*
||----------------------------------------------------------------------------------------
|| EMPLOYEE
||----------------------------------------------------------------------------------------
*/


$route['employee_signup'] = 'api/Employee_registration/signup';



$route['employee_login'] = 'api/Employee_registration/login';


$route['employeePersonal_detail'] = 'api/employee_api/employeePersonal_detail';



$route['employeeSkill'] = 'api/employee_api/employeeSkill';



$route['employeeEducation_detail'] = 'api/employee_api/employeeEducation_detail';



$route['employeeCareer_detail'] = 'api/employee_api/employeeCareer_detail';



$route['getEmployeeDetail'] = 'api/employee_api/employeeDetail';



$route['getEmployeeCareer'] = 'api/employee_api/employeeCareer';



$route['getEmployeeEducation'] = 'api/employee_api/employeeEducation';



$route['getEmployeeSkill'] = 'api/employee_api/employeeSkill';



$route['company/getallEmployeeView'] = 'api/employee_api/allEmployeeView';



$route['deleteEmployee/(:num)'] = 'api/employee_api/employee/$1';



$route['deleteEmployeeCareer'] = 'api/employee_api/deleteEmployeeCareer';



$route['deleteEmployeeEducation'] = 'api/employee_api/deleteEmployeeEducation';



$route['deleteEmployeeSkill'] = 'api/employee_api/deleteEmployeeSkill';





$route['getCountryList'] = 'api/employee_api/countryList';

$route['getStateList'] = 'api/employee_api/getStateList';

$route['getCityList'] = 'api/employee_api/getCityList';

$route['employee/ForgetPassword'] = 'api/Employee_registration/forgetPassword';

$route['user/resetPassword'] = 'api/Employee_registration/resetPassword';

$route['getProfileCompletePercent'] = 'api/employee_api/getProfileCompletePercent';

$route['user/changePassword'] = 'api/employee_api/changePassword';
$route['user/signupLoginViaSocialMedia'] = 'api/Employee_registration/signupLoginViaSocialMedia';
$route['user/documentsUpload'] = 'api/employee_api/documentsUpload';
$route['user/isVarify'] = 'api/employee_api/isVarify';
$route['user/getDocumentsUploaded'] = 'api/employee_api/getDocumentsUploaded';
$route['user/deleteDocumentsUploaded'] = 'api/employee_api/deleteDocumentsUploaded';
$route['employee/updateEmployeeSetting'] = 'api/employee_api/updateEmployeeSetting';
$route['employee/getEmployeeSetting'] = 'api/employee_api/getEmployeeSetting';



/*
||----------------------------------------------------------------------------------------
|| EMPLOYER
||----------------------------------------------------------------------------------------
*/


$route['employer'] = 'api/employer_api/index';



$route['employer_signup'] = 'api/Employer_registration/signup';



$route['employer_login'] = 'api/Employer_registration/login';



$route['company_detail'] = 'api/employer_api/company_detail';



$route['contact_detail'] = 'api/employer_api/contact_detail';



$route['company_kyc_detail'] = 'api/employer_api/company_kyc_detail';






$route['getAppliedCandidateList'] = 'api/employer_api/applied_candidateList';







$route['deleteEmployer/(:num)'] = 'api/employer_api/employer/$1';



$route['deletejobCategory/(:num)'] = 'api/employer_api/jobCategory/$1';







$route['viewEmployer'] = 'api/employer_api/viewEmployer';



$route['getEmployer'] = 'api/employer_api/getEmployer';





$route['company/forgetPassword'] = 'api/Employer_registration/forgetPassword';

$route['company/resetPassword'] = 'api/Employer_registration/resetPassword';


$route['company/getAllJobsCategory'] = 'api/employer_api/allJobCategory';


$route['company/changePassword'] = 'api/employer_api/changePassword';

$route['company/signupLoginViaSocialMedia'] = 'api/Employer_registration/signupLoginViaSocialMedia';

// $route['company/addUpdateVisa'] = 'api/employer_api/addUpdateVisa';
$route['company/documentsUpload'] = 'api/employer_api/documentsUpload';
$route['company/isVarify'] = 'api/employer_api/isVarify';
$route['company/getDocumentsUploaded'] = 'api/employer_api/getDocumentsUploaded';
$route['employer/updateEmployerSetting'] = 'api/employer_api/updateEmployerSetting';
$route['employer/getEmployerSetting'] = 'api/employer_api/getEmployerSetting';






/*
||----------------------------------------------------------------------------------------
|| COMMON
||----------------------------------------------------------------------------------------
*/

$route['common/getJobs'] = 'api/Common_controller/getalljobs';
$route['common/getTestApi'] = 'api/Common_controller/getTestApi';
$route['common/generateOtp'] = 'api/Common_controller/generateOtp';
$route['common/getNotifications'] = 'api/Common_controller/getNotifications';
$route['common/isReadNotification'] = 'api/Common_controller/isReadNotification';
$route['common/addUpdateMiscellaneousSubstage'] = 'api/admin_api/addUpdateMiscellaneousSubstage';
$route['common/getMiscellaneousSubstage'] = 'api/admin_api/getMiscellaneousSubstage';
$route['common/deleteMiscellaneousSubstage'] = 'api/admin_api/deleteMiscellaneousSubstage';
$route['common/addActivityLog'] = 'api/Common_controller/addActivityLog';
$route['getActivityLog'] = 'api/admin_api/getActivityLog';
$route['common/testApi'] = 'api/Common_controller/testApi';

/*
||----------------------------------------------------------------------------------------
|| Payment
||----------------------------------------------------------------------------------------
*/
$route['payment/creatRazorpayOrder'] = 'api/Payment_gateway_controller/creatRazorpayOrder';
$route['payment/addRazorPayReciept'] = 'api/Payment_gateway_controller/addRazorPayReciept';
$route['payment/getPaymentReciept'] = 'api/Payment_gateway_controller/getPaymentReciept';
$route['payment/addPaymentReciept'] = 'api/Payment_gateway_controller/addPaymentReciept';

/*
||----------------------------------------------------------------------------------------
|| Email
||----------------------------------------------------------------------------------------
*/
$route['common/sendEmail'] = 'api/Email_controller/sendEmail';
$route['common/addUpdateEmailTemplate'] = 'api/Email_controller/addUpdateEmailTemplate';
$route['common/getEmailTemplate'] = 'api/Email_controller/getEmailTemplate';
$route['common/emailTemplateTest'] = 'api/Email_controller/emailTemplateTest'; //testEmail
$route['sendEmailTest'] = 'api/Email_controller/sendEmailTest';

/*
||----------------------------------------------------------------------------------------
|| Lmia
||----------------------------------------------------------------------------------------
*/
$route['admin/addUpdateLmia'] = 'api/Lmia_controller/addUpdateLmia';
$route['company/getLmia'] = 'api/Lmia_controller/getLmia';
$route['addUpdateLmiaSubstagesEmployee'] = 'api/Lmia_controller/addUpdateLmiaSubstagesEmployee';
$route['getLmiaSubstagesEmployee'] = 'api/Lmia_controller/getLmiaSubstagesEmployee';
$route['deleteLmiaSubstageEmployee'] = 'api/Lmia_controller/deleteLmiaSubstageEmployee';
$route['addUpdateLmiaSubstagesJob'] = 'api/Lmia_controller/addUpdateLmiaSubstagesJob';
$route['getLmiaSubstagesjob'] = 'api/Lmia_controller/getLmiaSubstagesjob';
$route['deleteLmiaSubstageJob'] = 'api/Lmia_controller/deleteLmiaSubstageJob';
/*
||----------------------------------------------------------------------------------------
|| Visa
||----------------------------------------------------------------------------------------
*/
$route['addUpdateVisa'] = 'api/employee_api/addUpdateVisa';
$route['getVisa'] = 'api/employee_api/getVisa';
/*
||----------------------------------------------------------------------------------------
|| Interview
||----------------------------------------------------------------------------------------
*/
$route['admin/addUpdateInterview'] = 'api/employer_api/addUpdateInterview';

$route['admin/getInterview'] = 'api/employer_api/getInterview';
/*
||----------------------------------------------------------------------------------------
|| job
||----------------------------------------------------------------------------------------
*/
$route['addJobs'] = 'api/employer_api/addJobs';
$route['getJob'] = 'api/employer_api/getjob';
$route['deletejob/(:num)'] = 'api/employer_api/job/$1';
$route['applyJob'] = 'api/employer_api/apply_job';
$route['deleteApplyJob'] = 'api/employer_api/deleteApplyJob';
$route['admin/jobDetail'] = 'api/employer_api/getAllJobsView';
$route['admin/getAllJobsViewAdmin'] = 'api/employer_api/getAllJobsViewAdmin';
$route['getJobResponse'] = 'api/employee_api/getJobResponse';
$route['getJobsByEmployee'] = 'api/employee_api/getJobsByEmployee';
$route['getAllJobs'] = 'api/employer_api/getAllJobsView';
$route['admin/assignJobToManager'] = 'api/admin_api/assignJobToManager';
/*
||----------------------------------------------------------------------------------------
|| Manager
||----------------------------------------------------------------------------------------
*/
$route['manager/addUpadateTeam'] = 'api/manager_controller/addUpadateTeam';
$route['manager/getTeam'] = 'api/manager_controller/getTeam';
$route['manager/deleteTeamMember'] = 'api/manager_controller/deleteTeamMember';
/*
||----------------------------------------------------------------------------------------
|| Setting
||----------------------------------------------------------------------------------------
*/
$route['setting/updateParentSetting'] = 'api/setting_controller/updateParentSetting';
$route['setting/getParentSetting'] = 'api/setting_controller/getParentSetting';
/*
||----------------------------------------------------------------------------------------
|| Agent
||----------------------------------------------------------------------------------------
*/
$route['agent/addUpadateAgent'] = 'api/agent_controller/addUpadateAgent';
$route['agent/getAgent'] = 'api/agent_controller/getAgent';
$route['agent/deleteAgent'] = 'api/agent_controller/deleteAgent';
/*
||----------------------------------------------------------------------------------------
|| Reserve
||----------------------------------------------------------------------------------------
*/
$route['setEmployeeReserve'] = 'api/employee_api/setEmployeeReserve';
$route['removeEmployeeReserve'] = 'api/employee_api/removeEmployeeReserve';