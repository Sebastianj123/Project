<?php
namespace App\Controllers\Header;
use App\Config\Controller;
use App\Models\Usr\UsrModel;
class HeaderController extends Controller{
    protected $view;
    protected $model;
    public function show()
    {
      $rol = $_SESSION['rol_id'];
      $this->model = new UsrModel;
      $data['mdls'] = $this->model->getModelUsr($rol);
      return $this->view("template/header",$data);
    }
  }
?>