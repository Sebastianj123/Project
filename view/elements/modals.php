<head>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

    <?php
        include('config/connectDb.php');
        $sql = 'CALL v_sex();';
        $sql .= 'CALL v_tD();';
        $sql .= 'CALL v_serialtel();';
        $sql .= 'CALL v_city();';

        $querysArray = array();

        if (!$con->multi_query($sql)) {
            echo "Falló la multiconsulta: (" . $con->errno . ") " . $con->error;
        }

        do {
        if ($result = $con->store_result()) {

                $resultQuery = $result->fetch_all(MYSQLI_ASSOC);
                array_push($querysArray, $resultQuery);
    
                $result->free();
            }
        } while ($con->more_results() && $con->next_result());

        $querySex = $querysArray[0];
        $queryTD = $querysArray[1];
        $querySerial = $querysArray[2];
        $queryCity = $querysArray[3];

    ?>
</head>


<!-- Modal Login -->
<div class="modal fade" id="loginM" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    
    <form class="fw-bolder modal-content bg-dark fw-bolder text-primary">
      
            <!-- Encabezado -->
        <mheader class="modal-header">
            
            <h1 class="modal-title text-info fs-3" id="exampleModalLabel">Login</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        
        </mheader>
      
            <!-- Cuerpo -->
        <mbody class="modal-body d-grid row g-2">
            
            <div class="col-md-10 container-fluid">
                
                <label for="reg_ema" class="fw-bold fw-2 text-light">
                    Email
                </label>

                <input type="email" class="form-control bg-secondary" id="reg_ema" autofocus require>

            </div>
            
                <!-- Password -->
            <?php
                include('view\elements\pass.php')
            ?>
            
            <div class="col-10 container-fluid">
                <div class="form-check">
                    <input class="form-check-input bg-secondary" type="checkbox" id="gridCheck">
                    <label class=" fw-bolder text-light" for="gridCheck">
                        Recuerdame el inició de sección
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

                    <ul class="dropdown-menu dropdown-menu-dark ">
                        <li>
                            <a class="dropdown-item text-info">
                                ¿Olvido su contraseña?
                            </a>
                        </li>

                        <li><hr class="dropdown-divider"></li>
                        
                        <li data-bs-toggle="modal" data-bs-target="#registerM">
                            <a class="dropdown-item text-info" data-bs-dismiss="modal">
                                Register
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

<!-- Modal Register -->
<div class="modal fade" id="registerM" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    
    <form class="fw-bolder modal-content bg-dark fw-bolder text-primary">
      
            <!-- Encabezado -->
        <mheader class="modal-header">
            
            <h1 class="modal-title text-info fs-3" id="exampleModalLabel">
                Register
            </h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        
        </mheader>
      
            <!-- Cuerpo -->
        <mbody class="modal-body d-grid row g-2">
        

            <!-- Nombre -->
            <div class="col-md-10 container-fluid">
                
                <label for="dts_nam" class="fw-bold fw-2 text-light">
                    Nombre
                </label>

                <input type="text" class="form-control bg-secondary" id="dts_nam" name="dts_nam" autofocus require>

            </div>
            
            <!-- Apellido -->
            <div class="col-md-10 container-fluid">
                
                <label for="dts_lastName" class="fw-bold fw-2 text-light">
                    Apellido
                </label>

                <input type="text" class="form-control bg-secondary" id="dts_lastName" name="dts_lastName" require>

            </div>

            <div class="col-md-10 container-fluid d-flex">
                
                <div class="flex-fill">
                    <label for="dts_bithDate" class="fw-bold fw-2 text-light">
                        Fecha nacimiento
                    </label>

                    <input type="date" class="form-control bg-secondary" id="dts_bithDate" name="dts_bithDate" require>
                </div>

                <div class="d-grid flex-fill">
                    
                    <label for="sex_id" class="fw-bold fw-2 text-light">
                        Genero:
                    </label>

                    <select class="p-2 fw-bold fw-2 text-dark" id="sex_id" name="sex_id" required>
                        <option selected disabled>Genero</option>
                        <?php
                            for ($i = 0; $i < count($querySex); $i++) :
                        ?>
                            <option value="<?= $querySex[$i]['sex_id'] ?>" 
                            title="<?php $querySex[$i]['sex_nam']?>"><?= $querySex[$i]['sex_nam'] ?></option>
                        <?php
                            endfor;
                        ?>
                    </select>
                </div>

            </div>

            
            <div class="col-md-10 container-fluid">
                
                <label for="tyDoc_id" class="fw-bold fw-2 text-light">
                    Documento De Identidad
                </label>

                <div class="d-flex g-2">
                    <select class="p-2 fw-bold fw-2 text-dark" id="tyDoc_id" name="tyDoc_id" required style="width:20%;">
                        <option selected disabled>TyDoc</option>
                        <?php
                            for ($i = 0; $i < count($queryTD); $i++) :
                        ?>
                            <option value="<?= $queryTD[$i]['tyDoc_id'] ?>" 
                            title="<?php $queryTD[$i]['tyDoc_desc']?>"><?= $queryTD[$i]['tyDoc_desc'] ?></option>
                        <?php
                            endfor;
                        ?>
                    </select>
                    <input type="number" class="form-control bg-secondary" id="dts_doc" name="dts_doc" require>
                </div>

            </div>

            <div class="col-md-10 container-fluid">
                
                <label for="city_id" class="fw-bold fw-2 text-light">
                    Ciudad y Dirección
                </label>

                <div class="d-flex g-2">
                    <select class="p-2 fw-bold fw-2 text-dark" id="city_id" name="city_id" required style="width:20%;">
                        <option selected disabled>Ciudad</option>
                        <?php
                            for ($i = 0; $i < count($queryCity); $i++) :
                        ?>
                            <option value="<?= $queryCity[$i]['city_id'] ?>" 
                            title="<?php $queryCity[$i]['city_nam']?>"><?= $queryCity[$i]['city_nam'] ?></option>
                        <?php
                            endfor;
                        ?>
                    </select>
                    <input type="text" class="form-control bg-secondary" id="dts_addr" name="dts_addr" require>
                </div>

            </div>

            <div class="col-md-10 container-fluid">
                
                <label for="serialTel_id" class="fw-bold fw-2 text-light">
                    Número De Telefono
                </label>

                <div class="d-flex g-2">
                    <select class="p-2 fw-bold fw-2 text-dark" id="serialTel_id" name="serialTel_id" required style="width:20%;">
                        <option selected disabled>Serial</option>
                        <?php
                            for ($i = 0; $i < count($querySerial); $i++) :
                        ?>
                            <option value="<?= $querySerial[$i]['serialTel_id'] ?>"><?= $querySerial[$i]['serialTel_pais'] ?></option>
                        <?php
                            endfor;
                        ?>
                    </select>
                    <input type="tel" class="form-control bg-secondary" id="" name="" require>
                </div>

            </div>


            <div class="col-md-10 container-fluid">
                
                <label for="reg_ema" class="fw-bold fw-2 text-light">
                    Email
                </label>

                <input type="email" class="form-control bg-secondary" id="reg_ema" name="reg_ema" require>

            </div>

            <div class="col-md-10 container-fluid">
                
                <label for="reg_usrName" class="fw-bold fw-2 text-light">
                    Nombre De Usuario
                </label>

                <input type="text" class="form-control bg-secondary" id="reg_usrName" name="reg_usrName" require>

            </div>

            <div class="col-md-10 container-fluid">
                
                <label for="reg_usrName" class="fw-bold fw-2 text-light">
                    Nombre De Usuario
                </label>

                <input type="text" class="form-control bg-secondary" id="reg_usrName" name="reg_usrName" require>

            </div>
            
                <!-- Password -->

            <?php
                include('view\elements\pass.php')
            ?>

            <div class="col-md-10 container-fluid">
                    
                    <!-- Titulo -->
                <label for="reg_pass" class=" fw-bolder text-light">
                    Repetir Password
                </label>

                    <!-- contenedor del input y el botón -->
                <div class="d-flex position-relative">

                        <!-- Input del password -->
                    <input type="password" class="form-control bg-secondary" id="reg_pass1" name="reg_pass1" require>
                    
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

            <script>
                const btn = document.getElementById('btnPassView1');
                // console.log(btn.className);
                btn.addEventListener ('click', ()=>{
                    const inp = document.getElementById('reg_pass1');
                    let classes = Object.values(btn.classList);
                    inp.type = classes
                    .includes('active') ? 
                    'text' :
                    'password';
                    inp.autofocus = "";
                });
            </script>
            
            <div class="col-10 container-fluid">
                <div class="form-check">
                    <input class="form-check-input bg-secondary" type="checkbox" id="gridCheck">
                    <label class=" fw-bolder text-light" for="gridCheck">
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

                    <ul class="dropdown-menu dropdown-menu-dark ">
                        <li>
                            <a class="dropdown-item text-info">
                                ¿Olvido su contraseña?
                            </a>
                        </li>

                        <li><hr class="dropdown-divider"></li>
                        
                        <li data-bs-toggle="modal" data-bs-target="#loguinM">
                            <a class="dropdown-item text-info" data-bs-dismiss="modal">
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
