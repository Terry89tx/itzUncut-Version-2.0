<?php
session_start();
include("include/config.php");
include("include/function.php");


if($_REQUEST[search_id]=="")$err="No search result.";
else
{
//PAGING STARTS
if($page=="")
$page = 1;
$sql = "SELECT count(*) as total from group_own where (gname like '%$_REQUEST[search_id]%' or keyword like '%$_REQUEST[search_id]%' or gdescn like '%$_REQUEST[search_id]%')";
$ars = $conn->Execute($sql);
if($ars->fields['total']<=$config[total_per_ini])$total = $ars->fields['total'];
else $total = $config[total_per_ini];
$tpage = ceil($total/$config[items_per_page]);
if($tpage==0) $spage=$tpage+1;
else $spage = $tpage;
$startfrom = ($page-1)*$config[items_per_page];

$sql="SELECT * from group_own where (gname like '%$_REQUEST[search_id]%' or keyword like '%$_REQUEST[search_id]%' or gdescn like '%$_REQUEST[search_id]%') limit $startfrom, $config[items_per_page]";
$rs = $conn->Execute($sql);
if($rs->recordcount()>0)$users = $rs->getrows();
$start_num=$startfrom+1;
$end_num=$startfrom+$rs->recordcount();

$page_link="";
for($k=1;$k<=$tpage;$k++) $page_link.="<a href='search_result.php?page=$k&search_type=$_REQUEST[search_type]&search_id=$_REQUEST[search_id]'>$k</a>&nbsp;&nbsp;";
//END PAGING

$tags=group_tags($sql);
STemplate::assign('tags',$tags);
}



STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('page',$page);
STemplate::assign('start_num',$start_num);
STemplate::assign('end_num',$end_num);
STemplate::assign('page_link',$page_link);
STemplate::assign('total',$total);
STemplate::assign('answers',$users);
$tags=group_tags($sql);
STemplate::assign('tags',$tags);
STemplate::assign('head_bottom',"grouplinks.tpl");
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('search.tpl');
STemplate::assign('ttime',($t2-$t1));
STemplate::display('search_group.tpl');
STemplate::display('footer.tpl');
?>
