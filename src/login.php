<?php
include 'sqli.php';
include 'mysql_info.php';
require 'jwt.php';

@error_reporting(0);
@$con = mysqli_connect($host,$dbuser,$dbpass,$dbname);
if (!$con) {
    echo "Failed to connect to MySQL: " . mysqli_error();
}
if(isset($_POST['username']) && isset($_POST['password'])) {
	$username = dowith_sql($_POST['username']);
	$passwd = dowith_sql($_POST['password']);
	$payload = array(
	    "username" => "$username",
	    "password" => "$passwd",
	);
	$sql = "SELECT stu_id,username FROM user WHERE username=('$username') AND password=('$passwd') LIMIT 0,1";
	$result = mysqli_query($con,$sql);
	if(mysqli_num_rows($result)<1) {
		$row['status'] = '404';
		$row['msg'] = 'wrong username or password';
		$json_data = json_encode($row);
		echo "$json_data";
	}
	else {
		$row = mysqli_fetch_array($result,MYSQLI_ASSOC);
		$token = encodes($payload,$key,'SHA256');
		$row['token'] = $token;
		$json_data = json_encode($row);
		echo "$json_data";
	}
}
else {
	$row['status'] = '401';
	$row['msg'] = 'please input username and password';
	$json_data = json_encode($row);
	echo "$json_data";
}
 ?>
