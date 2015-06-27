<?php
        ob_start();
        session_start();
//        include("../include/smarty.php");
        include("../include/config.php");
        include("../include/function.php");
        include_once ('editor_files/editor_functions.php');
        include_once ('editor_files/config.php');
        include_once ('editor_files/editor_class.php');

//        $smarty = new smarty_robel();
        $editor = new wysiwygPro();

        //SEND MESSAGE
        if($Send!="")
        {
                $err="";
                if($sendto=="")
                {
                        $err="No recepient provided. Please at least provide on receipient";                
                }
                elseif($msgcaption=="")
                {
                        $err="Please provide message Subject";
                }
                elseif($_POST['htmlCode']=="")
                {
                        $err="Please provide Message Body";
                }
                if($err!="")
                {
                        echo "<script language='Javascript'>
                        alert('$err');
                        </script>";
                }
                else{
                $code = stripslashes($_POST['htmlCode']);
                $code = longwordbreak ($code, 40, ' ');
                $code = remove_tags ($code, array(
                'object' => true,
                'embed' => true,
                'applet' => true,
                'script' => true
                ));
                $code = fixcharacters($code);
                $dt = Date("Y-m-d H:i:s");
                $send = explode("-",$sendto);
                while(list($k,$v)=each($send))
                {
                        $sql="Insert into msgboard(msgfrom,msgto,msgcaption,msgbody,msgdatetime,msgisread)
                                values($USERID,$v,'$msgcaption','$code','$dt','no')";
                        $conn->Execute($sql);
                }
                echo "<script language='JavaScript'>
                        parent.location.href='msgsuccess.php?sendto=$sendto';
                        </script>";
                exit;
                }
        }

        $editor->set_code($_POST['htmlCode']);
        $txt=$editor->return_editor('100%', 300);

        //DECLARE COMMON SMARTY VALUES
        STemplate::assign('url',$config[baseurl]);
        STemplate::assign('imgurl',$config[imgurl]);
        STemplate::assign('site',$config[site_title]);
        STemplate::assign('txt',$txt);
        STemplate::assign('sendto',$sendto);
        STemplate::assign('mtype',$mtype);

        STemplate::display('siteadmin/test.tpl');
        ob_end_flush()
?>
