<?php
session_start();
include("include/config.php");
include("include/function.php");


$sql = "select * from group_own where GID=$_REQUEST[gid]";
$rs = $conn->execute($sql);
STemplate::assign('gname', $rs->fields['gname']);
STemplate::assign('gurl', $rs->fields['gurl']);
STemplate::assign('gid', $gid);
$type = $rs->fields['type'];
STemplate::assign("type", $type);
STemplate::assign("gimage", $rs->fields['gimage']);
$gupload = $rs->fields['gupload'];
STemplate::assign("gupload", $gupload);


$sql = "select * from group_mem where GID=$_REQUEST[gid] and MID='$_SESSION[UID]'";
$rs = $conn->execute($sql);
$is_mem = $rs->fields['approved'];
STemplate::assign("is_mem", $is_mem);

if($_REQUEST['gid']=="")$err="Invalid profile direction.";
if($err=="")
{

if($_REQUEST['group_image'])
{
        $sql = "update group_own set gimage_vdo='$_REQUEST[VID]' where GID=$_REQUEST[gid]";
        $conn->execute($sql);
        $msg = "Group image is updated";
}

if($_REQUEST['remove_image'])
{
        $sql = "delete from group_vdo where VID='$_REQUEST[VID]' and GID='$_REQUEST[gid]'";
        $conn->execute($sql);
        header("Location: gvideos.php?urlkey=$_REQUEST[urlkey]&gid=$_REQUEST[gid]");
}

if($_REQUEST['approve_it'])
{
        $sql = "update group_vdo set approved='yes' where GID=$_REQUEST[gid] and VID='$_REQUEST[VID]'";
        $conn->execute($sql);
}

//PAGING STARTS
if($page=="")
{
	$page = 1;
}
else
{
	$page=$_REQUEST[page];
}



if($_SESSION[UID]==$gid)
        $qq = " and approved='yes' ";

$sql = "SELECT count(*) as total from group_vdo WHERE GID=$_REQUEST[gid] $qq limit $config[total_per_ini]";
$ars = $conn->Execute($sql);
if($ars->fields['total']<=$config[total_per_ini])$total = $ars->fields['total'];
else $total = $config[total_per_ini];
$tpage = ceil($total/$config[items_per_page]);
if($tpage==0) $spage=$tpage+1;
else $spage = $tpage;
$startfrom = ($page-1)*$config[items_per_page];


$sql="select * from group_vdo WHERE GID=$_REQUEST[gid] $qq order by AID desc limit $startfrom, $config[items_per_page]";
$rs=$conn->execute($sql);
if($rs->recordcount()>0)
$vdo = array();
$i=0;
while(!$rs->EOF)
{
        $sql = "select * from video where VID = ".$rs->fields['VID'];
        $rs1 = $conn->execute($sql);
        $a = $rs1->getrows();
        $a[0]["approved"] = $rs->fields['approved'];
        $vdo[$i]=$a[0];

        $rs->movenext();
        $i++;
}

$start_num=$startfrom+1;
$end_num=$startfrom+$rs->recordcount();

$page_link="";
for($k=1;$k<=$tpage;$k++) $page_link.="<a href='gvideos.php?gid=$_REQUEST[gid]&page=$k&type=$_REQUEST[type]'>$k</a>&nbsp;&nbsp;";
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
STemplate::assign('head_bottom',"grouplinks.tpl");
if($_SESSION['UID']!="")STemplate::assign('head_bottom_add',"crglinks.tpl");
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('gvideos.tpl');
STemplate::display('footer.tpl');
?>
