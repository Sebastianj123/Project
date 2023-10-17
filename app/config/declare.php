<?php
const HOST = 'localHost';
const USR = 'root';
const PASS = '';
const DB = 'cabellobellojj';

class data {
    protected $usr;
    protected $pass;
    protected $db;
    protected $host;

    public function __construct() {
        $this->host = HOST;
        $this->usr = USR;
        $this->pass = PASS;
        $this->db = DB;
    }

    /**
     * Get the value of host
     */ 
    public function getHost()
    {
        return $this->host;
    }

    /**
     * Set the value of host
     *
     * @return  self
     */ 
    public function setHost($host)
    {
        $this->host = $host;

        return $this;
    }

    /**
     * Get the value of db
     */ 
    public function getDb()
    {
        return $this->db;
    }

    /**
     * Set the value of db
     *
     * @return  self
     */ 
    public function setDb($db)
    {
        $this->db = $db;

        return $this;
    }

    /**
     * Get the value of pass
     */ 
    public function getPass()
    {
        return $this->pass;
    }

    /**
     * Set the value of pass
     *
     * @return  self
     */ 
    public function setPass($pass)
    {
        $this->pass = $pass;

        return $this;
    }

    /**
     * Get the value of usr
     */ 
    public function getUsr()
    {
        return $this->usr;
    }

    /**
     * Set the value of usr
     *
     * @return  self
     */ 
    public function setUsr($usr)
    {
        $this->usr = $usr;

        return $this;
    }

    public function getData(){
        return get_object_vars($this);
    }
}