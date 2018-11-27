<?php
include 'sqli.php';
include 'mysql_info.php';
require 'jwt.php';

$token = $_SERVER['HTTP_AUTHORIZATION'];
$user_info = check_token($token);
if($user_info == "Check Faild!!!")
{
	echo "Check Faild!!!";
}


 ?>