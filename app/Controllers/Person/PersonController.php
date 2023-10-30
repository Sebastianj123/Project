<?php
namespace App\Controllers\Person;
use App\Config\Controller;
use App\Models\Srv\SrvModel;

class PersonController extends Controller
{
    protected $model;
    protected $result;

    public function showSrv() {
        $this->model = new SrvModel();
        $data['mdl'] = $this->model->getSrvs();
        return $this->view('mdl/showMdl',$data);
    }

    public function showPerfil() {
        
    }
}
