<?php
  
  include('../../config/connectDb.php');

  $reg_ema = $_REQUEST['reg_ema'];
  $reg_pass = $_REQUEST['reg_pass'];

  $sqlEma = "CALL v_regEma('". $reg_ema ."');";

  $queryEma = $con -> query($sqlEma);
  
  

  $result = $queryEma -> fetch_all(MYSQLI_ASSOC);

  if (count($result) > 0) {
    
    $sqlPass = "CALL v_regPass(". $result[0]["usr_id"] .",'". $reg_pass ."');";
   


  // printf("Number of rows: %d.\n", $stmt->num_rows);
    // echo($sqlPass);
    try {
      $queryPass = $con -> prepare($sqlPass);
      if ($resultExecute = $queryPass->execute()) {
        $result1 = $resultExecute -> fetch_all(MYSQLI_ASSOC);
        var_dump($result1);
      }
    } catch (Exception $e) {
      echo('Error'.$e);
    }

  }


  // echo($reg_pass);

  // // echo($sqlEma);
  // echo($sqlPass);

  // var_dump($result);
?>