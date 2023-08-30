<?php
    if (isset($_POST['user_ema']) && isset($_POST['user_pass'])) {
        $id = $_POST['id'];
        $rol = $_POST['rol'];

        require('../../../config/connectDb.php');
        $user_ema = $_POST['user_ema'];
        $user_pass = $_POST['user_pass'];
        $sql = "CALL d_user ($id,'$user_ema','$user_pass')";
        if ($query = $con -> query($sql)) {
            echo('nice');
        } else {
            echo('no nice');
        }
    }
?>