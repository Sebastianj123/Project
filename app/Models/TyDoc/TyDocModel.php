<?php
namespace App\Models\TyDoc;
use App\Config\Model;

class TyDocModel extends Model
{
  protected $table;
  protected $primary;
  protected $attributes;

  public function __construct()
  {
    parent::__construct();
    $this->table = "tyDoc";
    $this->primary = "tyDoc_id";
    $this->attributes = array( 'tyDoc_nm', 'tyDoc_dsc');    
  }

  public function getTyDocAll()  {
    $this->sql = 'CALL v_tyDocs();';
    return $this->getQuery();
  }

  public function getTyDocId($id) : array {
    $this->sql = "CALL v_tyDoc($id);";
    return $this->getQuery();
  }

  public function setTyDocAll(array $data) : array {
    $values = $this->getValuesForSql($data);
    $this->sql = "CALL u_tyDoc($values);";
    return $this->getQuery();
  }

  public function delTyDoc($id) : array {
    $this->sql="CALL d_tyDoc($id)";
    return $this->getQuery();
  }
   
  public function inTyDoc(array $data) {
    $values = $this->getValuesForSql($data);
    $this->sql = "CALL i_tyDoc($values);";
    return $this->getQuery();
  }

}