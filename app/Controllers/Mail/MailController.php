<?php
namespace App\Controllers\Mail;

use App\Config\Controller;

final class MailController extends Controller
{
    protected $data;
    
    protected $destiantario;

    protected $title;

    protected $body;

    public function __construct(array $data)
    {
        $this->data = $data;
        $this->destiantario = $data['usr_ema'];
        $this->title = "Verificación De Usuario";
        $this->body = 'Ingrese a este link: '. APP_URL_PUBLIC . 'usr/' . 'verifyMail' .'para poder verificar su cuenta. Dentro de ';
    }

    protected function sendEmail() {
        
    }
}
