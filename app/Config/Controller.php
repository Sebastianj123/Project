<?php

namespace App\Config;

class Controller
{
  public function view($view, ?array $data = []) : mixed
  {
    $newView = require_once("../app/Views/" . $view . ".php");
    return $newView;
  }
}
?>