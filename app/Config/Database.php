<?php
require_once("../app/Config/Constans.php");

namespace App\Config\Database;
use \mysqli;
use \Exception;

class Database
{
    protected $host;
    protected $db;
    protected $user;
    protected $con;
    protected $pass;

    public function __construct()
    {
        $this->host = HOST;
        $this->user = USER;
        $this->pass = PASS;
        $this->db = DB;
        $this->con = null;
    }

    public function getConnect()
    {
        try {
            $this->con = new mysqli($this->host, $this->user, $this->pass, $this->db);
            echo('Connected :D <br>');
        } catch (Exception $e) {
			echo $e->getMessage();
			exit();
        }
    }

    public function closeCon()
    {
        try {
			$this->con->close();
			echo "Closed";
		} catch (Exception $e) {
			echo $e->getMessage();
			exit();
		}
    }
    
}
