<?php
        include("../include/config.php");

        if($_SESSION['AUID'])
        {
                $_SESSION['AUID'] = "";
                $_SESSION['APASSWORD'] = "";

                session_unregister("AUID");
                session_unregister("APASSWORD");
                session_destroy();

                header("location: ../index.php");
        }
?>
