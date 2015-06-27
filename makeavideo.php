<?php
session_start();
include("include/config.php");
include("include/function.php");


STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('search.tpl');
STemplate::display('makeavideo.tpl');
STemplate::display('footer.tpl');
?>
