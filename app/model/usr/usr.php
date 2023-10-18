<?php
    require_once('../../config/connectDB.php');
    class usr extends con
    {
        protected $usr_id;
        protected $usr_nm;
        protected $usr_ema;
        protected $usr_tel;
        protected $usr_pass;
        protected $rol_id;
        protected $per_id;
        protected $sta_id;

        public function __construct() {
            parent::__construct();            
        }

        
        /**
         * Get the value of sta_id
         */ 
        public function getSta_id()
        {
                return $this->sta_id;
        }

        /**
         * Set the value of sta_id
         *
         * @return  self
         */ 
        public function setSta_id($sta_id)
        {
                $this->sta_id = $sta_id;

                return $this;
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
         * Get the value of rol_id
         */ 
        public function getRol_id()
        {
                return $this->rol_id;
        }

        /**
         * Set the value of rol_id
         *
         * @return  self
         */ 
        public function setRol_id($rol_id)
        {
                $this->rol_id = $rol_id;

                return $this;
        }

        /**
         * Get the value of usr_pass
         */ 
        public function getUsr_pass()
        {
                return $this->usr_pass;
        }

        /**
         * Set the value of usr_pass
         *
         * @return  self
         */ 
        public function setUsr_pass($usr_pass)
        {
                $this->usr_pass = $usr_pass;

                return $this;
        }

        /**
         * Get the value of usr_tel
         */ 
        public function getUsr_tel()
        {
                return $this->usr_tel;
        }

        /**
         * Set the value of usr_tel
         *
         * @return  self
         */ 
        public function setUsr_tel($usr_tel)
        {
                $this->usr_tel = $usr_tel;

                return $this;
        }

        /**
         * Get the value of usr_ema
         */ 
        public function getUsr_ema()
        {
                return $this->usr_ema;
        }

        /**
         * Set the value of usr_ema
         *
         * @return  self
         */ 
        public function setUsr_ema($usr_ema)
        {
                $this->usr_ema = $usr_ema;

                return $this;
        }

        /**
         * Get the value of usr_nm
         */ 
        public function getUsr_nm()
        {
                return $this->usr_nm;
        }

        /**
         * Set the value of usr_nm
         *
         * @return  self
         */ 
        public function setUsr_nm($usr_nm)
        {
                $this->usr_nm = $usr_nm;

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
    }
    
?>