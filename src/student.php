<?php
@error_reporting(0);
include 'sqli.php';
include 'mysql_info.php';
require 'jwt.php';

$token = $_SERVER['HTTP_AUTHORIZATION'];
$user_info = check_token($token);
if($user_info == "Check Faild!!!"){
	$row['status'] = '403';
	$row['msg'] = 'token error';
	$json_data = json_encode($row);
	echo "$json_data";
}
else{
	@$con = mysqli_connect($host,$dbuser,$dbpass,$dbname);
	if (!$con) {
	    echo "Failed to connect to MySQL: " . mysqli_error();
	}
	if(isset($_POST['select']) && isset($_POST['keyword'])) {
		$se_type = dowith_sql($_POST['select']);
		$keyword = dowith_sql($_POST['keyword']);
		$sql = "SELECT * FROM book WHERE $se_type=('$keyword')";
		$result = mysqli_query($con,$sql);
		$row = mysqli_fetch_array($result,MYSQLI_ASSOC);
		$row['status'] = '200';
		$row['msg'] = 'book found';
		$json_data = json_encode($row);
		echo "$json_data";
	}
	else {
		$row['status'] = '401';
		$row['msg'] = 'please select the type and input contents';
		$json_data = json_encode($row);
		echo "$json_data";
	}
}
 ?>