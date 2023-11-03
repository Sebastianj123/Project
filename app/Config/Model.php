<?php
namespace App\Config;
use App\Config\Database;
use Exception;

abstract class Model 
{

    protected $conn;
    protected $objDB;
    protected $sql;
    protected $result;


    public function __construct() {
        $this->objDB = new Database();
        $this->conn = $this->objDB->getConnect();
    }

    protected final function error($e) : string {
        return 'Error: ' . $e->getMenssage();
    }

    protected final function getQuery($typeArray = null)  {
        $typeResult = ($typeArray === null) ? MYSQLI_ASSOC : MYSQLI_NUM; 
        try {
            $sql = $this->sql;
            $consult = $this->conn->query($sql);
            $this->result = $consult->fetch_all($typeResult);
            $this->sql->free();
            $consult->free();
            $this->objDB->closeConnect();
        } catch (Exception $e) {
            $this->result = $this->error($e);
        } finally {
            return $this->result;
        }
    }

    final function query() {
        $this->conn->query($this->sql);
        return ($this->conn->affected_rows > 0);
    }

    final protected function getValuesForSql(array $data) : string {
          return '"'. implode('", "', $data) . '"';
    }
}
