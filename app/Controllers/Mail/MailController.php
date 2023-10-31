<?php
namespace App\Controllers\Mail;

use App\Config\Controller;
use App\Models\Usr\UsrModel;
use Exception;

final class MailController extends Controller
{
    protected $data;
    
    protected $destiantario;

    protected $title;

    protected $body;

    protected $ruta;

    public function __construct(array $data)
    {
        $this->data = $data;
        $this->destiantario = $this->data['usr_ema'];
        $this->title = "Verificación De Usuario";
        $this->ruta = APP_URL_PUBLIC . 'usr/' . 'activateUsr' . "?ema=" . $this->data["usr_ema"];
        $this->body = '
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

<style>
    .bg-purple {
        background:#c8bdff;
    }

    .bg-purple950 {
        background:#120033;
    }
    .text-purple {
        color: #785bff;
    }

    .btn-primary {
  background-color: #673ab7!important;
  border-color: #673ab7!important;
  color: #fff!important;
}

.btn-primary:hover {
  background-color: #5a00fe;
}

.btn-primary:active {
  background-color: #6300fd;
}
</style>

<body class="bg-purple">
    <header class="d-flex justify-content-center aling-item-center bg-purple950 mb-5">
        <h1 class="text-purple"> Verificación De Usuario Cabello Bello JJ</h1>
    </header>

    <div class="d-flex justify-content-center aling-item-center">
        <a href='. $this->ruta.'" >
            <button type="button" class="btn btn-primary">
                click aqui para verificar su usuario
            </button>
        </a>
    </div>
     
</body> ';

    }

    protected function sendEmail() {
        try {
            mail($this->destiantario, $this->title, $this->body);
        } catch (Exception $e) {
            
        }
    }
}
