<?php



/*
 * Author:DIEGO CASALLAS
 * DATE: 29/09/2023
 * DESCRIPTION: THIS VIEW GENERAL
 */

namespace App;

use App\Config\Routing;

require_once('../app/Config/Autoload.php');


?>
<!DOCTYPE html>
<html lang="en">
<body>
  <div class="container-fluid">
  <?php
    $router = new Routing();
    $router->run();
  ?>

  </div>

</body>

</html>

