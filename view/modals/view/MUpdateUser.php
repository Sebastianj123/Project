<!-- Modal Actualizar Datos -->
<div class="modal fade" id="updInfoUserM" tabindex="-1" aria-labelledby="updInfoUserModalLabel" aria-hidden="true">
<div class="modal-dialog">
    
    <form class="fw-bolder modal-content bg-dark fw-bolder text-primary" method="POST" action="controller/user/update.php" autocomplete="off">
      
            <!-- Encabezado -->
        <mheader class="modal-header">
            
            <h1 class="modal-title text-info fs-3">
                Actualizar Datos De <?php echo $name; ?>
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

                <input type="text" class="form-control bg-secondary" value="<?php if(strlen($per_name) > 0) echo $per_name; else echo 'No existe'; ?>" id="per_name" name="per_name" autofocus required >

            </div>
            
            <!-- Apellido -->
            <div class="col-md-10 container-fluid">
                
                <label for="per_lastname" class="fw-bold fw-2 text-light">
                    Apellido
                </label>

                <input type="text" class="form-control bg-secondary" id="per_lastname" <?php if(strlen($per_lastname) == 0)  echo $noExiste; else echo 'value="'.$per_lastname.'"'; ?> name="per_lastname" required >

            </div>

            <div class="col-md-10 container-fluid d-flex">
                
                <div class="d-grid me-2 col-5 rounded">
                        
                    <label for="sex_id" class="fw-bold fw-2 text-light">
                        Genero:
                    </label>
                    <select class="p-2 fw-bold fw-2 text-dark btn-primary" id="sex_id" name="sex_id" required >
                        <option disabled>Genero</option>
                        <?php
                            for ($i = 0; $i < count($querySex); $i++) :
                                $idSex = $querySex[$i]['sex_id'];
                                $per_nameSex = $querySex[$i]['sex_name'];
                        ?>
                            <option value="<?php echo $idSex; ?>" 
                            title="<?php echo $per_nameSex; ?>" 
                            <?php if($idSex == $sex_id) echo 'selected'; ?>>
                                <?php echo$per_nameSex; ?>
                            </option>
                        <?php
                            endfor;
                        ?>
                    </select>
                </div>

                <div class="flex-fill col-6">
                    <label for="per_bith" class="fw-bold fw-2 text-light">
                        Fecha nacimiento
                    </label>

                    <input type="date" class="form-control bg-secondary" value="<?php echo $per_bith ?>" id="per_bith" name="per_bith" required >
                </div>
                
            </div>

            
            <div class="col-md-10 container-fluid">
                
                <label for="tyDoc_id" class="fw-bold fw-2 text-light">
                    Documento De Identidad
                </label>

                <div class="d-flex g-2">
                    <select class="p-2 fw-bold fw-2 text-dark btn-primary me-2" title="Tipo de documento" id="tyDoc_id" name="tyDoc_id" required  style="width:17.5%;">
                        <option disabled>TD (Tipo De Documento)</option>
                        <?php
                            for ($i = 0; $i < count($queryTD); $i++) :
                                $docId = $queryTD[$i]['tyDoc_id'];
                                $docname = $queryTD[$i]['tyDoc_name'];
                                $docdsc = $queryTD[$i]['tyDoc_dsc'];

                        ?>
                            <option value="<?= $docId; ?>" 
                            title="<?php echo $docId?>"
                            <?php if($docId == $tyDoc_id) echo 'selected';?>>
                                <?= $docname; ?> (<?= $docdsc; ?>).
                            </option>
                        <?php
                            endfor;
                        ?>
                    </select>
                    <input type="number" class="form-control bg-secondary" id="per_doc" value="<?= $per_doc ?>" name="per_doc" required >
                </div>

            </div>

            <div class="col-md-10 container-fluid">
                
                <label for="per_addr" class="fw-bold fw-2 text-light">
                    Dirección
                </label>

                <input type="text" class="form-control bg-secondary" value="<?= $per_addr ?>" id="per_addr" name="per_addr" required >

            </div>

            <div class="col-md-10 container-fluid">
                
                <label for="user_name" class="fw-bold fw-2 text-light">
                    Nombre De Usuario
                </label>

                <input type="text" class="form-control bg-secondary" id="user_name" name="user_name" value="<?= $user_name; ?>" required >

            </div>
            
            <div class="col-md-10 container-fluid">
                
                <label for="user_ema" class="fw-bold fw-2 text-light">
                    Email
                </label>

                <input type="email" class="form-control bg-secondary" id="user_ema" value="<?= $user_email; ?>" name="user_ema" required >

            </div>

            <div class="col-md-10 container-fluid">
                
                <label for="user_tel" class="fw-bold fw-2 text-light">
                    Número De Telefono
                </label>

                <input type="tel" class="form-control bg-secondary" id="user_tel" value="<?= $user_tel; ?>" name="user_tel" required >

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

                    <li data-bs-toggle="modal" data-bs-dismiss="modal">
                        <a class="dropdown-item text-info" data-bs-toggle="modal" data-bs-target="#verInfoUserM">
                            Ver datos de <?= $name ?>
                        </a>
                    </li>

                    <li><hr class="dropdown-divider"></li>
                    
                    <li data-bs-dismiss="modal">
                        <a class="dropdown-item text-info" data-bs-toggle="modal" data-bs-target="#" >
                            Borrar perfil
                        </a>
                    </li>
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