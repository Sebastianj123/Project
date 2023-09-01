<head>

<?php
    require('config/connectDb.php');
    $sql = 'CALL v_cita();';
    $query = $con -> query($sql);
    $result = $query -> fetch_all(MYSQLI_ASSOC);
?>
    <!-- Add the evo-calendar.css for styling -->
    <!-- Add the evo-calendar.css for styling -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/evo-calendar@1.1.2/evo-calendar/css/evo-calendar.min.css"/>
    <!-- <link rel="stylesheet" type="text/css" href="evo-calendar.min.css"/> -->
<link rel="stylesheet" href="assets/css/evo-calendar.midnight-blue.min.css">
</head>
<body>
    
<div id="calendar"></div>
    <!-- Add jQuery library (required) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.min.js"></script>    
    <!-- Add the evo-calendar.js for.. obviously, functionality! -->
    <script src="https://cdn.jsdelivr.net/npm/evo-calendar@1.1.2/evo-calendar/js/evo-calendar.min.js"></script>
</body>

<script>
        // $("#calendar").evoCalendar();
$(document).ready(
    function() {
        $('#calendar').evoCalendar({
            
            calendarEvents:
            [
                
                <?php
    for ($i = 0; $i < count($result) ; $i++) :
        $row = $result[$i];
        $cita_id = $row['cita_id'];
        $agend_date = $row['agend_date'];
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
        $mount = $map[substr($agend_date,5,2)];
        $day = substr($agend_date,8,2);
        $year = substr($agend_date,0,4);
        $date = "$mount/$day/$year";
?>
            {
                id: '<?= "$cita_id-$user_id-$sta_id" ?>',
                name: '<?= "$srv_name de ".'"'.$per_name.'"'?>',
                // badge: "02/13 - 02/15", // Event badge (optional)
                date: '<?= $date ?>', // Date range
                description: '<?= `El usuario "$per_name" aparto una cita de "$srv_name"` ?>',
                type: "cita",
                color: "#0ff" // Event custom color (optional)
            } <?= (count($result) == $i) ? '' : ',' ;?>
<?php endfor; ?>
            ],
            theme: 'Midnight Blue',
            language: 'es'
        });
    }
);
</script>