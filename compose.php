<?php
        include("include/config.php");
        include("include/function.php");
		chk_member_login();
        if($_REQUEST['receiver']==$_SESSION['USERNAME'])
                $err = "You cannot send message to yourself";
        elseif($_REQUEST['send'])
        {
                        if($_REQUEST['buddy_name'] != "Select Buddy")
                                $receiver_name = $_REQUEST['buddy_name'];
                        else
                                $receiver_name = $_REQUEST['receiver'];
                        STemplate::assign("receiver_name", $receiver_name);

                if($_REQUEST['receiver']=="" and $_REQUEST['buddy_name']=="Select Buddy")
                        $err = "Enter receiver name";
                elseif($_REQUEST['subject']=="")
                        $err = "Enter the subject of your message";
                elseif($_REQUEST['details']=="")
                        $err = "Enter details about your message";
                else{
                                $rs_e = $conn->execute("select * from signup where username='$receiver_name'");
                                $count = $rs_e->rowcount();
                                if($count>0)
                                {
                                        $conn->execute("insert pm set
                                                subject='$_REQUEST[subject]',
                                                body='$_REQUEST[details]',
                                                sender='$_SESSION[USERNAME]',
                                                receiver='$receiver_name',
                                                date='".date("Y-m-d H:i:s")."'
                                        ");
                                        
                                        $conn->execute("insert buddy_list set
                                                                username='$_SESSION[USERNAME]',
                                                                buddy_name='$receiver_name'");

/*
                                          $rs_u = $conn->execute("select * from signup where username='$receiver_name'");

										  $rs_sett = $conn->execute("select pm_notify from expert_setting where userid=".$rs_u->fields['userid']);

                                        if($rs_sett->fields['pm_notify']=='on')
                                        {

                                                STemplate::assign("user_id", $_SESSION['id']);
                                                STemplate::assign("user_name", $_SESSION['username']);
                                                STemplate::assign("user_type", $_SESSION['type']);
                                                STemplate::assign('sitename',$config['BASE_URL']);

                                                $to = $rs_u->fields['email'];
                                                $name = $config['admin_name'];
                                                $from = $config['admin_email'];
                                                $subj = $config['site_name']." - New Private Message";
                                                $body = STemplate::fetch("mail/new_pm_notify.tpl");

                                                mailing($to,$name,$from,$subj,$body);
                                        }
*/
                                        header("Location: inbox.php");
                                }
                                else
                                        $err = "There is no member of username '$receiver_name'";
                }
        }
        
        $sql = "select * from buddy_list where username='$_SESSION[USERNAME]'";
        $rs = $conn->execute($sql);

        $buddy_name = array();
        $buddy_name[] = "Select Buddy";

        while(!$rs->EOF)
        {
                $buddy_name[] = $rs->fields['buddy_name'];
                $rs->movenext();
        }

        STemplate::assign('buddy_name', $buddy_name);

        STemplate::assign('err',$err);
        STemplate::assign('head_bottom',"msglinks.tpl");
        STemplate::display('head1.tpl');
        STemplate::display('compose.tpl');
        STemplate::display('footer.tpl');
?>
