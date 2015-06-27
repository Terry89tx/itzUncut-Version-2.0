<?php
include("include/config.php");
session_start();
include("include/function.php");
chk_member_login();


$sql = "select * from group_own where GID=$_REQUEST[gid]";
$rs = $conn->execute($sql);
STemplate::assign('gname', $rs->fields['gname']);
$gupload = $rs->fields['gupload'];
STemplate::assign("gupload", $gupload);

if($_REQUEST['add_video'])
{
        $sql = "select * from group_mem where GID=$_REQUEST[gid]";
        $rs = $conn->execute($sql);
        if($rs->recordcount()>0)
        {
                if($gupload=='owner_approve')
                        $approved = 'no';
                else
                        $approved = 'yes';
                $sql = "insert group_vdo set
                                GID=$_REQUEST[gid],
                                VID=$_REQUEST[VID],
                                MID=$_SESSION[UID],
                                approved='$approved'
                                ";
                $conn->execute($sql);

                if($gupload == "owner_approve")
                        $msg="The video will be appear after owner approval";
                else
                        $msg = "The video is added to the group";
        }
}

//PAGING STARTS
if($_REQUEST[page]=="")
$page = 1;
else
$page = $_REQUEST[page];
$sql = "SELECT count(*) as total from video as v, favourite as f WHERE f.UID=$_SESSION[UID] and f.VID=v.VID limit $config[total_per_ini]";
$ars = $conn->Execute($sql);
if($ars->fields['total']<=$config[total_per_ini])$total = $ars->fields['total'];
else $total = $config[total_per_ini];
$tpage = ceil($total/$config[items_per_page]);
if($tpage==0) $spage=$tpage+1;
else $spage = $tpage;
$startfrom = ($page-1)*$config[items_per_page];

$sql="select * from video as v, favourite as f WHERE f.UID=$_SESSION[UID] and f.VID=v.VID limit $startfrom, $config[items_per_page]";
$rs=$conn->execute($sql);
if($rs->recordcount()>0)$vdo = $rs->getrows();
$start_num=$startfrom+1;
$end_num=$startfrom+$rs->recordcount();

$page_link="";
for($k=1;$k<=$tpage;$k++) $page_link.="<a href='ufavour.php?UID=$_SESSION[UID]&page=$k&type=$_REQUEST[type]'>$k</a>&nbsp;&nbsp;";
//END PAGING


STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('page',$page);
STemplate::assign('start_num',$start_num);
STemplate::assign('end_num',$end_num);
STemplate::assign('page_link',$page_link);
STemplate::assign('total',$total);
STemplate::assign('answers',$vdo);
STemplate::assign('head_bottom',"homelinks.tpl");
if($_SESSION['UID']!="")STemplate::assign('head_bottom_add',"addvideolink.tpl");
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('add_favour.tpl');
STemplate::display('footer.tpl');
?>
