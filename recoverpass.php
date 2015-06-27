<?php
session_start();
include("include/config.php");
include("include/function.php");


if($_REQUEST['recover'])
{
        if($_REQUEST['email']==""){
                $err = "Enter your email address";
		}
        else
        {		$email=$_REQUEST['email'];
                $sql = "select UID, username, pwd, fname, lname from signup where email='$email'";
                $rs = $conn->execute($sql);
			
				
                if($rs->fields['UID']=="")
                        $err = "Sorry, we have no record for this email address.";
                else
                {
                        STemplate::assign('receiver_name', $rs->fields['username']);
                        STemplate::assign('receiver_fname', $rs->fields['fname']);
                        STemplate::assign('receiver_lname', $rs->fields['lname']);
						 STemplate::assign('password', $rs->fields['pwd']);

                        $rs = $conn->execute("select * from emailinfo where email_id='recover_password'");
                        $subj = $rs->fields['email_subject'];
                        $email_path = $rs->fields['email_path'];
						$body = STemplate::fetch($email_path);
                        @mailing($_REQUEST['email'], $config['site_name'], $config['admin_email'], $subj, $body);

                        $msg = "An email is sent to your email address. Plese check it now.";

                        header("Location: recoverpass.php?msg=$msg");
                }
        }
}

if($_REQUEST[msg]!="")
$msg = $_REQUEST[msg];
STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('head_bottom',"homelinks.tpl");
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('recoverpass.tpl');
STemplate::display('footer.tpl');
?>
