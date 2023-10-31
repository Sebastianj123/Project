<?php

// use App\Controllers\Usr\UsrController;

use App\Controllers\Header\HeaderController;

$datos = (new HeaderController)->showHeader();
$modules = $datos['mdls'];
$rol = $datos['rol']['rol_nm'];
?>

<style>
  button:hover {
    background: #a391ff;
    color: #fff;
    font-weight: bold;
  }

  .btn-primary {
  background-color: #673ab7!important;
  border-color: #673ab7!important;
  color: #fff!important;
}

.nav-item {
  color: #fff;
  background-color: #4f00ff;
}

.nav-item:hover {
  background-color: #5a00fe;
}

.nav-item:active {
  background-color: #6300fd;
}
button {
  color:#fff !important;
}
</style>
<!-- Header -->
<header class="w-100 d-grid  m-0" >
      <!-- Cabecera del Header -->
      <hHeader class="row nger" style="background: #3200af;">
          <!-- apartado Logo y Nombre de la empresa -->
          <div id="container_logo-nm" class="row col-6">
              <div id="container_logo" class="col-3">
                  <img src="assets/img/icons/Logo.png" alt="Logo" class="p-4 w-100">
              </div>
              <div id="container_nm" class="col-9 d-flex aligt-items-center ">
                <div style="height:50%;" class="mt-4">
                  <h1 class=" h1 mt-4" style="color: #120033;"> Cabello Bello JJ</h1>
                </div>
              </div>
          </div>
  
          <!-- Nav de los botones/link log y el Reg -->
          <nav id="container_log_reg" class="col-6">
            
          </nav>
      </hHeader>
      
      <navHeader class="row">
        <ul class="nav nav-pills w-100 h-100 d-flex bg-dark" id="mdl" role="tablist">
          <?php foreach ($modules as $module): ?>
              <a href="<?=APP_URL_PUBLIC . $module["mdl_url"]?>" class="nav-item flex-fill justify-content-center g-2" role="presentation">
                <button class="nav-link w-100  <?=($module['mdl_nm'] === $mdl) ? 'active':'';?> f-grap" id="<?= $module['mdl_nm'] ?>" data-bs-toggle="pill" data-bs-target="#<?= $module['mdl_nm'] ?>" type="button" role="tab" aria-controls="<?= $module['mdl_nm'] ?>" aria-selected="true">
                  <?= $module['mdl_nm']?> (<?= $rol?>)
                </button>
              </a>
            <?php endforeach ?>
        </ul>
      </navHeader>

  </header>