<?php
namespace App\Models\Sta;
use App\Config\Model;

class StaModel extends Model
{
  protected $table;
  protected $primary;
  protected $attributes;

  public function __construct()
  {
    parent::__construct();
    $this->table = "sta";
    $this->primary = "sta_id";
    $this->attributes = array( 'sta_nm', 'sta_dsc');    
  }

  public function getStaAll()  {
    $this->sql = 'CALL v_stas();';
    return $this->getQuery();
  }

  public function getStaId($id) : array {
    $this->sql = "CALL v_sta($id);";
    return $this->getQuery();
  }

  public function setStaAll(array $data) : array {
    $values = $this->getValuesForSql($data);
    $this->sql = "CALL u_sta($values);";
    return $this->getQuery();
  }

  public function delSta($id) : array {
    $this->sql="CALL d_sta($id)";
    return $this->getQuery();
  }
   
  public function inSta(array $data) {
    $values = $this->getValuesForSql($data);
    $this->sql = "CALL i_sta($values);";
    return $this->getQuery();
  }

}