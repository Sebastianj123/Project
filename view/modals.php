<head>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
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
                
                <label for="inputEmail4" class="fw-bold fw-2 text-light">
                    Email
                </label>

                <input type="email" class="form-control bg-secondary" id="inputEmail4" autofocus require>

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
            


            <div class="col-md-10 container-fluid">
                
                <label for="inputEmail4" class="fw-bold fw-2 text-light">
                    Email
                </label>

                <input type="email" class="form-control bg-secondary" id="inputEmail4" autofocus require>

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
