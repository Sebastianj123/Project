<?php 
  require_once('../app/Views/template/header.php'); 
  $srvs = $data['srv'];
?>
<div class="container-fluid d-flex flex-wrap justify-content-center aling-items-center">
<style>

  .card {
    display: grid;
    grid-template-rows: 15% 30% auto auto;
    height: 60vh;
  }

  .text-withe-1 {
    color: #5e1eff !important;
    text-shadow: .2rem .2rem .5rem #3e00e6;
  }

</style>
<?php
foreach ($srvs as $key => $row):
    $id = $row['srv_id'];
    $nm = $row['srv_nm'];
    $dsc = $row['srv_dsc'];
    $img = $row['srv_img'];
    $precio = $row['srv_cost'];
    $time = $row['srv_tm'];
    $sta = $row['sta_id'];
    if ($sta === '1') :
?>
<div id="card-<?= $id ?>-<?= $nm ?>" class="card m-3" style="width: 18rem;">
  <div class="card-body">
    <h5 class="card-title px-2 py-1 text-withe-1"><?= $nm ?></h5>
  </div>
  <img src="<?= $img ?>" class="card-img" alt="<?= $img ?>" title="<?= $nm ?>: <?= $img ?>">

  <ul class="list-group list-group-flush d-grid ">
    <li class="list-group-item flex-fill"><strong class="text-withe-1">Costo: </strong> $<?= $precio ?> COP</li>
    <li class="list-group-item flex-fill"><strong class="text-withe-1">Tiempo Estimado: </strong> <?= $time ?> minutos </li>
  </ul>
  <div class="card-body jusify-content-center aling-items-center">
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#Modal-Srv-<?= $id ?>">
      Más info...
    </button>
    <a href="<?=APP_URL_PUBLIC . 'usr/showComprar'?>" class="flex-fill justify-content-center g-2">
      <button class="w-100 f-grap" id="comprar-<?= $id ?>" type="button" aria-selected="true">
        Comprar
      </button>
    </a>
  </div>
</div>



<!-- Modal -->
<div class="modal fade" id="Modal-Srv-<?= $id ?>" tabindex="-1" aria-labelledby="Modal-Srv-<?= $id ?>" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content  bg-dark">
      <div class="modal-header">
        <center>
          <h2 class="modal-title text-withe-1 fw-bold" id="Title-Modal-Srv-<?= $id ?>">
            <?= $nm ?>
          </h2>
        </center>
        <button type="button" class="btn-close bg-danger" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body bg-dark">
        <img src="<?= $img ?>" class="card-img-top" alt="<?= $img ?>">
        <ul class="list-group list-group-flush bg-dark">
          <li class="list-group-item text-withe bg-dark"><strong class="text-withe-1">Costo: </strong> $<?= $precio ?> COP</li>
          <li class="list-group-item text-withe bg-dark"><strong class="text-withe-1">Tiempo Estimado: </strong> <?= $time ?> minutos </li>
          <li class="list-group-item text-withe bg-dark"><strong class="text-withe-1">Descripcion Del servicio: </strong> <?= $dsc ?></li>
        </ul>
      </div>
      <div class="modal-footer d-flex flex-row">
        <a href="<?=APP_URL_PUBLIC . 'usr/showComprar'?>" class="flex-fill justify-content-center g-2">
          <button class="f-grap btn btn-primary" id="comprar-<?= $id ?>" type="button" aria-selected="true">
            Comprar
          </button>
        </a>
        <!-- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
      </div>
    </div>
  </div>
</div>

<?php
endif;
endforeach;
?>
</div>