<?php
include("include/config.php");
session_start();
include("include/function.php");


//PAGING
$sql="SELECT * from channel WHERE CHID=$_REQUEST[chid]";
$rs = $conn->Execute($sql);
if($rs->recordcount()>0)
{
$users = $rs->getrows();
$sql="SELECT count(VID) as total, UID from audio WHERE channel like '%|$_REQUEST[chid]|%'  group by UID order by total desc limit 5";
$rsx = $conn->Execute($sql);
$tmpary = $rsx->getrows();
STemplate::assign('actuser',$tmpary);
$sql="SELECT * from audio WHERE channel like '%|$_REQUEST[chid]|%' order by addtime desc limit 5";
$rsx = $conn->Execute($sql);
$tmpary = $rsx->getrows();
STemplate::assign('recadd',$tmpary);
$sql="SELECT * from audio WHERE channel like '%|$_REQUEST[chid]|%' order by viewnumber desc limit 5";
$rsx = $conn->Execute($sql);
$tmpary = $rsx->getrows();
STemplate::assign('mostview',$tmpary);
}
//END PAGING

STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('total',$rsx->recordcount());
STemplate::assign('answers',$users);
$tags=group_tags($sql);
STemplate::assign('tags',$tags);
STemplate::assign('head_bottom',"musiclinks.tpl");
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('audio_channel_detail.tpl');
STemplate::display('footer.tpl');
?>
