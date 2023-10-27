<?php
namespace App;

use App\Config\Routing;
use App\Controllers\Header\HeaderController;
use App\Controllers\Usr\UsrController;


require_once('../app/Config/Autoload.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" href="assets/img/icons/Logo.ico">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="assets/css/normalice.css">
</head>

<body style="background:#c8bdff;">
  <div class="container-fluid d-flex flex-column">
  <?php
    
    // Iniciar Session Guest
    $router = new Routing();
    $router->run();
  ?>

</div>

<?php require_once("../app/Views/template/footer.php") ?> 


</body>

</html>

