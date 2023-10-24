<?php
namespace App\Config;
use App\Config\Database;

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

    protected final function getQuery() : mixed  {
        try {
            $sql = $this->sql;
            $prepare_sql = $this->conn->query($sql);
            $this->result = $prepare_sql->fetch_all(MYSQLI_ASSOC);
            $this->sql->free();
            $prepare_sql->free();
            $this->objDB->connectMysqliClose();
        } catch (Exception $e) {
            $this->result = $this->error($e);
        } finally {
            return $this->result;
        }
    }

    final protected function getValuesForSql(array $data) : string {
          return '"'. implode('", "', $array) . '"';
    }
}
