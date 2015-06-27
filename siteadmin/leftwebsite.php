<?php
include("../include/config.php");

$active = $_GET[active];
if($active=="Users")
        include("leftmenu/userlinks.txt.php");
if($active=="Videos")
        include("leftmenu/videolinks.txt.php");
if($active=="Audio")
        include("leftmenu/audiolinks.txt.php");
if($active=="Channels")
        include("leftmenu/channellinks.txt.php");
if($active=="Groups")
        include("leftmenu/grouplinks.txt.php");
if($active=="Settings")
        include("leftmenu/settinglinks.txt.php");

STemplate::assign('MainLinks',$MainLinksArray);
STemplate::assign('ChildLinks',$ChildLinksArray);

STemplate::display('siteadmin/leftwebsite.tpl');
?>
