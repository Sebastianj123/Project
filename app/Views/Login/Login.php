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
  <form id="loginForm" action="<?= APP_URL_PUBLIC ?>guest/login" method="POST">

    <div class="form-floating mb-3">
      <input type="text" class="form-control form-control-sm" id="usr_nm" name="usr_nm"
        placeholder="name@example.com" value="" required>
      <label for="floatingInput"> User Email</label>
    </div>
    <div class="input-group mb-3 input-group-sm ">
      <input type="password" class="form-control" id="usr_pass" name="usr_pass" value=""
        placeholder="Password" aria-label="Example text with button addon" aria-describedby="button-addon1" required>
    </div>
    
    <div class="input-group mb-3 input-group-sm d-grid row">
      <div class="row">
        <input type="checkbox" class="col" id="remember" name="remember">
        <label for="remember" class="col-11">Recordar inicio de sesión</label>
      </div>
    </div>

    <button type="submit" form="loginForm" class="btn btn-primary w-100">Save changes</button>
  </form>

  <!--Container end form-->

</section>
<!-- Container Jscript-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>