<?php

class rol
{
    protected $rol_id;
    protected $rol_nm;
    protected $rol_dsc;

    public function __construct($rol_id, $rol_nm, $rol_dsc)
    {
        $this->rol_id = $rol_id;
        $this->rol_nm = $rol_nm;
        $this->rol_dsc = $rol_dsc;
    }

    /**
     * Get the value of rol_id
     */ 
    public function getrol_id()
    {
        return $this->rol_id;
    }

    /**
     * Set the value of rol_id
     *
     * @return  self
     */ 
    public function setrol_id($rol_id)
    {
        $this->rol_id = $rol_id;

        return $this;
    }

    /**
     * Get the value of rol_nm
     */ 
    public function getrol_nm()
    {
        return $this->rol_nm;
    }

    /**
     * Set the value of rol_nm
     *
     * @return  self
     */ 
    public function setrol_nm($rol_nm)
    {
        $this->rol_nm = $rol_nm;

        return $this;
    }

    /**
     * Get the value of rol_dsc
     */ 
    public function getrol_dsc()
    {
        return $this->rol_dsc;
    }

    /**
     * Set the value of rol_dsc
     *
     * @return  self
     */ 
    public function setrol_dsc($rol_dsc)
    {
        $this->rol_dsc = $rol_dsc;

        return $this;
    }
}
