<?php 
    require_once("../app/Views/template/header.php");
if(isset($data['message'])){
  $messageText = $data['message'];
}

?>

<!--Container-->
<section class="row w-50 m-auto flex-fill">
    <?php if(isset($messageText)):?>
      <div class="alert alert-warning" role="alert">
        <?= $messageText?>
      </div>
    <?php endif ?>
  <h3 class="text-center mt-4"> Login User </h3>
  <!--Container form-->
  <form id="loginForm" class="d-grid g-3" action="<?= APP_URL_PUBLIC ?>guest/login" method="POST">

    <div class="row mb-3">
      
      <label for="usr_nm" class="h5">
        Credenciales de usuario:
      </label>

      <div class="col-12">
        <input type="text" class="form-control " id="usr_nm" name="usr_nm" placeholder="name@example.com" required>
      </div>

    </div>
    
    <div class="row mb-3">
      
      <label for="usr_pass" class="h5">
        Contraseña
      </label>

      <div class="col-12">
        <input type="password" class="form-control" id="usr_pass" name="usr_pass" placeholder="Password" required>
      </div>
    
    </div>
    
    <div class="row ms-2 mb-3 row p-2">

      <div class="col-5 bg-purple950 rounded p-3 pb-2 row">
        <input type="checkbox" class="col" id="remember" name="remember">
        <label for="remember" class="col-11 h6 text-withe">Recordar inicio de sesión</label>
      </div>
    
    </div>

    <button type="submit" form="loginForm" class="btn btn-primary w-100">Save changes</button>
  </form>

  <!--Container end form-->

</section>
<!-- Container Jscript-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>