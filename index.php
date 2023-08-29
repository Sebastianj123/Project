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
    
// Rol
    if (!isset($_GET['rol'])) {
        $rol = null;
    } else {
        $rol = $_GET['rol'];
    }
// id
    
    if (!isset($_GET['id'])) {
        $id = null;
    } else {
        $id = $_GET['id'];
    }

// sta
    if (!isset($_GET['sta'])) {
        $sta = null;
    } else {
        $sta = $_GET['sta'];
    }

// condicional switch
    switch ($rol) {
        case 1:
            include('');
            break;
        case 2:
            include('');
            break;

        case 3:
            // include("view/user/index.php");
            break;
        default:
            // include('view/userX/index.php');
            break;
}
?>

<!-- Body ----------------------------------------------------------------------------------->
<body  class="bag bg-black d-flex flex-column gap-0 over-x-hidden">
        
<?php
    include('view/modals/modals.php');
?>

<!-- Cuerpo de la Página -->
<article class="d-flex flex-fill py-2" style="height: 85vh;">
    <!-- <div class="row container-fluid"> -->

        <section>

            <section style="height: 100%;" class="d-flex align-content-center flex-fill">
                    <!-- Botones de acceso a las vistas -->
                <div class="nav d-grid nav-pills me-3 g-3" id="v-pills-tab" role="tablist" aria-orientation="vertical" style="width: 8vw;">
                    
                <?php
                    require('view/every/nav.php');
                ?>

                    <!-- <button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-messages" type="button" role="tab" aria-controls="v-pills-messages" aria-selected="false">
                        Messages

                    </button>

                    <button class="nav-link" id="v-pills-settings-tab" data-bs-toggle="pill" data-bs-target="#v-pills-settings" type="button" role="tab" aria-controls="v-pills-settings" aria-selected="false">
                        Settings

                    </button> -->
                </div>
            </section>

        </section>

        <!-- Vistas -->
        <div class="tab-content flex-grow-1 mx-3 p-2" id="v-pills-tabContent" style="heigth:100vh; overflow-y: scroll;">
            
            <?php
                require('view/every/navHome.php');
            ?>
            
            <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab" tabindex="0">
                <h1>home3</h1>

            </div>
            
            <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab" tabindex="0">
                <h1>home4</h1>

            </div>
        </div>
        
    <!-- </div> -->
</article>

<!-- Footer -->

<?php
    include('view/every/footer.php');
?>



<!-- SCRIPTS-->
    <!-- BOOSTRAP JS -->
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</html>