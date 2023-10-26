<?php
namespace App\Config;

/* Default Data Database*/
define('HOST','LocalHost');
define('DB','cabelloBelloJJ');
define('USER','root');
define('PASS','');

/* Default options */
define("DEFAULT_FOLDER",'public/');
define("DEFAULT_CONTROLLER", "login");
define("DEFAULT_METHOD", "show");
define("DEFAULT_ACTION", "list");
/* Default App options */

define("APP_URL","http://127.0.0.1/SENA/project/app/");
define("APP_URL_PUBLIC","http://127.0.0.1/SENA/project/public/");
define("APP_NAME","Cabello Bello JJ");

define("DEFAULT_ROUTE", APP_URL_PUBLIC.DEFAULT_CONTROLLER.'/'.DEFAULT_METHOD);


/* Default time zone options */
date_default_timezone_set("America/Bogota");