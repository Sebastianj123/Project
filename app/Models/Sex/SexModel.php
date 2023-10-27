<?php
namespace App\Models\Sex;
use App\Config\Model;

class SexModel extends Model
{
  protected $table;
  protected $primary;
  protected $attributes;

  public function __construct()
  {
    parent::__construct();
    $this->table = "sex";
    $this->primary = "sex_id";
    $this->attributes = array( 'sex_nm', 'sex_dsc');    
  }

  public function getSexAll()  {
    $this->sql = 'CALL v_sexs();';
    return $this->getQuery();
  }

  public function getSexId($id) : array {
    $this->sql = "CALL v_sex($id);";
    return $this->getQuery();
  }

  public function setSexAll(array $data) : array {
    $values = $this->getValuesForSql($data);
    $this->sql = "CALL u_sex($values);";
    return $this->getQuery();
  }

  public function delSex($id) : array {
    $this->sql="CALL d_sex($id)";
    return $this->getQuery();
  }
   
  public function inSex(array $data) {
    $values = $this->getValuesForSql($data);
    $this->sql = "CALL i_sex($values);";
    return $this->getQuery();
  }

}