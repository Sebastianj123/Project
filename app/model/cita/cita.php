<?php

class cita
{
    protected $cita_id;
    protected $agn_id;
    protected $emp_id;
    protected $usr_id;

    public function __construct($cita_id, $agn_id, $emp_id, $usr_id)
    {
        $this->cita_id = $cita_id;
        $this->agn_id = $agn_id;
        $this->emp_id = $emp_id;
        $this->usr_id = $usr_id;
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

    /**
     * Get the value of agn_id
     */ 
    public function getAgn_id()
    {
        return $this->agn_id;
    }

    /**
     * Set the value of agn_id
     *
     * @return  self
     */ 
    public function setAgn_id($agn_id)
    {
        $this->agn_id = $agn_id;

        return $this;
    }

    /**
     * Get the value of cita_id
     */ 
    public function getCita_id()
    {
        return $this->cita_id;
    }

    /**
     * Set the value of cita_id
     *
     * @return  self
     */ 
    public function setCita_id($cita_id)
    {
        $this->cita_id = $cita_id;

        return $this;
    }
}
