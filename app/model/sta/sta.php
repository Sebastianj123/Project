<?php

class sta
{
    protected $sta_id;
    protected $sta_nm;
    protected $sta_dsc;

    public function __construct($sta_id, $sta_nm, $sta_dsc)
    {
        $this->sta_id = $sta_id;
        $this->sta_nm = $sta_nm;
        $this->sta_dsc = $sta_dsc;
    }

    /**
     * Get the value of sta_id
     */ 
    public function getsta_id()
    {
        return $this->sta_id;
    }

    /**
     * Set the value of sta_id
     *
     * @return  self
     */ 
    public function setsta_id($sta_id)
    {
        $this->sta_id = $sta_id;

        return $this;
    }

    /**
     * Get the value of sta_nm
     */ 
    public function getsta_nm()
    {
        return $this->sta_nm;
    }

    /**
     * Set the value of sta_nm
     *
     * @return  self
     */ 
    public function setsta_nm($sta_nm)
    {
        $this->sta_nm = $sta_nm;

        return $this;
    }

    /**
     * Get the value of sta_dsc
     */ 
    public function getsta_dsc()
    {
        return $this->sta_dsc;
    }

    /**
     * Set the value of sta_dsc
     *
     * @return  self
     */ 
    public function setsta_dsc($sta_dsc)
    {
        $this->sta_dsc = $sta_dsc;

        return $this;
    }
}
