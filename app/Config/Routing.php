<?php
namespace App\Config;

use App\Controllers\Usr\UsrController;
use App\Controllers\Home\HomeController;
use App\Controllers\Srv\SrvController;
use App\Config\Constants;
use Exception;

class Routing
{

  private $_folder;
  private $defaults = [
    "folder" => "public/",
    "controller" => "home",
    "method" => "show",
  ];
  private $_folderController;
  private $serverUri;
  private $url;
  private $_controller;
  private $_method;
  private $_attributes;

  public function __construct()
  {

    // Carpetas Default
    $this->_folder = $this->defaults['folder']; //public
    $_folderController = $this->defaults['controller']; // home

    // Controlador Default
    $this->_controller = ucwords($_folderController . "Controller"); //HomeController

    // Metodo Default
    $this->_method = $this->defaults['method']; // show
    // Atributos default
    $this->_attributes = ""; // none
    
    // Adquisicion de la url
    $this->serverUri = $_SERVER['REQUEST_URI'];
    // Subdivición de la url en 3 partes (1 = public/, 2 =usr/ (carpeta del controlador), 3 = show?id=3 (metodo del controlador y sus atributos)
    $this->url = explode("/", substr($this->serverUri,strpos($this->serverUri, $this->_folder),strlen($this->serverUri)));

    // Inicialización metodo
    $this->matchRoute();
  }

  public function matchRoute()
  {
    
    if (isset($this->url[1]) && isset($this->url[2])) {
      
      // Controlador
      $_folderController = ucwords($this->url[1]);
      
      // Atributos
      $tempAttributes = explode("?", $this->url[2]);
      $this->_attributes = (isset($tempAttributes[1])) ? $tempAttributes[1] : "" ;
      
      // Verificacion de controlador y metodo
      $tempController = ucwords($this->url[1] . "Controller");
      $tempMethod = $tempAttributes[0];
      if(class_exists($tempController)) {
        $this->_controller = $tempController;
        $this->_method = (in_array($tempMethod, get_class_methods($this->_controller))) ? $tempMethod : $this->defaults['method'];
      }
    }
  }

  // Función correr
  public function run()
  {
    try {
      
      // Inicializa el controlador
      $controller = new ($this->_controller)();
      // Inicializa un metodo del controlador
      $controller->{$this->_method()}();

    } catch (Exception $e) {
      echo ($e->getMessage());
    }
  }
}

?>