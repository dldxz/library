<?php
@error_reporting(0);
include 'mysql_info.php';
require 'jwt.php';

$headers = getallheaders();
$token = $headers['Authorization'];
$user_info = check_token($token);
if($user_info == "Check Faild!!!") {
	$row['status'] = '403';
	$row['msg'] = 'token error';
	$json_data = json_encode($row);
	echo "$json_data";
}
else {
	@$con = mysqli_connect($host,$dbuser,$dbpass,$dbname);
	if (!$con) {
	    echo "Failed to connect to MySQL: " . mysqli_error();
	}
	if(isset($_POST['select']) && isset($_POST['username']) && isset($_POST['userId']) && isset($_POST['isbn'])) {
		$choose = $_POST['select'];
		$username = $_POST['username'];
		$userId = $_POST['userId'];
		$isbn = $_POST['isbn'];

		switch ($choose) {
			case 'lendbook':
				$date = date("Y-m-d");
				$sql = "INSERT INTO borrow_record(borrowed,ISBN,uname) VALUES ($date,$isbn,$username)";
				$result = mysqli_query($con,$sql);
				$row = mysqli_fetch_array($result,MYSQLI_ASSOC);
				$row['status'] = '200';
				$row['msg'] = 'Successful borrowing';
				$json_data = json_encode($row);
				echo "$json_data";
				break;
			case 'renewbook':
				$date = date("Y-m-d");
				$sql1 = "UPDATE borrow_record SET returned=$date WHERE uname=$username AND ISBN=$isbn";
				$sql2 = "INSERT INTO borrow_record(borrowed,ISBN,uname) VALUES ($date,$isbn,$username)";
				$result = mysqli_query($con,$sql1);
				$result = mysqli_query($con,$sql2);
				$row = mysqli_fetch_array($result,MYSQLI_ASSOC);
				$row['status'] = '200';
				$row['msg'] = 'Renewal success';
				$json_data = json_encode($row);
				echo "$json_data";
			case 'returnbook':
				$date = date("Y-m-d");
				$sql = "UPDATE borrow_record SET returned=$date WHERE uname=$username AND ISBN=$isbn";
				$result = mysqli_query($con,$sql);
				$row = mysqli_fetch_array($result,MYSQLI_ASSOC);
				$row['status'] = '200';
				$row['msg'] = 'Successful returned';
				$json_data = json_encode($row);
				echo "$json_data";
			default:
				$row['status'] = '200';
				$row['msg'] = 'nodata';
				$json_data = json_encode($row);
				echo "$json_data";
				break;
		}
	}
	else {
		$row['status'] = '401';
		$row['msg'] = 'please entry all informations';
		$json_data = json_encode($row);
		echo "$json_data";
	}
}

 ?>