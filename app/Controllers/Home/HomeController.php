<?php
namespace App\Controllers\Home;
use App\Config\Controller;
use App\Models\Rol\RolModel;
use App\Models\Srv\SrvModel;
use App\Models\Usr\UsrModel;
class HomeController extends Controller{
    protected $view;
    protected $model;
    protected $rol;
    protected $headerModules;

    public function __construct()
    {
      $this->view = null;
      
      // Evaluador de sesión
        // session_start();
        // Instancia del modelo
        $this->model = new UsrModel;
        // Asignacion de rol
        $this->rol = (isset($_SESSION['session']['rol_id'])) ? $_SESSION['session']['rol_id'] : 4;
        // Obtencion de los modulos según el rol
        $this->headerModules = $this->model->getModelUsr ($this->rol);
    }

    public function show() {
      $data['mdls'] = $this->headerModules;
      // Modulos del Home
      $this->model = new SrvModel;
      $data['srv'] = $this->model->getSrvs();
      $folder = RUTE_HOME;
      return $this->view($folder,$data);
    }

  }
?>