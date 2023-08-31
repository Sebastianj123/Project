<!-- Modal Actualizar Datos -->
<div class="modal fade" id="agendarCitaM" tabindex="-1" aria-labelledby="agendarCitaModalLabel" aria-hidden="true">
    
    <div class="d-flex container-fluid justify-content-center">
        <div class="alert bg-info alert-info " role="alert" style="z-index:1000;">
            
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-square" viewBox="0 0 16 16">
                <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                <path d="M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.235.235 0 0 1 .02-.022z"/>
            </svg>

            <span class="text-dark fw-bold">
                Para ver las descipciones de los servicios: Deje el puntero encima de las opciones para ver su descripción
            </span>

            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </div>

<div class="modal-dialog">

    <form class="fw-bolder modal-content bg-dark fw-bolder text-primary" method="POST" action="controller/every/agendar.php" autocomplete="off">
      
            <!-- Encabezado -->
        <mheader class="modal-header">
            
            <h1 class="modal-title text-info fs-3">
                Agendar Cita
            </h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        
        </mheader>
      
            <!-- Cuerpo -->
        <mbody class="modal-body d-grid row g-3 position-relative">

            <div class="col-md-10 container-fluid">

                <label for="srv_id" class="fw-bold fw-2 text-light">
                    Servicio: 
                </label>

                <div class="d-grid g-2">
                    <select class="p-2 fw-bold fw-2 text-dark btn-primary me-2 container-fluid" title="Tipo de documento" id="srv" name="srv" required>
                        <option disabled selected> Servicio</option>
                        <?php

                        $srv = array();

                            for ($i = 0; $i < count($querySrv); $i++) :
                                $srvId = $querySrv[$i]['srv_id'];
                                $srvName = $querySrv[$i]['srv_name'];
                                $srvDsc = $querySrv[$i]['srv_dsc'];
                                $srv["srvName"] = $srvDsc;
                                
                        ?>
                            <option value="<?= $srvId; ?>" title="<?= $srvDsc?>">
                                <?= $srvName; ?>
                            </option>
                        <?php
                            endfor;
                        ?>
                    </select>
                </div>
            </div>

            <div class="col-md-10 container-fluid">
                <label for="srv_date" class="fw-bold fw-2 text-light">
                    Fecha: 
                </label>

                <input class="form-control bg-secondary" type="datetime-local" name="srv_date" id="srv_date" required>
            </div>
        </mbody>
        <mfooter class="modal-footer d-flex justify-content-between container-fluid">
            
            <!-- Links -->
        <div id="mfooter-links" class="d-grid text-center">
        
            <div class="dropdown">
                
                <button class="btn btn-danger dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Otras Opciones
                </button>

                <ul class="dropdown-menu dropdown-menu-dark ">

                    <!-- <li data-bs-toggle="modal" data-bs-dismiss="modal">
                        <a class="dropdown-item text-info" data-bs-toggle="modal" data-bs-target="#verInfoUserM">
                            Ver datos de <?= $name ?>
                        </a>
                    </li>

                    <li><hr class="dropdown-divider"></li>
                    
                    <li data-bs-toggle="modal" data-bs-dismiss="modal">
                        <a class="dropdown-item text-info" data-bs-toggle="modal" data-bs-target="#deleteM">
                            Borrar perfil
                        </a>
                    </li> -->
                </ul>
            </div>
            
        </div>
            <!-- Botones -->
        <div id="mfooter-buttons">
            <?php include('view/modals/elements/buttonClose.php'); ?>
            <button type="submit" class="btn btn-primary">Enviar</button>
        </div>
    </mfooter>

    </form>
</div>
</div>