<?php
session_start();
include("include/config.php");
include("include/function.php");
chk_member_login();
if($_REQUEST[invite_signup]!="")
{


        for($i=0;$i<count($_REQUEST[friends_email]);$i++)
        {	
				
                if($_REQUEST[friends_email][$i]!="")
                {
					$tag='yes';
					$emails[]=$_REQUEST[friends_email][$i];
					if($_REQUEST[friends_fname][$i]==""){$err="Please provide the firstname of your email.";break;}
					$fnames[]=$_REQUEST[friends_fname][$i];
					$rtype[]=$type[$i];
				
					}
        }

        if($tag!="yes")$err="Please provide at least an e-mail";
		

        if($err=="")
        {
					
        $to=$_SESSION[EMAIL];
        $name=$_SESSION[USERNAME];
        $from=$config[admin_email];
        $subj="Invitation";
		

		STemplate::assign('sender_name',$name);
        STemplate::assign('message',$_REQUEST[message]);
        STemplate::assign('freqkey',base64_encode($_SESSION[UID]));

        for($i=0;$i<count($emails);$i++)
        {


				$sql = "insert into friends set UID=$_SESSION[UID], friends_name='".$emails[$i]."', friends_type='All|".$rtype[$i]."', invite_date='".date("Y-m-d")."'";
				$conn->execute($sql);
				if(mysql_affected_rows()==1)$id=mysql_insert_id();
				else
				{
					$sql="select id from friends WHERE UID=$_SESSION[UID] and friends_name='".$emails[$i]."'";
					$rs=$conn->execute($sql);$id=$rs->fields['id'];}
					STemplate::assign('id',base64_encode($id));
					STemplate::assign('receiver_name',$fnames[$i]);
					$mailbody=STemplate::fetch('emails/invite_email.tpl');
					$mailbody=nl2br($mailbody);
					mailing($emails[$i],$name,$from,$subj,$mailbody);

		        }
		}

		$msg="Invitation sent successfully";
}

$sql = "select fname from signup where UID='$_SESSION[UID]'";
$rs = $conn->execute($sql);
$first_name = $rs->fields['fname'];
STemplate::assign('first_name', $first_name);

STemplate::assign(err,$err);
STemplate::assign('msg',$msg);
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('invite_signup.tpl');
STemplate::display('footer.tpl');
?>
