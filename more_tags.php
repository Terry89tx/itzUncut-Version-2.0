<?php
session_start();
include("include/config.php");
include("include/function.php");


//PAGING
$sql="SELECT * from video where type='public' order by addtime desc limit 100";
$rs = $conn->Execute($sql);
$rtags=group_tags($sql);
$sql="SELECT * from video where type='public' order by rand() limit 100";
$rs = $conn->Execute($sql);
$ptags=group_tags($sql);
//END PAGING


STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('answers',$users);
STemplate::assign('total',$rs->recordcount());
STemplate::assign('rtags',$rtags);
STemplate::assign('ptags',$ptags);
STemplate::assign('head_bottom',"homelinks.tpl");
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('more_tags.tpl');
STemplate::display('footer.tpl');
?>
