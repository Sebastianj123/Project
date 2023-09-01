<?php
    // Rol
    $rol = (!isset($_GET['rol'])) ? null : $rol = $_GET['rol'];

    // id
    $id = (!isset($_GET['id'])) ? null : $id = $_GET['id'];

    // sta
    $sta = (!isset($_GET['sta'])) ? null : $sta = $_GET['sta'];

    // error
    $error = (!isset($_GET['error'])) ? null : $error = $_GET['error'];
    // mss
    $mss = (!isset($_GET['mss'])) ? null : $mss = $_GET['mss'];

    $errors = array(
        'reg' => 'Se produjo un error en el registro (Datos duplicados)',
        'log' => 'Se produjo un error en el login (Correo, contraseña incorrecta ó usuario inactivo en este ultimo caso requiere validar su correo)',
        'empty' => 'Los campos (nombre de usuario, telefono y correo) del formulario no pueden quedar vacios...',
        'invalid' => 'Se produjo un error. Intente más tarde',
        'correoIn' => 'El correo no es correcto'
    );

    $msss = array(
        'log' => 'Logueese :D (Registro completado)',
        'valid' => 'Su correo se valido correctamente y se actualizarón sus datos',
        'send' => 'Se enviaron correctamente sus datos'
    );
?>