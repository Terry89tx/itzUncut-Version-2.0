<?php
session_start();
include("include/config.php");
include("include/function.php");
//chk_member_login();

if($_POST[removfavour]!="")
{
$sql="DELETE from favourite WHERE UID=$_SESSION[UID] and VID=$rvid";
echo $_SESSION[UID]."......";
echo $rvid;
//$conn->execute($sql);
}


//PAGING STARTS
if($page=="")
$page = 1;
if($_GET[UID])
        $sql = "SELECT count(*) as total from video as v, playlist as f WHERE f.UID=$_GET[UID] and f.VID=v.VID limit $config[total_per_ini]";
else
        $sql = "SELECT count(*) as total from video as v, playlist as f WHERE f.UID=$_SESSION[UID] and f.VID=v.VID limit $config[total_per_ini]";
$ars = $conn->Execute($sql);
if($ars->fields['total']<=$config[total_per_ini])$total = $ars->fields['total'];
else $total = $config[total_per_ini];
$tpage = ceil($total/$config[items_per_page]);
if($tpage==0) $spage=$tpage+1;
else $spage = $tpage;
$startfrom = ($page-1)*$config[items_per_page];

if($_GET[UID])
        $sql="select * from video as v, playlist as f WHERE f.UID=$_GET[UID] and f.VID=v.VID limit $startfrom, $config[items_per_page]";
else
        $sql="select * from video as v, playlist as f WHERE f.UID=$_SESSION[UID] and f.VID=v.VID limit $startfrom, $config[items_per_page]";
$rs=$conn->execute($sql);
if($rs->recordcount()>0)$vdo = $rs->getrows();
$start_num=$startfrom+1;
$end_num=$startfrom+$rs->recordcount();

$page_link="";
for($k=1;$k<=$tpage;$k++) $page_link.="<a href='my_playlist.php?UID=$_GET[UID]&page=$k&type=$_REQUEST[type]'>$k</a>&nbsp;&nbsp;";
//END PAGING


STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('page',$page);
STemplate::assign('start_num',$start_num);
STemplate::assign('end_num',$end_num);
STemplate::assign('page_link',$page_link);
STemplate::assign('total',$total);
STemplate::assign('answers',$vdo);
$mytags=group_tags($sql);
        STemplate::assign('mytags',$mytags);
STemplate::assign('head_bottom',"blank.tpl");
STemplate::assign('head_bottom_add',"viewuserlinks.tpl");
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('uplaylist.tpl');
STemplate::display('footer.tpl');
?>
