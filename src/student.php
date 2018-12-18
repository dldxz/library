<?php
@error_reporting(0);
include 'mysql_info.php';
require 'jwt.php';

$headers = getallheaders();
if(isset($headers['Authorization'])) {
	$token = $headers['Authorization'];
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
		if(!empty($_GET['select']) && !empty($_GET['keyword'])) {
			$se_type = $_GET['select'];
			$keyword = $_GET['keyword'];
			$sql = "SELECT * FROM book WHERE $se_type=('$keyword')";
			$result = mysqli_query($con,$sql);
			if(empty($result) || mysqli_num_rows($result) == 0) {
				$row['data'] = [];
				$row['status'] = '404';
				$row['msg'] = 'book not found';
				$json_data = json_encode($row);
				echo "$json_data";
			} else {
				$row['data'] = mysqli_fetch_all($result,MYSQLI_ASSOC);
				$row['status'] = '200';
				$row['msg'] = 'book found';
				$json_data = json_encode($row);
				echo "$json_data";
			}
		}
		else {
			$sql = "SELECT * FROM book";
			$result = mysqli_query($con,$sql);
			$row['data'] = mysqli_fetch_all($result,MYSQLI_ASSOC);
			$row['status'] = '200';
			$row['msg'] = 'all book lists';
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