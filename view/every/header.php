<head>
        <!-- Linkeado CSS BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<header class="top-0 d-flex px-5 justify-content-between container-fluid" style="heigth:4vh;">

  <nav class="navbar bg-body-tertiary col-8;">
      <div class="container">
        
      <a class="navbar-brand d-flex justify-content-center" title="Salon De Belleza Cabello Bello JJ">
          
          <div class="me-4">
            <img src="./assets/img/icon1-modified.png" 
          alt="Salon De Belleza Cabello Bello JJ" title="Salon De Belleza Cabello Bello JJ" width="50">
          </div>

        <h1>
          Salon De Belleza Cabello Bello JJ
        </h1>
        
        </a>
      </div>
    </nav>

<section class="d-flex g-5 align-items-center">

  <?php
  require('assets/php/declare.php');
  
    if ($rol > 3 || $rol < 1) {
      include('view/every/header/header.php');
    } 
    // else {
    //   include('view/every/header/header1.php');
    // }
  ?>

</section>

</header>