<?php
  
  include('../../config/connectDb.php');

  $per_name = $_REQUEST['per_name'];
  $lastName = $_REQUEST['lastName'];
  $sex_id = $_REQUEST['sex_id'];
  $brithDate = $_REQUEST['brithDate'];
  $tyDoc_id = $_REQUEST['tyDoc_id'];
  $per_doc = $_REQUEST['per_doc'];
  $per_tel = $_REQUEST['per_tel'];
  $per_ema = $_REQUEST['per_ema'];
  $per_usrName = $_REQUEST['per_usrName'];
  $per_pass = $_REQUEST['per_pass'];
  $pass = $_REQUEST['pass'];

    $name = $per_name.' '.$lastName;

    // echo($name);

    if ($pass == $per_pass) {
        $sql = "call i_client('$name',$sex_id,'$brithDate',$tyDoc_id,$per_doc,$per_tel,'$per_ema','$per_usrName','$per_pass');";
        // echo($sql);
        $query = $con -> query($sql);
        echo 'Registrado :D ahora ingrese al login y logueese';
    } else {
        echo('Hay algo equivocado');
    }

  
?>