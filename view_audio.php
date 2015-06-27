<?php
session_start();
include("include/config.php");
include("include/function.php");
//echo "ff" . $_GET['flag'];

if($_GET['flag']=="F")
{
		
        $sql = "select VID from audio where vkey='$_GET[viewkey]'";
        $rs = $conn->execute($sql);
        
        $sql = "select count(*) as total from feature_req_audio where VID=".$rs->fields['VID'];
 
        $rs1 = $conn->execute($sql);
        
        if($rs1->fields['total']>0){

                $sql = "update feature_req_audio set req = req + 1, date='".date("Y-m-d")."' where VID=".$rs->fields['VID'];
						
		}
        else{
                $sql = "insert feature_req_audio set VID=".$rs->fields['VID'].", req = 1, date='".date("Y-m-d")."'";

		}

        $rs = $conn->execute($sql);
        
        header("Location: view_audio.php?viewkey=$_GET[viewkey]&msg=Your feature request is sent successfully");
}
elseif($_GET['flag']=="I")
{
        $sql = "select VID from audio where vkey='$_GET[viewkey]'";
        $rs = $conn->execute($sql);

        $sql1 = "select count(*) as total from inappro_req_audio where VID=".$rs->fields['VID'];
        $rs1 = $conn->execute($sql1);

        if($rs1->fields['total']>0)
                $sql = "update inappro_req_audio set req = req + 1, date='".date("Y-m-d")."' where VID=".$rs->fields['VID'];
        else
                $sql = "insert inappro_req_audio set VID='".$rs->fields['VID']."', req = 1, date='".date("Y-m-d")."'";

        $rs = $conn->execute($sql);
        
        header("Location: view_audio.php?viewkey=$_GET[viewkey]&msg=Your inappropriate request is sent successfully");
}


//INITIALIZATION
if(!key_to_info_audio($viewkey)) $err="This audio does not exists.";
else
{
$list=key_to_info_audio($viewkey);
STemplate::assign('VID',$list[0]);
STemplate::assign('UID',$list[1]);

//END

//INCREASE VIEW COUNT
$sql="update audio set viewnumber=viewnumber+1, viewtime='".date("Y-m-d H:i:s")."' WHERE VID=$list[0]";
$conn->execute($sql);
//END

//INCREASE TOTAL VIEW COUNT
$sql="update signup set audio_viewed=video_viewed+1 WHERE UID=$list[1]";
$conn->execute($sql);
//END

//INCREASE TOTAL WATCH COUNT
if($_SESSION[UID]!=""){
$sql="update signup set watched_video=watched_video+1 WHERE UID=$_SESSION[UID]";
$conn->execute($sql);}
//END

//ADD AS PLAYLIST
if($_SESSION[UID]!=""){
$sql = "insert playlist_audio set UID = '$_SESSION[UID]', VID = ".$list[0];
$conn->execute($sql);
}
                

//ADD COMMENT
if($_REQUEST[action]=="comment" ||$_REQUEST[action]=="addfavour")chk_member_login($_REQUEST['viewkey']);
if($_POST[commentpost]!="")
{
	if($addcomment==""){
		$err="Please type something in the comment box.";
	}
	
		#echo  $_SESSION[UID] . "/" .$list[1];
	if($_SESSION[UID]==$list[1]){
		$err="You can not post comment to your audio.";
	}

if($err=="")
{
		
        # ADDING COMMENTS FOR AUDIO 
		$sql="insert into comments_audio set VID='$list[0]', UID='$_SESSION[UID]', commen='$addcomment', addtime='".time()."'";
		$conn->execute($sql);


		//echo mysql_affected_rows();
        if(mysql_affected_rows()==1){
			$sql="update audio set com_num=com_num+1 WHERE VID=$list[0]";

			$conn->execute($sql);

		}
        
		if(mysql_affected_rows()>=1){
			$msg="Your comment has been successfully placed!";
		}
        else{
			$msg="You already posted comment on this audio.";
		}


}}
//END

//ADD TO FAVOURITE
if($action=="addfavour")
{
if($_SESSION[UID]==$list[1])$err="You can not add your audio to favourite.";
if($err=="")
{
        $sql="insert into favourite_audio set UID=$_SESSION[UID],VID=$list[0]";$conn->execute($sql);
        if(mysql_affected_rows()==1){$sql="update audio set fav_num=fav_num+1 WHERE VID=$list[0]";$conn->execute($sql);}
        if(mysql_affected_rows()>=1)$msg="The audio successfully added to your favourite!";
        else $msg="You already added this audio to your favourite.";
}}
//END

//RATE audio
if(is_numeric($rated) && $rated>=2 && $rated<=10)
{
	audio_rating($list[0],$rated);
     header("location:$config[baseurl]/view_audio.php?viewkey=$_REQUEST[viewkey]&berated=yes"); exit;
}
else $_REQUEST[rated]="";
//END





//PAGING STARTS
if($category=="")
{
$config[items_per_page]=$config[rel_video_per_page];
$ch=explode(" ",$list[2]);
if(count($ch)>1)for($i=1;$i<count($ch);$i++)$chnl.="or keyword like '%$ch[$i]%'";
$sql="SELECT VID from audio where type='public' and (keyword like '%$ch[0]%' $chnl) order by VID asc";
}
elseif($category=="mr")$sql="SELECT VID from audio where type='public' order by addtime desc limit $config[total_per_ini]";
elseif($category=="mv")$sql="SELECT VID from audio where type='public' order by viewnumber desc limit $config[total_per_ini]";
elseif($category=="md")$sql="SELECT VID from audio where type='public' order by com_num desc limit $config[total_per_ini]";
elseif($category=="tf")$sql="SELECT VID from audio where type='public' order by fav_num desc limit $config[total_per_ini]";
elseif($category=="tr")$sql="SELECT VID from audio where type='public' order by ratedby*rate desc limit $config[total_per_ini]";
elseif($category=="rf")$sql="SELECT VID from audio where type='public' and featured='yes' order by addtime desc limit $config[total_per_ini]";
elseif($category=="rd")$sql="SELECT VID from audio where type='public' order by rand() limit $config[total_per_ini]";
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
if($category=="")$sql="SELECT * from audio where type='public' and (keyword like '%$ch[0]%' $chnl) order by VID asc limit $begining, 1";
elseif($category=="mr")$sql="SELECT * from audio where type='public' order by addtime desc limit $begining, 1";
elseif($category=="mv")$sql="SELECT * from audio where type='public' order by viewnumber desc limit $begining, 1";
elseif($category=="md")$sql="SELECT * from audio where type='public' order by com_num desc limit $begining, 1";
elseif($category=="tf")$sql="SELECT * from audio where type='public' order by fav_num desc limit $begining, 1";
elseif($category=="tr")$sql="SELECT * from audio where type='public' order by (ratedby*rate) desc limit $begining, 1";
elseif($category=="rf")$sql="SELECT * from audio where type='public' and featured='yes' order by addtime desc limit $begining, 1";
elseif($category=="rd")$sql="SELECT * from audio where type='public' order by rand() limit $begining, 1";
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

if($category=="")$sql="SELECT * from audio where type='public' and (keyword like '%$ch[0]%' $chnl) order by VID asc limit $rowcount, $config[items_per_page]";
elseif($category=="mr")$sql="SELECT * from audio where type='public' order by addtime desc limit $startfrom, $config[items_per_page]";
elseif($category=="mv")$sql="SELECT * from audio where type='public' order by viewnumber desc limit $startfrom, $config[items_per_page]";
elseif($category=="md")$sql="SELECT * from audio where type='public' order by com_num desc limit $startfrom, $config[items_per_page]";
elseif($category=="tf")$sql="SELECT * from audio where type='public' order by fav_num desc limit $startfrom, $config[items_per_page]";
elseif($category=="tr")$sql="SELECT * from audio where type='public' order by (ratedby*rate) desc limit $startfrom, $config[items_per_page]";
elseif($category=="rf")$sql="SELECT * from audio where type='public' and featured='yes' order by addtime desc limit $startfrom, $config[items_per_page]";
elseif($category=="rd")$sql="SELECT * from audio where type='public' order by rand() limit $startfrom, $config[items_per_page]";
else $sql="SELECT * from audio where  order by rand() limit $startfrom, $config[items_per_page]";

$rs=$conn->execute($sql);
if($rs->recordcount()<$config[items_per_page])$config[items_per_page]=$rs->recordcount();
$start_num=$startfrom+1;
$end_num=$startfrom+$rs->recordcount();
$users=$rs->getrows();
//END PAGING
}

if($category==""){$rowmincount=0;$rowmaxcount=($total-1);}
else {$rowmincount=($start_num-1);$rowmaxcount=($end_num-1);}
STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('head_bottom',"musiclinks.tpl");
STemplate::assign('iscommented',is_commented($list[0]));
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
STemplate::display('view_audio.tpl');
STemplate::display('footer.tpl');
?>
