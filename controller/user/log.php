<?php
  
  include('../../config/connectDb.php');

  $reg_ema = $_REQUEST['reg_ema'];
  $reg_pass = $_REQUEST['reg_pass'];

  $sqlEma = "CALL v_usersReg('". $reg_ema ."');";

  $queryEma = $con -> query($sqlEma);
  
  $result = $queryEma -> fetch_all(MYSQLI_ASSOC);

  if (count($result) > 0) {
    echo('El usuario existe <br>');
    if ($result[0]['sta_id'] == 1) {
      echo('El usuario existe y esta activo <br>');
        if ($result[0]['per_pass'] == $reg_pass) {
          echo('GOOOOOOOOOOOOOOOOOOOD validado');
        } else {
          echo('El usuario existe y esta activo pero la contraseña es incorrecta <br>');
        }
    } else {
      echo('El usuario existe pero esta "'. $result[0]['sta_name'] .'" :,c <br>');
    }
  } else {
    echo (':,c');
  }

  
?>