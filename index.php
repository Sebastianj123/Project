<!DOCTYPE html:5>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>

    <!-- ICON -->
    <link rel="icon" href="assets/img/icon1-modified.png">

    <!-- CSS -->
        <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!-- Background -->
    <link rel="stylesheet" href="assets/css/bg.css">
        <!-- Font -->
    <link rel="stylesheet" href="assets/css/text.css">
        <!-- Scroll -->
    <link rel="stylesheet" href="assets/css/scroll.css">
    <!-- INCLUDE -->

        <!-- ICONOS -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

</head>
<?php
    include('view/every/header.php');

    

    if (isset($_GET['rol'])) {
        $rol = null;
    } else {
        $rol = $_GET['rol'];
    }
        $rol = $_GET['rol'];
        $id = $_GET['id'];
        $sta = $_GET['sta'];

        switch ($rol) {
            case 1:
                include('');
                break;
 
            case 2:
                include('');
                break;
 
            case 3:
             include("view/user/index.php");
                break;
            default:
                include('view/userX/index.php');
                break;
            ;
}
?>