<?php
include("../include/config.php");
include("leftmenu/headlinks.txt.php");

STemplate::assign('HeadLinks',$HeadLinksArray);
STemplate::display('siteadmin/framehead.tpl');
?>
