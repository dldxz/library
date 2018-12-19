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
	}
	else{
		@$con = mysqli_connect($host,$dbuser,$dbpass,$dbname);
		if (!$con) {
		    echo "Failed to connect to MySQL: " . mysqli_error();
		}
		if(!empty($_POST['isbn']) && !empty($_POST['bname']) && !empty($_POST['author']) && !empty($_POST['price']) && !empty($_POST['publish_house']) && !empty($_POST['is_rare']) && !empty($_POST['book_type']) ) {
			$isbn = $_POST['isbn'];
			$keyword = $_POST['bname'];
			$author = $_POST['author'];
			$price = $_POST['price'];
			$publish_house = $_POST['publish_house'];
			$is_rare = $_POST['is_rare'];
			$book_type = $_POST['book_type'];
			$date = date("Y-m-d");
			$uname = $user_info['username'];

			$sql1 = "INSERT INTO inbound_record(inbound_date,uname,ISBN) VALUES ('$date','$uname','$isbn')";
			$result = mysqli_query($con,$sql1);
			$sql = "INSERT INTO book(ISBN,bname,author,price,publish_house,is_rare,book_type,is_Borrowed) VALUES ('$isbn','$keyword','$author','$price','$publish_house',$is_rare,'$book_type',False)";
			$result = mysqli_query($con,$sql);
			$row['status'] = '200';
			$row['msg'] = 'book entry success';
			$json_data = json_encode($row);
			echo "$json_data";
		}
		else {
			$row['status'] = '401';
			$row['msg'] = 'please entry all informations';
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
