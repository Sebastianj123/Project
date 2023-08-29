<?php
        include('config/connectDb.php');
        $sql = 'CALL v_sex();';
        $sql .= 'CALL v_tyDoc();';

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
?>