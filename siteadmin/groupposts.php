<?php
        include("../include/config.php");
        include("../include/function.php");
        
        $sql = "select gname from group_own where GID=$_GET[gid]";
        $rs = $conn->execute($sql);
        STemplate::assign('gname', $rs->fields['gname']);
        
        if($_POST['update'])
        {
                if($title == "")
                        $err = "Enter details for this topics";
                else
                {
                        $sql = "update group_tps set title='$title', approved='$approved' where TID=$TID";
                        $conn->execute($sql);
                        header("Location: groupposts.php?gid={$gid}&TID={$TID}");
                }
        }
        if($_POST['pupdate'])
        {
                if($post == "")
                        $err = "Enter details for this comments";
                else
                {
                        $sql = "update group_tps_post set post='$post' where PID=$PID";
                        $conn->execute($sql);
                        header("Location: groupposts.php?gid={$gid}&TID={$TID}");
                }
        }
        if($_GET['action'] == "pdel" and $_GET['PID']!="")
        {
                $sql = "delete from group_tps_post where PID=$PID";
                $conn->execute($sql);
                header("Location: groupposts.php?gid={$gid}&TID={$TID}");
        }

$sql = "select * from group_tps where TID=$TID";
$rs = $conn->execute($sql);
$topic = $rs->getrows();
STemplate::assign('topic', $topic[0]);

$sql = "select * from group_tps_post where  TID='$TID' order by PID asc";
$rs1 = $conn->execute($sql);
$post = $rs1->getrows();
STemplate::assign('post', $post);
STemplate::assign('total_post', count($post));



        Stemplate::assign('err',$err);
        Stemplate::assign('msg',$msg);
        STemplate::display("siteadmin/groupposts.tpl");
?>
