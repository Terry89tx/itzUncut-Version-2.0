<?php
session_start();
include("include/config.php");
include("include/function.php");

if($_REQUEST[action_login]!="")
{
        if($_REQUEST[username]=="")$err="Login: Username should not be null.";
        elseif($_REQUEST[password]=="") $err="Login: Password should not be null.";
        if($err=="")
        {
        $sql="SELECT * from signup WHERE username='$_REQUEST[username]' and pwd='$_REQUEST[password]'";
        $rs=$conn->execute($sql);
        if($rs->recordcount()<1) $err="Invalid Username/Password.";
        elseif($rs->fields['account_status']=="Inactive") $err = "Your account is currently inactive. You cannot login to the site.";

        if($err=="")
        {
                if($config['enable_package']=="yes")
                {
                        $sql = "select * from subscriber where UID=".$rs->fields['UID'];
                        $rs1 = $conn->execute($sql);
                        if(strtotime($rs1->fields['expired_time'])<strtotime(date("Y-m-d H:i:s")))
                        {
                                header("Location: renew_account.php?uid=".base64_encode($rs->fields['UID']));
                                die();
                        }
                }


                $sql="update signup set logintime='".time()."' WHERE username='$_REQUEST[username]'";
                $conn->execute($sql);
				$myUID=$UID;
				SESSION_REGISTER("myUID");$_SESSION[myUID]=$rs->fields['UID'];
	            SESSION_REGISTER("UID");$_SESSION[UID]=$rs->fields['UID'];
                SESSION_REGISTER("EMAIL");$_SESSION[EMAIL]=$rs->fields[email];
                SESSION_REGISTER("USERNAME");$_SESSION[USERNAME]=$rs->fields['username'];
                SESSION_REGISTER("EMAILVERIFIED");$_SESSION[EMAILVERIFIED]=$rs->fields[emailverified];
                login_data("last_5users");
                if($_REQUEST['next']!="")$page=$_REQUEST['next'].".php";else $page="index.php";
                if($_REQUEST['add']!="")$add=base64_decode($_REQUEST['add']);
                header("Location:$config[baseurl]/$page?$add");exit;

        }
        }
}


STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('head_bottom',"homelinks.tpl");
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('login.tpl');
STemplate::display('footer.tpl');
?>
