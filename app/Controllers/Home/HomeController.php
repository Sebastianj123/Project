<?php
namespace App\Controllers\Home;
use App\Config\Controller;
use App\Models\Usr\UsrModel;
class HomeController extends Controller{
    protected $view;
    protected $model;

    public function show(){
      $rol = (isset($_SESSION)) ? $_SESSION['rol_id'] : 4;
      $this->model = new UsrModel;
      $data = $this->model->getModelUsr();
      return $this->view("template/home/home");
    }
  }
?>