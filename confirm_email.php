<?php
include("include/config.php");
session_start();
include("include/function.php");


if($_REQUEST[vcode]!="")
{
        $sql="select * from verify as v,signup as s WHERE v.vcode='$_REQUEST[vcode]' and v.UID=s.UID";
        $rs=$conn->execute($sql);

        if($rs->recordcount()==0){
			$err="Invalid Verification code!";
		}
        else
        {
			$sql="update signup set emailverified='yes' where UID=".$rs->fields[UID];
			$conn->execute($sql);

			SESSION_REGISTER("UID");$_SESSION[UID]=$rs->fields[UID];
			SESSION_REGISTER("EMAIL");$_SESSION[EMAIL]=$rs->fields[email];
			SESSION_REGISTER("USERNAME");$_SESSION[USERNAME]=$rs->fields[username];
			SESSION_REGISTER("EMAILVERIFIED");$_SESSION[EMAILVERIFIED]="yes";

			if(mysql_affected_rows()>=1){
				$msg="Your email has been successfully verified.";
			}
			else{
				$msg = "Your email is already verified";
			}
        }
}

if($_REQUEST[action_send]!="")
{
        $ran=time().rand(1,99999999);
        $sql="update verify as v, signup as s set
                        v.vcode='$ran',
                        s.emailverified='no' WHERE v.UID=s.UID and v.UID=$_SESSION[UID]";
        $conn->execute($sql);
        STemplate::assign('vcode',$ran);

        $to=$_SESSION[EMAIL];
        $name=$config['site_name'];
        $from=$config['admin_email'];

        $rs = $conn->execute("select * from emailinfo where email_id='verify_email'");
        $subj = $rs->fields['email_subject'];
        $email_path = $rs->fields['email_path'];
        $mailbody=STemplate::fetch($email_path);
		
        mailing($to,$name,$from,$subj,$mailbody);
        session_to_db();
        $msg = "A verification email is sent to your address. Please check your email.";
}



STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('confirm_email.tpl');
STemplate::display('footer.tpl');
?>
