<?php
  
  include('../../config/connectDb.php');

  $per_name = $_REQUEST['per_name'];
  $per_lastName = $_REQUEST['per_lastname'];
  $sex_id = $_REQUEST['sex_id'];
  $per_bith = $_REQUEST['per_bith'];
  $tyDoc_id = $_REQUEST['tyDoc_id'];
  $per_doc = $_REQUEST['per_doc'];
  $per_addr = $_REQUEST['per_addr'];
  $user_tel = $_REQUEST['user_tel'];
  $user_ema = $_REQUEST['user_ema'];
  $user_name = $_REQUEST['user_name'];
  $user_pass = $_REQUEST['user_pass'];
  $per_addr = $_REQUEST['per_addr'];
  $pass = $_REQUEST['pass'];


  
    // $name = $per_name.' '.$lastName;

    // echo($name);
    // $querysArray = array();

    //     if (!$con->multi_query($sql)) {
    //         echo "Falló la multiconsulta: (" . $con->errno . ") " . $con->error;
    //     }

    //     do {
    //     if ($result = $con->store_result()) {

    //       if ($pass == $user_pass) {

    //           $sql = "call i_client('$per_name','$per_lastName',$sex_id,$tyDoc_id,$per_doc,'$per_bith','$user_name','$user_ema',$user_tel,'$user_pass','$per_addr');";
    //           // $query = $con -> query($sql);
    //         } else {
    //             echo('Hay algo equivocado');
    //         }

    //             $resultQuery = $result->fetch_all(MYSQLI_ASSOC);
    //             array_push($querysArray, $resultQuery);
    
    //             $result->free();
    //         }
    //     } while ($con->more_results() && $con->next_result());
  
?>