<!DOCTYPE html>
<html lang="es">
<head>
    <?php require_once('every/meta.php'); ?>
</head>
<body>
  <!-- Header -->
  <header>
      <!-- Cabecera del Header -->
      <hHeader>
  
          <!-- apartado Logo y Nombre de la empresa -->
          <div id="container_logo-nm">
              <div id="container_logo" ></div>
              <div id="container_nm" ></div>
          </div>
  
          <!-- Nav de los botones/link log y el Reg -->
          <nav id="container_log_reg">
                  <!-- link log-->
              <a href="" id="link_log">
                  log
              </a>          
                  <!-- divisor -->
                  <hr id="divisor_log_reg">
              <!-- Link Reg -->
              <a href="" id="link_reg">
                  reg
              </a>
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

  <bBody>
    <div class="tab-content" id="pills-tabContent">
        
        <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
          HOME
        </div>
        
        <div class="tab-pane fade" id="pills-services" role="tabpanel" aria-labelledby="pills-services-tab" tabindex="0">
          SERVICES
        </div>
        
        <div class="tab-pane fade" id="pills-calendar" role="tabpanel" aria-labelledby="pills-calendar-tab" tabindex="0">
          calendar
        </div>

      </div>
  </bBody>

  <footer>
    footer
  </footer>
</body>
</html>