<?php
// echo"This is test mail file----- chk";die;
// API URL
$apiUrl = 'http://65.0.20.158/canjobs/common/sendEmail';

// Create cURL request
$ch = curl_init($apiUrl);

// Set cURL options
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

// Execute cURL request
$response = curl_exec($ch);

// Check for errors
if(curl_errno($ch)) {
 echo 'Error: ' . curl_error($ch);
} else {
 echo 'API Response: ' .$response;
}

// Close cURL session
curl_close($ch);
?>