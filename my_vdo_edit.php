<?php
session_start();
include("include/config.php");
include("include/function.php");
chk_member_login();

if($_REQUEST[update_video]!="")
{
        $recorddate=$_REQUEST[year]."-".$_REQUEST[month]."-".$_REQUEST[day];
        if($_REQUEST[vtitle]=="") $err="Upload: Please Provide a video title.";
        elseif($_REQUEST[vdescription]=="") $err="Upload: Please Provide a video description.";
        elseif($_REQUEST[vkeyword]=="") $err="Upload: Please provide tag/s.";
        elseif(count($_REQUEST[chlist])<1 || count($_REQUEST[chlist])>3) $err="Upload: Please check (1 to 3) channel/s.";
        elseif($recorddate!="yyyy-mm-dd"){if(!checkdate($_REQUEST[month],$_REQUEST[day],$_REQUEST[year])) $err="Invalid date format";}
        $listch=implode("|",$_REQUEST[chlist]);
        if($err=="")
        {
			if($recorddate!="yyyy-mm-dd")$add.="record_date='$recorddate', ";
			if($_REQUEST[country]!="Select Country")$add.="country='$_REQUEST[country]', ";
			$sql="update video set
					title='$_REQUEST[vtitle]',
					description='$_REQUEST[vdescription]',
					featuredesc='$_REQUEST[featuredesc]',
					keyword='$_REQUEST[vkeyword]',
					channel='0|$listch|0',
					type='$_REQUEST[video_privacy]',
					location='$_REQUEST[field_address]',
					$add
					be_comment='$_REQUEST[allow_comments]',
					be_rated='$_REQUEST[allow_ratings]',
					embed='$_REQUEST[allow_embed]'
					WHERE VID=$_REQUEST[VID]";
			$conn->execute($sql);
			$vid=mysql_insert_id();
			$vdoname=$vid.".".$ph;
        if(mysql_affected_rows()>=1)$msg="Video info updated successfully!";
        }
}


$sql="select * from video WHERE VID=$_REQUEST[VID]";
$rs=$conn->execute($sql);
$date=explode("-",$rs->fields[record_date]);
$chid=explode("|",$rs->fields[channel]);
STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('chid',$chid);
STemplate::assign('days',days($date[2]));
STemplate::assign('months',months($date[1]));
STemplate::assign('years',years($date[0]));
STemplate::assign('country',country_box($rs->fields[country]));
STemplate::assign('answers',$rs->getarray());
STemplate::assign('head_bottom',"homelinks.tpl");
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('my_vdo_edit.tpl');
STemplate::display('footer.tpl');
?>
