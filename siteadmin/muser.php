<?php
        include("../include/config.php");
        include("../include/function.php");
        include_once ('editor_files/editor_functions.php');
        include_once ('editor_files/config.php');
        include_once ('editor_files/editor_class.php');

        $editor = new wysiwygPro();

//FORM SUBMITTED
if($_REQUEST['submit']!="")
{
        if($_REQUEST['a']=="user")
        {
                if($_REQUEST['UID']=="0" or $_REQUEST['UID']=="")
                        $err = "Please select a user";
                elseif($_REQUEST['subj']=="")
                        $err = "Please enter subject of your mail";
                elseif($_REQUEST['htmlCode']=="")
                        $err = "Please write your email details";
                else
                {
                        if($_REQUEST['UID']=='All')
                        {
                                $sql = "select email from signup where account_status='Active'";
                                $rs = $conn->execute($sql);
                                while(!$rs->EOF)
                                {
                                        @mailing($rs->fields['email'], $config['site_name'], $config['admin_email'], $_REQUEST['subj'], $_REQUEST['htmlCode']);
                                        $rs->movenext();
                                }
                                $msg = "Email is successfully sent to all user";
                                header("Location: muser.php?a=user&msg=$msg");
                        }
                        else
                        {
                                $sql = "select username, email from signup where UID='$_REQUEST[UID]'";
                                $rs = $conn->execute($sql);
                                @mailing($rs->fields['email'], $config['site_name'], $config['admin_email'], $_REQUEST['subj'], $_REQUEST['htmlCode']);
                                $msg = "Email is successfully sent to <b>".$rs->fields['username']."</b>";
                                header("Location: muser.php?a=user&msg=$msg");
                        }
                }
        }
        elseif($_REQUEST['a']=="group")
        {
                if($_REQUEST['GID']=="0" or $_REQUEST['GID']=="")
                        $err = "Please select a group";
                elseif($_REQUEST['subj']=="")
                        $err = "Please enter subject of your mail";
                elseif($_REQUEST['htmlCode']=="")
                        $err = "Please write your email details";
                else
                {
                        $sql = "select gname from group_own where GID='$_REQUEST[GID]'";
                        $rs = $conn->execute($sql);
                        $gname = $rs->fields['gname'];
                        
                        $sql = "select MID from group_mem where GID='$_REQUEST[GID]'";
                        $rs = $conn->execute($sql);
                                
                        while(!$rs->EOF)
                        {
                                $MID[] = $rs->fields['MID'];
                                $rs->movenext();
                        }
                        $sql = "select email from signup where UID in (".implode(', ', $MID).")";
                        $rs = $conn->execute($sql);
                        while(!$rs->EOF)
                        {
                                @mailing($rs->fields['email'], $config['site_name'], $config['admin_email'], $_REQUEST['subj'], $_REQUEST['htmlCode']);
                                $rs->movenext();
                        }
                        $msg = "Email is successfully sent to all user of the group <b>$gname</b>";
                        header("Location: muser.php?a=group&msg=$msg");

                }
        }
        else
        {
                if($_REQUEST[email]=="")
                        $err = "Please provide reciever email address";
                elseif(!check_email($_REQUEST[email]))
                        $err = "Email address is not valid";
                elseif($_REQUEST['subj']=="")
                        $err = "Please enter subject of your mail";
                elseif($_REQUEST['htmlCode']=="")
                        $err = "Please write your email details";

                if($err=="")
                {
                        mailing($_REQUEST[email], $config['site_name'], $config['admin_email'], $_REQUEST[subj], $_REQUEST['htmlCode']);
                        $msg = "Mail is send to $uname successfully";
                        header("Location: muser.php?email=$email&uname=$uname&msg=$msg");
                }
        }
}

if($_REQUEST['a']=='user')
{
        $sql = "select UID, username from signup where account_status='Active' order by username";
        $rs = $conn->execute($sql);
        
        $user_ops = "<option value='0'>-- Select a user --</option>";
        while(!$rs->EOF)
        {
                if($_REQUEST['UID']==$rs->fields['UID'])
                        $sel = "selected";
                else
                        $sel = "";
                $user_ops .= "<option value='".$rs->fields[UID]."' $sel>".$rs->fields['username']."</option>";
                $rs->movenext();
        }
        $user_ops .= "<option value='All'>(Send to All)</option>";
        
        STemplate::assign('user_ops', $user_ops);
}
elseif($_REQUEST['a']=='group')
{
        $sql = "select GID, gname from group_own order by gname";
        $rs = $conn->execute($sql);

        $group_ops = "<option value='0'>-- Select a group --</option>";
        while(!$rs->EOF)
        {
                if($_REQUEST['GID']==$rs->fields['GID'])
                        $sel = "selected";
                else
                        $sel = "";
                $group_ops .= "<option value='".$rs->fields[GID]."' $sel>".$rs->fields['gname']."</option>";
                $rs->movenext();
        }
        STemplate::assign('group_ops', $group_ops);
}

        $editor->set_code($_REQUEST['htmlCode']);
        $txt=$editor->return_editor('100%', 350);
        STemplate::assign('txt',$txt);
        
        if($_REQUEST[msg]!="") $msg=$_REQUEST[msg];
        STemplate::assign('msg',$msg);
        STemplate::assign('err',$err);
        STemplate::display("siteadmin/muser.tpl");
?>
