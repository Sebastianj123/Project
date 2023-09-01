<!-- Modal ForgetPass -->
<div class="modal fade" id="forgetPassM" tabindex="-1" aria-labelledby="forgetPassModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    
    <form class="fw-bolder modal-content bg-dark fw-bolder text-primary" id="formForget" action="controller/userX/forget.php?<?="rol=$rol&id=$id&sta=$sta"?>" method="POST">
      
            <!-- Encabezado -->
        <mheader class="modal-header">
            
            <h1 class="modal-title text-info fs-3" id="loguinModalLabel">Login</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        
        </mheader>
      
            <!-- Cuerpo -->
        <mbody class="modal-body d-grid row g-2">
            
            <div class="col-md-10 container-fluid">
                
                <label for="user_ema" class="fw-bold fw-2 text-light">
                    Ingrese el correo con el que este registrado.....
                </label>

                <input type="email" class="form-control bg-secondary" id="user_ema" name="user_ema" autofocus required>

            </div>
      
        </mbody>

            <!-- Footer -->
        <mfooter class="modal-footer d-flex justify-content-between container-fluid">
            
                <!-- Botones -->
            <div id="mfooter-buttons">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </div>
        </mfooter>

    </form>
  </div>
</div>