<?php
namespace App\Controllers\Usr;
use App\Config\Controller;
use App\Models\Sex\SexModel;
use App\Models\Srv\SrvModel;
use App\Models\TyDoc\TyDocModel;
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

  public static function getSession(array $data){
      session_start();
      $dataAuxiliar = ['usr_id' => $data['usr_id'], 'rol_id' => $data['rol_id']];
      session_set_cookie_params($data['timeLine'] * 60 , null, DEFAULT_ROUTE);
      $_SESSION['session'] = $dataAuxiliar;
      var_dump($_SESSION['session']);
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

    public function showSrv() : mixed {
      $this->model = new SrvModel();
        $data['srv'] = $this->model->getSrvs();
        return $this->view('usr/srv',$data);
    }

    public function activateUsr() {
      if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['usr']) ) {
          $this->model = new UsrModel;
          $id = ($this->model->getLoginData($_GET['ema']))[0]['usr_id'];
          $this->model->activeUsr($id);
      }
      header("Location: " . APP_URL_PUBLIC . DEFAULT_CONTROLLER_LOGIN . '/' . DEFAULT_METHOD);
    }

    public function showPerfil() {
      $this->model = new UsrModel;
      $datos = $_SESSION['session'];
      $data['usr'] = ($this->model->getUsr($datos['usr_id']))[0];
      $this->model = new SexModel;
      $data['sex'] = $this->model->getSexAll();
      $this->model = new TyDocModel;
      $data['tyDoc'] = $this->model->getTyDocAll();
      return $this->view('usr/perfil',$data);
  }

  public function showEdit() {
    $this->model = new UsrModel;
    $datos = $_SESSION['session'];
    $data['usr'] = ($this->model->getUsr($datos['usr_id']))[0];
    $this->model = new SexModel;
    $data['sex'] = $this->model->getSexAll();
    $this->model = new TyDocModel;
    $data['tyDoc'] = $this->model->getTyDocAll();
    return $this->view('usr/editPerfil',$data);
}

   public function updateUsr() {
      $this->model = new UsrModel;
      $data = array_merge(['usr_id' => $_SESSION['session']['usr_id']], $_POST);
      $this->model->updateUsr($data);
      header('Location: ' . APP_URL_PUBLIC . 'usr' . '/' . 'showPerfil');
   }

   public function showDelete() {
    $data['usr'] = $_SESSION['session'];
    return $this->view('usr/delete',$data);
   }

   public function inhability() {
      $this->model = new UsrModel;
      $id = $_SESSION['session']['usr_id'];
      $pass = ($this->model->getReg($_SESSION['session']['usr_id']))[0]['usr_pass'];
      if (password_verify($_POST['usr_pass'], $pass)) {
        $this->model = new UsrModel;
        $this->model->deleteUsr($id);
        $this->logOut();
      }

      return $this->view('usr/delete');
   }
}

?>