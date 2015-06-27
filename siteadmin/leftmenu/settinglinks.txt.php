<?php
$MainLinksArray = array (
        array("Site Configuration","#",1),
        array("Email Settings","#",1),
        array("Package Settings","#",1),
        array("Advertise Settings","#",1),
	    array("Bandwidth","#",1),
		array("Poll setting","#",1)


  );

  /********************************************************************
    This is the child links array.

    Paramters to be passed

    0 ==> Title of the link
    1 ==> The url to be passed
          Note:
          In this parameter if u want to include a subtree of links
          then put a # in this location
    2 ==> The Main Link ID

  ********************************************************************/

  $ChildLinksArray = array(
    array("System Settings","settings.php",0),
    array("Static Pages","spages.php?action=view&page=about.tpl",0),
	 array("Miscellaneous","miscellaneous.php",0),
    array("View Email Template(s)","emailsettings.php",1),
    array("Add Email Template","emailedit.php?action=add",1),
    array("Available Packages","packages.php",2),
    array("Add New Package","packedit.php?action=add",2),
    array("View Advertisement","adv.php",3),
    array("Reset Bandwidth","bandwidth.php",4),
	array("View Polls","viewpolllist.php",5),
	array("Add New Poll","poll.php",5)
	 	
  );
?>
