                                                             <?php
session_start();
include("include/config.php");
include("include/function.php");

$sql="SELECT * from group_own WHERE gurl='$_REQUEST[urlkey]'";
$rs = $conn->Execute($sql);
if($rs->recordcount()>0)
{
STemplate::assign('groupname',$rs->fields[gname]);
//PAGING STARTS
if($page=="")
$page = 1;
$sql = "SELECT count(*) as total from group_mem WHERE GID=".$rs->fields[GID];
$ars = $conn->Execute($sql);
if($ars->fields['total']<=$config[total_per_ini])$total = $ars->fields['total'];
else $total = $config[total_per_ini];
$tpage = ceil($total/$config[items_per_page]);
if($tpage==0) $spage=$tpage+1;
else $spage = $tpage;
$startfrom = ($page-1)*$config[items_per_page];

$sql="SELECT m.*,s.addtime from group_mem as m,signup as s WHERE m.MID=s.UID and m.GID=".$rs->fields[GID]." limit $startfrom, $config[items_per_page]";
$rs=$conn->execute($sql);
if($rs->recordcount()>0)$vdo = $rs->getrows();
$start_num=$startfrom+1;
$end_num=$startfrom+$rs->recordcount();
$page_link="";
for($k=1;$k<=$tpage;$k++) $page_link.="<a href='group_members.php?UID=$_REQUEST[UID]&page=$k&type=$_REQUEST[type]'>$k</a>&nbsp;&nbsp;";
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
STemplate::assign('head_bottom',"grouplinks.tpl");
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('ugroup_members.tpl');
STemplate::display('footer.tpl');
?>
