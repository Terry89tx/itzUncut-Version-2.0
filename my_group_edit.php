<?php
session_start();
include("include/config.php");
include("include/function.php");
chk_member_login();


if($_POST['edit_group'])
{
        if($_POST['group_name']=="")
                $err = "Please enter a group name";
        elseif($_POST['description']=="")
                $err = "Please enter a description of your group";
        elseif($_POST['short_name']=="")
                $err = "Please enter a group url";
        else
        {
                $sql = "update group_own set
                        gname = '$_POST[group_name]',
                        keyword = '$_POST[tags]',
                        gdescn = '$_POST[description]',
                        gurl = '$_POST[short_name]',
                        type = '$_POST[group_type]',
                        gupload = '$_POST[video_upload_type]',
                        gposting = '$_POST[forum_upload_type]',
                        gimage = '$_POST[group_icon]'
                where OID='$_SESSION[UID]' and gurl='$_REQUEST[urlkey]'";
                $conn->execute($sql);
        }
        
        if(count($_POST['channel'])<1 or count($_POST['channel'])>3)
                $err = "Upload: Please check (1 to 3) channel/s.";
        else
        {
                $sql = "update group_own set
                        channel = '0|".implode("|",$_POST['channel'])."|0'
                        where OID='$_SESSION[UID]' and gurl='$_REQUEST[urlkey]'";
                $conn->execute($sql);
        }
        
        if($err == "")
                header("Location: groups_home.php?urlkey=$_POST[short_name]&msg=Group+is+updated+successfully");
}

$sql="SELECT * from group_own WHERE gurl='$_REQUEST[urlkey]'";
$rs = $conn->Execute($sql);
if($rs->recordcount()>0)
{
        $ownid=insert_check_group_own($rs->fields[GID]);
        if($ownid!=$_SESSION[UID])header("location:$config[baseurl]/groups_home.php?urlkey=$_REQUEST[urlkey]");
        $group = $rs->getrows();
}

$mych = explode("|",$group[0]['channel']);
$ch = insert_list_channel();
for($i=0; $ch[$i]['ch']!=""; $i++)
{
        if(in_array($ch[$i]['id'], $mych))
                $checked = "checked";
        else
                $checked = "";
        $ch_checkbox .= "<input type=checkbox name=channel[] value=".$ch[$i]['id']." $checked>".$ch[$i]['ch']."</input><br>";
}

STemplate::assign('ch_checkbox',$ch_checkbox);

STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('group',$group[0]);
STemplate::assign('head_bottom',"grouplinks.tpl");
if($_SESSION['UID']!="")STemplate::assign('head_bottom_add',"crglinks.tpl");
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('my_group_edit.tpl');
STemplate::display('footer.tpl');
?>
