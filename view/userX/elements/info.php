<head>

    <?php

    // Incluir la configuración del php (coneecion para el archivo propio)
        // include('..\..\config\connectDb.php');
    // Incluir la configuración del php (coneecion para la pagina)
        include('config/connectDb.php');

        $sql = "CALL v_TinfoPag();";
        $query = $con->query($sql);
        $queryAsocc = $query->fetch_all(MYSQLI_ASSOC);
    ?>

</head>

<section class=" container-fluid d-grid">

    <?php
        for ($i=0; $i < count($queryAsocc); $i++) { 
            $id = $queryAsocc[$i]['pag_id'];
            $nam = $queryAsocc[$i]['pag_nam'];
            $info = $queryAsocc[$i]['pag_text'];
            $img = $queryAsocc[$i]['pag_img'];
            $titleImg = "$nam: $img";
    ?>
    <div id="info-<?php echo $id;?>" class="row">
        
        <h1 class="text-info" id="info-title-<?php echo $id; ?>">
            <?php echo $nam; ?>
        </h1>

        <section class="d-flex">
            <p class="flex-fill">
                <?php echo $info; ?>
            </p>

            <div class="" style="width:30%; position:relative;">
                <img src="<?php echo $img; ?>" alt="<?php echo $img; ?>" title="<?php echo ($titleImg); ?>" class="w-30"
                style="width:100%;">
            </div>

        </section>

    </div>
    <?php
        }
    ?>

</section>