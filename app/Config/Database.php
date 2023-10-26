<?php
namespace App\Config;
use \mysqli;
use \Exception;
use App\Config\App;
// require_once("../app/Config/Constants.php");

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
        $this->con = Null;
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
        return $this->con;
    }

    public function closeConnect()
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