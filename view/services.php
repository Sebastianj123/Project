<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> -->
<!-- <link rel="stylesheet" href="assets/css/text.css"> -->

<?php
    include('controller/connectDb.php');

    $sql = 'CALL cabellobellojj.vT_srvA();';


    $query = $con->query($sql);
    $queryAsocc = $query->fetch_all(MYSQLI_ASSOC);
?>

<!-- <section id="services"> -->

    <h1 class="title" class="text-info">
        Servicios
    </h1>

    <div id="cards" class="d-flex flex-row flex-wrap ">
        
        <!-- Cards individuales -->
<?php
    for ($i=0; $i < count($queryAsocc); $i++) {
?>

        
        <div id="cardSrv-<?php echo $queryAsocc[$i]['srv_code']; ?>" class="card bg-info rounded-2 d-grid border-3 border-info flex-grow-1 m-2" style="max-width: 25vw; max-height:100vh;">

            <div id="cardImg <?php echo$queryAsocc[$i]['srv_code']; ?>" class="p-3">
                <img src="<?php echo $queryAsocc[$i]['srv_img']; ?>" class="card-img-top border border-4 border-dark rounded-2" alt="<?php echo$queryAsocc[$i]['srv_img']; ?>"
                id="card-img-<?php echo $queryAsocc[$i]['srv_code']; ?>">
            </div>
            
            <div class="card-body">
            
                    <!-- Nombre Servicio -->
                <h3 class="card-title" id="card-title-<?php echo$queryAsocc[$i]['srv_code']; ?>">
                    <?php
                    echo $queryAsocc[$i]['srv_nam'];
                    ?>
                </h3>
                
                    Precio
                <h5 class="card-title"> $ <span><?php echo$queryAsocc[$i]['srv_prc']; ?> </span></h5>
                
                <a href="" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#cardM-<?php echo$queryAsocc[$i]['srv_code']; ?>">
                    Ver Más
                </a>

                <a href="#" class="btn btn-primary">
                    Haz tu reserva...
                </a>

            </div>
        
        </div>

                <!-- Modal de la card <?php echo$queryAsocc[$i]['srv_code']; ?> -->
        <div class="modal fade" id="cardM-<?php echo$queryAsocc[$i]['srv_code']; ?>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            
            <form class="fw-bolder text-light-emphasis modal-content bg-dark fw-bolder">
            
                    <!-- Encabezado -->
                <mheader class="modal-header">
                    
                    <h1 class="modal-title text-info fs-3" id="exampleModalLabel">
                        <?php
                            echo $queryAsocc[$i]['srv_nam'];
                        ?>
                    </h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                
                </mheader>
            
                    <!-- Cuerpo -->
                <mbody class="modal-body d-grid row">
                
                    <img src="<?php echo $queryAsocc[$i]['srv_img']; ?>" class="card-img-top" alt="<?php echo$queryAsocc[$i]['srv_img']; ?>"
                    id="card-img-<?php echo $queryAsocc[$i]['srv_code']; ?>">
                    
                    <div class="card-body">
                    
                            <!-- Nombre Servicio -->
                        <h3 class="card-title" id="card-title-<?php echo$queryAsocc[$i]['srv_code']; ?>">
                            <?php
                                echo $queryAsocc[$i]['srv_nam'];
                            ?>
                        </h3>
                        
                            <h2 class="text-info">
                                Precio:
                            </h2>
                        <h5 class="card-title text-white"> $ <span class="text-white"><?php echo$queryAsocc[$i]['srv_prc']; ?> </span></h5>

                            <h2 class="text-info">
                                Descripción
                            </h2>
                        <p class="card-text text-white">
                            <?php echo$queryAsocc[$i]['srv_dsc']; ?>
                        </p>

                            <h2 class="text-info">
                                Código Del Serivicio:
                            </h2>
                        <p class="text-white">
                            <?php echo$queryAsocc[$i]['srv_code']; ?>
                        </p>

                    </div>
                </mbody>

                    <!-- Footer -->
                <mfooter class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    
                    <a href="#" class="btn btn-primary">
                            Haz tu reserva...
                        </a>
                </mfooter>

            </form>
        </div>
        </div>
<?php
    }
    $con -> close();
?>
    </div>

<!-- </section> -->