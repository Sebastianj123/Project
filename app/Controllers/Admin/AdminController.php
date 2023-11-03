<?php
namespace App\Controllers\Admin;
use App\Config\Controller;
use App\Models\Srv\SrvModel;
use App\Models\Sta\StaModel;
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
  
    public function showDeleteUsr() {
      $data['usrs'] = $this->model->getUsrs();
      return $this->view("admin/delete",$data); 
    }

    public function showSrv() : mixed {
        $this->model = new SrvModel();
        $data['srv'] = $this->model->getSrvs();
        return $this->view('admin/srv',$data);
    }

    public function showComprar() : mixed {
        return $this->view('usr/comprar');
    }

    public function deleteUsr() {
      if(isset($_POST['usr_id'])){
        if ($this->model->deleteUsr($_POST['usr_id'])) {
        header('Location: ' . DEFAULT_ROUTE);
        } 
      } 
      header('Location: ' . APP_URL_PUBLIC . 'admin/showDeleteUsr');
    }

    public function showSetSta() {
      $data['usrs'] = $this->model->getUsrs();
      $this->model = new StaModel;
      $data['sta'] = $this->model->getStaAll();
      return $this->view("admin/setEstado",$data);
    }

    public function setSta() {
      $this->model = new UsrModel;
      if(isset($_POST['sta_id']) && isset($_POST['usr_id'])) {
        $sta = $_POST['sta_id'];
        $id = $_POST['usr_id'];
        // echo 'validacion 1';
        if ($this->model->setSta($id,$sta)) {
          // echo 'validacion 2';
          header('Location: ' . DEFAULT_ROUTE);
        }
      }
       
      header('Location: ' . APP_URL_PUBLIC . 'admin/showSetSta');
    }

}

?>