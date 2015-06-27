<?php
$MainLinksArray = array (
        array("Audio Management","#",1) ,
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
    array("All","audios.php",0),
    array("Public","audios.php?a=public",0),
    array("Private","audios.php?a=private",0),
    array("Search","audios.php?a=Search",1)
  );
?>
