<?php
session_start();
include("include/config.php");
include("include/function.php");
chk_member_login();

        if($_REQUEST['action']=='del')
        {
                $conn->execute("update pm set
                                        outbox_track = 1
                                where pm_id=$_REQUEST[id] and sender='$_SESSION[USERNAME]'
                               ");
        }


//PAGING STARTS
if($_REQUEST[page]=="")
	$page = 1;
else
	$page=$_REQUEST[page];


$sql = "SELECT count(*) as total from pm where sender='$_SESSION[USERNAME]'  and outbox_track=2 limit $config[total_per_ini]";
$ars = $conn->Execute($sql);
if($ars->fields['total']<=$config[total_per_ini])$total = $ars->fields['total'];
else $total = $config[total_per_ini];
$tpage = ceil($total/$config[items_per_page]);
if($tpage==0) $spage=$tpage+1;
else $spage = $tpage;
$startfrom = ($page-1)*$config[items_per_page];

$sql = "select * from pm where sender='$_SESSION[USERNAME]' and outbox_track=2 order by pm_id desc limit $startfrom, $config[items_per_page]";

$rs = $conn->execute($sql);

while(!$rs->EOF)
{
        if($rs->fields['outbox_track'] == 2)
        {
                        $pm_id[] = $rs->fields['pm_id'];
							$subject[] = $rs->fields['subject'];
;
                        $body[] = $rs->fields['body'];
                        $receiver[] = $rs->fields['receiver'];
                        $date[] = $rs->fields['date'];
        }
        $rs->movenext();
}
$start_num=$startfrom+1;
$end_num=$startfrom+$rs->recordcount();

$page_link="";
for($k=1;$k<=$tpage;$k++) $page_link.="<a href='outbox.php?UID=$_SESSION[UID]&page=$k&type=$_REQUEST[type]'>$k</a>&nbsp;&nbsp;";
//END PAGING


        STemplate::assign('pm_id', $pm_id);
        STemplate::assign('subject', $subject);
        STemplate::assign('body', $body);
        STemplate::assign('receiver', $receiver);
        STemplate::assign('date', $date);
STemplate::assign('start_num',$start_num);
STemplate::assign('end_num',$end_num);
STemplate::assign('page_link',$page_link);
STemplate::assign('total',$total);
        STemplate::assign('err',$err);
        STemplate::assign('head_bottom',"msglinks.tpl");
        STemplate::display('head1.tpl');
        STemplate::display('err_msg.tpl');
        STemplate::display('outbox.tpl');
        STemplate::display('footer.tpl');
?>

