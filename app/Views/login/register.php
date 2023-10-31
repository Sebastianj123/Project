<?php 
    require_once("../app/Views/template/header.php"); 
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
    
  </style>
  <h1 class="text-center mt-3">Formulario de registro</h1>

  <form action="<?= APP_URL_PUBLIC ?>guest/register" method="POST" class="bg-purple950 p-5 rounded">
    
    <input type="text" class = "form-control" name="per_nm" id="per_nm" placeholder="Nombre" required>
    
    <input type="text" class = "form-control" name="per_ltnm" id="per_ltnm" placeholder="Apellido" required>
    
    <div class="row">
      <label for="per_bithDt" class="col-7">
        <span class="form-control">
          Fecha de nacimiento:
        </span>
      </label>
      <div class="col-5">
        <input type="date" class="form-control" name="per_bithDt" id="per_bithDt" required>
      </div>
    </div>

    <div class="d-grid my-2">
      <div class="row col-12 m-auto g-2">
        <select class = "form-control" name="sex_id" id="sex_id" class="col-5 p-2">
          <option value="" disabled selected>Género</option>
          <?php foreach ($data['sex'] as $key => $value): ?>
              <option value="<?= $value['sex_id'] ?>" title="<?= $value['sex_dsc']?>" ><?= $value['sex_nm']?></option>
          <?php endforeach ?>
        </select>
        <select class = "form-control" name="tyDoc_id" id="tyDoc_id" class="col-5 p-2">
          <option value="" disabled selected>Tipo De Documento</option>
          <?php foreach ($data['tyDoc'] as $key => $value): ?>
              <option value="<?= $value['tyDoc_id'] ?>" title="<?= $value['tyDoc_dsc']?>" ><?= $value['tyDoc_nm']?></option>
          <?php endforeach ?>
        </select>
      </div>
    </div>
    <input type="number" class = "form-control" name="per_doc" id="per_doc" placeholder="Documento" required>
    <input type="text" class = "form-control" name="usr_nm" id="usr_nm" placeholder="Nombre de usuario" required>
    <input type="email" class = "form-control" name="usr_ema" id="usr_ema" placeholder="Correo electrónico" required>
    <input type="number" class = "form-control" name="ust_tel" id="usr_tel" placeholder="Teléfono" required>
    <input type="password" class = "form-control" name="usr_pass" id="usr_pass" placeholder="Contraseña" required>
    <input type="text" class = "form-control" name="per_addr" id="per_addr" placeholder="Dirección" required>

    <button type="submit">Registrarme</button>
  </form>