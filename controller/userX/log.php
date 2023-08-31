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

  $local = (count($result) > 0 && $sta == 1 && $result[0]['user_pass'] == $user_pass) 
  ? "Location: ../../index.php?rol=$rol&id=$id&sta=$sta" 
  : "Location: ../../index.php?error=log";
  
  header($local);

?>