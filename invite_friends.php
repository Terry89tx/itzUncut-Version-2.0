<?php
session_start();
include("include/config.php");
include("include/function.php");
chk_member_login();

if($_REQUEST[action_invite]!="")
{
        if($_REQUEST['first_name']!="")
        {
                $sql = "update signup set fname='$first_name' where UID='$_SESSION[UID]'";
                $conn->execute($sql);
        }

        if(isset($_REQUEST['first_name'])&&$_REQUEST['first_name']=="")
                $err = "Please enter your first name";
        elseif($_REQUEST['recipients']=="" and $_REQUEST['UID']=="")
                $err = "Please enter a valid email address in the email to field";
        else
        {
                $sql = "select username, fname, lname from signup where UID='$_SESSION[UID]'";
                $rs = $conn->execute($sql);
                STemplate::assign('sender_name', $rs->fields['username']);
                STemplate::assign('sender_fname', $rs->fields['fname']);
                STemplate::assign('sender_lname', $rs->fields['lname']);
                
                $sender_name = $_SESSION[USERNAME];
                $rs = $conn->execute("select * from emailinfo where email_id='invite_email'");
                $subj = $rs->fields['email_subject'];
                $email_path = $rs->fields['email_path'];
                 
                if($_REQUEST['UID']=="")
                {
								 $emails = explode(",",$_REQUEST['recipients']);
								 for($i=0; $i<count($emails); $i++)
								 {
										$to=$emails[$i];
										$name=$_SESSION[USERNAME];
										$from=$_SESSION[EMAIL];
										STemplate::assign('message',$_REQUEST[message]);
										STemplate::assign('freqkey',base64_encode($_SESSION[UID]));

										$sql = "insert into friends set UID=$_SESSION[myUID], friends_name='".$emails[$i]."', friends_type='All|Friends', invite_date='".date("Y-m-d")."'";
										 
										$conn->execute($sql);
										$id=mysql_insert_id();

										STemplate::assign('id',base64_encode($id));
										$mailbody=STemplate::fetch($email_path);
										$mailbody=nl2br($mailbody);

										mailing($to,$name,$from,$subj,$mailbody);
								 }
                }
                else
                {
                        $sql = "select * from signup where UID='$_REQUEST[UID]'";
                        $rs = $conn->execute($sql);
                        
                        STemplate::assign('receiver_name', $rs->fields['username']);
                        STemplate::assign('receiver_fname', $rs->fields['fname']);
                        STemplate::assign('receiver_lname', $rs->fields['lname']);
                        
                        $to=$rs->fields['email'];
                        $name=$_SESSION[USERNAME];
                        $from=$config[admin_email];

						STemplate::assign('message',$_REQUEST[message]);
                        STemplate::assign('freqkey',base64_encode($_SESSION[UID]));
						
						$sql="SELECT uid,fid from friends where UID=$_SESSION[UID] and  FID='$_REQUEST[UID]'";
						$rs2=$conn->execute($sql);
						
						if ($rs2->rowcount()>0){
								$sql="UPDATE friends set invite_date='".date("Y-m-d")."'" . "where UID=$_SESSION[UID] and  FID='$_REQUEST[UID]'";
								$conn->execute($sql); 
								  header("Location: invite_friends.php?msg=Your+already+invited+him or he is you friend.&UID=$_REQUEST[UID]");
								  exit;
						}
						else
						{
							$sql = "insert into friends set UID=$_SESSION[myUID], FID='$_REQUEST[UID]', friends_name='".$rs->fields['username']."', friends_type='All|Friends', invite_date='".date("Y-m-d")."'";
							$conn->execute($sql);

							/*$sql = "insert into friends set UID=$_REQUEST[UID], FID='$_SESSION[UID]', friends_name='".$_SESSION[USERNAME]."', friends_type='All|Friends', invite_date='".date("Y-m-d")."'";
							$conn->execute($sql);
							*/
						}


							$id=mysql_insert_id();	

							STemplate::assign('id',base64_encode($id));
							STemplate::assign('firstname',$rs->fields['username']);
							$mailbody=STemplate::fetch($email_path);
							$mailbody=nl2br($mailbody);
							
							$conn->execute("insert pm set
													subject='$subj',
													body='$mailbody',
													sender='$_SESSION[USERNAME]',
													receiver='".$rs->fields['username']."',
													date='".date("Y-m-d H:i:s")."'
							");

							mailing($to,$name,$from,$subj,$mailbody);
                }

                header("Location: invite_friends.php?msg=Your+invite+sent+successfully&UID=$_REQUEST[UID]");
        }
}

$sql = "select fname from signup where UID='$_SESSION[UID]'";
$rs = $conn->execute($sql);
$first_name = $rs->fields['fname'];
STemplate::assign('first_name', $first_name);

if ($_REQUEST[msg]!=""){
	$msg=$_REQUEST[msg];
}

STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('head_bottom',"friendlinks.tpl");
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('invite_friends.tpl');
STemplate::display('footer.tpl');
?>
