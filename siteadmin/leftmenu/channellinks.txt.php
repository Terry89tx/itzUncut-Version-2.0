<?php
$MainLinksArray = array (
        array("Channel Management","#",1) ,
        array("Options","#",1)
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
    array("View Channels","channels.php",0),
    array("Add Channels","channeledit.php?action=add",0),
    array("Search","channels.php?a=Search",1)
  );
?>
