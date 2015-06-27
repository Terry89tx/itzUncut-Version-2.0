<?php
session_start();
include("include/config.php");
include("include/function.php");
chk_member_login();

$sql = "select * from group_own where gurl='$_REQUEST[urlkey]'";
$rs = $conn->execute($sql);
$gname = $rs->fields['gname'];
$gupload = $rs->fields['gupload'];
STemplate::assign("gupload", $gupload);
STemplate::assign('gname',$gname);
if($_REQUEST['send']!="")
{
				$sql = "select username, fname, lname from signup where UID='$_SESSION[UID]'";
				$rs = $conn->execute($sql);
				
				$sender_name=$rs->fields['username'];
				$sender_fname=$rs->fields['fname'];
				$sender_lname=$rs->fields['lname'];
				STemplate::assign('sender_name',$sender_name);
				STemplate::assign('sender_fname',$sender_fname);
				STemplate::assign('sender_lname',$sender_lname);

        if($_REQUEST['message']=="")
                $err = "Please enter your invitation message";
        elseif($flist[0]=="" and $_REQUEST['recipients']=="")
                $err = "Please select friends or enter a valid email address in the email to field";
        else
        {
               

                $rs = $conn->execute("select * from emailinfo where email_id='invite_group_email'");
                $subj = $rs->fields['email_subject'];
                $email_path = $rs->fields['email_path'];
                
				if(count($flist)>0)
                {

                   
                   for($i=0; $i<count($flist); $i++)
                   {

                        $rs_e = $conn->execute("select * from signup where username='".$flist[$i]."'");
                        $count = $rs_e->rowcount();
                        
                        STemplate::assign('receiver_name', $rs_e->fields['username']);
                        STemplate::assign('receiver_fname', $rs_e->fields['fname']);
                        STemplate::assign('receiver_lname', $rs_e->fields['lname']);
                        
                        $key = md5($rs_e->fields['UID'].$_REQUEST[urlkey]);
                        
                                if($count>0)
                                {
                                        $conn->execute("insert pm set
                                                subject='$subj',
                                                body='".$message."<br><br>Click here <A href=$config[baseurl]/groups_home.php?urlkey=$_REQUEST[urlkey]&key=$key>$config[baseurl]/groups_home.php?urlkey=$_REQUEST[urlkey]&key=$key</A> to visit the group.',
                                                sender='$_SESSION[USERNAME]',
                                                receiver='".$flist[$i]."',
                                                date='".date("Y-m-d H:i:s")."'
                                        ");

                                        $conn->execute("insert buddy_list set
                                                                username='$_SESSION[USERNAME]',
                                                                buddy_name='".$flist[$i]."'");
                                }
                   
                        $sql = "select email from signup where username='".$flist[$i]."'";
                        $rs = $conn->execute($sql);
                        $to=$rs->fields['email'];
                        $name=$_SESSION[USERNAME];
                        $from=$_SESSION[EMAIL];

                        STemplate::assign('message',$_REQUEST[message]);
                        STemplate::assign('key',$key);

                        STemplate::assign('firstname',$flist[$i]);
                        $mailbody=STemplate::fetch($email_path);
                        $mailbody=nl2br($mailbody);
                        @mailing($to,$name,$from,$subj,$mailbody);
                    }
                }
                


                if($_REQUEST['recipients'])
                {
                    $emails = explode(",",$_REQUEST['recipients']);
                    for($i=0; $i<count($emails); $i++)
                   {
                        $to=$emails[$i];
                        $name=$_SESSION[USERNAME];
                        $from=$_SESSION[EMAIL];
                        STemplate::assign('message',$_REQUEST[message]);
                        $mailbody=STemplate::fetch($email_path);
                        $mailbody=nl2br($mailbody);
						$subj=str_replace('$sender_name',$sender_name,$subj);
						$subj=str_replace('$gname',$gname,$subj);
                        @mailing($to,$name,$from,$subj,$mailbody);
                    }
                }
                header("Location: invite_members.php?urlkey=$_REQUEST[urlkey]&gid=$_REQUEST[gid]&msg=Your invite sent successfully");
        }
}

$sql = "select fname from signup where UID='$_SESSION[UID]'";
$rs = $conn->execute($sql);
$first_name = $rs->fields['fname'];
STemplate::assign('first_name', $first_name);

$sql = "select friends_name, FID from friends where UID=$_SESSION[UID] and friends_status='Confirmed'";
$rs = $conn->execute($sql);

while(!$rs->EOF)
{
        $my_friends[] = $rs->fields['friends_name'];
        $fname .= "<option value=".$rs->fields['friends_name'].">".$rs->fields['friends_name']."</option>\n";
        $rs->movenext();
}
STemplate::assign('fname',$fname);
STemplate::assign('myfriends',$my_friends);

STemplate::assign('err',$err);
STemplate::assign('msg',$_REQUEST[msg]);
STemplate::assign('head_bottom',"grouplinks.tpl");
if($_SESSION['UID']!="")STemplate::assign('head_bottom_add',"crglinks.tpl");
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('invite_members.tpl');
STemplate::display('footer.tpl');
?>
