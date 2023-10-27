<?php
namespace App\Controllers\Usr;
use App\Config\Controller;
use App\Models\Usr\UsrModel;

class UsrController extends Controller
{
  protected $model;
  protected $result;
  public function __construct()
  {
    $this->model = new UsrModel();
    $this->result = array();
  }

  public function getDefaultSession() : mixed {
    if (!isset($_SESSION)) {
      session_set_cookie_params(30 * 60, null, DEFAULT_ROUTE);
      session_start();
      $_SESSION = [ 'is_login' => false, 'user_id' => '', 'usr_nm' => DEFAULT_USR_NM, 'rol_id' => DEFAULT_ROL_ID ];
    } return $_SESSION;
  }

  public function getSession(array $data){
      session_destroy();
      session_set_cookie_params((($data['timeLine']) ? 0 : 30 * 60) , null, DEFAULT_ROUTE);
      session_start();
      $_SESSION = [ 'is_login' => true, 'user_id' => $data['usr_id'], 'usr_nm' => $data['usr_nm'], 'rol_id' => $data['rol_id'] ];
  }

  public function show() {
    return $this->view("usr/home");
  }



}

?>