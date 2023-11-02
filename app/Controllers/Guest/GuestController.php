<?php

namespace App\Controllers\Guest;

use App\Models\Usr\UsrModel;
use App\Config\Controller;
use App\Controllers\Mail\MailController;
use App\Controllers\Usr\UsrController;
use App\Models\Sex\SexModel;
use App\Models\Srv\SrvModel;
use App\Models\TyDoc\TyDocModel;
use LDAP\Result;

class GuestController extends Controller
{

  private $model;
  private $result;
  private $routeDefautl;
  protected $primary;
  public function __construct()
  {
    $this->model = new UsrModel();
    $this->result = array();
    $this->routeDefautl = APP_URL_PUBLIC . 'login/show';
    $this->primary = "usr_id";

  }

  public function showLogin(){
    // unset($data['mdl']); 
    $data['mdl'] = "Login";
    return $this->view("login/login",$data);
  }

  public function showRegister() {
    $this->model = new SexModel;
    $data['sex'] = $this->model->getSexAll();
    $this->model = new TyDocModel;
    $data['tyDoc'] = $this->model->getTyDocAll();
    $data['mdl'] = "Register";
    return $this->view("login/register",$data);
    
  }

  public function login()
  {
    if ($_SERVER['REQUEST_METHOD'] == "POST") {
      $modelUsr = $this->getDataModel();
      $userEmail = $modelUsr['usr_nm'];
      $userPassword = $modelUsr['usr_pass'];
      $this->result = $this->model->getLoginData($userEmail);

      if (count($this->result) > 0) {
        if ($this->result[0]['sta_id'] == 1) {
          if (password_verify($userPassword, $this->result[0]["usr_pass"])) {

            $data = $this->result[0];
            $data['timeLine'] = (isset($modelUsr['remember'])) ? 0 : 30;
   
            UsrController::getSession($data);
            // var_dump($_SESSION['session']);
            header("Location: " . APP_URL_PUBLIC . DEFAULT_CONTROLLER_LOGIN . "/". DEFAULT_METHOD . ucwords(DEFAULT_CONTROLLER_LOGIN));
  
          } else {
  
            $data['message'] = "Invalid password";
            return $this->view("login/login", $data);
          }
        } else {  
          $data['message'] = 'The user is "' . $this->result[0]['sta_nm'] .'"';
          return $this->view("login/login", $data);
        }

      } else {
        $data['message'] = "User does not exist error";
        return $this->view("login/login", $data);
      }
    }
    return $this->result;
  }
  /*Method get data info */

  public function register() {
    $data = $_POST;

    // Valida los datos
    $controller = new MailController($data);
    
    $data = array_filter($data, function($value) {
      return !empty($value);
    });
    
    
    $data = array_map(function($value) {
      return filter_var($value, FILTER_SANITIZE_STRING);
    }, $data);
    
    $data['usr_pass'] = password_hash($data['usr_pass'],PASSWORD_DEFAULT);

    $this->model->insertUsr('client',$data);


    $data['message'] = 'Debes verificar tu cuenta por medio de correo electronico, se envio al correo que registraste en la página';
    return $this->view('login/login');
  }

  public function getDataModel()
  {
    $data = [
      'usr_nm' => $_REQUEST['usr_nm'],
      'remember' => (empty($_REQUEST['remember'])) ? false : true ,
      'usr_pass' => $_REQUEST['usr_pass'],
    ];
    return $data;
  }
 /*Method  signOff*/
  public function signOff()
  {
    session_start();
    unset($_SESSION["newsession"]);
    header("Location: " . $this->routeDefautl);
  }
}


?>