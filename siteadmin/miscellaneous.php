<?php
		include("../include/config.php");
		include("../include/function.php");
		if($_REQUEST['submit'])
		{
			$sql = "update sconfig set svalue='$_REQUEST[selUserVote]' where soption='video_rating'";
			$conn->execute($sql);
			$sql = "update sconfig set svalue='$_REQUEST[selUser_poll]' where soption='user_poll'";
			$conn->execute($sql);
		}
		
		if($_REQUEST[msg]!="") $msg=$_REQUEST[msg];
			
			Stemplate::assign('err',$err);
			Stemplate::assign('msg',$msg);
			STemplate::display("siteadmin/miscellaneous.html");
?>
