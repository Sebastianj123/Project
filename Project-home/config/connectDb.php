<?php
$host = 'localhost'; 
$db = 'cabellobellojj'; 
$usr = 'root';
$pass = '';
// $call_v_s = 'SELECT * FROM v_s;'; 

$con = new mysqli($host,$usr,$pass,$db);

if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
}  
// else {
//     echo "Connected successfully :d " . $host . ' ' . $db . ' ' . $usr . ' ' . $pass . '<br>' ;
// }


?>