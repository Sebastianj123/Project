<?php
  
  include('../../config/connectDb.php');

  $per_name = $_REQUEST['per_name'];
  $per_lastName = $_REQUEST['per_lastname'];
  $sex_id = $_REQUEST['sex_id'];
  $per_bith = $_REQUEST['per_bith'];
  $tyDoc_id = $_REQUEST['tyDoc_id'];
  $per_doc = $_REQUEST['per_doc'];
  $user_tel = $_REQUEST['user_tel'];
  $user_ema = $_REQUEST['user_ema'];
  $user_name = $_REQUEST['user_name'];
  $user_pass = $_REQUEST['user_pass'];
  $pass = $_REQUEST['pass'];

    // $name = $per_name.' '.$lastName;

    // echo($name);

    if ($pass == $user_pass) {
        $sql = "call i_client('$per_name','$per_lastName',$sex_id,$tyDoc_id,$per_doc,'$per_bith','$user_name','$user_ema',$user_tel,'$user_pass',null);";
        // echo($sql);
        $query = $con -> query($sql);
        echo 'Registrado :D ahora ingrese al login y logueese';
    } else {
        echo('Hay algo equivocado');
    }

  
?>