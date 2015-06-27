<?php
include("include/config.php");
session_start();
include("include/function.php");


//PAGING
$sql="SELECT * from channel";
$rs = $conn->Execute($sql);
$users = $rs->getrows();
//END PAGING

STemplate::assign('err',$err);

STemplate::assign('msg',$msg);
STemplate::assign('answers',$users);
STemplate::display('head1.tpl');
STemplate::display('search.tpl');


if($flag=="audio_channels.tpl")
{
        STemplate::display($flag);
}
else
{
        STemplate::display('channels.tpl');
}

STemplate::display('footer.tpl');
?>
