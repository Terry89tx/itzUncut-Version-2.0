<?php
include("../include/config.php");
include("../include/function.php");
chk_admin_login();

if($_GET['active']=="Users")
{
        STemplate::assign('defaulthome','users.php');
}

if($_GET['active']=="Videos")
{
        STemplate::assign('defaulthome','videos.php');
}

if($_GET['active']=="Audio")
{
        STemplate::assign('defaulthome','audios.php');
}


if($_GET['active']=="Channels")
{
        STemplate::assign('defaulthome','channels.php');
}

if($_GET['active']=="Groups")
{
        STemplate::assign('defaulthome','groups.php');
}

if($_GET['active']=="Settings")
{
        STemplate::assign('defaulthome','settings.php');
}


STemplate::assign('active',$_GET['active']);
STemplate::display('siteadmin/main.tpl');
?>
