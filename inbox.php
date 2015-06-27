<?php
session_start();
include("include/config.php");
include("include/function.php");
chk_member_login();

        if($_REQUEST['action']=='del')
        {
                $conn->execute("update pm set
                                        inbox_track = 1
                                where pm_id = $_REQUEST[id] and receiver='$_SESSION[USERNAME]'
                               ");
                header("Location: inbox.php");
        }
        

//PAGING STARTS
if($_REQUEST[page]=="")
	$page = 1;
else
	$page=$_REQUEST[page];

$sql = "SELECT count(*) as total from pm where receiver='$_SESSION[USERNAME]'  and inbox_track=2 limit $config[total_per_ini]";
$ars = $conn->Execute($sql);
if($ars->fields['total']<=$config[total_per_ini])$total = $ars->fields['total'];
else $total = $config[total_per_ini];
$tpage = ceil($total/$config[items_per_page]);
if($tpage==0) $spage=$tpage+1;
else $spage = $tpage;
$startfrom = ($page-1)*$config[items_per_page];

$sql = "select * from pm where receiver='$_SESSION[USERNAME]' and inbox_track=2 order by pm_id desc limit $startfrom, $config[items_per_page]";
$rs = $conn->execute($sql);
while(!$rs->EOF)
{
        if($rs->fields['inbox_track'] == 2)
        {
                        $pm_id[] = $rs->fields['pm_id'];
                        $body[] = $rs->fields['body'];
                        $sender[] = $rs->fields['sender'];
                        $date[] = $rs->fields['date'];
                        $seen[] = $rs->fields['seen'];
						$subject[] = fx_replace('$sender_name',$rs->fields['subject'],$rs->fields['sender']);				
        }
        $rs->movenext();
}
$start_num=$startfrom+1;
$end_num=$startfrom+$rs->recordcount();

$page_link="";
for($k=1;$k<=$tpage;$k++) $page_link.="<a href='inbox.php?UID=$_SESSION[UID]&page=$k&type=$_REQUEST[type]'>$k</a>&nbsp;&nbsp;";
//END PAGING

        
        STemplate::assign('pm_id', $pm_id);
        STemplate::assign('subject', $subject);
        STemplate::assign('body', $body);
        STemplate::assign('sender', $sender);
        STemplate::assign('date', $date);
        STemplate::assign('seen', $seen);
		STemplate::assign('start_num',$start_num);
		STemplate::assign('end_num',$end_num);
		STemplate::assign('page_link',$page_link);
		STemplate::assign('total',$total);
        STemplate::assign('err',$err);
        STemplate::assign('head_bottom',"msglinks.tpl");

        STemplate::display('head1.tpl');
        STemplate::display('err_msg.tpl');
        STemplate::display('inbox.tpl');
        STemplate::display('footer.tpl');

?>
