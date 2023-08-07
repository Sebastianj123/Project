<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<?php
    include('controller/connectDb.php');

    $sql = 'CALL cabellobellojj.vT_srvA();';


    $query = $con->query($sql);
    $queryAsocc = $query->fetch_all(MYSQLI_ASSOC);
?>

<section id="services">

    <h1 class="title" class="text-info">
        Servicios
    </h1>

    <div id="cards d-flex flex-row">
        
        <!-- Cards individuales -->
<?php
    for ($i=0; $i < count($queryAsocc); $i++) {
?>
        <div id="cardSrv-<?php echo $queryAsocc[$i]['srv_code']; ?>" class="card bg-info rounded-2" style="width: 18rem;">

            <img src="<?php echo $queryAsocc[$i]['srv_img']; ?>" class="card-img-top" alt="<?php echo$queryAsocc[$i]['srv_img']; ?>"
            id="card-img-<?php echo $queryAsocc[$i]['srv_code']; ?>">
            
            <div class="card-body">
            
                    Nombre Servicio
                <h3 class="card-title" id="card-title-<?php echo$queryAsocc[$i]['srv_code']; ?>">
                    <?php
                    echo $queryAsocc[$i]['srv_nam'];
                    ?>
                </h3>
                
                    Precio
                <h5 class="card-title"> $ <span><?php echo$queryAsocc[$i]['srv_prc']; ?> </span></h5>

                    Descripcion
                <p class="card-text">
                    <?php echo$queryAsocc[$i]['srv_dsc']; ?>
                </p>

                <p>
                <?php echo$queryAsocc[$i]['srv_code']; ?>
                </p>
                
                <a href="#" class="btn btn-primary">
                    Mirar Más
                </a>

                <a href="#" class="btn btn-primary">
                    Comprar
                </a>

            </div>
        
        </div>
<?php
    }
    $con -> close();
?>
    </div>

</section>