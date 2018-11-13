<?php
include('sqli.php')
$dbuser = " ";
$dbpass = " ";
$dbname = " ";
$host = " ";


@error_reporting(0);
@$con = mysqli_connect($host,$dbuser,$dbpass,$dbname);
if (!$con)
{
    echo "Failed to connect to MySQL: " . mysqli_error();
}
$username = dowith_sql($_POST['username']);
$passwd = dowith_sql($_POST['password']);
$sql = "SELECT * FROM user WHERE username=('$username') AND password=('$passwd') LIMIT 0,1";
$result = mysqli_query($sql);
$row = mysqli_fetch_array($result);
$json_data = json_encode($row);
echo "$json_data";
 ?>