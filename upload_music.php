<?php
session_start();
include("include/config.php");
include("include/function.php");
chk_member_login();
isMailVerified();

#echo "hello" . $_POST[action_upload];
#echo $config['audiodir'];
#echo $config['audiourl'];

if($_POST[action_upload]!="")
{
        if($field_myvideo_title=="") $err="Upload: Please Provide a Audio(MP3) title.";
        elseif($field_myvideo_descr=="") $err="Upload: Please Provide a Audio(MP3) description.";
        elseif($field_myvideo_keywords=="") $err="Upload: Please provide tag/s.";
        elseif(count($chlist)<1 || count($chlist)>3) $err="Upload: Please check (1 to 3) channel/s.";
        if($err=="")
        {
        STemplate::assign('secondpage',"second");
        $listch=implode("|",$chlist);
        STemplate::assign('listch',$listch);
        }
}




if($_POST[upload_final]!="")
{
		#echo "uploading";
        if($_FILES['field_uploadfile']['tmp_name']=="") 
				$err="Please provide the audio location.";
       
	   
		if($err=="" && $_FILES['field_uploadfile']['tmp_name']!=""){
                $p=$_FILES['field_uploadfile']['name'];
                $pos=strrpos($p,".");
                $ph=strtolower(substr($p,$pos+1,strlen($p)-$pos));
                $im_size =  $_FILES['field_uploadfile']['size'];
                if( $ph!="mp3" && $ph!="wav" )
	               $err="Invalid audio Format.";
        }

	
        if($err==""){
			$sql="insert into audio set
					UID=$_SESSION[UID],
					title='$field_myvideo_title',
					description='$field_myvideo_descr',
					keyword='$field_myvideo_keywords',
					channel='0|$listch|0',
					addtime='".time()."',
					adddate='".date("Y-m-d")."',
					vkey='".mt_rand()."',
					type='$field_privacy',
					filehome='$p'";
					$conn->execute($sql);
					$vid=mysql_insert_id();
					$vdoname=$vid.".".$ph;
		
		

        //VIDEO UPLOADING
        if($config['activexinstall']=="no")
        {
            if(isset($_FILES['field_uploadfile']['tmp_name']) && is_uploaded_file($_FILES['field_uploadfile']['tmp_name'])){
                $ff = $config['audiodir']."/".$vdoname;
                if(move_uploaded_file($_FILES['field_uploadfile']['tmp_name'], $ff))
                {}
                else
                        echo "Error";
                //$mov = new ffmpeg_movie($ff);
                //video_to_frame($ff,$vid,&$mov,$listch[0]);
                //$duration=$mov->getDuration();

                //exec("$config[ffmpeg] -i $config[vdodir]/$vdoname -f flv $config[flvdodir]/".$vid.".flv");
            }
        }
        //END
        $key=substr(md5($vid),11,20);
        $sql="update audio set
                vdoname='$vdoname',
                flvdoname='".$vid.".flv',
                duration='$duration',
                vkey='$key' WHERE VID=$vid";
        $conn->execute($sql);
        if(mysql_affected_rows()>=1)header("Location:$config[baseurl]/upload_success_music.php?viewkey=$key&upload=yes");exit;
        }
		
}


	STemplate::assign('err',$err);
	STemplate::assign('msg',$msg);
	STemplate::assign('head_bottom',"musiclinks.tpl");
	STemplate::display('head1.tpl');
	STemplate::display('err_msg.tpl');
	STemplate::display('upload_music.tpl');
	STemplate::display('footer.tpl');
?>
