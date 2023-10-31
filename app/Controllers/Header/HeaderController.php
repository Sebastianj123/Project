<?php
namespace App\Controllers\Header;
use App\Config\Controller;
use App\Controllers\Usr\UsrController;
use App\Models\Rol\RolModel;
use App\Models\Usr\UsrModel;
class HeaderController extends Controller{
    protected $view;
    protected $model;

    public function __construct()
    {
      $this->model = new UsrModel;
    }

    public function showHeader() :array {
      $rol = (isset($_SESSION['session']['rol_id'])) ? $_SESSION['session']['rol_id'] : 4 ;
      $data['session'] = $_SESSION['session'];
      $data['mdls'] = $this->model->getModelUsr($rol);
      $this->model = new RolModel;
      $data['rol'] = ($this->model->getRolId($rol))[0];
      return $data; 
    }
  }
?>