    <!-- Home (vista) -->
<div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab" tabindex="0">    
    <?php
        include('view/every/home.php');
    ?>
</div>

    <!-- Servicio (vista) -->
<div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab" tabindex="0">
    
    <?php
        include('view/every/services.php');
    ?>

</div>

<!-- Calendário (vista) -->
<div class="tab-pane fade m-auto" id="v-pills-disabled" role="tabpanel" aria-labelledby="v-pills-disabled-tab" tabindex="0" style="height:100%;">
    <?php
        // Calendarío
        include('view/every/calendar.php');
    ?>
</div>