<?php

namespace App\Controllers\Guest;

use App\Models\Usr\UsrModel;
use App\Config\Controller;
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

  public function show()
  {
    $this->model = new SrvModel;
    $data['srv'] = $this->model->getSrvs();
    $data['mdl'] = "Home Guest";
    return $this->view("template/home/home",$data);
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
    $this->routeDefautl = APP_URL_PUBLIC . 'template/home/show';
    if ($_SERVER['REQUEST_METHOD'] == "POST") {
      $modelUsr = $this->getDataModel();
      $userEmail = $modelUsr['usr_nm'];
      $userPassword = $modelUsr['usr_pass'];
      $this->result = $this->model->getLoginData($userEmail);

      if (count($this->result) > 0) {
        if (password_verify($userPassword, $this->result[0]["usr_pass"])) {

          $data = $this->result[0];
          $data['timeLine'] = isset($modelUsr['remember']);
          (new UsrController)->getSession($data);
          header("Location: " . APP_URL_PUBLIC . DEFAULT_CONTROLLER_LOGIN . DEFAULT_METHOD);

        } else {

          $data['message'] = "Invalid password";
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
    $data = array_filter($data, function($value) {
      return !empty($value);
    });

    $data = array_map(function($value) {
      return filter_var($value, FILTER_SANITIZE_STRING);
    }, $data);

    $this->model->insertUsr('client',$data);
  }

  public function getDataModel()
  {
    $data = [
      'usr_nm' => $_REQUEST['usr_nm'],
      'remember' => $_REQUEST['remember'],
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