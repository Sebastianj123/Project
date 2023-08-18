<?php
    $precioIn = strrev('4000000000000');
    $a = array();
    for ($i = 0; $i < strlen($precioIn) ; $i++) { 
        if ($i == 2 || $i == 5 || $i == 8) {
            array_push($a,'.',$precioIn[$i]);
        }
        array_push($a,$precioIn[$i]);
    };
    $e = strrev(implode("",$a));
?>