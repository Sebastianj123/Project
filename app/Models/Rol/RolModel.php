<?php
namespace App\Models\Rol;
use App\Config\Model;

class RolModel extends Model
{
  protected $table;
  protected $primary;
  protected $attributes;

  public function __construct()
  {
    parent::__construct();
    $this->table = "rol";
    $this->primary = "rol_id";
    $this->attributes = array( 'rol_nm', 'rol_dsc');    
  }

  public function getRolAll()  {
    $this->sql = 'CALL v_rols();';
    return $this->getQuery();
  }

  public function getRolId($id) : array {
    $this->sql = "CALL v_rol($id);";
    return $this->getQuery();
  }

  public function setRolAll(array $data) : array {
    $values = $this->getValuesForSql($data);
    $this->sql = "CALL u_rol($values);";
    return $this->getQuery();
  }

  public function delRol($id) : array {
    $this->sql="CALL d_rol($id);";
    return $this->getQuery();
  }
   
  public function inRol(array $data) {
    $values = $this->getValuesForSql($data);
    $this->sql = "CALL i_rol($values);";
    return $this->getQuery();
  }

}