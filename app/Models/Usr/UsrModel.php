<?php
    
    namespace App\Models\Usr;
    use App\Config\Database;
    use App\Controllers\validateTypeData;
    use PDO;

class UsrModel
{
  protected $table;
  protected $primary;
  protected $attributes;
  protected $conn;
  protected $result;
  protected $typeConn;      
  protected $objDB;
  protected $sql;

  public function __construct()
  {
    $this->table = "usr";
    $this->primary = "usr_id";
    $this->attributes = array( 'usr_nm', 'usr_ema', 'usr_tel', 'usr_pass', 'rol_id', 'per_id', 'sta_id');
    $this->objDB = new Database();
    $this->conn = $this->objDB->getConnect();
  }

  protected function error($e) : string {
    return 'Error: ' . $e->getMenssage();
  }
  protected function getQuery() {
    try {
      $sql = $this->sql;
      $prepare_sql = $this->conn->query($sql);
      $this->result = $prepare_sql->fetch_all(MYSQLI_NUM);
      $this->sql->free();
      $prepare_sql->free();
      $this->objDB->connectMysqliClose();
    } catch (Exception $e) {
      $this->result = $this->error($e);
    } finally {
      return $this->result;
    }
  }

  public function get($id)
  {
    $this->sql = "Call v_reg($id);";
    return $this->getQuery();
  }

  public function getUsrAll() {
    $this->sql = "Call v_regs();";
    return $this->getQuery();
  }

  public function getLoginData($usr_nm, $usr_pass) : array{
    $type = (new validateData($usr_name))->validateTypeData();
    $this->sql = "Call login('$type','$usr_nm');";
    return $this->getQuery();
  }

  public function insertUsr(string $typeUsr, array $data){
    switch ($typeUsr) {
      case 'emp':
        $sp = 'i_emp';
        $srv = "," . $data['srv_id'];
        break;
      case 'client' :
        $sp = 'i_client';
        $srv = "";
        break;
      default:
        trigger_error("No se encuentra el tipo de usuario a registrar", E_USER_ERROR);
        break;
    }
    foreach ($data as $key => $value) {
      $this->sql = "CALL $sp ($value $srv);";
    }
    $this->resul = $this->getQuery();
    return $this->result;
  }

  public function updateUsr(string $typeUsr, array $data){
    foreach ($data as $key => $value) {
      $this->sql = "CALL u_usr ($value);";
    }
    $this->resul = $this->getQuery();
    return $this->result;
  }

  public function deleteUsr($id) {
    $this->sql = "CALL u_usr_sta($id,4);";
    return $this->getQuery();
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
  
  public function setEmpRol(int $id, $srv){
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

}
          
?>