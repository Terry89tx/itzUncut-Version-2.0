<?php
include("include/config.php");
session_start();
include("include/function.php");
chk_member_login();


if($_REQUEST[id]!="")
{
$id=base64_decode($_REQUEST[id]);
$sql="select * from friends WHERE id=$id";
$rs=$conn->execute($sql);
if($rs->recordcount()>0)
{
STemplate::assign('AID',$id);
STemplate::assign('UID',$rs->fields['UID']);
}}



//ACCEPT
if($_REQUEST[friend_accept]!="")
{

$sql="select * from friends WHERE id='$_REQUEST[AID]' and friends_status='Pending'";
$rs=$conn->execute($sql);
if($rs->recordcount()>0)
{


$sql="update friends set
        FID=$_SESSION[UID],
        friends_name='$_SESSION[USERNAME]',
        friends_status='Confirmed' WHERE id=$_REQUEST[AID] and friends_status='Pending'";
		$conn->execute($sql);

        if(mysql_affected_rows()==1)
        {

				 
                $fid['un'] = $rs->fields['UID'];
                $fname = insert_id_to_name($fid);
				
                $sql = "insert friends set
                                UID=$_SESSION[UID],
                                FID=".$rs->fields['UID'].",
                                friends_name='$fname',
                                friends_type='All|Friends',
                                invite_date='".date("Y-m-d")."',
                                friends_status='Confirmed'
                                ";
                $conn->execute($sql);
                $msg="You have accepted the request of a friend.";
        }
}
header("location:$config[baseurl]/index.php?msg=$msg");exit;
}

//DENY
if($_REQUEST[friend_deny]!="")
{
$sql="DELETE from  friends  where id=$_REQUEST[AID]";
$rs=$conn->execute($sql);
if(mysql_affected_rows()==1)$msg="You have denied the request of a friend.";
header("location:$config[baseurl]/index.php?msg=$msg");exit;
}

if ($_REQUEST[msg]!=""){
	$msg=$_REQUEST[msg];
}

STemplate::assign(err,$err);
STemplate::assign('msg',$msg);
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('friend_accept.tpl');
STemplate::display('footer.tpl');
?>

