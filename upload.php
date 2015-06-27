<?php
include("include/config.php");
session_start();
include("include/function.php");
chk_member_login();
isMailVerified();
if($config['enable_package']=="yes")
{
        check_subscriber(100);
}


if($_REQUEST[action_upload]!="")
{
        if($_REQUEST[field_myvideo_title]==""){
			$err="Upload: Please Provide a video title.";
		}
        elseif($_REQUEST[field_myvideo_descr]==""){
			$err="Upload: Please Provide a video description.";
		}
        elseif($_REQUEST[field_myvideo_keywords]==""){
			$err="Upload: Please provide tag/s.";
		}
        elseif(count($_REQUEST[chlist])<1 || count($_REQUEST[chlist])>3){
			$err="Upload: Please check (1 to 3) channel/s.";
		}

        if($err==""){
			$page = "second";
			STemplate::assign('secondpage',"second");
			$listch=implode("|",$_REQUEST[chlist]);
			STemplate::assign('listch',$listch);
			$var = "<script language=javascript>
					var field_myvideo_title = $_REQUEST[field_myvideo_title];
					var field_myvideo_descr = $_REQUEST[field_myvideo_descr];
					var field_myvideo_keywords = $_REQUEST[field_myvideo_keywords];
					var listch = $listch;
					</script>";
			STemplate::assign("var", $var);
        }
}
if($_POST[upload_final]!="")
{
        if($_FILES['field_uploadfile']['tmp_name']=="") $err="Please provide the video location.";
        if($err=="" && $_FILES['field_uploadfile']['tmp_name']!="")
                {
                $p=$_FILES['field_uploadfile']['name'];
                $pos=strrpos($p,".");
                $ph=strtolower(substr($p,$pos+1,strlen($p)-$pos));
                /* Space in Megabytes (MB) */
                $space = round($_FILES['field_uploadfile']['size']/(1024*1024));
                if($config['enable_package']=="yes")
                {
                        check_subscriber($space);
                }
                
                if(($ph!="mpg" && $ph!="avi" && $ph!="mpeg" && $ph!="wmv" && $ph!="rm" && $ph!="dat") || $space>$config[max_video_size])
                $err="Invalid Video Format.";
                }

        if($err=="")
        {
                $sql="insert into video set
                        UID=$_SESSION[UID],
                        title='$_REQUEST[field_myvideo_title]',
                        description='$_REQUEST[field_myvideo_descr]',
                        keyword='$_REQUEST[field_myvideo_keywords]',
                        channel='0|$_REQUEST[listch]|0',
                        space = '$_REQUEST[space]',
                        addtime='".time()."',
                        adddate='".date("Y-m-d")."',
                        vkey='".mt_rand()."',
                        type='$_REQUEST[field_privacy]',
                        filehome='$_REQUEST[p]'";
                $conn->execute($sql);
                $vid=mysql_insert_id();
                $vdoname=$vid.".".$ph;
             
                    if(isset($_FILES['field_uploadfile']['tmp_name']) && is_uploaded_file($_FILES['field_uploadfile']['tmp_name']))
                    {
						$ff = $config[vdodir]."/".$vdoname;
						if(move_uploaded_file($_FILES['field_uploadfile']['tmp_name'], $ff))
						{	$mov = new ffmpeg_movie($ff);
							video_to_frame($ff,$vid,&$mov,$listch[0]);
							$duration=$mov->getDuration();
							exec("$config[ffmpeg] -i $config[vdodir]/$vdoname -acodec mp3 -ar 22050 -ab 32 -f flv $config[flvdodir]/".$vid.".flv");
						}
                       
                    }
                //END

                $key=substr(md5($vid),11,20);
                $sql="update video set
                        vdoname='$vdoname',
                        flvdoname='".$vid.".flv',
                        duration='$duration',
                        vkey='$key' WHERE VID=$vid";
                $conn->execute($sql);
        
                if($config['enable_package']=="yes")
                {
                        $sql = "update subscriber set used_space=used_space+$space, used_bw=used_bw+$space, total_video=total_video+1 where UID=$_SESSION[UID]";
                        $conn->execute($sql);
                }
        
                header("Location:$config[baseurl]/upload_success.php?viewkey=$key&upload=yes&vid=$vid");
        }
}


STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('head_bottom',"blank.tpl");
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('upload.tpl');
STemplate::display('footer.tpl');
?>
