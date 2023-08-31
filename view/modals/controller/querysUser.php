<?php

    // echo 'asfsdf';
        include('config/connectDb.php');
        $sql = 'CALL v_sex();';
        $sql .= 'CALL v_tyDoc();';
        $sql .= "CALL v_user_id($id);";
        $sql .= 'CALL v_rol();';
        $sql .= 'CALL v_sta();';
        $sql .= 'CALL v_srv();';


        $querysArray = array();

        if (!$con->multi_query($sql)) {
            echo "Falló la multiconsulta: (" . $con->errno . ") " . $con->error;
        }

        do {
        if ($result = $con->store_result()) {

                $resultQuery = $result->fetch_all(MYSQLI_ASSOC);
                // echo "$sql <br>";
                array_push($querysArray, $resultQuery);
    
                $result->free();
            }
        } while ($con->more_results() && $con->next_result());

        // Declaración de consultas (array row)
        $querySex = $querysArray[0];
        $queryTD = $querysArray[1];
        $queryUser = $querysArray[2];
        $queryRol = $querysArray[3];
        $querySta = $querysArray[4];
        $querySrv = $querysArray[5];

        // var_dump($queryUser);

        // Declaración de mensaje X
        $noExiste = 'placeholder="No existe" style::placeholder="color:black"';

        // Declaración de campos de la consulta de USER
        $per_name = $queryUser[0]['per_name'];
        $per_lastname = $queryUser[0]['per_lastname'];
        $sex_id = $queryUser[0]['sex_id'];
        $per_bith = $queryUser[0]['per_bith'];
        $tyDoc_id = $queryUser[0]['tyDoc_id'];
        $per_doc = $queryUser[0]['per_doc'];
        $per_addr = $queryUser[0]['per_addr'];
        $user_name = $queryUser[0]['user_name'];
        $user_tel = $queryUser[0]['user_tel'];
        $user_email = $queryUser[0]['user_email'];
        $user_pass = $queryUser[0]['user_pass'];
        $user_email = $queryUser[0]['user_email'];
        
        // Declaración del nombre completo de usuario
        $name = '"'.$per_name.' '. $per_lastname.'"';

?>