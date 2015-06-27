<?php
include("include/config.php");
session_start();
include("include/function.php");

# Find the vote information 
$mydate= date('Y-m-d');
$sql ="select * from poll_question  where start_date<='$mydate' and end_date>='$mydate'";
$rs = $conn->Execute($sql);
$x=$rs->getarray();
$list=explode("|", $x[0]['poll_answer']);
STemplate::assign('poll_id',$x[0]['poll_id']);
STemplate::assign('poll_qty',$x[0]['poll_qty']);
STemplate::assign('list',$list);

//PAGING
$items_per_page=($config['rows_per_page']*$config['cols_per_page']);
$sql="SELECT * from video where type='public' and featured='yes' order by addtime desc";
$rs = $conn->Execute($sql);
if($rs->recordcount()>0)$users = $rs->getrows();
//END PAGING

$sql1 = "select VID, title, viewtime, vkey from video where viewtime<>'0000-00-00 00:00:00' order by viewtime desc limit 0, ".$config['recently_viewed_video'];
$rs_v = $conn->execute($sql1);
$recent = $rs_v->getrows();
STemplate::assign('recent', $recent);
STemplate::assign('recent_total', count($recent));

if ($_REQUEST['msg']!=""){
	$msg=$_REQUEST['msg'];
}

STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('answers',$users);
STemplate::assign('total',$rs->recordcount());
$sql="SELECT * from video where type='public' order by addtime desc limit 100";
$tags=group_tags($sql);
STemplate::assign('tags',$tags);
STemplate::assign('head_bottom',"homelinks.tpl");

if($config['enable_package']=="yes" and $_SESSION['UID']!="")
{
        $sql = "select * from subscriber where UID=$_SESSION[UID]";
        $rs = $conn->execute($sql);
        $u_info = $rs->getrows();
        STemplate::assign('u_info', $u_info[0]);
        $rs->movefirst();
        
        $sql = "select * from package where pack_id=".$rs->fields['pack_id'];
        $rs = $conn->execute($sql);
        $pack = $rs->getrows();
        STemplate::assign('pack', $pack[0]);
}

STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('search.tpl');
STemplate::display('index.tpl');
STemplate::display('right.tpl');
STemplate::display('footer.tpl');
?>
