<?php
include("include/config.php");
session_start();
include("include/function.php");
chk_member_login();
//if($_REQUEST[UID]==$_SESSION[UID])header("location:$config[baseurl]/my_video.php");

/* Fetch my friends UID */
$sql = "select FID from friends where UID=$_SESSION[UID] and friends_status='Confirmed'";
$rs = $conn->execute($sql);
while(!$rs->EOF)
{
        $frnd[] = $rs->fields['FID'];
        $rs->movenext();
}
if($frnd[0]!="")
        $my_friends = implode(",", $frnd);


{
if($_REQUEST['type']!="private") $_REQUEST['type']="public";
//PAGING STARTS
if($page=="")
        $page = 1;
$sql = "SELECT count(*) as total from video WHERE UID in ($my_friends) limit $config[total_per_ini]";
$ars = $conn->Execute($sql);
if($ars->fields['total']<=$config[total_per_ini])$total = $ars->fields['total'];
else $total = $config[total_per_ini];
$tpage = ceil($total/$config[items_per_page]);
if($tpage==0) $spage=$tpage+1;
else $spage = $tpage;
$startfrom = ($page-1)*$config[items_per_page];

if($my_friends!="")
{
        $sql="select * from video WHERE UID in ($my_friends) limit $startfrom, $config[items_per_page]";

        $rs=$conn->execute($sql);
        if($rs->recordcount()>0)$vdo = $rs->getrows();
        $start_num=$startfrom+1;
        $end_num=$startfrom+$rs->recordcount();
}

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
if($my_friends!="")
        $kwords=group_tags($sql);
STemplate::assign('vtags',$kwords);
STemplate::assign('head_bottom',"friendlinks.tpl");
//STemplate::assign('head_bottom_add',"viewuserlinks.tpl");
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('search.tpl');
STemplate::display('fvideos.tpl');
STemplate::display('footer.tpl');
?>
