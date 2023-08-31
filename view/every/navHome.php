    <!-- Home (vista) -->
<div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab" tabindex="0">    
    <?php
        require('view/every/home.php');
    ?>
</div>

    <!-- Servicio (vista) -->
<div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab" tabindex="0">
    
    <?php
        require('view/every/services.php');
    ?>

</div>

<!-- Calendário (vista) -->
<div class="tab-pane fade m-auto" id="v-pills-calendar" role="tabpanel" aria-labelledby="v-pills-calendar-tab" tabindex="0" style="height:100%;">
    <?php
        // Calendarío
        require('view/every/calendar.php');
    ?>
</div>

<!-- <?php
    require('assets/php/declare.php');
    switch ($rol) :
        case 1:
?>
    
<?php
            break;
        case 2:
?>

<?php
            break;
        case 3:
?>

<?php
            break;
    endswitch;
?> -->