<?php
function punto($string) {
    $precioIn = strrev($string);
    $aCicloPunto = array();

    for ($incrementableCicloPunto = 0; $incrementableCicloPunto < strlen($precioIn) ; $incrementableCicloPunto++) { 
        if ($incrementableCicloPunto == 3 || $incrementableCicloPunto == 6) {
            array_push($aCicloPunto,'.');
        }
            array_push($aCicloPunto,$precioIn[$incrementableCicloPunto]);
        };
    return strrev(implode("",$aCicloPunto));
};

?>