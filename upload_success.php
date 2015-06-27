<?php
session_start();
include("include/config.php");
include("include/function.php");
chk_member_login();
if($_REQUEST[action_update]!="")
{
$sql="select VID from video WHERE vkey='$_REQUEST[viewkey]'";
$rs = $conn->Execute($sql);
if($rs->recordcount()<=0)$err="Invalid key";
if($err=="")
{
        if(!is_numeric($_REQUEST[month]) ||!is_numeric($_REQUEST[day]) || !is_numeric($_REQUEST[year]) || !checkdate($_REQUEST[month],$_REQUEST[day],$_REQUEST[year]))
        $err="Upload: Please Provide a valid date.";
        elseif($_REQUEST[field_address]=="") $err="Upload: Please Provide the location.";
        elseif($_REQUEST[country]=="Select Country") $err="Please provide Country name.";
        if($err=="")
        {
        $sql="update video set
                record_date='".$_REQUEST[year]."-".$_REQUEST[month]."-".$_REQUEST[day]."',
                location='$_REQUEST[field_address]',
                country='$_REQUEST[country]' WHERE VID=".$rs->fields[VID];
        $conn->execute($sql);
        if(mysql_affected_rows()>=1) header("location:$config[baseurl]/my_video.php");
        }
}}

STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('head_bottom',"blank.tpl");
STemplate::assign('vidid',$_GET['vid']);
STemplate::assign('days',days($_REQUEST[day]));
STemplate::assign('months',months($_REQUEST[month]));
STemplate::assign('years',years($_REQUEST[year]));
STemplate::assign('country',country_box($_REQUEST[country]));

STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('upload_success.tpl');
STemplate::display('footer.tpl');
?>
