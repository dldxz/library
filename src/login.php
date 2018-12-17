<?php
@error_reporting(0);
include 'mysql_info.php';
require 'jwt.php';

@$con = mysqli_connect($host,$dbuser,$dbpass,$dbname);
if (!$con) {
    echo "Failed to connect to MySQL: " . mysqli_error();
}
if(isset($_POST['username']) && isset($_POST['password'])) {
	$username = $_POST['username'];
	$passwd = $_POST['password'];
	$sql = "SELECT stu_id,username,types FROM user WHERE username=('$username') AND password=('$passwd') LIMIT 0,1";
	$result = mysqli_query($con,$sql);
	if(is_bool($result)) {
		$row['status'] = '404';
		$row['msg'] = 'wrong username or password';
		$json_data = json_encode($row);
		echo "$json_data";
	}
	else {
		$row = mysqli_fetch_array($result,MYSQLI_ASSOC);
		$payload = array(
		    "username" => "$username",
		);
		$token = encodes($payload,$key,'SHA256');
		$row['token'] = $token;
		$row['status'] = '200';
		$row['msg'] = 'login success';
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
