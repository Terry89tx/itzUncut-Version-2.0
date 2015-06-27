<?php
$MainLinksArray = array (
        array("User Management","#",1) ,
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
    array("All","users.php",0),
    array("Active","users.php?a=Active",0),
    array("Inactive","users.php?a=Inactive",0),
    array("Search","users.php?a=Search",1),
    array("Send Email", "muser.php?a=user", 1)
  );
?>
