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
        <!-- botones input num -->
    <link rel="stylesheet" href="assets/css/btnInpNum.css">
    <!-- require -->

        <!-- ICONOS -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

</head>
<!-- Body ----------------------------------------------------------------------------------->
<body  class="bag bg-black d-flex flex-column gap-0 over-x-hidden">
        
<?php
    require('assets/php/declare.php');
    require('view/modals/modals.php');
    require('view/every/header.php');

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
                </div>
            </section>

        </section>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#agendarCitaM"></button>

        <!-- Vistas -->
        <div class="tab-content flex-grow-1 mx-3 p-2" id="v-pills-tabContent" style="heigth:100vh; overflow-y: scroll;">
            
            <?php
                require('view/every/navHome.php');
            ?>

            </div>
        </div>
        
    <!-- </div> -->
</article>

<!-- Footer -->

<?php
    require('view/every/footer.php');
?>

<!-- ALERTS -->
<div class="position-absolute">
    <?php
        if (!$error == null) :
    ?>
        <div class="alert alert-danger d-flex align-items-center justify-content-between container-fluid" role="alert" style="position:absolute; top:10%; z-index:10000000;">
            <!-- <svg class="bi flex-shrink-0 me-2" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg> -->
            <div>
                <?= $errors[$error]; ?>        
            </div>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <?php
        endif;
        // require('view/modals/modals.php');
    ?>

    <?php
        if (!$mss == null) :
    ?>
        <div class="alert alert-primary d-flex align-items-center justify-content-between container-fluid" role="alert" style="position:absolute; top:10%; z-index:10000000;">
            <!-- <svg class="bi flex-shrink-0 me-2" role="img" aria-label="Info:"><use xlink:href="#info-fill"/></svg> -->
            <div>
                <?= $msss[$mss]; ?>        
            </div>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <?php
        endif;
    ?>
</div>

</body>
<!-- SCRIPTS-->
    <!-- BOOSTRAP JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</html>

