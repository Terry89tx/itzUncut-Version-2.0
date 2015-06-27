<?php
session_start();
$t1=time();
include("include/config.php");
include("include/function.php");
if($_REQUEST['sort']=="adddate")$sortby="order by addtime desc";
elseif($_REQUEST['sort']=="viewnum")$sortby="order by viewnumber desc";
elseif($_REQUEST['sort']=="rate")$sortby="order by (ratedby*rate) desc";
else $sortby="order by title";



if($_REQUEST['search_id']=="" && $_REQUEST['search_key']=="")$err="Please type a search key";
if($err=="")
{
if($_REQUEST['search_type']=="search_users")
{
$sql="select UID from signup WHERE username='$_REQUEST[search_id]'";
$rs=$conn->execute($sql);
if($rs->recordcount()>0){$id=$rs->fields['UID'];header("location:$config[baseurl]/uprofile.php?UID=$id");exit;}
}
elseif($_REQUEST[search_type]=="search_groups")
{header("location:$config[baseurl]/search_group.php?search_type=$_REQUEST[search_type]&search_id=$_REQUEST[search_id]");exit;}
elseif($_REQUEST[search_type]=="related")
{
	$list=key_to_info($_REQUEST['search_key']);
	$ch=explode(" ",$list[2]);
	if(count($ch)>1)for($i=1;$i<count($ch);$i++)$chnl.="or keyword like '%$ch[$i]%'";
	$sql="SELECT count(*) as total from video where type='public' and (title like '%$ch[0]%' $chnl) order by VID asc";
}
else
{
		$sql = "SELECT count(*) as total from video where type='public' and (title like '%$_REQUEST[search_id]%' or keyword like '%$_REQUEST[search_id]%' or description like '%$_REQUEST[search_id]%') $sortby limit $config[total_per_ini]";
}


//PAGING STARTS
if($_REQUEST[page]=="")
$page = 1;
else
$page = $_REQUEST[page];
$ars = $conn->Execute($sql);
if($ars->fields['total']<=$config[total_per_ini])$total = $ars->fields['total'];
else $total = $config[total_per_ini];
$tpage = ceil($total/$config[items_per_page]);
if($tpage==0) $spage=$tpage+1;
else $spage = $tpage;
$startfrom = ($page-1)*$config[items_per_page];
if($_REQUEST[search_type]=="related")$sql="SELECT * from video where type='public' and (title like '%$ch[0]%' $chnl) order by VID asc limit $startfrom, $config[items_per_page]";
else $sql="SELECT * from video where type='public' and (title like '%$_REQUEST[search_id]%' or keyword like '%$_REQUEST[search_id]%' or description like '%$_REQUEST[search_id]%') $sortby limit $startfrom, $config[items_per_page]";
$rs = $conn->Execute($sql);
if($rs->recordcount()>0)$users = $rs->getrows();
$start_num=$startfrom+1;
$end_num=$startfrom+$rs->recordcount();

$page_link="";
for($k=1;$k<=$tpage;$k++) $page_link.="<a href='search_result.php?page=$k&search_type=$_REQUEST[search_type]&search_id=$_REQUEST[search_id]&search_key=$_REQUEST[search_key]&sort=$_REQUEST[sort]'>$k</a>&nbsp;&nbsp;";
//END PAGING

$tags=group_tags($sql);
STemplate::assign('tags',$tags);
}

STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('ch',$ch);
STemplate::assign('page',$page);
STemplate::assign('start_num',$start_num);
STemplate::assign('end_num',$end_num);
STemplate::assign('page_link',$page_link);
STemplate::assign('total',$total);
STemplate::assign('answers',$users);
STemplate::assign('head_bottom',"homelinks.tpl");
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('search.tpl');
$t2=time();
STemplate::assign('ttime',($t2-$t1));
STemplate::display('search_result.tpl');
STemplate::display('footer.tpl');
?>
