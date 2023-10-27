<?php
namespace App\Model\Cita;
use App\Config\Model;

final class CitaModel extends Model
{
  protected $table;
  protected $primary;
  protected $attributes;
  
  public function __construct() {
    $this->table = 'cita';
    $this->primary = 'cita_id';
    $this->attributes = array("agn_id", "emp_id", "usr_id", "sta_id");
  }

  public function getCita($id) : array {
    $this->sql = "CALL v_cita($id);";
    return $this->getQuery();
  }
  
  public function getCitaSta($id,$sta) : array {
    $this->sql = "CALL v_cita_sta($id);";
    return $this->getQuery();
  }

  public function getCitas() : array {
    $this->sql = 'CALL v_citas();';
    return $this->getQuery();
  }

  public function getCitasSta($sta) : array {
    $this->sql = "CALL v_citas_sta($sta);";
    return $this->getQuery();
  }
  
  public function setCita(array $data) : array {
    $values = $this->getValuesForSql($data);
    $this->sql = "CALL u_cita($values);";
    return $this->getQuery();
  }
  
  public function delCita($id) : array {
    $this->sql="CALL d_cita($id)";
    return $this->getQuery();
  }

  
}

?>