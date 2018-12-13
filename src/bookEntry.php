<?php
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
	@error_reporting(0);
	@$con = mysqli_connect($host,$dbuser,$dbpass,$dbname);
	if (!$con) {
	    echo "Failed to connect to MySQL: " . mysqli_error();
	}
	if(isset($_POST['isbn']) && isset($_POST['bname']) && isset($_POST['author']) && isset($_POST['price']) && isset($_POST['publish_house']) && isset($_POST['is_rare']) && isset($_POST['book_type']) ) {
		$isbn = dowith_sql($_POST['isbn']);
		$keyword = dowith_sql($_POST['bname']);
		$author = dowith_sql($_POST['author']);
		$price = dowith_sql($_POST['price']);
		$publish_house = dowith_sql($_POST['publish_house']);
		$is_rare = dowith_sql($_POST['is_rare']);
		$book_type = dowith_sql($_POST['book_type']);

		$sql = "INSERT INTO book(ISBN,bname,author,price,publish_house,is_rare,book_type) VALUES ($isbn,$keyword,$author,$price,$publish_house,$is_rare,$book_type)";
		$result = mysqli_query($con,$sql);
		$row = mysqli_fetch_array($result,MYSQLI_ASSOC);
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
 ?>