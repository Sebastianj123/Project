<?php
namespace App\Models\Srv;
use App\Config\Model;

class SrvModel extends Model
{
  protected $table;
  protected $primary;
  protected $attributes;

  public function __construct()
  {
    parent::__construct();
    $this->table = "srv";
    $this->primary = "srv_id";
    $this->attributes = array( 'srv_nm', 'srv_dsc','srv_tm', 'srv_img','srv_cost', 'sta_id');    
  }

  public function getSrvs()  {
    $this->sql = 'CALL v_srvs();';
    return $this->getQuery();
  }

  public function getSrv($id) : array {
    $this->sql = "CALL v_srv($id);";
    return $this->getQuery();
  }

  public function getSrvsSta($sta)  {
    $this->sql = "CALL v_srvs_sta($sta);";
    return $this->getQuery();
  }

  public function getSrvSta($id,$sta) : array {
    $this->sql = "CALL v_srv_sta($id,$sta);";
    return $this->getQuery();
  }

  public function setSrv(array $data) : array {
    $values = $this->getValuesForSql($data);
    $this->sql = "CALL u_srv($values);";
    return $this->getQuery();
  }

  public function delSrv($id) : array {
    $this->sql="CALL u_srv_sta($id,4)";
    return $this->getQuery();
  }

  public function inSrv(array $data) {
    $values = $this->getValuesForSql($data);
    $this->sql = "CALL i_srv($values);";
    return $this->getQuery();
  }

}