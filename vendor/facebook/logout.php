<?php

 require 'config.php';

 echo '<pre>';
 print_r($_SESSION);
 echo '</pre>';
 $facebook->destroySession();
 session_start();
 unset($_SESSION['userdata']);
 session_destroy();
 header("Location:http://loginfb.mm");

?>