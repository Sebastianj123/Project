<?php
/*
 *Ahutor:DIEGO CASALLAS
 *Busines: SINAPSIS TECHNOLOGIES
 *Date:13/10/2023
 *Description:...
 */

namespace App\Controllers\Home;
use App\Config\Controller;
  class HomeController extends Controller{

    protected $view;
    protected $model;
    public function show(){
      
      return $this->view("/home/home");
    }
  }
?>