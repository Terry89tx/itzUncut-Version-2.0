<?php
include("include/config.php");
session_start();
include("include/function.php");

        STemplate::assign('err',$err);
        STemplate::assign('head_bottom',"blank.tpl");
        STemplate::display('head1.tpl');
        STemplate::display('err_msg.tpl');
        echo "<table width=100% height=300 cellpadding=0 cellspacing=0><tr><td valign=top>";
        STemplate::display('dev.tpl');
        echo "</td></tr></table>";
        STemplate::display('footer.tpl');
?>
