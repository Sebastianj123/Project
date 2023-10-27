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

  public function getSession() : mixed {
    if (!isset($_SESSION)) {
      session_set_cookie_params(30 * 60, null, DEFAULT_ROUTE);
      session_start();
      $_SESSION = [ 'is_login' => false, 'user_id' => '', 'usr_nm' => DEFAULT_USR_NM, 'rol_id' => DEFAULT_ROL_ID ];
    } return $_SESSION;
  }

  public function show() {
    return $this->view("usr/home");
  }



}

?>