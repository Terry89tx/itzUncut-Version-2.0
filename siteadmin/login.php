<?php
include("../include/config.php");

STemplate::assign('url',$config['baseurl']);

//PROCESS LOGIN
if(isset($_POST['login']))
{
        if($_POST['uname']=="" or $_POST['pass']=="")
                $err = "Please Provide Username and Password.";
        elseif($_POST['uname']!=$config['admin_name'] and $_POST['pass']!=$config['admin_pass'])
                $err = "Invalid Username and/or Password Provided";
        elseif($_POST['uname']==$config['admin_name'] and $_POST['pass']==$config['admin_pass'])
        {
                //REGISTER SESSION
                session_register("AUID");
                session_register("APASSWORD");
                $_SESSION['AUID'] = $config['admin_name'];
                $_SESSION['APASSWORD'] = $config['admin_pass'];

                $link = "main.php?active=Users";
                header("Location: $link");
        }
        else
                $err = "Invalid Username/Password. Login failed.";
}
STemplate::assign('msg',$msg);
STemplate::assign('err',$err);
STemplate::display('siteadmin/login.tpl');
?>
