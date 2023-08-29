<?php
    if (isset($_POST['user_ema']) && isset($_POST['user_pass'])) {
        $id = $_POST['id'];
        $rol = $_POST['rol'];
        require('../../../config/connectDb.php');
        $user_ema = $_POST['user_ema'];
        $user_pass = $_POST['user_pass'];
        $sql = "CALL u_user_sta ($id,4,'$user_ema','$user_pass')";
        echo($sql);
        // $query = $con -> query($sql);
        // $arrayQuery = $query -> fecht_all(MSQLI_ASSOC);
    }

?>