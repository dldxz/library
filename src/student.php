<?php
include 'sqli.php';
include 'mysql_info.php';
require 'jwt.php';

$token = $_SERVER['HTTP_AUTHORIZATION'];
$user_info = check_token($token);
if($user_info == "Check Faild!!!"){
	http_response_code(403)
}
else{
	$sql = "SELECT * FROM user WHERE username=('$username') AND password=('$passwd') LIMIT 0,1";
	$result = mysqli_query($con,$sql);
	$row = mysqli_fetch_array($result,MYSQLI_ASSOC);

	$row['token'] = $token;
	$json_data = json_encode($row);
	echo "$json_data";
}
 ?>