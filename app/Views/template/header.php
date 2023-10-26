<?php
use App\Controllers\User\UsrController;


session_start();
if (!isset($_SESSION["newsession"])) {
  header("Location: " . DEFAULT_ROUTE);
} else {
  $User = new UsrController();
  $id = $_SESSION["newsession"];
  $attributesId="usr_id";
  $modules = $Usr->getModelUsr();
}

?>
<!-- Header -->
  <header class="container-fluid d-grid">
      <!-- Cabecera del Header -->
      <hHeader class="row">
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
            <?php foreach ($modules as $module): ?>
              <li class="nav-item">
                <a class="nav-link" href="<?= APP_URL_PUBLIC . $module['mdl_url'] ?>">
                  <?= $module['mdl_nm'] ?>
                </a>
              </li>
            <?php endforeach ?>
          </nav>
      </hHeader>

      <navHeader class="container-fluid">
        <ul class="nav nav-pills mb-3 container-fluid d-flex" id="pills-tab" role="tablist">
          <li class="nav-item" role="presentation">
            <button class="nav-link active f-grap" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">Home</button>
          </li>
          <li class="nav-item" role="presentation">
            <button class="nav-link f-grap" id="pills-services-tab" data-bs-toggle="pill" data-bs-target="#pills-services" type="button" role="tab" aria-controls="pills-services" aria-selected="false">Servicios</button>
          </li>
          <li class="nav-item" role="presentation">
            <button class="nav-link f-grap" id="pills-calendar-tab" data-bs-toggle="pill" data-bs-target="#pills-calendar" type="button" role="tab" aria-controls="pills-calendar" aria-selected="false">calendar</button>
          </li>
        </ul>
      </navHeader>

  </header>