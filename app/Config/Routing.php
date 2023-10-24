<?php

/*
 * Author:DIEGO CASALLAS
 * DATE: 29/09/2023
 * DESCRIPTION: THIS FUNCTIONS ROUTING
 */
namespace App\Config;

use App\Controllers\Usr\UsrController;
use App\Controllers\Home\HomeController;
use App\Controllers\Srv\SrvController;
use App\Config\Constants;
use Exception;

class Routing
{

  private $_folder;
  private $_defaultController;
  private $_defaultFolder;
  private $_defaultMethod;
  private $serverUri;
  private $url;
  private $_controller;
  private $_method;
  private $_attributes;
  private $_subMethod;

  public function __construct()
  {
    $this->_folder = "public/";
    $this->_defaultController = "home";
    $this->_defaultFolder = "Home";
    $this->_defaultMethod = "show";
    $this->serverUri = $_SERVER['REQUEST_URI'];

    $this->url = explode("/", substr($this->serverUri,strpos($this->serverUri, $this->_folder),strlen($this->serverUri)));

    $this->matchRoute();
  }

  public function matchRoute()
  {
    
    if (isset($this->url[1]) && isset($this->url[2])) {
      $_folderController = ucwords($this->url[1]);
      $this->_controller = ucwords($this->url[1] . "Controller");
      $this->_attributes = explode("?", $this->url[2]);
      if (substr_count($this->_attributes[0],"-") >= 1) {
        $method = explode("-",$this->_attributes[0]);
        $this->_method = $method[0];
        $this->_subMethod = $method[1];
      } else  {
        $this->_method = $this->_attributes[0];
        $this->_subMethod = '';
      }

      if (isset($this->_attributes[1])) {
        $this->_attributes = $this->_attributes[1];
      } else {
        $this->_attributes = "";
      }
    } else {
      $_folderController = $this->_defaultFolder;
      $this->_controller = ucwords($_folderController . "Controller");
      $this->_method = $this->_defaultMethod;
      $this->_attributes = "";
    }
    var_dump( $this->_controller );
    echo("<br>");
    var_dump( $this->_method );
    echo("<br>");
    var_dump( $this->_attributes );
    echo("<br>");
    var_dump( $this->_subMethod );

  }

  public function run()
  {
    try {

      switch ($this->_controller) {

        case "UsrController":
          $controller = new UsrController();
          break;

        default:
          $controller = new HomeController();
          break;

      }
      switch ($this->_method) {

        case "show":
          $controller->show();
          break;
        case "create":
          $controller->create();
          break;
        case "update":
          $controller->update();
          break;
        case "delete":
          $controller->delete();
          break;

      }
    } catch (Exception $e) {
      echo ($e->getMessage());

    }
  }



}



?>