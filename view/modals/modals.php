<?php
    switch ($rol) {
        case 1:
            // require('view/modals/modalsUser.php');
            break;

        case 2:
            // require('view/modals/modalsUser.php');
            break;

        case 3:
            require('view/modals/modalsUser.php');
            break;
        default:
            require('view/modals/modalsUserX.php');
            break;
    }
?>