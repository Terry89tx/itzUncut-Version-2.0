<?php
	include("../include/config.php");
	include("../include/function.php");



	if ($_REQUEST[action]=="delete" ){
			$sql="delete from poll_question  where poll_id='$_REQUEST[poll_id]'";
			$conn->execute($sql);
			$err="Delete successfull";
	}

	$sql = "select * from poll_question";
	$rs = $conn->execute($sql);
	$pollArray = $rs->getarray();
	

	Stemplate::assign('pollArray',$pollArray);
	Stemplate::assign('err',$err);

	STemplate::display("siteadmin/viewpolllist.tpl");


?>

