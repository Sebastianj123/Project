<?php
namespace App\Controllers\Admin;
use App\Config\Controller;
use App\Models\Srv\SrvModel;
use App\Models\Usr\UsrModel;

class AdminController extends Controller
{
  protected $model;
  protected $result;
  protected $__SESSION;
  public function __construct()
  {
    $this->model = new UsrModel();
    $this->result = array();
  }
  
    public function showDelete() {
      return $this->view("usr/delete"); 
    }

    public function showSrv() : mixed {
        $this->model = new SrvModel();
        $data['srv'] = $this->model->getSrvs();
        return $this->view('admin/srv',$data);
    }

    public function showComprar() : mixed {
        return $this->view('usr/comprar');
    }


}

?>