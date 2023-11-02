<?php 
    require_once("../app/Views/template/header.php");
    // var_dump($data);
    $usr = $data['usr'];
?>
<style>
    body {
      font-family: sans-serif;
    }

    form {
      width: 500px;
      margin: 0 auto;
    }

    input {
      width: 100%;
      padding: 10px;
      margin-bottom: 10px;
      border: 1px solid #ccc;
    }

    button {
      width: 100%;
      padding: 10px;
      background-color: #000;
      color: #fff;
      border: none;
      cursor: pointer;
    }
    button:hover {
      background: #a391ff;
      color: #fff;
      font-weight: bold;
    }

    .bg-purple950 {
      background: #120033;
    }

    .bg-purple {
      background: #4a00ff;
    }
    
  </style>

  <h1 class="text-center mt-3">Datos del usuario</h1>

  
  <form action="<?= APP_URL_PUBLIC ?>usr/inhability" method="POST" class="bg-purple950 p-5 rounded">
  <div class="alert alert-warning d-flex align-items-center justify-content-center container-fluid" role="alert">
    <div class="fw-bold flex-fill">
        Antes de eliminar su cuenta necesitamos verificar que sea usted ya que esta acción inHabilitara el acceso a esta página:
    </div>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>

  <div class="alert alert-warning d-flex align-items-center justify-content-center container-fluid" role="alert">
    <div class="fw-bold flex-fill">
        Si lo devolvio a esta página despues de eliminar su cuenta es que ocurrio un error.
    </div>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>

  <h2 class="text-center text-withe">Eliminar</h2>  

    <label for="usr_id" class=" px-4 py-2 mb-3 text-withe rounded fw-bold w-100">
        Ingrese su contraseña :
    </label>
    
    <input type="pass" class ="form-control" name="usr_pass" id="usr_pass" placeholder="Contraseña" required>
        
    <div class="d-flex w-100">

      <?php require_once('../app/Views/template/usr/templateButtons.php') ?>

      <button type="submit" class="rounded ms-5">
        InHabilitar tu cuenta
      </button>
    </div>
</form>