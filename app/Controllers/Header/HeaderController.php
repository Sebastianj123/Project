<?php
namespace App\Controllers\Header;
use App\Config\Controller;
use App\Controllers\Usr\UsrController;
use App\Models\Usr\UsrModel;
class HeaderController extends Controller{
    protected $view;
    protected $model;

    public function __construct()
    {
      $this->model = new UsrModel;
    }

    public function showHeader() :array {

      session_start();
      $rol = (isset($_SESSION['session']['rol_id'])) ? $_SESSION['session']['rol_id'] : 4 ;
      $data['mdls'] = null;
      $data['mdls'] = $this->model->getModelUsr ($rol);
      return $data;
    }
  }
?>