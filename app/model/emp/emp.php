<?php
class emp
{
    protected $emp_id;
    protected $usr_id;
    protected $srv_id;

    public function __construct($emp_id, $usr_id, $srv_id)
    {
        $this->emp_id = $emp_id;
        $this->usr_id = $usr_id;
        $this->srv_id = $srv_id;
    }
    
    /**
     * Get the value of srv_id
     */ 
    public function getSrv_id()
    {
        return $this->srv_id;
    }

    /**
     * Set the value of srv_id
     *
     * @return  self
     */ 
    public function setSrv_id($srv_id)
    {
        $this->srv_id = $srv_id;

        return $this;
    }

    /**
     * Get the value of usr_id
     */ 
    public function getUsr_id()
    {
        return $this->usr_id;
    }

    /**
     * Set the value of usr_id
     *
     * @return  self
     */ 
    public function setUsr_id($usr_id)
    {
        $this->usr_id = $usr_id;

        return $this;
    }

    /**
     * Get the value of emp_id
     */ 
    public function getEmp_id()
    {
        return $this->emp_id;
    }

    /**
     * Set the value of emp_id
     *
     * @return  self
     */ 
    public function setEmp_id($emp_id)
    {
        $this->emp_id = $emp_id;

        return $this;
    }
}
