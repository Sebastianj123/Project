<!-- Modal Login -->
<div class="modal fade" id="deleteM" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    
    <form class="fw-bolder modal-content bg-dark fw-bolder text-primary" id="formdelete" action="view/modals/controller/deleteU.php" method="POST">
      
            <!-- Encabezado -->
        <mheader class="modal-header">
            
            <h1 class="modal-title text-info fs-3" id="loguinModalLabel">
                Eliminar usuario
            </h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        
        </mheader>
      
            <!-- Cuerpo -->
        <mbody class="modal-body d-grid row g-2">
            
            <div class="col-md-10 container-fluid">
                
                <label for="user_ema" class="fw-bold fw-2 text-light">
                    Ingrese el nombre de Usuario, Teléfono o Correo con el que este registrado 
                </label>

                <input type="text" class="form-control bg-secondary" id="user_ema" name="user_ema" autofocus required>

            </div>
            
                <!-- Password -->
            <div class="col-md-10 container-fluid">
        
                <label for="user_pass" class=" fw-bolder text-light">
                    Ingrese la contraseña
                </label>
            
                    <!-- contenedor del input y el botón -->
                <div class="d-flex position-relative">
            
                        <!-- Input del password -->
                    <input type="password" class="form-control bg-secondary" id="user_pass" name="user_pass" required>
                    
                        <!-- Boton para cambiar el tipo de input que es (toogel de text input) -->
                    <button class="position-absolute end-0 btn btn-primary" data-bs-toggle="button" id="btnPassView" style="width:10%; height:100%;">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-slash-filll" viewBox="0 0 16 16">
                            <path d="m10.79 12.912-1.614-1.615a3.5 3.5 0 0 1-4.474-4.474l-2.06-2.06C.938 6.278 0 8 0 8s3 5.5 8 5.5a7.029 7.029 0 0 0 2.79-.588zM5.21 3.088A7.028 7.028 0 0 1 8 2.5c5 0 8 5.5 8 5.5s-.939 1.721-2.641 3.238l-2.062-2.062a3.5 3.5 0 0 0-4.474-4.474L5.21 3.089z"/>
                            <path d="M5.525 7.646a2.5 2.5 0 0 0 2.829 2.829l-2.83-2.829zm4.95.708-2.829-2.83a2.5 2.5 0 0 1 2.829 2.829zm3.171 6-12-12 .708-.708 12 12-.708.708z"/>
                        </svg>
            
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eyel d-none" viewBox="0 0 16 16">
                            <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
                            <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                        </svg>
                    </button>
                </div>
                        
            </div>
            
            <input type="number" name="rol" value="<?= $rol; ?>" style="display:none;">
            <input type="number" name="id" value="<?= $id; ?>" style="display:none;">
      
        </mbody>

            <!-- Footer -->
        <mfooter class="modal-footer d-flex justify-content-between container-fluid">
                <!-- Botones -->
            <div id="mfooter-buttons">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Borrar</button>
            </div>
        </mfooter>

    </form>
  </div>
</div>