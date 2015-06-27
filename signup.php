<?php
	session_start();
	include("include/config.php");
	include("include/function.php");
	$_REQUEST['add']="";
    
	while(list($k,$v)=each($_GET))
	{
		if($k!="next")
			$_REQUEST['add'].="&$k=$v";
	};

    if($_REQUEST[action_signup]!="")
    {
		
        if($_REQUEST[email]=="")
		{
			$err="Signup: Email should not be null.";
		}
        elseif(!check_email($_REQUEST[email]))
		{
			$err="Signup: Invalid Email format!";
		}
        elseif(check_field_exists($_REQUEST[email],"email","signup")==1)
		{
			$err="Signup: This email already exist!";
		}
        elseif($_REQUEST[username]=="")
		{
			$err="Signup: Username should not be null.";
		}
        elseif(check_field_exists($_REQUEST[username],"username","signup")==1)
		{
			$err="Signup: This Username already exist!";
		}
        elseif($_REQUEST[password1]=="")
		{
			$err="Signup: Password should not be null.";
		}
        elseif($_REQUEST[password1]!=$_REQUEST[password1])
		{
			$err="Signup: Retype does not match.";
		}
        elseif($config['enable_package']=="yes" and $_REQUEST[pack_id] == "")
		{ 
			$err="Signup: Please select a package";
		}
		
        if($err=="")
        {
				
				
				$sql="insert into signup set
						email='$_REQUEST[email]',
						username='$_REQUEST[username]',
						pwd='$_REQUEST[password1]',
						addtime='".time()."',
						logintime='".time()."'";
				$conn->execute($sql);	


				$userid=mysql_insert_id();
				
				$sql="insert into verify set
						UID='$userid'";
				$conn->execute($sql);
				
				$sql="insert subscriber set
						UID='$userid'";
				$conn->execute($sql);

					####################### Email				
							$ran=time().rand(1,99999999);
							$sql="update verify as v, signup as s set
											v.vcode='$ran',
											s.emailverified='no' WHERE v.UID=s.UID and v.UID='$userid'";
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
							$msg = "A verification email is sent to your address. Please check your email.";
					##################### end Email SECTION 

				
			if($config['enable_package']=="yes")
			{
					$sql = "select * from package where pack_id=$_REQUEST[pack_id]";
					$rs = $conn->execute($sql);
					if($rs->fields['is_trial']=="yes")
					{
							$expired_time = date("Y-m-d H:i:s", strtotime("+".$rs->fields['trial_period']." day"));
					
							$sql = "update subscriber set
									pack_id=$_REQUEST[pack_id],
									subscribe_time='".date("Y-m-d H:i:s")."',
									expired_time='$expired_time'
									where UID = $userid";
							$conn->execute($sql);
							
							SESSION_REGISTER("UID");			$_SESSION[UID]=$userid;
							SESSION_REGISTER("EMAIL");			$_SESSION[EMAIL]="$_REQUEST[email]";
							SESSION_REGISTER("USERNAME");		$_SESSION[USERNAME]="$_REQUEST[username]";
							SESSION_REGISTER("EMAILVERIFIED");	$_SESSION[EMAILVERIFIED]="no";

							if($_REQUEST['next']!="")$page=$_REQUEST['next'].".php";else $page="invite_signup.php";
							if($_REQUEST['add']!="")$add=base64_decode($add);
									header("Location:$config[baseurl]/$page?$add");exit;
					}
					else
					{
							$sql = "update signup set acount_status='Inactive' where UID=$userid";
							$conn->execute($sql);

							header("Location: pack_ops.php?pack=$_REQUEST[pack_id]&uid=".base64_encode($userid));
					}
			}
			else
			{
					SESSION_REGISTER("UID");$_SESSION[UID]=$userid;
					SESSION_REGISTER("EMAIL");$_SESSION[EMAIL]="$_REQUEST[email]";
					SESSION_REGISTER("USERNAME");$_SESSION[USERNAME]="$_REQUEST[username]";
					SESSION_REGISTER("EMAILVERIFIED");$_SESSION[EMAILVERIFIED]="no";

					if($_REQUEST['next']!="")$page=$_REQUEST['next'].".php";else $page="invite_signup.php";

					if($_REQUEST['add']!="")$_REQUEST['add']=base64_decode($_REQUEST['add']);
							header("Location:$config[baseurl]/$page?$add");exit;
			}
		}
}

if($config['enable_package']=="yes")
{
        $sql = "select * from package where status = 'Active' order by price desc";
        $rs = $conn->execute($sql);
        STemplate::assign('package', $rs->getrows());
}

STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('head_bottom',"homelinks.tpl");
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('signup.tpl');
STemplate::display('footer.tpl');
?>
