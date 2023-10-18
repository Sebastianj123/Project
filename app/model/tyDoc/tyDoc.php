<?php

class tyDoc
{
    protected $tydoc_id;
    protected $tyDoc_nm;
    protected $tyDoc_dsc;

    public function __construct($tydoc_id, $tyDoc_nm, $tyDoc_dsc)
    {
        $this->tydoc_id = $tydoc_id;
        $this->tyDoc_nm = $tyDoc_nm;
        $this->tyDoc_dsc = $tyDoc_dsc;
    }

    /**
     * Get the value of tydoc_id
     */ 
    public function getTydoc_id()
    {
        return $this->tydoc_id;
    }

    /**
     * Set the value of tydoc_id
     *
     * @return  self
     */ 
    public function setTydoc_id($tydoc_id)
    {
        $this->tydoc_id = $tydoc_id;

        return $this;
    }

    /**
     * Get the value of tyDoc_nm
     */ 
    public function getTyDoc_nm()
    {
        return $this->tyDoc_nm;
    }

    /**
     * Set the value of tyDoc_nm
     *
     * @return  self
     */ 
    public function setTyDoc_nm($tyDoc_nm)
    {
        $this->tyDoc_nm = $tyDoc_nm;

        return $this;
    }

    /**
     * Get the value of tyDoc_dsc
     */ 
    public function getTyDoc_dsc()
    {
        return $this->tyDoc_dsc;
    }

    /**
     * Set the value of tyDoc_dsc
     *
     * @return  self
     */ 
    public function setTyDoc_dsc($tyDoc_dsc)
    {
        $this->tyDoc_dsc = $tyDoc_dsc;

        return $this;
    }
}
