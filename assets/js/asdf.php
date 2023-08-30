<?php
    for ($i = 0; $i < count($result) ; $i++) :
        $row = $result[$i];
        $cita_id = $row['cita_id'];
        $cita_date = $row['cita_date'];
        $user_id = $row['user_id'];
        $per_name = $row['per_name'];
        $emp_srv_id = $row['emp_srv_id'];
        $per_nameEmp = $row['per_name'];
        $srv_id = $row['srv_id'];
        $srv_name = $row['srv_name'];
        $sta_id = $row['sta_id'];
        $sta_name = $row['sta_name'];
        $map = [
            '01' => 'January',
            '02' => 'February',
            '03' => 'March',
            '04' => 'April',
            '05' => 'May',
            '06' => 'June',
            '07' => 'July',
            '08' => 'August',
            '09' => 'September',
            '10' => 'October',
            '11' => 'November',
            '12' => 'December'
        ];
        $mount = $map[substr($cita_date,5,2)];
        $day = substr($cita_date,8,2);
        $year = substr($cita_date,0,4);
        $date = "$mount/$day/$year";
?>

$("#evoCalendar").evoCalendar({
    calendarEvents: [
      {
        id: '<?= "$cita_id-$user_id-$sta_id" ?>',
        name: '<?= "$srv_name de ".'"'.$per_name.'"'?>',
        description: '<?= `El usuario "$per_name" aparto una cita de "$srv_name"` ?>',
        date: '<?= $date ?>',
        type: 'Cita'
        color: "#63d867" // Event custom color (optional)
    }
    ]
  });

<?php
    endfor;
?>