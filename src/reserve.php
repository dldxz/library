<?php
@error_reporting(0);
include 'mysql_info.php';
require 'jwt.php';

$headers = getallheaders();
if(isset($headers['Authorization'])) {
	$token = $headers['Authorization'];
	$user_info = check_token($token);
	if($user_info == "Check Faild!!!") {
		$row['status'] = '403';
		$row['msg'] = 'token error';
		$json_data = json_encode($row);
		echo "$json_data";
	} else{
		@$con = mysqli_connect($host,$dbuser,$dbpass,$dbname);
		if (!$con) {
		    echo "Failed to connect to MySQL: " . mysqli_error();
		}
		if(!empty($_POST['ISBN']) && !empty($_POST['username'])) {
			$date = date("Y-m-d");
			$isbn = $_POST['ISBN'];
			$stu_id = $user_info['stu_id'];
			$sql = "INSERT INTO reserve_record(ISBN,uid,reserve_date) VALUES ('$isbn','$stu_id','$date')";
			$result = mysqli_query($con,$sql);
			$row['status'] = '200';
			$row['msg'] = 'book reserve success';
			$json_data = json_encode($row);
			echo "$json_data";
		} else {
			$row['status'] = '401';
			$row['msg'] = 'please input all informations';
			$json_data = json_encode($row);
			echo "$json_data";
		}
	}
} else{
	$row['status'] = '403';
	$row['msg'] = 'please login';
	$json_data = json_encode($row);
	echo "$json_data";
}
 ?>