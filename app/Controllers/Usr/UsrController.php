<?php
namespace App\Controllers\Usr;
use App\Config\Controller;
use App\Models\Usr\UsrModel;

class UsrController extends Controller
{
  protected $model;
  protected $result;
  protected $__SESSION;
  public function __construct()
  {
    $this->model = new UsrModel();
    $this->result = array();
  }

  public function getSessionGuest(){
    session_start();
    $_SESSION['session'] = ['rol_id' => 4];
  }

  public static function getSession(array $data){
      session_start();
      $dataAuxiliar = ['usr_id' => $data['usr_id'], 'rol_id' => $data['rol_id']];
      session_set_cookie_params((($data['timeLine']) ? 0 : 30 * 60) , null, DEFAULT_ROUTE);
      $_SESSION['session'] = $dataAuxiliar;
      // var_dump($_SESSION['session']);
    }
  
    public function showDelete() {
      return $this->view("usr/delete"); 
    }

    public function logOut() {
      session_start();
      if(isset($_SESSION))
      {
        session_unset();
        session_destroy();
      } 
      header("Location: " . APP_URL_PUBLIC . DEFAULT_CONTROLLER_LOGIN . '/' . DEFAULT_METHOD);
    }



}

?>