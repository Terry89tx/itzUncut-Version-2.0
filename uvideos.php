<?php
session_start();
include("include/config.php");
include("include/function.php");
//if($_REQUEST[UID]==$_SESSION[UID])header("location:$config[baseurl]/my_video.php");



if($_REQUEST['UID']=="")$err="Invalid profile direction.";
if($err=="")
{
if($_REQUEST['type']!="private") $_REQUEST['type']="public";
//PAGING STARTS
if($page=="")
$page = 1;
$sql = "SELECT count(*) as total from video WHERE UID=$_REQUEST[UID] and type='$_REQUEST[type]' limit $config[total_per_ini]";
$ars = $conn->Execute($sql);
if($ars->fields['total']<=$config[total_per_ini])$total = $ars->fields['total'];
else $total = $config[total_per_ini];
$tpage = ceil($total/$config[items_per_page]);
if($tpage==0) $spage=$tpage+1;
else $spage = $tpage;
$startfrom = ($page-1)*$config[items_per_page];

$sql="select * from video WHERE UID=$_REQUEST[UID]  and type='$_REQUEST[type]' limit $startfrom, $config[items_per_page]";
$rs=$conn->execute($sql);
if($rs->recordcount()>0)$vdo = $rs->getrows();
$start_num=$startfrom+1;
$end_num=$startfrom+$rs->recordcount();

$page_link="";
for($k=1;$k<=$tpage;$k++) $page_link.="<a href='uvideos.php?UID=$_REQUEST[UID]&page=$k&type=$_REQUEST[type]'>$k</a>&nbsp;&nbsp;";
//END PAGING
}

STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('page',$page);
STemplate::assign('start_num',$start_num);
STemplate::assign('end_num',$end_num);
STemplate::assign('page_link',$page_link);
STemplate::assign('total',$total);
STemplate::assign('answers',$vdo);
$kwords=group_tags($sql);
STemplate::assign('vtags',$kwords);
//STemplate::assign('head_bottom',"blank.tpl");
STemplate::assign('head_bottom_add',"viewuserlinks.tpl");
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('uvideos.tpl');
STemplate::display('footer.tpl');
?>
