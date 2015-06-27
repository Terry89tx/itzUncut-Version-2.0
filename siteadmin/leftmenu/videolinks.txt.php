<?php
$MainLinksArray = array (
        array("Video Management","#",1) ,
        array("Flag Request", "#", 1),
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
    array("All","videos.php",0),
    array("Public","videos.php?a=public",0),
    array("Private","videos.php?a=private",0),
    array("Feature","videos.php?a=feature",1),
    array("Inappropriate","videos.php?a=inappropriate",1),
    array("Search","videos.php?a=Search",2)
  );
?>
