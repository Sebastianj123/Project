<?php
    error() {
        header('Local: ');
    };

    $srv_id = (!isset($_POST['srv_id'])) ? $_POST['srv_id'] : error(); ;
    echo $srv_id;
?>