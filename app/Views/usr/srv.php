<?php
require_once('../app/Views/template/header.php');
    $srvs = $data['srv'];
foreach ($srvs as $key => $row):
    $id = $row['srv_id'];
    $nm = $row['srv_nm'];
    $img = $row['srv_img'];
    $precio = $row['srv_cost'];
    $time = $row['srv_tm'];
?>
<div id="card-<?= $id ?>-<?= $nm ?>" class="card" style="width: 18rem;">
  <img src="<?= $img ?>" class="card-img-top" alt="<?= $img ?>">
  <div class="card-body">
    <h5 class="card-title"><?= $nm ?></h5>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item"><strong>Costo: </strong> $<?= $precio ?> </li>
    <li class="list-group-item"><strong>Tiempo Estimado: </strong> <?= $time ?> </li>
  </ul>
  <div class="card-body">
    <a href="#" class="card-link">Card link</a>
    <a href="#" class="card-link">Another link</a>
  </div>
</div>
<?php
endforeach;
?>

