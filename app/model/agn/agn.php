<?php

class agn
{
    protected $agn_id;
    protected $agn_dt;
    protected $tyAgn_id;

    public function __construct($agn_id, $agn_dt, $tyAgn_id)
    {
        $this->agn_id = $agn_id;
        $this->agn_dt = $agn_dt;
        $this->tyAgn_id = $tyAgn_id;
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
     * Get the value of agn_dt
     */ 
    public function getAgn_dt()
    {
        return $this->agn_dt;
    }

    /**
     * Set the value of agn_dt
     *
     * @return  self
     */ 
    public function setAgn_dt($agn_dt)
    {
        $this->agn_dt = $agn_dt;

        return $this;
    }

    /**
     * Get the value of tyAgn_id
     */ 
    public function getTyAgn_id()
    {
        return $this->tyAgn_id;
    }

    /**
     * Set the value of tyAgn_id
     *
     * @return  self
     */ 
    public function setTyAgn_id($tyAgn_id)
    {
        $this->tyAgn_id = $tyAgn_id;

        return $this;
    }
}
