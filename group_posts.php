<?php
session_start();
include("include/config.php");
include("include/function.php");


if($_POST['add_topic'])
{
        if($_POST['topic_title'] != "")
        {
                $sql = "insert group_tps_post set
                        TID=$_GET[tid],
                        UID=$_SESSION[UID],
                        date='".date("Y-m-d H:i:s")."',
                        post='$_POST[topic_title]',
                        VID='$_POST[topic_video]'
                        ";
                $conn->execute($sql);
                header("Location: group_posts.php?urlkey=$_GET[urlkey]&gid=$_GET[gid]&tid=$_GET[tid]");
        }
}


$sql = "select * from group_own where GID=$_GET[gid]";
$rs = $conn->execute($sql);
STemplate::assign('gname', $rs->fields['gname']);
$gupload = $rs->fields['gupload'];
STemplate::assign("gupload", $gupload);

$sql = "select * from group_tps where TID=$_GET[tid]";
$rs = $conn->execute($sql);
$topic = $rs->getrows();
STemplate::assign('topic', $topic[0]);

$sql = "select * from group_tps_post where  TID='$_GET[tid]' order by PID asc";
$rs1 = $conn->execute($sql);
$post = $rs1->getrows();
STemplate::assign('post', $post);
STemplate::assign('total_post', count($post));


/* Fetch login user video for combobox */
if($_SESSION['UID']!="")
{
        $sql = "select VID, title from video where UID='$_SESSION[UID]' order by VID desc";
        $rs = $conn->execute($sql);

        $video_ops = "<OPTION value='' selected>- Your Videos -</OPTION>";
        while(!$rs->EOF)
        {
                $video_ops .= "<option value=".$rs->fields['VID'].">".$rs->fields['title']."</option>";
                $rs->movenext();
        }
        $video_ops .="<OPTION value=''>- Your Favorite Videos -</OPTION>";

        $sql = "select VID from favourite where UID='$_SESSION[UID]'";
        $rs = $conn->execute($sql);
        while(!$rs->EOF)
        {
                $fav[] = $rs->fields['VID'];
                $rs->movenext();
        }
        if($fav[0]!="")
        {
                $fav_video = implode(",", $fav);
                $sql = "select VID, title from video where VID in ($fav_video) order by VID desc";
                $rs = $conn->execute($sql);
                while(!$rs->EOF)
                {
                        $video_ops .= "<option value=".$rs->fields['VID'].">".$rs->fields['title']."</option>";
                        $rs->movenext();
                }
        }
        STemplate::assign('video_ops', $video_ops);
}


$add = base64_encode("&urlkey=$_GET[urlkey]&gid=$_GET[gid]&tid=$_GET[tid]");
STemplate::assign('add',$add);

STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('head_bottom',"grouplinks.tpl");
if($_SESSION['UID']!="")STemplate::assign('head_bottom_add',"crglinks.tpl");
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('group_posts.tpl');
STemplate::display('footer.tpl');
?>
