<?php
session_start();
include("include/config.php");
include("include/function.php");
chk_member_login();

if($_REQUEST['create_group']!="")
{
        if($_REQUEST[group_name]=="") $err="Please Provide a group name.";
        elseif($_REQUEST[tags]=="") $err="Please Provide tag/s.";
        elseif($_REQUEST[description]=="") $err="Please provide description.";
        elseif($_REQUEST[short_name]=="" || check_field_exists($_REQUEST[short_name],"gurl","group_own")==1) $err="Please provide unique part of url.";
        elseif(count($_REQUEST[chlist])<1 || count($_REQUEST[chlist])>3) $err="Upload: Please check (1 to 3) channel/s.";

        if($err=="")
        {
        $listch=implode("|",$_REQUEST[chlist]);
        $sql="insert into group_own set
                OID=$_SESSION[UID],
                gname='$_REQUEST[group_name]',
                keyword='$_REQUEST[tags]',
                gdescn='$_REQUEST[description]',
                gurl='$_REQUEST[short_name]',
                channel='0|$listch|0',
                type='$_REQUEST[group_type]',
                gupload='$_REQUEST[video_upload_type]',
                gposting='$_REQUEST[forum_upload_type]',
                gimage='$_REQUEST[group_icon]',
                gcrtime='".time()."'";
        $conn->execute($sql);
        $id=mysql_insert_id();
        $sql="insert into group_mem set
                GID=$id,
                MID=$_SESSION[UID],
                member_since = '".date("Y-m-d")."'
                ";
        $conn->execute($sql);
        if(mysql_affected_rows()>=1) header("Location:$config[baseurl]/groups_home.php?urlkey=$_REQUEST[short_name]");exit;
        }
}

STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('answers',$users);
STemplate::assign('head_bottom',"grouplinks.tpl");
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('create_group.tpl');
STemplate::display('footer.tpl');
?>
