<?php
@error_reporting(0);
include 'mysql_info.php';
require 'jwt.php';

$headers = getallheaders();
if(!empty($headers['Authorization'])) {
	$token = $headers['Authorization'];
	$user_info = check_token($token);
	if($user_info == "Check Faild!!!") {
		$row['status'] = '403';
		$row['msg'] = 'token error';
		$json_data = json_encode($row);
		echo "$json_data";
	} else {
		@$con = mysqli_connect($host,$dbuser,$dbpass,$dbname);
		if (!$con) {
		    echo "Failed to connect to MySQL: " . mysqli_error();
		}
		if(!empty($_POST['types'])) {
			if($_POST['types'] == "reserve_record") {
				if($user_info['types'] == "admin") {
					$sql = "SELECT * FROM reserve_record";
					$result = mysqli_query($con,$sql);
					if(empty($result) || mysqli_num_rows($result) == 0) {
						$row['data'] = 'no record';
						$row['status'] = '200';
						$row['msg'] = 'record not found';
						$json_data = json_encode($row);
						echo "$json_data";
					} else {
						$row['data'] = mysqli_fetch_all($result,MYSQLI_ASSOC);
						$row['status'] = '200';
						$row['msg'] = 'record found';
						$json_data = json_encode($row);
						echo "$json_data";
					}
				} else {
					$uid = $user_info['stu_id'];
					$sql = "SELECT * FROM reserve_record WHERE uid='$uid'";
					$result = mysqli_query($con,$sql);
					if(empty($result) || mysqli_num_rows($result) == 0) {
						$row['data'] = 'no record';
						$row['status'] = '200';
						$row['msg'] = 'record not found';
						$json_data = json_encode($row);
						echo "$json_data";
					} else {
						$row['data'] = mysqli_fetch_all($result,MYSQLI_ASSOC);
						$row['status'] = '200';
						$row['msg'] = 'record found';
						$json_data = json_encode($row);
						echo "$json_data";
					}
				}
			}
			elseif($_POST['types'] == "borrow_record") {
				if($user_info['types'] == "admin") {
					$sql = "SELECT * FROM borrow_record";
					$result = mysqli_query($con,$sql);
					if(empty($result) || mysqli_num_rows($result) == 0) {
						$row['data'] = 'no record';
						$row['status'] = '200';
						$row['msg'] = 'record not found';
						$json_data = json_encode($row);
						echo "$json_data";
					} else {
						$row['data'] = mysqli_fetch_all($result,MYSQLI_ASSOC);
						$row['status'] = '200';
						$row['msg'] = 'record found';
						$json_data = json_encode($row);
						echo "$json_data";
					}
				} else {
					$username = $user_info['username'];
					$sql = "SELECT * FROM borrow_record WHERE uname='$username'";
					$result = mysqli_query($con,$sql);
					if(empty($result) || mysqli_num_rows($result) == 0) {
						$row['data'] = 'no record';
						$row['status'] = '200';
						$row['msg'] = 'record not found';
						$json_data = json_encode($row);
						echo "$json_data";
					} else {
						$row['data'] = mysqli_fetch_all($result,MYSQLI_ASSOC);
						$row['status'] = '200';
						$row['msg'] = 'record found';
						$json_data = json_encode($row);
						echo "$json_data";
					}
				}
			}
		} else {
			$row['status'] = '401';
			$row['msg'] = 'please set types';
			$json_data = json_encode($row);
			echo "$json_data";
		}
	}
}