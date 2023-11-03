<?php

use App\Controllers\Header\HeaderController;

$datos = (new HeaderController)->showHeader();
$modules = $datos['mdls'];

// var_dump($modules);
// $mdl = (isset($data['mdl'])) ? $data['mdl'] : 'Home Guest';
// echo $mdl;
?>

      <navHeader class="row d-flex justify-content-center">
        <ul class="w-100 h-100 d-flex bg-dark" id="mdl" role="tablist">
          <?php foreach ($modules as $module): ?>
              <a href="<?=APP_URL_PUBLIC . $module["mdl_url"]?>" class="nav-item flex-fill justify-content-center g-2" role="presentation">
                <button class="nav-link w-100  <?=($module['mdl_nm'] === $mdl) ? 'active':'';?> f-grap" id="<?= $module['mdl_nm'] ?>" data-bs-toggle="pill" data-bs-target="#<?= $module['mdl_nm'] ?>" type="button" role="tab" aria-controls="<?= $module['mdl_nm'] ?>" aria-selected="true">
                  <?= $module['mdl_nm'] ?>
                </button>
              </a>
            <?php endforeach ?>
        </ul>
      </navHeader>

  </header>