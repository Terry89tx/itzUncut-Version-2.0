<?php
include("include/config.php");
session_start();
include("include/function.php");


//PAGING
if($page=="")
$page = 1;

if($category!="rd" && $category!="mv" && $category!="md" && $category!="tf" && $category!="tr" && $category!="rf") $category="mr";
if($category=="mr")$sql = "SELECT count(*) as total from audio where type='public' order by addtime desc limit $config[total_per_ini]";
elseif($category=="mv")$sql = "SELECT count(*) as total from audio where type='public' order by viewnumber desc limit $config[total_per_ini]";
elseif($category=="md")$sql = "SELECT count(*) as total from audio where type='public' order by com_num desc limit $config[total_per_ini]";
elseif($category=="tf")$sql = "SELECT count(*) as total from audio where type='public' order by fav_num desc limit $config[total_per_ini]";
elseif($category=="tr")$sql = "SELECT count(*) as total from audio where type='public' order by ratedby*rate desc limit $config[total_per_ini]";
elseif($category=="rf")$sql = "SELECT count(*) as total from audio where type='public' and featured='yes' order by addtime desc limit $config[total_per_ini]";
elseif($category=="rd")$sql = "SELECT count(*) as total from audio where type='public' order by rand() limit $config[total_per_ini]";

$ars = $conn->Execute($sql);
if($ars->fields['total']<=$config[total_per_ini])$total = $ars->fields['total'];
else $total = $config[total_per_ini];
$tpage = ceil($total/$config[items_per_page]);
if($tpage==0) $spage=$tpage+1;
else $spage = $tpage;
$startfrom = ($page-1)*$config[items_per_page];
//generate next and previous
$next="";
$prev="";
$next_page=$page+1;
$prev_page=$page-1;
if($page>1 && $page<$spage)
{
        $next="<b><a href='audio.php?page=$next_page'>Next</a><b>";
        $prev="<b><a href='audio.php?page=$prev_page'>Previous</a><b>";
}
else if($page<$spage)
{
        $next="<b><a href='images.php?page=$next_page'>Next</a><b>";
}
else if($page>1 && $page=$spage)
{
        $prev="<b><a href='images.php?page=$prev_page'>Previous</a><b>";
}

if($category=="mr")$sql="SELECT * from audio where type='public' order by addtime desc limit $startfrom, $config[items_per_page]";
elseif($category=="mv")$sql="SELECT * from audio where type='public' order by viewnumber desc limit $startfrom, $config[items_per_page]";
elseif($category=="md")$sql="SELECT * from audio where type='public' order by com_num desc limit $startfrom, $config[items_per_page]";
elseif($category=="tf")$sql="SELECT * from audio where type='public' order by fav_num desc limit $startfrom, $config[items_per_page]";
elseif($category=="tr")$sql="SELECT * from audio where type='public' order by (ratedby*rate) desc limit $startfrom, $config[items_per_page]";
elseif($category=="rf")$sql="SELECT * from audio where type='public' and featured='yes' order by addtime desc limit $startfrom, $config[items_per_page]";
elseif($category=="rd")$sql="SELECT * from audio where type='public' order by rand() limit $startfrom, $config[items_per_page]";

$rs = $conn->Execute($sql);
$users = $rs->getrows();
$start_num=$startfrom+1;
$end_num=$startfrom+$rs->recordcount();


$page_link="";
for($k=1;$k<=$tpage;$k++) $page_link.="<a href='audio.php?page=$k&viewtype=$_REQUEST[viewtype]&category=$category'>$k</a>&nbsp;&nbsp;";

//END PAGING



STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('page',$page);
STemplate::assign('start_num',$start_num);
STemplate::assign('end_num',$end_num);
STemplate::assign('placement',$placement);
STemplate::assign('page_link',$page_link);
STemplate::assign('total',$total);
STemplate::assign('answers',$users);
STemplate::assign('next',$next);
STemplate::assign('prev',$prev);
STemplate::assign('head_bottom',"musiclinks.tpl");
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('search.tpl');
STemplate::display('audio.tpl');
STemplate::display('footer.tpl');
?>
