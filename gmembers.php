<?php
include("include/config.php");
session_start();
include("include/function.php");

$sql = "select * from group_own where GID=$gid";
$rs = $conn->execute($sql);
STemplate::assign('gname', $rs->fields['gname']);
STemplate::assign('gurl', $rs->fields['gurl']);
$gupload = $rs->fields['gupload'];
STemplate::assign("gupload", $gupload);

if($_POST['approve_mem'])
{
        $sql = "update group_mem set approved='yes' where AID='$AID'";
        $conn->execute($sql);
}

if($_POST['remove_mem'])
{
        $sql = "delete from group_mem where MID='$_POST[MID]' and GID='$gid'";
        $conn->execute($sql);
        header("Location: gmembers.php?urlkey=$urlkey&gid=$gid");
}


//PAGING STARTS
if($page=="")
$page = 1;
$sql = "SELECT count(*) as total from group_mem WHERE GID=$_REQUEST[gid] limit $config[total_per_ini]";
$ars = $conn->Execute($sql);
if($ars->fields['total']<=$config[total_per_ini])$total = $ars->fields['total'];
else $total = $config[total_per_ini];
$tpage = ceil($total/$config[items_per_page]);
if($tpage==0) $spage=$tpage+1;
else $spage = $tpage;
$startfrom = ($page-1)*$config[items_per_page];

$sql="select * from group_mem WHERE GID=$_REQUEST[gid] limit $startfrom, $config[items_per_page]";
$rs=$conn->execute($sql);
if($rs->recordcount()>0)$vdo = $rs->getrows();
$start_num=$startfrom+1;
$end_num=$startfrom+$rs->recordcount();

$page_link="";
for($k=1;$k<=$tpage;$k++) $page_link.="<a href='gmembers.php?gid=$_REQUEST[gid]&page=$k&type=$_REQUEST[type]'>$k</a>&nbsp;&nbsp;";
//END PAGING


STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('page',$page);
STemplate::assign('start_num',$start_num);
STemplate::assign('end_num',$end_num);
STemplate::assign('page_link',$page_link);
STemplate::assign('total',$total);
STemplate::assign('friends',$vdo);
STemplate::assign('head_bottom',"grouplinks.tpl");
if($_SESSION['UID']!="")STemplate::assign('head_bottom_add',"crglinks.tpl");
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('gmembers.tpl');
STemplate::display('footer.tpl');
?>
