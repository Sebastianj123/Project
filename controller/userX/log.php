<?php
  
  include('../../config/connectDb.php');

  $user_ema = $_REQUEST['user_ema'];
  $user_pass = $_REQUEST['user_pass'];

  $sqlEma = "CALL v_usersReg('$user_ema','$user_pass');";

  $queryEma = $con -> query($sqlEma);
  
  $result = $queryEma -> fetch_all(MYSQLI_ASSOC);

  $rol = $result[0]['rol_id'];
  $id = $result[0]['user_id'];
  $sta = $result[0]['sta_id'];

  if (count($result) > 0) {
    echo('El usuario existe <br>');
    if ($sta == 1) {
      echo('El usuario existe y esta activo <br>');
        if ($result[0]['user_pass'] == $user_pass) {

          $local = "Location: ../../index.php?rol=$rol&id=$id&sta=$sta";

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