<?php

class per
{
    protected $per_id;
    protected $per_nm;
    protected $per_ltNm;
    protected $per_bitDt;
    protected $sex_id;
    protected $tyDoc_id;
    protected $per_doc;
    protected $per_addr;

    public function __construct($per_id, $per_nm, $per_ltNm, $per_bitDt, $sex_id, $tyDoc_id, $per_doc, $per_addr)
    {
        $this->per_id = $per_id;
        $this->per_nm = $per_nm;
        $this->per_ltNm = $per_ltNm;
        $this->per_bitDt = $per_bitDt;
        $this->sex_id = $sex_id;
        $this->tyDoc_id = $tyDoc_id;
        $this->per_doc = $per_doc;
        $this->per_addr = $per_addr;
    }



    /**
     * Get the value of per_id
     */ 
    public function getPer_id()
    {
        return $this->per_id;
    }

    /**
     * Set the value of per_id
     *
     * @return  self
     */ 
    public function setPer_id($per_id)
    {
        $this->per_id = $per_id;

        return $this;
    }

    /**
     * Get the value of per_nm
     */ 
    public function getPer_nm()
    {
        return $this->per_nm;
    }

    /**
     * Set the value of per_nm
     *
     * @return  self
     */ 
    public function setPer_nm($per_nm)
    {
        $this->per_nm = $per_nm;

        return $this;
    }

    /**
     * Get the value of per_ltNm
     */ 
    public function getPer_ltNm()
    {
        return $this->per_ltNm;
    }

    /**
     * Set the value of per_ltNm
     *
     * @return  self
     */ 
    public function setPer_ltNm($per_ltNm)
    {
        $this->per_ltNm = $per_ltNm;

        return $this;
    }

    /**
     * Get the value of per_bitDt
     */ 
    public function getPer_bitDt()
    {
        return $this->per_bitDt;
    }

    /**
     * Set the value of per_bitDt
     *
     * @return  self
     */ 
    public function setPer_bitDt($per_bitDt)
    {
        $this->per_bitDt = $per_bitDt;

        return $this;
    }

    /**
     * Get the value of sex_id
     */ 
    public function getSex_id()
    {
        return $this->sex_id;
    }

    /**
     * Set the value of sex_id
     *
     * @return  self
     */ 
    public function setSex_id($sex_id)
    {
        $this->sex_id = $sex_id;

        return $this;
    }

    /**
     * Get the value of tyDoc_id
     */ 
    public function getTyDoc_id()
    {
        return $this->tyDoc_id;
    }

    /**
     * Set the value of tyDoc_id
     *
     * @return  self
     */ 
    public function setTyDoc_id($tyDoc_id)
    {
        $this->tyDoc_id = $tyDoc_id;

        return $this;
    }

    /**
     * Get the value of per_doc
     */ 
    public function getPer_doc()
    {
        return $this->per_doc;
    }

    /**
     * Set the value of per_doc
     *
     * @return  self
     */ 
    public function setPer_doc($per_doc)
    {
        $this->per_doc = $per_doc;

        return $this;
    }

    /**
     * Get the value of per_addr
     */ 
    public function getPer_addr()
    {
        return $this->per_addr;
    }

    /**
     * Set the value of per_addr
     *
     * @return  self
     */ 
    public function setPer_addr($per_addr)
    {
        $this->per_addr = $per_addr;

        return $this;
    }
}
