<?php
session_start();
include("include/config.php");
include("include/function.php");
chk_member_login();

if($_POST[action_update]!="")
{
$sql="select VID from audio WHERE vkey='$_REQUEST[viewkey]'";
$rs = $conn->Execute($sql);
if($rs->recordcount()<=0)$err="Invalid key";
if($err=="")
{
        if(!is_numeric($month) ||!is_numeric($day) || !is_numeric($year) || !checkdate($month,$day,$year))
        $err="Upload: Please Provide a valid date.";
        elseif($field_address=="") $err="Upload: Please Provide the location.";
        elseif($country=="Select Country") $err="Please provide Country name.";
        if($err=="")
        {
				$sql="update audio set
					record_date='".$year."-".$month."-".$day."',
					location='$field_address',
					country='$country' WHERE VID=".$rs->fields[VID];
				 $conn->execute($sql);
        if(mysql_affected_rows()>=1) header("location:$config[baseurl]/my_audio.php");
        }
}}

STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('head_bottom',"musiclinks.tpl");
STemplate::assign('days',days($_POST[day]));
STemplate::assign('months',months($_POST[month]));
STemplate::assign('years',years($_POST[year]));
STemplate::assign('country',country_box($_POST[country]));
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('upload_success_music.tpl');
STemplate::display('footer.tpl');
?>
