<?php

require_once('declare.php');

class con extends data{
    private $con;

    public final function __construct()
    {
        parent::__construct();
        try {
            $this->con = new mysqli( $this->host, $this->usr, $this->pass, $this->db );
        } catch (Exception $exception) {
            $this->con = 'Fallo la conexión' . $exception;
        } finally {
            return $this->con;
        }
    }

    private function pt($key, $value){
        return "$key => $value <br>";
    }

    public function getData(){
        $temp = "<h1> Datos </h1>";
        $data = [
            'HOST' => $this->host,
            'USR' => $this->usr,
            'PASS' => $this->pass,
            'DB' => $this->db
        ];
        foreach ($data as $key => $value) {
            $key = strtoupper($key);
            $value = (empty($value)) ? 'None': $value;
            $temp = $temp . "$key => $value. <br>";
        }
        return $temp;
    }

    public function printData() {
        echo($this->getData());
    }
}
$con = new con();
$con->printData();