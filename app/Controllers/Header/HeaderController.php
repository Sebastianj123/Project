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
    public function showGuest()
    {
      // var_dump($this->model->getModelUsr());
      $data['mdls'] = $this->model->getModelUsr();
      return $data;
    } 

    public function showHeader() {

      $rol = $_SESSION['rol_id'];
      var_dump($rol);
      $this->model = new UsrModel;
      $data['mdls'] = $this->model->getModelUsr($rol);
      return $data;
      
    }
  }
?>