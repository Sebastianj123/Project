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
            theme: 'Midnight Blue',
            language: 'es'
        },
        
        'addCalendarEvent', [
            {
                id: '09nk7Ts',
                name: "My Birthday",
                date: 'August/15/2023',
                type: "event",
                everyYear: true
            }]
        )
    }
);
</script>