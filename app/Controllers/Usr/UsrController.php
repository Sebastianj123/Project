<?php
namespace App\Controllers\Usr;
use App\Config\Controller;
use App\Models\Usr\UsrModel;

class UsrController extends Controller
{
  protected $model;
  protected $result;
  public function __construct()
  {
    $this->model = new UsrModel();
    $this->result = array();
  }

  public function show() {
    $data['users'] = $this->model->getUsrAll();
    return $this->view("usr/home", $data);
  }

}

?>