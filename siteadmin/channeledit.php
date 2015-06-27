<?php
        include("../include/config.php");
        include("../include/function.php");
        
        if($_REQUEST['edit_channel'])
        {
                $sql = "update channel set
                                name = '$_REQUEST[name]',
                                descrip = '$_REQUEST[descrip]'
                        where CHID=$_REQUEST[chid]";
                $conn->execute($sql);
                
                if($_FILES[picture]!="")
                {
                        $err = upload_jpg($_FILES, 'picture', "$_REQUEST[chid].jpg", 120, $config['BASE_DIR'].'/chimg/');
                }
                if($err == "")
                        header("Location: channeledit.php?action=edit&chid=$_REQUEST[chid]&page=$_REQUEST[page]&msg=Channel+information+updated+successfully");
                                
        }
        
        if($_REQUEST['add_channel'])
        {
                if($_REQUEST[name]=="")
                        $err = "Enter channel name";
                elseif($_REQUEST[descrip]=="")
                        $err = "Provide channel description";
                elseif($_FILES['picture']['name']=="")
                        $err = "Provide a channel image";

                if($err=="")
                {
                        $sql = "insert channel set
                                name = '$_REQUEST[name]',
                                descrip = '$_REQUEST[descrip]'";
                        $conn->execute($sql);
                        $err = upload_jpg($_FILES, 'picture', $conn->Insert_ID().".jpg", 120, $config['BASE_DIR'].'/chimg/');
                }
                if($err == "")
                        header("Location: channeledit.php?action=add&msg=Channel+added+successfully");

        }

        if($_REQUEST['chid']!="")
        {
                $rs = $conn->execute("select * from channel where CHID=$_REQUEST[chid]");
                $channel = $rs->getrows();
                Stemplate::assign('channel', $channel[0]);
        }
        
        Stemplate::assign('err',$err);
        Stemplate::assign('msg',$msg);
        STemplate::display("siteadmin/channeledit.tpl");
?>
