<?php
namespace App\Models\Mdl;
use App\Config\Model;

class MdlModel extends Model
{
  protected $table;
  protected $primary;
  protected $attributes;
  
  public function __construct()
  {
      parent::__construct();
      $this->table = "Mml";
      $this->primary = "mdl_id";
      $this->attributes = array( 'mdl_nm', 'mdl_url', 'mdl_dsc' );
  }

  public function getMdls() {
    $this->sql = "CALL v_mdls();";
    return $this->getQuery();
  }

  public function inMdl($data) {
    $values = $this->getValuesForSql($data);
    $this->sql = "CALL i_mdl($values);";
    return $this->getQuery();
  }

  public function delMdl($id) {
    $this->sql = "CALL d_mdl($id);";
    return $this->getQuery();
  }

  public function setMdl($id, $data) {
    $this->sql = "CALL u_mdl($id, $values);";
    return $this->getQuery();
  }

  
}

?>