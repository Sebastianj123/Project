<?php
  $per_name = $_REQUEST['per_name'];
  $per_lastName = $_REQUEST['per_lastname'];
  $sex_id = $_REQUEST['sex_id'];
  $per_bith = $_REQUEST['per_bith'];
  $tyDoc_id = $_REQUEST['tyDoc_id'];
  $per_doc = $_REQUEST['per_doc'];
  require('../../assets/php/declare.php');

  if(!empty($_REQUEST['user_name'])&&!empty($_REQUEST['user_ema'])&&!empty($_REQUEST['user_tel'])){
    $user_tel = $_REQUEST['user_tel'];
    $user_ema = $_REQUEST['user_ema'];
    $user_name = $_REQUEST['user_name'];
    $asunto = "Validar que eres tú para actualizar tus datos";
    $msg = "127.0.0.1/SENA/project/controller/user/updateTrue.php?id=$id&rol=$rol&sta=$sta";

    $header = "From: Cabello Bello JJ". "\r\n";
    $header .= "Reply-To: noreply@example.com". "\r\n";
    $header .= "X-Mailer: PHP/". phpversion();
    $mail = @mail($user_ema, $asunto, $msg, $header) ;
      if ($mail) {
        header("Location: ../../index.php?rol=$rol&id=$id&sta=$sta&mss=send");
      }
  } 
  else {
    header("Location: ../../index.php?rol=$rol&id=$id&sta=$sta&error=empty");
  }
  // echo("$id,$id,'$per_name','$per_lastName',$sex_id,$tyDoc_id,$per_doc,'$per_bith',null,'$user_name','$user_ema',$user_tel,$rol,$sta");
  // $sql = "call u_user($id,$id,'$per_name','$per_lastName',$sex_id,$tyDoc_id,$per_doc,'$per_bith',null,'$user_name','$user_ema',$user_tel,'$user_pass',$rol,$sta);";

  // var_dump($sql);
?>