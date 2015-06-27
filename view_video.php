<?php
session_start();

include("include/config.php");
include("include/function.php");



// FOR GUEST USER BANDWIDTH CANCULATION   
if (!isset($_SESSION[UID])){

		# Collect data
		$guest_ip=$_SERVER['REMOTE_ADDR'];
		$guest_date=date('d-m-y');
		
		# CHECK THIS ENTY EXIT OR NOT
		$sql = "select  * from  guest_info  where guest_ip='$guest_ip' and log_date='$guest_date'";
		$rs = $conn->execute($sql);	
		$my_duration=$rs->fields['use_bw'];
		$guest_row=$rs->recordcount($sql);
		
        if ($my_duration>=$config['guest_limite']){
			$url=$config['BASE_URL'] . "?err=Sorry video limit is excided for today !!"; 
			redirect($url);
		}


		# FIND OUT DURATION OF THE MOVI
		$sql = "select duration from video where vkey='$_REQUEST[viewkey]'";
		$rs = $conn->execute($sql);
		$movi_duration=$rs->fields['duration'];
		
		

		# UPDATE Data ase
		if ($guest_row>0){
				$movi_duration=$movi_duration + $my_duration; 
				$sql = "update guest_info set use_bw='$movi_duration' where guest_ip='$guest_ip' and 	log_date='$guest_date'";
				$rs = $conn->execute($sql);	
		}
		else{
				$sql = "INSERT into		guest_info set 
										guest_ip='$guest_ip',
										log_date='$guest_date',
										use_bw='$movi_duration' ";
				$rs = $conn->execute($sql);		
				
		}
			
}		

		


if($config['enable_package']=="yes")
{

		if (!isset($_SESSION[UID])){
				$msg="Guest user"; 				
		}
		else{
			$sql = "select space from video where vkey='$_REQUEST[viewkey]'";
			$rs = $conn->execute($sql);
			check_subscriber($rs->fields['space']);

			$sql = "update subscriber set used_bw = used_bw + ".$rs->fields['space']." where UID=$_SESSION[UID]";
			$conn->execute($sql);
		}
}

if($_REQUEST['flag']=="F")
{

        $sql = "select VID from video where vkey='$_REQUEST[viewkey]'";
        $rs = $conn->execute($sql);
        $sql = "select count(*) as total from feature_req where VID=".$rs->fields['VID'];
        $rs1 = $conn->execute($sql);
        
		
		


        if($rs1->fields['total']>0)
                $sql = "update feature_req set req = req + 1, date='".date("Y-m-d")."' where VID=".$rs->fields['VID'];
        else
                $sql = "insert feature_req set VID=".$rs->fields['VID'].", req = 1, date='".date("Y-m-d")."'";

        $rs = $conn->execute($sql);
        
        header("Location: view_video.php?viewkey=$_REQUEST[viewkey]&msg=Your+feature+request+is+sent+successfully");
}
elseif($_REQUEST['flag']=="I")
{
        $sql = "select VID from video where vkey='$_REQUEST[viewkey]'";
        $rs = $conn->execute($sql);

        $sql1 = "select count(*) as total from inappro_req where VID=".$rs->fields['VID'];
        $rs1 = $conn->execute($sql1);

        if($rs1->fields['total']>0)
                $sql = "update inappro_req set req = req + 1, date='".date("Y-m-d")."' where VID=".$rs->fields['VID'];
        else
                $sql = "insert inappro_req set VID='".$rs->fields['VID']."', req = 1, date='".date("Y-m-d")."'";

        $rs = $conn->execute($sql);
        
        header("Location: view_video.php?viewkey=$_REQUEST[viewkey]&msg=Your inappropriate request is sent successfully");
}

	

//INITIALIZATION
if(!key_to_info($_REQUEST[viewkey])) $err="This video does not exists.";
else
{
	$list=key_to_info($_REQUEST[viewkey]);
	STemplate::assign('VID',$list[0]);
	STemplate::assign('UID',$list[1]);
	//END

	//INCREASE VIEW COUNT
	$sql="update video set viewnumber=viewnumber+1, viewtime='".date("Y-m-d H:i:s")."' WHERE VID=$list[0]";
	$conn->execute($sql);
	//END

	//INCREASE TOTAL VIEW COUNT
	$sql="update signup set video_viewed=video_viewed+1 WHERE UID=$list[1]";
	$conn->execute($sql);
	//END

	//INCREASE TOTAL WATCH COUNT
	if($_SESSION[UID]!=""){
	$sql="update signup set watched_video=watched_video+1 WHERE UID=$_SESSION[UID]";
	$conn->execute($sql);}
	//END

	//ADD AS PLAYLIST
	if($_SESSION[UID]!=""){
	$sql = "insert playlist set UID = '$_SESSION[UID]', VID = ".$list[0];
	$conn->execute($sql);
}
                

//ADD COMMENT
if($_REQUEST[action]=="comment" || $_REQUEST[action]=="addfavour")chk_member_login($_REQUEST['viewkey']);

	if($_POST[commentpost]!="")
	{
	if($addcomment=="")$err="Please type something in the comment box.";
	if($_SESSION[UID]==$list[1])$err="You can not post comment to your video.";
	if($err=="")
	{
			$sql="insert into comments set VID=$list[0], UID=$_SESSION[UID], commen='$addcomment', addtime='".time()."'";$conn->execute($sql);
			if(mysql_affected_rows()==1){$sql="update video set com_num=com_num+1 WHERE VID=$list[0]";$conn->execute($sql);}
			if(mysql_affected_rows()>=1) $msg="Your comment has been successfully placed!";
			else $msg="You already posted comment on this video.";
	}

}
//END


//ADD TO FAVOURITE
if($_REQUEST[action]=="addfavour")
{
if($_SESSION[UID]==$list[1])$err="You can not add your video to favourite.";
if($err=="")
{
        $sql="insert into favourite set UID=$_SESSION[UID],VID=$list[0]";
		$conn->execute($sql);
        if(mysql_affected_rows()==1)
		{
			$sql="update video set fav_num=fav_num+1 WHERE VID=$list[0]";
			$conn->execute($sql);
		}
        if(mysql_affected_rows()>=1)
				$msg="The video successfully added to your favourite!";
        else 
				$msg="You already added this video to your favourite.";
}}
//END

//RATE VIDEO
if(is_numeric($rated) && $rated>=2 && $rated<=10){
	video_rating($list[0],$rated);
	header("location:$config[baseurl]/view_video.php?viewkey=$_REQUEST[viewkey]&berated=yes"); exit;}
else{
	$_REQUEST[rated]="";
}
//END





//PAGING STARTS
if($category=="")
{
$config[items_per_page]=$config[rel_video_per_page];
$ch=explode(" ",$list[2]);

if(count($ch)>1)for($i=1;$i<count($ch);$i++)$chnl.="or keyword like '%$ch[$i]%'";
	$sql="SELECT VID from video where type='public' and (keyword like '%$ch[0]%' $chnl) order by VID asc";
}
elseif($category=="mr")$sql="SELECT VID from video where type='public' order by addtime desc limit $config[total_per_ini]";
elseif($category=="mv")$sql="SELECT VID from video where type='public' order by viewnumber desc limit $config[total_per_ini]";
elseif($category=="md")$sql="SELECT VID from video where type='public' order by com_num desc limit $config[total_per_ini]";
elseif($category=="tf")$sql="SELECT VID from video where type='public' order by fav_num desc limit $config[total_per_ini]";
elseif($category=="tr")$sql="SELECT VID from video where type='public' order by ratedby*rate desc limit $config[total_per_ini]";
elseif($category=="rf")$sql="SELECT VID from video where type='public' and featured='yes' order by addtime desc limit $config[total_per_ini]";
elseif($category=="rd")$sql="SELECT VID from video where type='public' order by rand() limit $config[total_per_ini]";
$rs = $conn->Execute($sql);
$total = $rs->recordcount();
if($total>$config[total_per_ini])$total=$config[items_per_page];
if($total<$config[items_per_page])$config[items_per_page]=$total;
$startfrom = ($_REQUEST[page]-1)*$config[items_per_page];

//TOP LIST
$rowcount=0;
while(!$rs->EOF)
{
if($rs->fields[VID]==$list[0]) break;
	$rowcount++;
	$rs->movenext();
}
$begining=$rowcount-1;
for($i=0;$i<=3;$i++)
{
$sql="";
if($begining>=0)
{
if($category=="")$sql="SELECT * from video where type='public' and (keyword like '%$ch[0]%' $chnl) order by VID asc limit $begining, 1";
elseif($category=="mr")$sql="SELECT * from video where type='public' order by addtime desc limit $begining, 1";
elseif($category=="mv")$sql="SELECT * from video where type='public' order by viewnumber desc limit $begining, 1";
elseif($category=="md")$sql="SELECT * from video where type='public' order by com_num desc limit $begining, 1";
elseif($category=="tf")$sql="SELECT * from video where type='public' order by fav_num desc limit $begining, 1";
elseif($category=="tr")$sql="SELECT * from video where type='public' order by (ratedby*rate) desc limit $begining, 1";
elseif($category=="rf")$sql="SELECT * from video where type='public' and featured='yes' order by addtime desc limit $begining, 1";
elseif($category=="rd")$sql="SELECT * from video where type='public' order by rand() limit $begining, 1";
}
if($sql!="")
{
$rs=$conn->execute($sql);
$link[$i]['vid']=$rs->fields[VID];
$link[$i]['key']=$rs->fields[vkey];
STemplate::assign('link',$link);
}
$begining++;
}
//END TOP LIST

if($category=="")$sql="SELECT * from video where type='public' and (keyword like '%$ch[0]%' $chnl) order by VID asc limit $rowcount, $config[items_per_page]";
elseif($category=="mr")$sql="SELECT * from video where type='public' order by addtime desc limit $startfrom, $config[items_per_page]";
elseif($category=="mv")$sql="SELECT * from video where type='public' order by viewnumber desc limit $startfrom, $config[items_per_page]";
elseif($category=="md")$sql="SELECT * from video where type='public' order by com_num desc limit $startfrom, $config[items_per_page]";
elseif($category=="tf")$sql="SELECT * from video where type='public' order by fav_num desc limit $startfrom, $config[items_per_page]";
elseif($category=="tr")$sql="SELECT * from video where type='public' order by (ratedby*rate) desc limit $startfrom, $config[items_per_page]";
elseif($category=="rf")$sql="SELECT * from video where type='public' and featured='yes' order by addtime desc limit $startfrom, $config[items_per_page]";
elseif($category=="rd")$sql="SELECT * from video where type='public' order by rand() limit $startfrom, $config[items_per_page]";
$rs=$conn->execute($sql);
if($rs->recordcount()<$config[items_per_page])$config[items_per_page]=$rs->recordcount();
$start_num=$startfrom+1;
$end_num=$startfrom+$rs->recordcount();
$users=$rs->getrows();
//END PAGING
}



if($_REQUEST[msg]!=""){
	$msg=$_REQUEST[msg];
}



if($category==""){$rowmincount=0;$rowmaxcount=($total-1);}
else {$rowmincount=($start_num-1);$rowmaxcount=($end_num-1);}
STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('head_bottom',"videolinks.tpl");
STemplate::assign('iscommented',is_commented($list[0]));
STemplate::assign('isvideocommented',is_video_commented($list[0]));
STemplate::assign('isvideorated',is_video_rated($list[0]));
STemplate::assign('isvideoembabed',is_video_embabed($list[0]));
STemplate::assign('rowcountmin',$rowcount);
STemplate::assign('total',$total);
STemplate::assign('items_per_page',$config[items_per_page]);
STemplate::assign('rowcount',$rowcount);
STemplate::assign('rowmincount',$rowmincount);
STemplate::assign('rowmaxcount',$rowmaxcount);
STemplate::assign('start_num',$start_num);
STemplate::assign('end_num',$end_num);
STemplate::assign('answers',$users);
//RELATED TAGS
$tags=group_tags($sql);
STemplate::assign('tags',$tags);
//END
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('view_video.tpl');
STemplate::display('footer.tpl');
?>
