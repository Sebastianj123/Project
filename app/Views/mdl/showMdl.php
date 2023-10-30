<?php
require_once('../app/Views/template/header.php');
    $srvs = $data['mdl'];
    // print_r($srvs);
?>
<table id="table-mdl">
<tr>

  <?php
  foreach ($srvs[0] as $key => $row):
  ?>

      <th><?= $key ?></th>

  <?php endforeach;?>
  
  </tr>
  
<?php
  foreach ($srvs as $a => $row):
  ?>
  <tr>
  <?php
  foreach ($row as $key => $value):
  ?>

      <td><?= $value ?></td>

  <?php endforeach;?>
  </tr>
  <?php endforeach; ?>    
</table>
