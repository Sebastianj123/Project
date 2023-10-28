<?php
namespace App\Controllers\Mdl;

use App\Config\Controller;
use App\Models\User\UserModel;


class UserController extends Controller
{
  protected $model;
  protected $result;
  protected $table;

  public function __construct($tabla)
  {
    $this->table = ucwords($tabla);
    $this->model = new ($tabla."Model");
    $this->result = array();

  }
  public function show()
  {
    $method = "get" . $this->table . "s";
    $data[''] = $this->model->{$method}();
    return $this->view("mdl/ver", $data);

  }

  public function create()
  {
    /* $this->result['users']=$this->model->getUserAll();
     var_dump($this->result['users']);*/
    echo (" CREATE");
  }
  public function edit()
  {
    /* $this->result['users']=$this->model->getUserAll();
     var_dump($this->result['users']);*/
    echo ("EDIT");
  }
  public function update()
  {
    /* $this->result['users']=$this->model->getUserAll();
     var_dump($this->result['users']);*/
    echo ("UPDATE");
  }
  public function delete()
  {
    /* $this->result['users']=$this->model->getUserAll();
     var_dump($this->result['users']);*/
    echo (" DELETE");
  }

}
?>