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







// $route['register'] = 'api/Authorisation/register';



// $route['login'] = 'api/Authorisation/login';



// $route['getProfile'] = 'api/naukari/getProfile';











///////// Admin //////////////



$route['admin_login'] = 'api/Admin_registration/login';



$route['admin/getEmployeeDetail'] = 'api/employee_api/allEmployeeDetail';



$route['admin/getEmployeeSkill'] = 'api/employee_api/allEmployeeSkill';



$route['admin/getEmployeeCareer'] = 'api/employee_api/allEmployeeCareer';



$route['admin/getEmployeeEducation'] = 'api/employee_api/allEmployeeEducation';



// $route['admin/getAllJobs'] = 'api/employer_api/allJobs';



$route['admin/getAllJobsCategory'] = 'api/employer_api/allJobCategory';



$route['admin/getAllEmployer'] = 'api/employer_api/allEmployer';



$route['admin/addFollowup'] = 'api/admin_api/followUp';



$route['admin/addAdmin'] = 'api/admin_api/addAdmin';



$route['admin/getFollowup'] = 'api/admin_api/getfollowup';



$route['admin/getallEmployeeView'] = 'api/employee_api/allEmployeeView';



$route['admin/addCategory'] = 'api/employer_api/addCategory';



$route['admin/getAllAdmin'] = 'api/admin_api/allAdmin';



$route['admin/getAdmin'] = 'api/admin_api/admin';



$route['admin/deleteAdmin'] = 'api/admin_api/deleteAdmin';

$route['admin/getFollowupView'] = 'api/admin_api/viewFollowup';

$route['admin/jobDetail'] = 'api/employer_api/getAllJobsView';

$route['admin/addUpdatefilterList'] = 'api/admin_api/addUpdatefilterList';

$route['admin/getFilterList'] = 'api/admin_api/getFilterList';

$route['admin/addUpdateInterview'] = 'api/employer_api/addUpdateInterview';

$route['admin/getInterview'] = 'api/employer_api/getInterview';

$route['admin/deleteFilterListItem'] = 'api/admin_api/deleteFilterListItem';

$route['admin/addUpdateLmia'] = 'api/employer_api/addUpdateLmia';

$route['admin/getToken'] = 'api/admin_api/getToken';

$route['admin/getSummaryCounts'] = 'api/admin_api/getSummaryCounts';
$route['admin/getAllLastFollowup'] = 'api/admin_api/getAllLastFollowup';






///////// Employee //////////////



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



$route['getJobResponse'] = 'api/employee_api/getJobResponse';

$route['getCountryList'] = 'api/employee_api/countryList';

$route['getStateList'] = 'api/employee_api/getStateList';

$route['getCityList'] = 'api/employee_api/getCityList';

$route['employee/forgetPassword'] = 'api/Employee_registration/forgetPassword';

$route['employee/resetPassword'] = 'api/Employee_registration/resetPassword';





////////// Employer ////////////



$route['employer'] = 'api/employer_api/index';



$route['employer_signup'] = 'api/Employer_registration/signup';



$route['employer_login'] = 'api/Employer_registration/login';



$route['company_detail'] = 'api/employer_api/company_detail';



$route['contact_detail'] = 'api/employer_api/contact_detail';



$route['company_kyc_detail'] = 'api/employer_api/company_kyc_detail';



$route['addJobs'] = 'api/employer_api/addJobs';



$route['applyJob'] = 'api/employer_api/apply_job';



$route['getAppliedCandidateList'] = 'api/employer_api/applied_candidateList';



$route['getAllJobs'] = 'api/employer_api/getAllJobsView';



$route['deleteEmployer/(:num)'] = 'api/employer_api/employer/$1';



$route['deletejobCategory/(:num)'] = 'api/employer_api/jobCategory/$1';



$route['deletejob/(:num)'] = 'api/employer_api/job/$1';



$route['viewEmployer'] = 'api/employer_api/viewEmployer';



$route['getEmployer'] = 'api/employer_api/getEmployer';



$route['getJob'] = 'api/employer_api/getjob';

$route['company/forgetPassword'] = 'api/Employer_registration/forgetPassword';

$route['company/resetPassword'] = 'api/Employer_registration/resetPassword';


$route['company/getAllJobsCategory'] = 'api/employer_api/allJobCategory';

