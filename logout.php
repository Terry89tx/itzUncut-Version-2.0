<?php
session_start();
include("include/config.php");

$_SESSION[UID]="";session_unregister("UID");
$_SESSION[EMAIL]="";session_unregister("EMAIL");
$_SESSION[USERNAME]="";session_unregister("USERNAME");

//echo "<table align=center><tr><td><br><br><b><center>You Have been Successfully logged out.<br>You will be redirected to Main site in few seconds.</center></b></td></tr></table>";
//echo "<Meta HTTP-EQUIV=refresh content=\"2; url=$config[baseurl]/index.php\">";
header("location: $config[baseurl]/index.php");
?>
