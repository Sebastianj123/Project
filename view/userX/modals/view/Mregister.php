<!-- Modal Register -->
<div class="modal fade" id="registerM" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    
    <form class="fw-bolder modal-content bg-dark fw-bolder text-primary" method="POST" action="controller/user/reg.php">
      
            <!-- Encabezado -->
        <mheader class="modal-header">
            
            <h1 class="modal-title text-info fs-3" id="registerModalLabel">
                Register
            </h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        
        </mheader>
      
            <!-- Cuerpo -->
        <mbody class="modal-body d-grid row g-2 position-relative">
        

            <!-- Nombre -->
            <div class="col-md-10 container-fluid">
                
                <label for="per_name" class="fw-bold fw-2 text-light">
                    Nombre
                </label>

                <input type="text" class="form-control bg-secondary" id="per_name" name="per_name" autofocus required>

            </div>
            
            <!-- Apellido -->
            <div class="col-md-10 container-fluid">
                
                <label for="per_lastname" class="fw-bold fw-2 text-light">
                    Apellido
                </label>

                <input type="text" class="form-control bg-secondary" id="per_lastname" name="per_lastname" required>

            </div>

            <div class="col-md-10 container-fluid d-flex">
                
                <div class="d-grid me-2 col-5 rounded">
                        
                    <label for="sex_id" class="fw-bold fw-2 text-light">
                        Genero:
                    </label>
                    <select class="p-2 fw-bold fw-2 text-dark btn-primary" id="sex_id" name="sex_id" required>
                        <option selected disabled>Genero</option>
                        <?php
                            for ($i = 0; $i < count($querySex); $i++) :
                        ?>
                            <option value="<?= $querySex[$i]['sex_id'] ?>" 
                            title="<?php $querySex[$i]['sex_name']?>"><?= $querySex[$i]['sex_name'] ?></option>
                        <?php
                            endfor;
                        ?>
                    </select>
                </div>

                <div class="flex-fill col-6">
                    <label for="brithDate" class="fw-bold fw-2 text-light">
                        Fecha nacimiento
                    </label>

                    <input type="date" class="form-control bg-secondary" id="brithDate" name="brithDate" required>
                </div>
                
            </div>

            
            <div class="col-md-10 container-fluid">
                
                <label for="tyDoc_id" class="fw-bold fw-2 text-light">
                    Documento De Identidad
                </label>

                <div class="d-flex g-2">
                    <select class="p-2 fw-bold fw-2 text-dark btn-primary me-2" title="Tipo de documento" id="tyDoc_id" name="tyDoc_id" required style="width:17.5%;">
                        <option selected disabled>TD (Tipo De Documento)</option>
                        <?php
                            for ($i = 0; $i < count($queryTD); $i++) :
                        ?>
                            <option value="<?= $queryTD[$i]['tyDoc_id'] ?>" 
                            title="<?php echo$queryTD[$i]['tyDoc_dsc']?>"><?= $queryTD[$i]['tyDoc_name'] ?> (<?php echo$queryTD[$i]['tyDoc_dsc']?>)</option>
                        <?php
                            endfor;
                        ?>
                    </select>
                    <input type="number" class="form-control bg-secondary" id="per_doc" name="per_doc" required>
                </div>

            </div>

            <div class="col-md-10 container-fluid">
                
                <label for="per_addr" class="fw-bold fw-2 text-light">
                    Dirección
                </label>

                <input type="text" class="form-control bg-secondary" id="per_addr" name="per_addr" required>

            </div>

            <div class="col-md-10 container-fluid">
                
                <label for="per_tel" class="fw-bold fw-2 text-light">
                    Número De Telefono
                </label>

                <input type="tel" class="form-control bg-secondary" id="per_tel" name="per_tel" required>

            </div>


            <div class="col-md-10 container-fluid">
                
                <label for="per_ema" class="fw-bold fw-2 text-light">
                    Email
                </label>

                <input type="email" class="form-control bg-secondary" id="per_ema" name="per_ema" required>

            </div>

            <div class="col-md-10 container-fluid">
                
                <label for="per_usrName" class="fw-bold fw-2 text-light">
                    Nombre De Usuario
                </label>

                <input type="text" class="form-control bg-secondary" id="per_usrName" name="per_usrName" required>

            </div>

            <div class="col-md-10 container-fluid">
                
                <label for="per_pass" class="fw-bold fw-2 text-light">
                    Contraseña
                </label>

                <input type="password" class="form-control bg-secondary" id="per_pass" name="per_pass" required>

            </div>
            
                <!-- Password -->

            <!-- <?php
                // include('view\elements\pass.php');
            ?> -->

            <div class="col-md-10 container-fluid">
                    
                    <!-- Titulo -->
                <label for="pass" class="fw-bolder text-light">
                    Repetir Password
                </label>

                    <!-- contenedor del input y el botón -->
                <div class="d-flex position-relative">

                        <!-- Input del password -->
                    <input type="password" class="form-control bg-secondary" id="pass" name="pass" required>
                    
                        <!-- Boton para cambiar el tipo de input que es (toogel de text input) -->
                    <button class="position-absolute end-0 btn btn-primary" data-bs-toggle="button" id="btnPassView1" style="width:10%; height:100%;">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-eye-slash" viewBox="0 0 16 16">
                            <path d="M13.359 11.238C15.06 9.72 16 8 16 8s-3-5.5-8-5.5a7.028 7.028 0 0 0-2.79.588l.77.771A5.944 5.944 0 0 1 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.134 13.134 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755-.165.165-.337.328-.517.486l.708.709z"/>
                            <path d="M11.297 9.176a3.5 3.5 0 0 0-4.474-4.474l.823.823a2.5 2.5 0 0 1 2.829 2.829l.822.822zm-2.943 1.299.822.822a3.5 3.5 0 0 1-4.474-4.474l.823.823a2.5 2.5 0 0 0 2.829 2.829z"/>
                            <path d="M3.35 5.47c-.18.16-.353.322-.518.487A13.134 13.134 0 0 0 1.172 8l.195.288c.335.48.83 1.12 1.465 1.755C4.121 11.332 5.881 12.5 8 12.5c.716 0 1.39-.133 2.02-.36l.77.772A7.029 7.029 0 0 1 8 13.5C3 13.5 0 8 0 8s.939-1.721 2.641-3.238l.708.709zm10.296 8.884-12-12 .708-.708 12 12-.708.708z"/>
                        </svg>
                    </button>
                </div>
                
            </div>
            
            <div class="col-10 container-fluid">
                <div class="form-check">
                    <input class="form-check-input bg-secondary" type="checkbox" id="gridCheck">
                    <label class=" fw-bolder text-light" for="gridCheck" required>
                        Hacepto Terminos y condiciones
                    </label>
                </div>
            </div>
      
        </mbody>

            <!-- Footer -->
        <mfooter class="modal-footer d-flex justify-content-between container-fluid">
            
                <!-- Links -->
            <div id="mfooter-links" class="d-grid text-center">
            
                <div class="dropdown">
                    
                    <button class="btn btn-danger dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Otras Opciones
                    </button>

                    <ul class="dropdown-menu dropdown-menu-dark" style="z-index:10000;">
                    
                        <li data-bs-toggle="modal" data-bs-dismiss="modal">
                            <a class="dropdown-item text-info" data-bs-toggle="modal" data-bs-target="#q1M">
                                ¿Por qué tengo que registrar me?
                            </a>
                        </li>

                        <li><hr class="dropdown-divider"></li>
                        
                        <li data-bs-dismiss="modal">
                            <a class="dropdown-item text-info" data-bs-toggle="modal" data-bs-target="#loginM" >
                                Ya tengo una cuenta
                            </a>
                        </li>
                    </ul>
                </div>
                
            </div>
                <!-- Botones -->
            <div id="mfooter-buttons">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Sign in</button>
            </div>
        </mfooter>

    </form>
  </div>
</div>