<?php
  
  include('../../config/connectDb.php');

  $per_name = $_REQUEST['per_name'];
  $per_lastName = $_REQUEST['per_lastname'];
  $sex_id = $_REQUEST['sex_id'];
  $brithDate = $_REQUEST['brithDate'];
  $tyDoc_id = $_REQUEST['tyDoc_id'];
  $per_doc = $_REQUEST['per_doc'];
  $per_tel = $_REQUEST['per_tel'];
  $per_ema = $_REQUEST['per_ema'];
  $per_usrName = $_REQUEST['per_usrName'];
  $per_pass = $_REQUEST['per_pass'];
  $pass = $_REQUEST['pass'];

    // $name = $per_name.' '.$lastName;

    // echo($name);

    if ($pass == $per_pass) {
        $sql = "call i_client('$per_name','$per_lastName',$sex_id,$tyDoc_id,$per_doc,'$brithDate','$per_usrName','$per_ema',$per_tel,'$per_pass',null);";
        // echo($sql);
        $query = $con -> query($sql);
        echo 'Registrado :D ahora ingrese al login y logueese';
    } else {
        echo('Hay algo equivocado');
    }

  
?>