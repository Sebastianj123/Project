<head>
    
    <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <!-- Add the evo-calendar.css for styling -->
    <!-- Add the evo-calendar.css for styling -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/evo-calendar@1.1.2/evo-calendar/css/evo-calendar.min.css"/>
</head>

<body>

<section style="height:100%; width:100%;" class="d-flex justify-content-center align-items-center">
<div id="calendar">

</div>
</section> 
    
    <!-- Add jQuery library (required) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.min.js"></script>

<!-- Add the evo-calendar.js for.. obviously, functionality! -->
<script src="https://cdn.jsdelivr.net/npm/evo-calendar@1.1.2/evo-calendar/js/evo-calendar.min.js"></script>

<script>

$("#calendar").evoCalendar();
    // language
    // $('#calendar').evoCalendar({
    //     // theme: 'Midnight Blue',
    //     // language: 'es'
    // });

//     $("#evoCalendar").on('selectDate', function() {
//     // code here
//   });

//     $("#evoCalendar").evoCalendar('addCalendarEvent', [
//     {
//       id: '09nk7Ts',
//       name: "My Birthday",
//       date: "1 15 2023",
//       type: "birthday",
//       everyYear: true
//     }
//   ]);
</script>

</body>