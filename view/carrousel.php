<head>
  <?php
    // include('../config/connectDb.php');
    include('config/connectDb.php');

    $sql = 'CALL cabellobellojj.vT_srvA();';


    $query = $con->query($sql);
    $queryAsocc = $query->fetch_all(MYSQLI_ASSOC);
    $interval = 3000;
    $url_error = 'https://www.mundodeportivo.com/alfabeta/hero/2018/10/167687.alfabetajuega-problemas-tecnicos.jpg?width=1200';
  ?>

<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous"> -->
</head>

<article class="flex-fill justify-content-center align-items-center px-10">
        
    <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
        
        <div class="carousel-inner">

            <?php 
                
                for ($i=0; $i < count($queryAsocc); $i++) {
                    $url = $queryAsocc[$i]['srv_img'];
                    $code =$queryAsocc[$i]['srv_code'];
             ?>
            
            <!-- Imagen #<?php echo $i + 1 ?> code-<?php echo $code; ?> -->
            <a 
                href="#" id="a-carrousel-<?php echo $code; ?>" 
                class="carousel-item w-100 <?php if($i==0) {echo 'active';} else; ?>" 
                data-bs-interval="3000"
            />

                <div class="container-fluid w-60 d-flex justify-content-center align-items-center" style="height:70vh;">
                    <img 
                        id="img-carrousel-<?php echo $code; ?>" 
                        src="<?php if($url == '') {echo $url_error;} else {echo $url;} ?>" 
                        alt="<?php if($url == '') {echo $url_error;} else {echo $url;} ?>" 
                        class="w-60 img-carrousel"
                    />
                </div>
            
            </a>

            <?php } 
            ?>
        </div>

        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
            <span class="carousel-control-prev-icon p-4 bg-dark" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
            <span class="carousel-control-next-icon p-4 bg-dark" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>    

</article>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>