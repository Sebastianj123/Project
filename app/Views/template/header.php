<?php 
$modules = $data['mdls'];
?>
<!-- Header -->
  <header class="w-100 d-grid">
      <!-- Cabecera del Header -->
      <hHeader class="row nger">
          <!-- apartado Logo y Nombre de la empresa -->
          <div id="container_logo-nm" class="row col-6">
              <div id="container_logo" class="col-3">
                  <img src="assets/img/icons/Logo.png" alt="Logo" class="p-4 w-100">
              </div>
              <div id="container_nm" class="col-9 d-flex aligt-items-center ">
                <div style="height:50%;" class="mt-4">
                  <h1 class="text-primary h1 mt-4"> Cabello Bello JJ</h1>
                </div>
              </div>
          </div>
  
          <!-- Nav de los botones/link log y el Reg -->
          <nav id="container_log_reg" class="col-6">
            
          </nav>
      </hHeader>

      <navHeader class="row">
        <ul class="nav nav-pills mb-3 w-100 h-100 d-flex bg-secondary" id="mdl" role="tablist">
          <?php foreach ($modules as $module): ?>
              <li class="nav-item flex-fill justify-content-center g-2" role="presentation">
                <button class="nav-link w-100 h-100 <?=($module === $modules[0]) ? 'active':'';?> f-grap" id="<?= $module['mdl_nm'] ?>" data-bs-toggle="pill" data-bs-target="#<?= $module['mdl_nm'] ?>" type="button" role="tab" aria-controls="<?= $module['mdl_nm'] ?>" aria-selected="true"><?= $module['mdl_nm'] ?></button>
              </li>
            <?php endforeach ?>
        </ul>
      </navHeader>

  </header>