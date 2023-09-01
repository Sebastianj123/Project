<?php
    require('../../config/connectDb.php');
    require('../../assets/php/declare.php');
    if (!empty($_POST['user_ema'])) {
        $user_ema = $_POST['user_ema'];
        $sql = "call v_user_pass ('$user_ema')";

        if (!empty($query = $con-> query($sql))) {
            $result = $query -> fetch_all(MYSQLI_ASSOC);
            $user_name = $result[0]["user_name"];
            $user_pass = $result[0]["user_pass"];
            $asunto = "Recuperación de contraseña";
            $msg = `Usuario "$user_name"` ."\r\n";
            $msg .= `contraseña "$user_pass"` ."\r\n";
            $msg .= "Pagina: 127.0.0.1/SENA/project/index.php?id=$id&rol=$rol&sta=$sta";
            $header = "From: Cabello Bello JJ". "\r\n";
            $mail = @mail($user_ema, $asunto, $msg, $header);

            if ($mail) {
                header("Location: ../../index.php?rol=$rol&id=$id&sta=$sta&mss=send");
            } else {

                echo("$user_ema, $asunto, $msg, $header" . 'paila');
                // header("Location: ../../index.php?rol=$rol&id=$id&sta=$sta&error=invalid");

            }

        } else {
            header("Location: ../../index.php?rol=$rol&id=$id&sta=$sta&error=correoIn");
        }
        
    } else {
        header("Location: ../../index.php?rol=$rol&id=$id&sta=$sta&error=correoIn");
    }
?>