<?php 

namespace Public\Assets\tools;
class validateData
{
    private $typeData;
    private $dataIn;

    public function __construct($str) {
        $this->dataIn = $str;
        $this->typeData = null;
    }

    private static $expReg = [
        "num" => '/^(3[0-9]{9})$/',
        "ema" => '/^[A-z0-9\\._-]+@[A-z0-9][A-z0-9-]*(\\.[A-z0-9_-]+)*\\.([A-z]{2,6})$/'
    ];

    public static function isTel($str) : bool {
        return preg_match(self::$expReg['num'], $str) && ctype_digit($str);
    }

    public static function isEmail($str) : bool {
        return preg_match(self::$expReg['ema'], $str);
    }

    public static function isUsrNm($str) : bool {
        return !(self::isEmail($str) || self::isTel($str)); 
    }

    public function validateTypeData() : string {
        if(self::isUsrNm($this->dataIn)) {
            $this->typeData = 'usr_nm';
        } elseif (self::isEmail($this->dataIn)) {
            $this->typeData = 'usr_ema';
        } else {
            $this->typeData = 'usr_tel';
        }
        return $this->typeData;
    }
}

// $str = '3054102953';
// $type = (new validateData($str))->validateTypeData();
// echo $type;
?>