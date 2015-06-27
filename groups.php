<?php
session_start();
include("include/config.php");
include("include/function.php");


if($_REQUEST[catgy]=="")$_REQUEST[catgy]="Featured";

//PAGING STARTS
if($_REQUEST[page]=="")
$page = 1;
else
$page = $_REQUEST[page];

if(is_numeric($_REQUEST[chid]))$sql="SELECT count(*) as total from group_own WHERE channel like '%$_REQUEST[chid]%'";
else
{
if($_REQUEST[b]!="ra" && $_REQUEST[b]!="mm" && $_REQUEST[b]!="mv" && $_REQUEST[b]!="mt")
	$b="fr";
else
	$b = $_REQUEST['b'];

if($b=="fr")$sql = "SELECT count(*) as total from group_own WHERE featured='yes'";
elseif($b=="ra")$sql="SELECT count(*) as total from group_own order by gcrtime desc";
elseif($b=="mm")$sql="SELECT distinct count(*) as total from group_mem group by GID";
elseif($b=="mv")$sql="SELECT distinct count(*) as total from group_vdo group by GID";
elseif($b=="mt")$sql="SELECT distinct count(*) as total from group_tps group by GID";
}

$ars = $conn->Execute($sql);
if($ars->fields['total']<=$config[total_per_ini])$total = $ars->fields['total'];
else $total = $config[total_per_ini];
$tpage = ceil($total/$config[items_per_page]);
if($tpage==0) $spage=$tpage+1;
else $spage = $tpage;
$startfrom = ($page-1)*$config[items_per_page];

if(is_numeric($_REQUEST[chid]))$sql="SELECT * from group_own WHERE channel like '%$_REQUEST[chid]%' limit $startfrom, $config[items_per_page]";
else
{
	if($b=="fr")$sql="SELECT * from group_own WHERE featured='yes' limit $startfrom, $config[items_per_page]";
	elseif($b=="ra")$sql="SELECT * from group_own order by gcrtime desc limit $startfrom, $config[items_per_page]";
	elseif($b=="mm")$sql="SELECT distinct *,count(MID) as total from group_mem as m, group_own as o WHERE m.GID=o.GID group by m.GID order by total desc  limit $startfrom, $config[items_per_page]";
	elseif($b=="mv")$sql="SELECT distinct *,count(VID) as total from group_vdo as v, group_own as o WHERE v.GID=o.GID group by v.GID order by total desc  limit $startfrom, $config[items_per_page]";
	elseif($b=="mt")$sql="SELECT distinct * from group_tps group by GID";
}

$rs=$conn->execute($sql);
if($rs->recordcount()>0)$vdo = $rs->getrows();
$start_num=$startfrom+1;
$end_num=$startfrom+$rs->recordcount();
$page_link="";
if(is_numeric($_REQUEST[chid]))$add="&chid=$_REQUEST[chid]&catgy=$$_REQUEST[catgy]";else $add="&b=$b&catgy=$$_REQUEST[catgy]";
for($k=1;$k<=$tpage;$k++) $page_link.="<a href='groups.php?UID=$_REQUEST[UID]&page=$k$add'>$k</a>&nbsp;&nbsp;";
//END PAGING


STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('page',$page);
STemplate::assign('start_num',$start_num);
STemplate::assign('end_num',$end_num);
STemplate::assign('page_link',$page_link);
STemplate::assign('total',$total);
STemplate::assign('answers',$vdo);
STemplate::assign('head_bottom',"grouplinks.tpl");
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('search.tpl');
STemplate::display('groups.tpl');
STemplate::display('footer.tpl');
?>
