<!DOCTYPE html>
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

<!-- Body ----------------------------------------------------------------------------------->
<body  class="bag bg-black d-flex flex-column gap-0">
        
<?php
    include('view/header.php');
?>

<!-- Cuerpo de la Página -->
<article class="d-flex flex-fill py-2 g-2">
    <!-- <div class="row container-fluid"> -->

        <section class="" >

        <section style="height: 100%;" class="d-flex align-content-center flex-fill">
<!-- Botones de acceso a las vistas -->
                <div class="nav d-grid nav-pills me-3 g-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        
                        <button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">
                            
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door" viewBox="0 0 16 16">
                                <path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146ZM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5Z"/>
                            </svg>
                        
                        </button>
    
                        <button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">
                            Profile
    
                        </button>
    
                        <button class="nav-link" id="v-pills-disabled-tab" data-bs-toggle="pill" data-bs-target="#v-pills-disabled" type="button" role="tab" aria-controls="v-pills-disabled" aria-selected="false">
                            Disabled
    
                        </button>
    
                        <button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-messages" type="button" role="tab" aria-controls="v-pills-messages" aria-selected="false">
                            Messages
    
                        </button>
    
                        <button class="nav-link" id="v-pills-settings-tab" data-bs-toggle="pill" data-bs-target="#v-pills-settings" type="button" role="tab" aria-controls="v-pills-settings" aria-selected="false">
                            Settings
    
                        </button>
                    </div>
        </section>

        </section>

        <!-- Vistas -->
        <div class="tab-content flex-grow-1" id="v-pills-tabContent" style="heigth:100%; overflo">
            
            <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab" tabindex="0">
                
            <?php
                include('view/home.php');
            ?>
            </div>
            
            <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab" tabindex="0">
                <h1>home1</h1>

            </div>
            
            <!-- Calendário -->
            <div class="tab-pane fade" id="v-pills-disabled" role="tabpanel" aria-labelledby="v-pills-disabled-tab" tabindex="0">
                <?php
                    // Calendarío
                    include('view/calendario.php');
                ?>

            </div>
            
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
<footer class="bg-danger bottom-0">
    oasdf
</footer>

<!-- SCRIPTS-->
    <!-- BOOSTRAP JS -->
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</html>