<?php

session_start();
include("include/config.php");
include("include/function.php");
chk_member_login();

        if($_GET['s']=="0")
        {
                $conn->execute("update pm set
                                        seen = 1
                                where pm_id = $_GET[id]
                                ");
        }
        
        $sql = "select * from pm where pm_id=$_GET[id]";
        $rs = $conn->execute($sql);
		 		
        STemplate::assign('subject',fx_replace('$sender_name',$rs->fields['subject'],$rs->fields['sender']));
        STemplate::assign('body', $rs->fields['body']);
        STemplate::assign('sender', $rs->fields['sender']);
        STemplate::assign('date', $rs->fields['date']);
        

        /* fetch user information */
                $sql = "select UID from signup where username='".$rs->fields['sender']."'";
                $rs_u = $conn->execute($sql);

        STemplate::assign('userid', $rs_u->fields['UID']);
        STemplate::assign('err',$err);
        STemplate::assign('head_bottom',"msglinks.tpl");
        STemplate::display('head1.tpl');
        STemplate::display('msg.tpl');
        STemplate::display('footer.tpl');
?>
