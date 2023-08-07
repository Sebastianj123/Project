
<!-- Modal Login -->
<div class="modal fade" id="loginM" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    
    <form class="fw-bolder text-light-emphasis modal-content bg-dark fw-bolder">
      
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

                <input type="email" class="form-control bg-secondary" id="inputEmail4" autofocus>
            
            </div>
            
            <div class="col-md-10 container-fluid">
                
                <label for="inputPassword4" class=" fw-bolder text-light">
                    Password
                </label>
                <input type="password" class="form-control bg-secondary" id="inputPassword4">
            
            </div>
            
            <div class="col-10 container-fluid">
                <div class="form-check">
                <input class="form-check-input bg-secondary" type="checkbox" id="gridCheck">
                <label class=" fw-bolder text-light" for="gridCheck">
                    Check me out
                </label>
                </div>
            </div>

            <div class="col-10 container-fluid">

                <a href="#" class="link-info link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover container" title="Recuperar Contraseña">
                    Recuperar Contraseña
                </a>
            
            </div>
      
        </mbody>

            <!-- Footer -->
        <mfooter class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Sign in</button>
        </mfooter>

    </form>
  </div>
</div>

<!-- Modal Register -->
<div class="modal fade" id="registerM" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    
    <form class="fw-bolder text-light-emphasis modal-content bg-dark fw-bolder">
      
            <!-- Encabezado -->
        <mheader class="modal-header">
            
            <h1 class="modal-title text-info fs-3" id="exampleModalLabel">Register</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        
        </mheader>
      
            <!-- Cuerpo -->
        <mbody class="modal-body d-grid row">
            
            <div class="col-md-10 container-fluid">
                
                <label for="inputEmail4" class="fw-bold fw-2 text-light">
                    Email
                </label>

                <input type="email" class="form-control" id="inputEmail4">
            
            </div>
            
            <div class="col-md-10 container-fluid">
                
                <label for="inputPassword4" class=" fw-bolder text-light">
                    Password
                </label>
                <input type="password" class="form-control" id="inputPassword4">
            
            </div>
            
            <div class="col-10 container-fluid">
                <div class="form-check">
                <input class="form-check-input" type="checkbox" id="gridCheck">
                <label class=" fw-bolder text-light" for="gridCheck">
                    Check me out
                </label>
                </div>
            </div>
      
        </mbody>

            <!-- Footer -->
        <mfooter class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Sign in</button>
        </mfooter>

    </form>
  </div>
</div>