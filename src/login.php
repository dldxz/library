<?php
include 'sqli.php';
include 'mysql_info.php';
require 'jwt.php';

@error_reporting(0);
@$con = mysqli_connect($host,$dbuser,$dbpass,$dbname);
if (!$con)
{
    echo "Failed to connect to MySQL: " . mysqli_error();
}
$username = dowith_sql($_GET['username']);
$passwd = dowith_sql($_GET['password']);
$payload = array(
    "username" => "$username",
    "password" => "$passwd",
);
$sql = "SELECT * FROM user WHERE username=('$username') AND password=('$passwd') LIMIT 0,1";
$result = mysqli_query($con,$sql);
$row = mysqli_fetch_array($result,MYSQLI_ASSOC);
$token = encodes($payload,$key,'SHA256');

$row['token'] = $token;
$json_data = json_encode($row);
echo "$json_data";
 ?>