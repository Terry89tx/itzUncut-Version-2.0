<?php
session_start();

include("include/config.php");
include("include/function.php");
$UID = $_SESSION[myUID];


$sql="select * from signup WHERE UID=$_REQUEST[UID]";
$rs=$conn->execute($sql);

if($rs->recordcount()>0)
{
	//INCREASE VIEW COUNT
	$sql="update signup set profile_viewed=profile_viewed+1 WHERE UID=$_REQUEST[UID]";
	$conn->execute($sql);
	
	//END
	$dat=explode("-",$rs->fields[bdate]);
	$age=(date("Y")-$dat[0]);
	STemplate::assign('profileage',$age);
	$users = $rs->getrows();
	$sql="select * from video WHERE UID=$_REQUEST[UID] order by VID desc limit 1";
	$rs=$conn->execute($sql);
	$vdo = $rs->getrows();
}
$chkuserflag="";

if(checklogin()){
	$chkuserflag="guest";
}

if ($_SESSION[myUID]==$_REQUEST[UID]){
		$chkuserflag="self";

}

STemplate::assign('chkuserflag',$chkuserflag);	
STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('answers',$users);
STemplate::assign('videos',$vdo);
STemplate::assign('head_bottom',"blank.tpl");
STemplate::assign('head_bottom_add',"viewuserlinks.tpl");
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('uprofile.tpl');
STemplate::display('footer.tpl');
?>