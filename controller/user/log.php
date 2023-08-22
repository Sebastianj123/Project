<?php
  
  include('../../config/connectDb.php');

  $reg_ema = $_REQUEST['reg_ema'];
  $reg_pass = $_REQUEST['reg_pass'];

  $sqlEma = "CALL v_usersReg('$reg_ema','$reg_pass');";

  $queryEma = $con -> query($sqlEma);
  
  $result = $queryEma -> fetch_all(MYSQLI_ASSOC);

  $local = "Location: ../../index.php";

  if (count($result) > 0) {
    echo('El usuario existe <br>');
    if ($result[0]['sta_id'] == 1) {
      echo('El usuario existe y esta activo <br>');
        if ($result[0]['per_pass'] == $reg_pass) {
          echo('GOOOOOOOOOOOOOOOOOOOD validado');
          header($local);
        } else {
          echo('El usuario existe y esta activo pero la contraseña es incorrecta <br>
          <button><a href="../../"> Inicio </a></button>
          ');
        }
    } else {
      echo('El usuario existe pero esta "'. strtolower($result[0]['sta_name']) .'" :,c <br>
      <button><a href="../../"> Inicio </a></button>');
    }
  } else {
    echo (':,c');
  }

  
?>