<?php
namespace App\Controllers\Home;
use App\Config\Controller;
use App\Models\Usr\UsrModel;
class HomeController extends Controller{
    protected $view;
    protected $model;

    public function showGuest(){
      return $this->view("template/home/home");
    }
  }
?>