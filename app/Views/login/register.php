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
  </style>
  <h1 class="text-center mt-3">Formulario de registro</h1>

  <form action="<?= APP_URL_PUBLIC ?>guest/register" method="POST">
    <input type="text" name="per_nm" id="per_nm" placeholder="Nombre" required>
    <input type="text" name="per_ltnm" id="per_ltnm" placeholder="Apellido" required>
    <input type="date" name="per_bithDt" id="per_bithDt" placeholder="Fecha de nacimiento" required>
    <select name="sex_id" id="sex_id">
    <option value="" disabled selected>Género</option>
        <?php foreach ($data['sex'] as $key => $value): ?>
            <option value="<?= $value['sex_id'] ?>" title="<?= $value['sex_dsc']?>" ><?= $value['sex_nm']?></option>
        <?php endforeach ?>
    </select>
    <select name="tyDoc_id" id="tyDoc_id">
        <option value="" disabled selected>Tipo De Documento</option>
        <?php foreach ($data['tyDoc'] as $key => $value): ?>
            <option value="<?= $value['tyDoc_id'] ?>" title="<?= $value['tyDoc_dsc']?>" ><?= $value['tyDoc_nm']?></option>
        <?php endforeach ?>
    </select>
    <input type="number" name="per_doc" id="per_doc" placeholder="Documento" required>
    <input type="text" name="usr_nm" id="usr_nm" placeholder="Nombre de usuario" required>
    <input type="email" name="usr_ema" id="usr_ema" placeholder="Correo electrónico" required>
    <input type="number" name="ust_tel" id="usr_tel" placeholder="Teléfono" required>
    <input type="password" name="usr_pass" id="usr_pass" placeholder="Contraseña" required>
    <input type="text" name="per_addr" id="per_addr" placeholder="Dirección" required>

    <button type="submit">Registrarme</button>
  </form>