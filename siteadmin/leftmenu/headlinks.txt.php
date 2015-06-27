<?php
  /********************************************************************
    This is the main links array... u have to put the values in this
    array.

    0 ==> Title of the link
    1 ==> The url to be passed
          Note:
          In this parameter if u want to include a subtree of links
          then put a # in this location
    2 ==> Does this Link have sub tree of links
          0 = No sub links
          1 = Sub Links
  ********************************************************************/

  $HeadLinksArray = array (
        //it should be not more then 6 or less then 1
        //array("My Home","main.php",0,""),
        array("Users","main.php?active=Users",1,"userlinks.txt.php"),
        array("Videos","main.php?active=Videos",1,"userlinks.txt.php"),
  	    
        array("Channels","main.php?active=Channels",1,"channellinks.txt.php"),
        array("Groups","main.php?active=Groups",1,"grouplinks.txt.php"),
        array("Settings","main.php?active=Settings",1,"settinglinks.txt.php"),
  );
?>
