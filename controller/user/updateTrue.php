<?php
    require('../../assets/php/declare.php');
    require('../../config/connectDb.php');
    $sql = "call u_user_sta ($id,1)";
    $extend = ($con -> query($sql) === TRUE) ? "mss=valid" : "error=invalid";
    $local = "Location: ../../index.php?rol=$rol&id=$id&".$extend;
    header($local);
?>