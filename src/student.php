<?php
@error_reporting(0);
include 'mysql_info.php';
require 'jwt.php';

$headers = getallheaders();
$token = $headers['HTTP_AUTHORIZATION'];
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
	if(isset($_GET['select']) && isset($_GET['keyword'])) {
		$se_type = $_GET['select'];
		$keyword = $_GET['keyword'];
		$sql = "SELECT * FROM book WHERE $se_type=('$keyword')";
		$result = mysqli_query($con,$sql);
		$row = mysqli_fetch_array($result,MYSQLI_ASSOC);
		$row['status'] = '200';
		$row['msg'] = 'book found';
		$json_data = json_encode($row);
		echo "$json_data";
	}
	else {
		$sql = "SELECT * FROM book";
		$result = mysqli_query($con,$sql);
		$row = mysqli_fetch_array($result,MYSQLI_ASSOC);
		$row['status'] = '200';
		$row['msg'] = 'all book lists';
		$json_data = json_encode($row);
		echo "$json_data";
	}
}
 ?>