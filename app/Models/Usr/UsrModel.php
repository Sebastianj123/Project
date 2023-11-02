<?php
    
namespace App\Models\Usr;
use App\Config\Model;
use PDO;
use Public\Assets\tools\validateData;

final class UsrModel extends Model
{
  protected $table;
  protected $primary;
  protected $attributes;

  public function __construct()
  {
    parent::__construct();
    $this->table = "usr";
    $this->primary = "usr_id";
    $this->attributes = array( 'usr_nm', 'usr_ema', 'usr_tel', 'usr_pass', 'rol_id', 'per_id', 'sta_id');
  }

  public function getUsr($id)
  {
    $this->sql = "Call v_usr($id);";
    return $this->getQuery();
  }

  public function getUsrs() {
    $this->sql = "Call v_usrs();";
    return $this->getQuery();
  }
  
  public function getUsrSta($id, $sta) {
    $this->sql = "Call v_usr_sta($id,$sta);";
    return $this->getQuery();
  }
  
  public function getUsrsSta($sta) {
    $this->sql = "Call v_usrs_sta($sta);";
    return $this->getQuery();
  }

  public function getLoginData($usr_nm) : array{
    $type = (new validateData($usr_nm))->validateTypeData();
    $this->sql = "Call login('$type','$usr_nm');";
    return $this->getQuery();
  }

  public function insertUsr(string $typeUsr, array $data, ?string $srv_id = ''){
    $values = $this->getValuesForSql($data);
    switch ($typeUsr) {
      case 'emp':
        $sp = 'i_emp';
        $srv = ",'$srv_id'";
        break;
      case 'client' :
        $sp = 'i_client';
        $srv = "";
        break;
      default:
        trigger_error("No se encuentra el tipo de usuario a registrar", E_USER_ERROR);
        break;
    }
    
    $this->sql = "CALL $sp ($values $srv);";
    return $this->getQuery();
  }

  public function updateUsr(array $data){
      $values = $this->getValuesForSql($data);
      $this->sql = "CALL u_usr ($values);";
      return $this->getQuery();
  }

  public function deleteUsr($id) {
    $this->sql = "CALL u_usr_sta($id,4);";
    $this->query();
  }

  public function activeUsr($id) {
    $this->sql = "CALL u_usr_sta($id,1);";
    return $this->getQuery();
  }

  public function inactiveUsr($id) {
    $this->sql = "CALL u_usr_sta($id,2);";
    return $this->getQuery();
  }

  public function toConfirmUsr($id) {
    $this->sql = "CALL u_usr_sta($id,3);";
    return $this->getQuery();
  }

  public function setAmindRol($id) {
    $this->sql = "CALL u_usr_rol($id,1);";
    return $this->getQuery();
  }
  
  public function setEmpRol($id, $srv){
    $this->sql = "Call u_usr_rol_emp($id,$srv);";
    return $this->getQuery();
  }

  public function setClientRol($id) {
    $this->sql = "CALL u_usr_rol($id,3);";
    return $this->getQuery();
  }

  public function getEmps() {
    $this->sql = "CALL v_emps();";
    return $this->getQuery();
  }

  public function getModelUsr($id = 4)
  {
    $this->sql = "CALL v_usr_mdl($id)";
    return $this->getQuery();
  }

  public function getReg($id) {
    $this->sql = "CALL v_reg($id)";
    return $this->getQuery();
  }

  public function getRegs() {
    $this->sql = "CALL v_reg()";
    return $this->getQuery();
  }

  public function setPass(array $data) {
    $values = $this->getValuesForSql($data);
    $this->sql = "CALL v_reg($values)";
    return $this->getQuery();
  }
}
          
?>