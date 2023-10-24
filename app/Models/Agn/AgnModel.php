<?php
namespace App\Models\Agn;
use App\Config\Model;

class AgnModel extends Model
{
  protected $table;
  protected $primary;
  protected $attributes;
  
  public function __construct()
  {
      parent::__construct();
      $this->table = "agn";
      $this->primary = "agn_id";
      $this->attributes = array( 'agn_dt' );
  }

  public function getAgns() {
    $this->sql = "CALL v_agns();";
    return $this->getQuery();
  }

  public function inAgn($data) {
    $values = $this->getValuesForSql($data);
    $this->sql = "CALL i_agn($values);";
    return $this->getQuery();
  }

  public function delAgn($id) {
    $this->sql = "CALL d_agn($id);";
    return $this->getQuery();
  }

  public function setAgn($id, $date) {
    $this->sql = "CALL u_agn($id, $date);";
    return $this->getQuery();
  }
}

?>