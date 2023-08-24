<head>
    <link rel="stylesheet" href="assets/css/btnInpNum.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</head>


<?php
    // Se enlazan los querys requeridos para los modales
    require('view/userX/modals/controller/querys.php');

    // Se enlazan diferentes modales como lo son:
        // Login
    require('view/userX/modals/view/Mlogin.php');
        // Register
    require('view/userX/modals/view/Mregister.php');
        // Pregunta
    require('view/userX/modals/view/Mquestion.php');
        // Terminos del servicio
    require('view/userX/modals/view/Mterms.php');
?>






