<?php
        include("../include/config.php");
        include("../include/function.php");

        if($_REQUEST['update'])
        {
                $file_path = $config['BASE_DIR']."/templates/".$_REQUEST['page'];
                if(file_exists($file_path))
                {
                        $handle = fopen($config['BASE_DIR']."/templates/".$_REQUEST['page'], "w");
                        fwrite($handle,stripslashes($_POST['body']));
                        fclose($handle);
                        $msg = "Page updated successfully";
                }
                else
                        $err = "Page does not exist";
        }

        STemplate::assign('msg',$msg);
        STemplate::assign('err',$err);
        STemplate::display("siteadmin/spages.tpl");
?>
