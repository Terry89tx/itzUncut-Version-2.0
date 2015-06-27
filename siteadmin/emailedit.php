<?php
        include("../include/config.php");
        include("../include/function.php");

        if($_REQUEST['action']=='add')
        {
                if($_REQUEST['update'])
                {
                        $file_path = $config['BASE_DIR']."/templates/emails/".$_REQUEST['email_path'];
                        $sql = "insert emailinfo set email_id='$_REQUEST[email_id]', email_subject='$_REQUEST[email_subject]', email_path='emails/$_REQUEST[email_path]', comment='$_REQUEST[comment]'";
                        $conn->execute($sql);
                        
                        if(!file_exists($file_path))
                        {
                                $handle = fopen($file_path, "w");
                                fwrite($handle,stripslashes($_REQUEST['email_details']));
                                fclose($handle);
                        }

                        //file_put_contents($file_path, stripslashes($email_details));
                        header("Location: emailedit.php?action=add&msg=Email is created successfully");
                }
        }
        else
        {
                $sql = "select * from emailinfo where email_id='$_REQUEST[email_id]'";
                $rs = $conn->execute($sql);
                $email = $rs->getrows();
                STemplate::assign('email', $email[0]);
        
                if($_REQUEST['update'])
                {
                        $sql = "update emailinfo set email_subject='$_REQUEST[email_subject]', comment='$_REQUEST[comment]' where email_id='$_REQUEST[email_id]'";
                        $conn->execute($sql);

                        $handle = fopen($config['BASE_DIR']."/templates/".$email[0]['email_path'], "w");
                        fwrite($handle,stripslashes($_REQUEST['email_details']));
                        fclose($handle);
                        
                        //file_put_contents($config['BASE_DIR']."/templates/".$email[0]['email_path'], stripslashes($email_details));
                        header("Location: emailedit.php?email_id=$_REQUEST[email_id]&msg=Email is updated successfully");
                }
        
        
                STemplate::assign('email_details', file_get_contents($config['BASE_DIR']."/templates/".$email[0]['email_path']));
        }

        if($_REQUEST[msg]!="") $msg=$_REQUEST[msg];
        Stemplate::assign('err',$err);
        Stemplate::assign('msg',$msg);
        STemplate::display("siteadmin/emailedit.tpl");
?>
