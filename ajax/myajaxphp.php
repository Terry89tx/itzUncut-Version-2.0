<?php
	/////////////////////////////////////////////////
## THIS IS AJAX BACK HAND SCRIPT FOR RATING CALCULATION 
   /////////////////////////////////////////////////

## My SMARTY INI
 include("../include/config.php");
 include("../include/function.php");

## My AJAX INI
 require_once($config['BASE_DIR'] . "/ajax/cpaint2.inc.php"); 

  $cp = new cpaint();
  $cp->register('process_data');
  $cp->register('process_comments');
  $cp->register('process_Vote');
  $cp->register('executeDB');
  $cp->register('view_vote');
  $cp->start();
  $cp->return_data(); 



//##############################   DB EXEXUTION START  ####
function executeDB($sql){
		# INI
		global $cp; 
		global $conn;
		$myFlag="";
		
		## Check sql 
		if(!strstr($sql, 'select')){
			if(!strstr($sql, 'SELECT')){
				$myFlag="2";
			}
			else{
				$myFlag="1";
			}
		}
				
		if($myFlag=="1"){
			$dbreport="1";
			$res=$conn->execute($sql);
			$dbarray=$res->getarray();
			
					for( $i=0;$dbarray[$i][0];$i++){
							for( $ii=0;$dbarray[0][$ii];$ii++){
								
										$ret_name="dbvalue";
										$ret_name.=$i;
										$ret_name.=$ii;
										$a_result_node =& $cp->add_node($ret_name);
										$a_result_node->set_data($dbarray[$i][$ii]);
							}
					}
			
			$a_result_node =& $cp->add_node('recordcount');
			$a_result_node->set_data($i);
			$a_result_node =& $cp->add_node('coloumcount');
			$a_result_node->set_data($ii);
		}
		else{
			$dbreport="2";
			$conn->execute($sql);
				if(mysql_affected_rows()<0){
					$dbreport="-1";
				}

		}
$a_result_node =& $cp->add_node('dbreport');
$a_result_node->set_data($dbreport);
}


//## End	


//# Rating video
function process_data($rated,$vid){
		 global $cp; 
	 	 
		 
		 if(is_numeric($rated) && $rated>=2 && $rated<=10){			
			$flag=video_rating($vid,$rated);

			if($flag)
			{
				global $conn;
				$sql="select rate,ratedby from video where VID='$vid'";
				$rs=$conn->execute($sql);
				$x=$rs->getarray();
				$trate=$x[0][0];
				$tvote=$x[0][1];
				
				#PROCESS RATE TO FLAG
				$rate=ceil($trate);
				$cnt=floor($rate/2);
				
				$a_result_node =& $cp->add_node("trate");
				$a_result_node->set_data($cnt);
				$a_result_node =& $cp->add_node("tvote");
				$a_result_node->set_data($tvote);
			}
			else{
				$a_result_node =& $cp->add_node("trate");
				$a_result_node->set_data('exist');
			}

			
		}
		else{
			$a_result_node =& $cp->add_node("tvote");
			$a_result_node->set_data('0');
			$a_result_node =& $cp->add_node("tvote");
			$a_result_node->set_data('0');
		}
}
//End Rating



function process_comments($comments_value,$uid,$vid){
	 global $cp; 
 	 global $conn;
	 
	  $sql="insert into comments set VID=$vid, UID=$uid, commen='$comments_value', addtime='".time()."'";
	  $conn->execute($sql);
	
		if(mysql_affected_rows()==1){
			$sql="update video set com_num=com_num+1 WHERE VID=$vid";
			$conn->execute($sql);
		 }
			if(mysql_affected_rows()>=1){ 
				$msg=1; //"Your comment has been successfully placed!";
			}
			else{ 
				$msg=0;//"You already posted comment on this video.";
			}
		
		  $a_result_node =& $cp->add_node("a");
 		  $a_result_node->set_data($msg);
}



function process_Vote($id,$voteAnswer){
	global $cp; 	
	global $conn;
	global $config;
	$today=date('Y-m-d');
	$myIP=$_SERVER['REMOTE_ADDR'];
	
	$flag=false;
	if($config['user_poll']=="Once"){
		$sql="SELECT COUNT(*) as cnt from vote_result WHERE  vote_id='$id' AND voter_id='$_SESSION[UID]'";
		$rs=$conn->execute($sql);
		if($rs->fields['cnt']>0){
			$flag=true;
		}
	}
	
	if(!$flag){
		 # INSERT VOTE 
		 $sql="insert into vote_result set  vote_id='$id',
											 voter_id='$_SESSION[UID]',
											answer='$voteAnswer',
											client_ip='$myIP',
											voted_date='$today'";
		$conn->execute($sql);
		if(mysql_affected_rows()>0){
			  $a_result_node =& $cp->add_node("result");
			  $a_result_node->set_data('1');			
		}
		else{
				 $a_result_node =& $cp->add_node("result");
				 $a_result_node->set_data('-1');
				 return false;
		}

			# GET ANSWER OF VOTE CATE GORY
		$sql="SELECT * from poll_question  where poll_id='$id'";
		$rsc=$conn->execute($sql);
		$poll_answer=$rsc->fields['poll_answer']; 
		
		# SPLIT IN ARRAY 
		$list=explode("|",$poll_answer);

		#COUT OF EACH CATEGORY
		for($i=0;$list[$i];$i++){
			$sql="select count(*) as poll_id from vote_result WHERE answer='" . $list[$i] . "'"  ;
			$rs=$conn->execute($sql);
			$Countlist[$i]=$rs->fields[poll_id];
			
			
		}


			# CALCULATE THE PARCENTAGE 
			$Countlist=clulateParcentage($Countlist);
			
			# CRETE NODE AND BACK TO PAVILION 
			for($i=0;$list[$i];$i++){
				$a_result_node =& $cp->add_node("A1".$i);
				$a_result_node->set_data($list[$i]);			
				
			}

			# CRETE NODE AND BACK TO PAVILION 
			for($i=0;1;$i++){

				$a_result_node =& $cp->add_node("P1".$i);
				$a_result_node->set_data($Countlist[$i]);			
				if($Countlist[$i]==""){
					break;
				}

				
			}

		
				$a_result_node =& $cp->add_node("count");
				$a_result_node->set_data($i);		



	}
	else{
			$a_result_node =& $cp->add_node("result");
			$a_result_node->set_data(2);
			return false;
	}
		
	
	
	
}




function view_vote($id){
	global $cp;
	global $conn;
	# GET ANSWER OF VOTE CATE GORY
	$sql="SELECT * from poll_question  where poll_id='$id'";
    $rsc=$conn->execute($sql);
	$poll_answer=$rsc->fields['poll_answer']; 
	
	# SPLIT IN ARRAY 
	$list=explode("|",$poll_answer);

	#COUT OF EACH CATEGORY
	for($i=0;$list[$i];$i++){
		$sql="select count(*) as poll_id from vote_result WHERE answer='" . $list[$i] . "'"  ;
        $rs=$conn->execute($sql);
		$Countlist[$i]=$rs->fields[poll_id];
		
		
	}


	# CALCULATE THE PARCENTAGE 
	$Countlist=clulateParcentage($Countlist);
		
		# CRETE NODE AND BACK TO PAVILION 
		for($i=0;$list[$i];$i++){
			$a_result_node =& $cp->add_node("A1".$i);
			$a_result_node->set_data($list[$i]);			
			
		}

		# CRETE NODE AND BACK TO PAVILION 
		for($i=0;1;$i++){

			$a_result_node =& $cp->add_node("P1".$i);
			$a_result_node->set_data($Countlist[$i]);			
			if($Countlist[$i]==""){
				break;
			}

			
		}

	
			$a_result_node =& $cp->add_node("count");
			$a_result_node->set_data($i);		
}



?>