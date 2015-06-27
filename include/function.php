<?php

//CHECK HOTORNOT ADMINISTRATOR LOGIN
function chk_admin_login()
{
        global $config;
        if($_SESSION['AUID']!=$config['admin_name'] || $_SESSION['APASSWORD']!=$config['admin_pass'])
        {
                header("Location:$config[baseurl]/siteadmin/login.php");
                exit;
        }
}

//CHECK HOTORNOT MEMBER LOGIN
function chk_member_login($viewkey="")
{
        global $config,$conn;

        $sql="select * from signup where UID=$_SESSION[UID]";
        $rs=$conn->execute($sql);
        if($_SESSION['UID']=="" || $_SESSION['EMAIL']=="" || $rs->recordcount()==0)
        {
                $q = "";
                while(list($k,$v)=each($_GET)){$q.="&$k=$v";}
                $q=base64_encode($q);
                if($q!="")$add="&add=$q";
                $temp=$_SERVER['PHP_SELF'];
                $path=explode("/",$temp);
                $page=$path[count($path)-1];
                $page=str_replace(".php","",$page);
                header("Location:$config[baseurl]/signup.php?next=$page$add");
                exit;
        }
}

function session_to_db()
{
        global $conn;
        $sql="select * from signup where UID=$_SESSION[UID]";
        $rs=$conn->execute($sql);
        if($rs->recordcount()>0)
        {
                $_SESSION[EMAILVERIFIED]=$rs->fields['emailverified'];
        }
}
//MAIL FUNCTIION
function mailing($to,$name,$from,$subj,$body,$bcc="") {
	$headers="";
global $SERVER_NAME;
$subj=nl2br($subj);
$body=nl2br($body);
$recipient = $to;
if($bcc!="") $headers = "Bcc: " . $bcc."\n";
$headers .= "From: " . $from . "\n";
//$headers .= "X-Sender: <" . "$to" . ">\n";
//$headers .= "Return-Path: <" . "$to" . ">\n";
//$headers .= "Error-To: <" . "$to" . ">\n";
$headers .= "Content-Type: text/html\n";
mail("$recipient","$subj","$body","$headers");
}
//EMAIL VERIFICATION
function isMailVerified()
{
        global $config;

        if($_SESSION[EMAILVERIFIED]=="no")header("Location:$config[baseurl]/confirm_email.php");
}
function is_commented($vid)
{
        global $config,$conn;
        $sql="select count(*) as cnt from comments WHERE VID=$vid and UID=$_SESSION[UID]";
        $rs=$conn->execute($sql);
        if($rs->fields[cnt]>0) return "yes";
}

function is_video_commented($vid)
{
        global $config,$conn;
        $sql="select  be_comment from video WHERE VID=$vid";
        $rs=$conn->execute($sql);
		return $rs->fields['be_comment'];

}
function is_video_rated($vid)
{
        global $config,$conn;
        $sql="select be_rated from video WHERE VID=$vid";
        $rs=$conn->execute($sql);
		return $rs->fields['be_rated'];

}

function is_video_embabed($vid)
{
        global $config,$conn;
        $sql="select  embed from video WHERE VID=$vid";
        $rs=$conn->execute($sql);
		return $rs->fields['embed'];

}


//SOME YEARS CONSTRUCTION
function years($sel="")
{
        $year="";
        $init=date("Y");
        for($i=1900;$i<=$init;$i++)
        {
                if($i==$sel)
                        $year.="<option value='$i' selected>$i</option>";
                else
                        $year.="<option value='$i'>$i</option>";
        }
        return $year;
}
//SOME MONTHS CONSTRUCTION
function months($sel=""){
        $month="";
        $months=array("January","February","March","April","May","June","July","August","September","October","November","December");
        for($i=1;$i<=12;$i++)
        {
                if($i==$sel){
                        $month.="<option value='$i' selected>$i</option>";
                                }
                else{
                        $month.="<option value='$i'>$i</option>";
                                }
        }
        return $month;
}
//SOME DAYS CONSTRUCTION
function days($sel="")
{
        $day="";
        for($i=1;$i<=31;$i++)
        {
                if($i==$sel){
                        $day.="<option value='$i' selected>$i</option>";
                                }
                else{
                        $day.="<option value='$i'>$i</option>";
                                }
        }
        return $day;
}
//Populate country
function country_box($sel=""){
$coun="";
$country=array("United States","Afghanistan","Albania","Algeria","American Samoa","Andorra","Angola","Anguilla","Antartica","Antigua and Barbuda","Argentina","Armenia","Aruba","Ascension Island","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Botswana","Bouvet Island","Brazil","Brunei Darussalam","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Canada","Cape Verde Islands","Cayman Islands","Chad","Chile","China","Christmas Island","Colombia","Comoros","Cook Islands","Costa Rica","Cote d Ivoire","Croatia/Hrvatska","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","East Timor","Ecuador","Egypt","El Salvador","Equatorial Guinea","Eritrea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Guiana","French Polynesia","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guadeloupe","Guam","Guatemala","Guernsey","Guinea","Guinea-Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Ireland","Isle of Man","Israel","Italy", "Jamaica", "Japan", "Jersey", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte Island", "Mexico", "Micronesia", "Moldova", "Monaco", "Mongolia", "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcairn Island", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion Island", "Romania", "Russian Federation", "Rwanda", "Saint Helena", "Saint Lucia", "San Marino", "Saudi Arabia", "Senegal", "Seychelles", "Sierra Leone", "Singapore", "Slovak Republic", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia", "Spain", "Sri Lanka", "Suriname", "Svalbard", "Swaziland", "Sweden", "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "Togo", "Tokelau", "Tonga Islands", "Tunisia", "Turkey", "Turkmenistan", "Tuvalu", "Uganda", "Ukraine", "United Kingdom", "Uruguay", "Uzbekistan", "Vanuatu", "Vatican City", "Venezuela", "Vietnam", "Western Sahara", "Western Samoa", "Yemen", "Yugoslavia", "Zambia","Zimbabwe");
for($i=0;$i<count($country);$i++)
{
        if($sel==$country[$i])
                $coun .="<option value='$country[$i]' selected>$country[$i]</option>";
        else
                $coun .="<option value='$country[$i]'>$country[$i]</option>";
}
return $coun;
}
//DROP STATE
function state_drop($sel="")
{
$coun="";
$state = array("Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "District of Columbia", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming", "Others");

for($i=0;$i<count($state);$i++)
{
        if($sel==$state[$i])
                $coun .="<option value='$state[$i]' selected>$state[$i]</option>";
        else
                $coun .="<option value='$state[$i]'>$state[$i]</option>";
}
return $coun;
}

//REDIRECT PAGE USING JAVASCRIPT
function redirect($link)
{
        echo "<script language=Javascript>
                document.location.href='$link';
                </script>";
}

function video_to_frame($fpath,$name,$mov,$chnl)
{
        global $config;
        $frcount=$mov->getFrameCount()-1;
                $try = 1;
                $fc = 1;

            while(1)
                {
                        $p = rand(1,$frcount);
                        $ff_frame= $mov->getFrame($p);
                        if($ff_frame==true)
                        {
                        $gd_image = $ff_frame->toGDImage();
                                $ff=$config['TMB_DIR']."/".$name.".jpg";
                        imagejpeg($gd_image, $ff);
                                $fd=$config['TMB_DIR']."/".$fc."_".$name.".jpg";
                        createThumb($ff,$fd,$config['img_max_width'],$config['img_max_height']);
                                $fc++;
                          }
                        $try++;
                        if($try>10 || $fc==4)
                                break;

                }
     
}

function createThumb($srcname,$destname,$maxwidth,$maxheight)
{
        global $config;
        $oldimg = $srcname;//$config['basepath']."/photo/".$srcname;
        $newimg = $destname;//$config['basepath']."/photo/".$destname;

        $imagedata = GetImageSize($oldimg);
        $imagewidth = $imagedata[0];
        $imageheight = $imagedata[1];
        $imagetype = $imagedata[2];

        $shrinkage = 1;
        if ($imagewidth > $maxwidth)
        {
                $shrinkage = $maxwidth/$imagewidth;
        }
        if($shrinkage !=1)
        {
                $dest_height = $shrinkage * $imageheight;
                $dest_width = $maxwidth;
        }
        else
        {
                $dest_height=$imageheight;
                $dest_width=$imagewidth;
        }
        if($dest_height > $maxheight)
        {
                $shrinkage = $maxheight/$dest_height;
                $dest_width = $shrinkage * $dest_width;
                $dest_height = $maxheight;
        }
        if($imagetype==2)
        {
                $src_img = imagecreatefromjpeg($oldimg);
                $dst_img = imageCreateTrueColor($dest_width, $dest_height);
                ImageCopyResampled($dst_img, $src_img, 0, 0, 0, 0, $dest_width, $dest_height, $imagewidth, $imageheight);
                imagejpeg($dst_img, $newimg, 100);
                imagedestroy($src_img);
                imagedestroy($dst_img);
        }
        elseif ($imagetype == 3)
        {
                $src_img = imagecreatefrompng($oldimg);
                $dst_img = imageCreateTrueColor($dest_width, $dest_height);
                ImageCopyResampled($dst_img, $src_img, 0, 0, 0, 0, $dest_width, $dest_height, $imagewidth, $imageheight);
                imagepng($dst_img, $newimg, 100);
                imagedestroy($src_img);
                imagedestroy($dst_img);
        }
        else
        {
                $src_img = imagecreatefromgif($oldimg);
                $dst_img = imageCreateTrueColor($dest_width, $dest_height);
                ImageCopyResampled($dst_img, $src_img, 0, 0, 0, 0, $dest_width, $dest_height, $imagewidth, $imageheight);
                imagejpeg($dst_img, $newimg, 100);
                imagedestroy($src_img);
                imagedestroy($dst_img);
        }
}

//CHECK IF EMAIL ADDRESS IS VALID OR NOT
function check_email($email)
{
       $email_regexp = "^([-!#\$%&'*+./0-9=?A-Z^_`a-z{|}~])+@([-!#\$%&'*+/0-9=?A-Z^_`a-z{|}~]+\\.)+[a-zA-Z]{2,4}\$";
       return eregi($email_regexp, $email);
}





function check_gurl($name)
{
       $email_regexp = "!([a-zA-Z0-9])$";
       return eregi($email_regexp, $name);
}

function check_field_exists($fvalue,$field,$table)
{
        global $conn;

        $sql="select count(*) as cnt from $table where $field='$fvalue'";
        $res=$conn->execute($sql);
        if($res->fields[cnt]>0) return 1; else return 0;
}

function key_to_info($key)
{
        global $config,$conn;
    
        $sql="select VID,UID,keyword,viewnumber from video where vkey='$key'";
        
        $rs=$conn->execute($sql);
        
        if($rs->recordcount()>0){
                        $list[]=$rs->fields['VID'];
                        $list[]=$rs->fields['UID'];
                        $list[]=$rs->fields['keyword'];
                        $list[]=$rs->fields['viewnumber'];
                        return $list;

                }
                
        else return false;
}
function key_to_info_audio($key)
{
        global $config,$conn;
        
        $sql="select VID,UID,keyword,viewnumber from audio where vkey='$key'";
        $rs=$conn->execute($sql);
        if($rs->recordcount()>0)
        {$list[]=$rs->fields['VID'];$list[]=$rs->fields['UID'];$list[]=$rs->fields['keyword'];$list[]=$rs->fields['viewnumber'];
        return $list;}
        else return false;
}
function delete_vdo($aid,$bid)
{
        global $conn;
        $sql="DELETE from video WHERE VID=$aid and UID=$bid";$conn->execute($sql);
        $sql="DELETE from group_vdo WHERE VID=$aid";$conn->execute($sql);
        $sql="DELETE from favourite WHERE VID=$aid";$conn->execute($sql);
        $ff1=$config[tmburl]."/1_".$aid.".jpg";
        $ff2=$config[tmburl]."/2_".$aid.".jpg";
        $ff3=$config[tmburl]."/3_".$aid.".jpg";
        if(file_exists($ff1)) @unlink($ff1);
        if(file_exists($ff2)) @unlink($ff2);
        if(file_exists($ff3)) @unlink($ff3);
        $sql="select vdoname from video WHERE VID=$aid";$rs=$conn->execute($sql);
        $ff4=$config[vdourl]."/".$rs->fields[vdoname];
        if($rs->recordcount()>0 && file_exists($ff4))@unlink($ff4);
        return "Deleted successfully!";
}
function group_tags($query)
{                
        global $conn;
        $list="";
        $rs=$conn->execute($query);

        while(!$rs->EOF)
        {
             $tarray=explode(" ",$rs->fields['keyword']);
             for($i=0;$i<count($tarray);$i++)         
                         {

                                 if(stristr($list,$tarray[$i])===FALSE)
                                 {
                                         $list.=$tarray[$i]." ";
                                 }
                         }

                         $rs->movenext();
        }

        $list=trim($list);
        $taglist=explode(" ",$list);
        if($list!="")return $taglist;
}
//END
function video_rating($vid,$urate)
{
		global $config,$conn;
		$sql="select ratedby,rate,voter_id from video where VID='$vid'";
		$rs=$conn->execute($sql);
		$voter_id=$rs->fields['voter_id'];		
		
		$flag=false;
		if($config['video_rating']=="Once")
		{
			$niddle="|";
			$niddle.=$_SESSION['UID'];
			$niddle.="|";
			$flag=strstr($voter_id,$niddle);
		}
		
		
		if(!$flag){
			if($voter_id==""){
				$voter_id.= "|";
			}		
			$voter_id.=$_SESSION['UID'];
			$voter_id.= "|";

			
			$t=$rs->fields['ratedby']*$rs->fields['rate'];

			$newrby=($rs->fields['ratedby']+1);
			$newrate=($t+$urate)/$newrby;
			
					$sql="update  video set
					ratedby=$newrby,
					rate=$newrate,
					voter_id='$voter_id' WHERE VID='$vid'";
			$conn->execute($sql);
					return true;
		}
		else{
			return false;
		}
}

function user_rating($uid,$urate)
{
        global $conn;
        $sql="select ratedby,rate from signup  where  UID='$uid'";
        $rs=$conn->execute($sql);
        $t=$rs->fields['ratedby']*$rs->fields['rate'];

                $newrby=($rs->fields['ratedby']+1);
        $newrate=($t+$urate)/$newrby;
        
                $sql="update  signup set
                ratedby=$newrby,
                rate=$newrate WHERE UID='$uid'";
        $conn->execute($sql);
                return ceil($newrate);
}


# Audio ration 
function audio_rating($vid,$urate)
{
        global $conn;
        $sql="select ratedby,rate from audio where VID='$vid'";
        $rs=$conn->execute($sql);
        $t=$rs->fields['ratedby']*$rs->fields['rate'];
        $newrby=($rs->fields['ratedby']+1);
        $newrate=($t+$urate)/$newrby;
        $sql="update  audio set
                ratedby=$newrby,
                rate=$newrate WHERE VID=$vid";
        $conn->execute($sql);
}

function login_data($tbl="")
{
        global $conn;
        $sql="select count(*) as ttl from $tbl";
        $rs=$conn->execute($sql);
        if($rs->fields[ttl]>=10)
        {$sql="select min(LOGID) as log from $tbl";$rs=$conn->execute($sql);
        $sql="delete from $tbl WHERE LOGID=".$rs->fields['log'];$rs=$conn->execute($sql);}
        $sql="insert into $tbl set UID=$_SESSION[UID]";$rs=$conn->execute($sql);
}
function insert_id_to_name($id)
{
        global $config,$conn;

        $sql="select username from signup where UID=$id[un]";
        $rs=$conn->execute($sql);
        return $rs->fields['username'];
}
function insert_tag_to_name($a)
{
        if($a[tag]=="mr") $res="Most Recent";
        elseif($a[tag]=="mv") $res="Most Viewed";
        elseif($a[tag]=="md") $res="Most Discussed";
        elseif($a[tag]=="tf") $res="Top Favourites";
        elseif($a[tag]=="tr") $res="Top Rated";
        elseif($a[tag]=="rf") $res="Recently Featured";
        elseif($a[tag]=="rf") $res="Recently Featured";
        elseif($a[tag]=="rd") $res="Random";
        return $res;
}
//CACULATION OF TIME
function insert_time_range($info)
{
        global $config,$conn;
                
                //print_r($info);

        $present=time();
        $sql="select $info[field] from $info[tbl] where $info[IDFR]=$info[id]";
                //echo $sql; 
        $rs=$conn->execute($sql);
        $addtime=$rs->fields[$info['field']];
        $interval=$present-$addtime;
        if($interval>0)
        {
        $day=$interval/(60*60*24);
        if($day>=1) {$range=floor($day)." days ";$interval=$interval-(60*60*24*floor($day));}
        if($interval>0 && $range=="")
        {
        $hour=$interval/(60*60);
        if($hour>=1) {$range=floor($hour)." hours ";$interval=$interval-(60*60*floor($hour));}
        }
        if($interval>0 && $range=="")
        {
        $min=$interval/(60);
        if($min>=1) {$range=floor($min)." minutes ";$interval=$interval-(60*floor($min));}
        }
        if($interval>0 && $range=="")
        {
        $scn=$interval;
        if($scn>=1) {$range=$scn." seconds ";}
        }
        if($range!="")$range=$range." ago"; else $range="just now";
        return $range;
        }
}
//END
function insert_time_to_date($a)
{
        global $conn;
        $date=date("F j, Y, g:i a",$a['tm']);
        return $date;
}
//VIDEO KEYWORDS
function insert_video_keyword($a)
{
        global $conn;
        $sql="select keyword from video where VID='$a[vid]'";
        $rs=$conn->execute($sql);
        $a=$rs->fields['keyword'];
        $list=explode(" ",$a);
        return $list;
}
# AUDIO KEY WORD
function insert_audio_keyword($a)
{
        global $conn;
        $sql="select keyword from audio where VID='$a[vid]'";
        $rs=$conn->execute($sql);
        $a=$rs->fields['keyword'];
        $list=explode(" ",$a);
        return $list;
}

function insert_list_channel()
{
        global $conn;
        $sql="select * from channel";
        $rs=$conn->execute($sql);
        $i=0;
        while(!$rs->EOF)
        {
        $list[$i]['ch']=$rs->fields['name'];
        $list[$i]['id']=$rs->fields['CHID'];
        $i++;
        $rs->movenext();
        }
        return $list;
}
function insert_video_channel($a)
{
        global $conn;
        if($a[tbl]=="")$sqlx="channel from video where VID='$a[vid]'";
        else $sqlx="channel from $a[tbl] where GID='$a[gid]'";
        $sql="select $sqlx";
        $rs=$conn->execute($sql);
        $a=$rs->fields['channel'];
        if($a!="")
        {
        $temp=explode("|",$a);
        if(count($temp)>=1) for($i=1;$i<count($temp);$i++) $list.=" or CHID=".$temp[$i];
        $sql="select CHID,name from channel where CHID=$temp[0] $list";
        $rsx=$conn->execute($sql);
        $res=$rsx->getrows();
        return $res;
        }
}
function insert_audio_channel($a)
{
        global $conn;
        if($a[tbl]==""){
                        $sqlx="channel from audio where VID='$a[vid]'";
                }
        else{
                        $sqlx="channel from $a[tbl] where GID='$a[gid]'";
                }

        $sql="select $sqlx";
        $rs=$conn->execute($sql);
        $a=$rs->fields['channel'];
        if($a!="")
        {
        $temp=explode("|",$a);
        if(count($temp)>=1) for($i=1;$i<count($temp);$i++) $list.=" or CHID=".$temp[$i];
        $sql="select CHID,name from channel where CHID=$temp[0] $list";
        $rsx=$conn->execute($sql);
        $res=$rsx->getrows();
        return $res;
        }
}


function insert_show_rate($a)
{
        global $conn,$config;
        
                $rate=ceil($a['rte']);

        $cnt=floor($rate/2);

        for($i=0;$i<$cnt;$i++)$list.="<img src='$config[imgurl]/star.gif' width=15>&nbsp;";
        for($i=0;$i<(5-$cnt);$i++)
        {
                        if($rate-($cnt*2)==1){$list.="<img src='$config[imgurl]/half_star.gif' width=15>";$rate=0;}
                        else $list.="<img src='$config[imgurl]/blank_star.gif'>";
        }
        if($rate>0) return $list; else return "Not yet rated";
}



function insert_row_count($a)
{
        global $conn;
        $sql="select count(*) as cnt from $a[tbl] where GID='$a[gid]'";
        $res=$conn->execute($sql);
        return $res->fields['cnt'];
}

function insert_channel_count($a)
{
        global $conn;
        $dt=date("Y-m-d");
        $sql="select count(*) as dytotal from video WHERE channel like '%$a[cid]%' and adddate='$dt'";
        $rs=$conn->execute($sql);
        $list[0]=$rs->fields['dytotal'];
        $sql="select count(*) as chtotal from video WHERE channel like '%$a[cid]%'";
        $rs=$conn->execute($sql);
        $list[1]=$rs->fields['chtotal'];
        $sql="select count(*) as grtotal from group_own WHERE channel like '%$a[cid]%'";
        $rs=$conn->execute($sql);
        $list[2]=$rs->fields['grtotal'];

        return $list;
}
function insert_get_photo($a)
{
        global $conn;
        $sql="select max(VID) as vid from video where UID=$a[uid]";
        $rs=$conn->execute($sql);
        return $rs->fields['vid'];
}

function insert_video_info($a)
{
        global $conn;
        $sql="select * from video where VID='$a[vid]'";
        $rs=$conn->execute($sql);
       $x=$rs->getarray();
          
                return $x;

}

function insert_audio_info($a)
{
        global $conn;
        $sql="select * from audio where VID='$a[vid]'";
        $rs=$conn->execute($sql);
        return $rs->getarray();
}


function insert_comment_info($a)
{
        global $conn;
        $sql="select * from comments where VID='$a[vid]'";
        $rs=$conn->execute($sql);
        return $rs->getarray();
}
function insert_comment_info_audio($a)
{
        global $conn;
        $sql="select * from comments_audio where VID='$a[vid]'";
        $rs=$conn->execute($sql);
        return $rs->getarray();
}

function insert_comment_count($a)
{
        global $conn;
        $sql="select count(*) as ttl from comments where VID='$a[vid]'";
        $rs=$conn->execute($sql);
        return $rs->fields['ttl'];
}

function insert_comment_count_audio($a)
{
        global $conn;
        $sql="select count(*) as ttl from comments_audio where VID='$a[vid]'";
        $rs=$conn->execute($sql);
        return $rs->fields['ttl'];
}

function insert_video_count($a)
{
        global $conn;
        if($a[type]=="public")$add="and type='$a[type]'";
        if($a[type]=="private")$add="and type='$a[type]'";
        $sql="select count(*) as ttl from video where UID=$a[uid] $add";
        $rs=$conn->execute($sql);
        return $rs->fields['ttl'];
}

function insert_audio_count($a)
{
        global $conn;
        if($a[type]=="public")$add="and type='$a[type]'";
        if($a[type]=="private")$add="and type='$a[type]'";
        $sql="select count(*) as ttl from audio where UID=$a[uid] $add";
        $rs=$conn->execute($sql);
        return $rs->fields['ttl'];
}

function insert_favour_count($a)
{
        global $conn;
        $sql="select count(*) as ttl from favourite where UID='$a[uid]'";
        $rs=$conn->execute($sql);
        return $rs->fields['ttl'];
}

function insert_favour_count_audio($a)
{
        global $conn;
        $sql="select count(*) as ttl from favourite_audio where UID='$a[uid]'";
        $rs=$conn->execute($sql);
        return $rs->fields['ttl'];
}



function insert_playlist_count($a)
{
        global $conn;
        $sql="select count(*) as ttl from playlist where UID='$a[uid]'";
        $rs=$conn->execute($sql);
        return $rs->fields['ttl'];
}

function insert_msg_count()
{
        global $conn;
        $sql="select count(*) as ttl from pm where receiver='$_SESSION[USERNAME]' and seen=0 and inbox_track=2";
        $rs=$conn->execute($sql);
        return $rs->fields['ttl']+0;
}

function insert_friends_count($a)
{
        global $conn;
        $sql="select count(*) as ttl from friends where UID='$a[uid]' and friends_status='Confirmed'";
        $rs=$conn->execute($sql);
        return $rs->fields['ttl'];
}

function insert_5users_count($a)
{
        global $conn;
        if($_SESSION[UID]!="") $add="";
        $sql="select distinct UID from $a[tbl] $add order by LOGID desc limit 5";
        $rs=$conn->execute($sql);
                
        return $rs->getarray();
}

function insert_group_count($a)
{
        global $conn;
        if($a[chid]!="")
        {
                $from ="group_own";
                $add1="where channel like '%|$a[chid]|%' ";
        }
        if($a[uid]!="")
        {
                $add1="where m.GID=o.GID and m.MID=$a[uid]";
                $from="group_own as o, group_mem as m";
        }
        if($a[type]=="public")$add2="and type='$a[type]'";
        if($a[type]=="private")$add2="and type='$a[type]'";
        $sql="select count(*) as ttl from $from $add1 $add2";
        //count(m.GID) as total from group_own as o, group_mem as m WHERE m.GID=o.GID and m.MID=$_REQUEST[UID]
        $rs=$conn->execute($sql);
        return $rs->fields['ttl'];
}
function insert_group_info_count($a)
{
        global $conn;
        $sql="select count(*) as ttl from $a[tbl] where GID=$a[gid] $a[query]";
        $rs=$conn->execute($sql);
        return $rs->fields['ttl'];
}
function insert_topic_count($a)
{
        global $conn;
        $sql="select count(*) as ttl from group_tps where GID=$a[GID] and approved='yes'";
        $rs=$conn->execute($sql);
        return $rs->fields['ttl'];
}
function insert_post_count($a)
{
        global $conn;
        $sql="select count(*) as ttl from group_tps_post where TID=$a[TID]";
        $rs=$conn->execute($sql);
        return $rs->fields['ttl'];
}
function insert_group_img($a)
{
        global $conn;
        $sql = "select * from group_own where GID='$a[gid]'";
        $rs = $conn->execute($sql);
        if($rs->fields['gimage']=='owner_only')
        {
                return $rs->fields['gimage_vdo'];
        }
        else
        {
                $sql="select VID from $a[tbl] where GID='$a[gid]' order by AID desc limit 1";
                $res=$conn->execute($sql);
                return $res->fields['VID'];
        }

}

function insert_member_img($a)
{
        global $conn;
        $sql="select VID from video where UID='$a[UID]' order by VID desc limit 1";
        $res=$conn->execute($sql);

        if ($res->fields['VID'] == "")
                echo "<IMG class=moduleEntryThumb height=90 src='images/no_videos_groups.gif' width=120>";
        else
                echo "<IMG class=moduleEntryThumb height=90 src='thumb/1_".$res->fields['VID'].".jpg' width=120>";
}



function insert_check_group_own($a)
{
        global $conn;
        $sql="select OID from group_own where GID=$a[gid]";
        $rs=$conn->execute($sql);
        return $rs->fields['OID'];
}
function insert_check_group_mem($a)
{
        global $conn;
        if($_SESSION['UID']!=""){
        $sql="select count(*) as cnt from group_mem where GID=$a[gid] and MID=$_SESSION[UID]";
        $rs=$conn->execute($sql);
        }
        if($_SESSION['UID']!="")$rss=$rs->fields['cnt'];else $rss=0;
        return $rss;
}
function insert_home_info()
{
        global $conn;
        if($_SESSION['UID']!="")
        {
        $sql="select video_viewed,profile_viewed,watched_video from signup WHERE UID=$_SESSION[UID]";
        $rs=$conn->execute($sql);
        $rss=$rs->getarray();
        }
        return $rss;
}

/*function insert_friends_count($a)
{
        global $conn;
        if($_SESSION['UID']!="")
        {
        $sql="select count(*) as cnt from relation WHERE (FAID=$_SESSION[UID] or FBID=$_SESSION[UID]) and status='yes'";
        $rs=$conn->execute($sql);
        }
        return $rs->fields['cnt'];
}*/
function insert_frndreq_count($a)
{
        global $conn;
        if($_SESSION['UID']!="")
        {
                $sql="select count(*) as cnt from friends WHERE FID='$_SESSION[UID]' and friends_status='Pending'";
                $rs=$conn->execute($sql);
        }
        
        return $rs->fields['cnt']+0;
}

function insert_timediff($var)
{
        $mytime = strtotime($var['time']);
        $now = time();

        $diff = $now-$mytime;
        $second = $diff%60;
        $minutes = ($diff/60)%60;
        $hours = ($diff/3600)%24;
        $days = ($diff/(3600*24))%30;
        $months = ($diff/(3600*24*30))%12;
        $years = ($diff/(3600*24*30*12))%10000;
        
        $x = array();
        $x['days']=$days;
        $x['hours']=$hours;
        $x['minutes']=$minutes;
        $x['seconds']=$second;

        if($years==1)
                echo "$years year ago";
        elseif($years>1)
                echo "$years years ago";
        elseif($months==1)
                echo "$months month ago";
        elseif($months>1)
                echo "$months months ago";
        elseif($days==1)
                echo "$days day ago";
        elseif($day>1)
                echo "$days days ago";
        elseif($hours==1)
                echo "$hours hour ago";
        elseif($hours>1)
                echo "$hours hours ago";
        elseif($minutes==1)
                echo "$minutes minute ago";
        elseif($minutes>1)
                echo "$minutes minutes ago";
        elseif($second==1)
                echo "$second second ago";
        elseif($second>1)
                echo "$second seconds ago";

}

/*
        Calculate time difference from $latest_time and $mytime.
        If $latest_time is empty then get difference from current time.
        Time Format: yyyy-mm-dd hh:mm:ss
*/
function timediff($mytime, $latest_time="")
{
        $time1 = strtotime($mytime);

        if($latest_time=="")
                $time2 = time();
        else
                $time2 = strtotime($latest_time);

        $diff = $time2-$time1;
        $second = $diff%60;
        $minutes = ($diff/60)%60;
        $hours = ($diff/3600)%24;
        $days = ($diff/(3600*24))%30;
        $x = array();
        $x['days']=$days;
        $x['hours']=$hours;
        $x['minutes']=$minutes;
        $x['seconds']=$second;

        return $x;
}

/* To add item in a field seperating with | pipe */
function add_item($table, $field, $query, $new)
{
        global $conn;
        
        $sql = "select $field from $table where $query";
        $rs = $conn->execute($sql);
        $type = explode("|", $rs->fields[$field]);
        $type[] = $new;
        $type = array_unique($type);
        sort($type);
        $new_type = implode("|", $type);
        $conn->execute("update $table set $field='$new_type|' where $query");
}

/* To remove item in a field seperated with | pipe */
function remove_item($table, $field, $query, $item)
{
        global $conn;
        $sql = "select $field from $table where $query";
        $rs = $conn->execute($sql);
        $new_type = str_replace("|$item|", "|", $rs->fields[$field]);
        $conn->execute("update $table set $field='$new_type' where $query");
}

function insert_showlist($v)
{
        global $conn;
        $sql = "select friends_type from friends where id=$v[id]";
        $rs = $conn->execute($sql);
        $type = str_replace("All|", "", $rs->fields['friends_type']);
        $type = str_replace("All", "", $type);
        $type = str_replace("|", ", ", $type);
        return $type;
}

/* Get value from a field
       {insert name=getfield assign=myfield field=$field table=$table qfield=$qfield qvalue=$qvalue order=$order}
*/
function insert_getfield($v)
{
        global $conn;
        $sql = "select $v[field] from $v[table] where $v[qfield]='$v[qvalue]' $v[order]";

        $rs = $conn->execute($sql);
        return $rs->fields[ $v['field'] ];
}

function insert_format_size($v)
{
        $size = $v['size'];
        if($v['type']=="byte")
        {

        }
        else
        {
                if($size<1024)
                        $output = round($size,2) . " MB";
                elseif($size<1024*1024)
                        $output = round($size/1024,2) . " GB";
        }

        echo $output;
}

function insert_advertise($v)
{
        global $conn;
        $sql = "select adv_text from adv where adv_name='$v[adv_name]' and adv_status='Active'";
        $rs = $conn->execute($sql);
        echo $rs->fields['adv_text'];
}

function insert_adv_status($v)
{
        global $conn;
        $sql = "select adv_status from adv where adv_name='$v[adv_name]'";
        $rs = $conn->execute($sql);

        return $rs->fields['adv_status'];
}

function check_expirity()
{
        $date = "2006-04-15";
        if(date("Y-m-d")>=$date)
        {
                echo "<br><br><font color=red><center><h1>The site is expired</h1></center></font>";
                exit;
        }
}

function upload_jpg($HTTP_POST_FILES, $var_name, $file_name, $img_width=128, $dir="upload/", $rename="")
{
        if($HTTP_POST_FILES[$var_name]["name"])
        {
                $file_url = $dir . uniqid("").tmp;
                $ext = strrchr($HTTP_POST_FILES[$var_name]["name"], '.');
                move_uploaded_file($HTTP_POST_FILES[$var_name]["tmp_name"], $file_url);

                if($HTTP_POST_FILES[$var_name]["error"]>0)
                {
                        $err = "Error occurs while uploading file";
                }
                elseif(strtolower($ext)=='.jpg')
                {
                        $img = @imagecreatefromjpeg($file_url);
                        $size = @getimagesize($file_url);
                        $width= $size[0];
                        $height= $size[1];

                        if ($width>$img_width)
                        {
                                $percentage = $img_width / $width;
                                $width *= $percentage;
                                $height *= $percentage;

                                $img_r = @imagecreatetruecolor ($width, $height);
                                @imagecopyresampled($img_r, $img, 0, 0, 0, 0, $width, $height, $size[0], $size[1]);
                        }
                        else
                        {
                                $img_r = $img;
                        }

                        $pic_name = $dir. $file_name;
                        @ImageJpeg($img_r, $pic_name, 100);
 //                       rename("$pic_name", "$dir"."$rename");
                        @unlink($file_url);
                }
                else
                {
                        @unlink($file_url);
                        $err = "File must be as .jpg format";
                }
        }

        return $err;
}


//Validate Credit Card Info Form For Member Area
function validate_billing($VALS)
{
        $msg="";

        //CC VALIDATION
        if($VALS['cc_fname_txt']=="")
                $msg="Please Enter First Name Appearing on Credit Card.";
        elseif($VALS['cc_lname_txt']=="")
                $msg="Please Enter Lirst Name Appearing on Credit Card.";
        elseif($VALS['cc_email_txt']=="")
                $msg="Please Enter Your Email Address";
        elseif(!check_email($VALS['cc_email_txt']))
                $msg="Please Provide a Valid Email Address";
        elseif($VALS['cc_num_txt']=="")
                $msg="Please Enter Credit Card number.";
        elseif(validateCCnum($VALS['cc_num_txt'],$VALS['cc_type_box'])==false)
                $msg="Please Provide Valid Credit Card Number.";

        //CC ADDRESS VALIDATION
        elseif($VALS['cc_address1_txt']=="")
                $msg="Please Enter Billing Street Address Properly.";
        elseif($VALS['cc_city_txt']=="")
                $msg="Please Enter The Billing City Name.";
        elseif($VALS['cc_zipcode_txt']=="")
                $msg="Please Enter Billing Zip Code.";
        elseif(strlen($VALS['cc_zipcode_txt'])!=5)
                $msg="Please Enter Valid US Zip Code For Billing.";

        return $msg;
}

//GET CC MONTH BOX
function cc_month($sel="")
{
        $month="";
        for($i=1;$i<=12;$i++)
        {
                if($i<=9)
                        $j="0".$i; else $j=$i;
                if($i==$sel)
                        $month.="<option value='$i' selected>$j</option>";
                else
                        $month.="<option value='$i'>$j</option>";
        }
        return $month;
}

//GET CC MONTH BOX
function cc_year($sel="")
{
        $year="";
        for($i=2004;$i<=2020;$i++)
        {
                if($i==$sel)
                        $year.="<option value='$i' selected>$i</option>";
                else
                        $year.="<option value='$i'>$i</option>";
        }
        return $year;
}

//check_expirity();
/* $var[space], $var[bw]*/
function check_subscriber($space=0)
{
        global $conn;
        $sql = "select * from subscriber where UID='$_SESSION[UID]'";
                //echo$sql . "<br>"; 
        $rs = $conn->execute($sql);
        $subs = $rs->getrows();
        
        $sql = "select * from package where pack_id=".$subs[0]['pack_id'];
                //echo $sql; 
        $rs = $conn->execute($sql);
        $pack = $rs->getrows();
        
        if($pack[0]['video_limit']!=0 and $subs[0]['total_video']>=$pack[0]['video_limit'])
        {
                $err = "You cannot upload more than ".$pack[0]['video_limit']." videos";
                $type = "limit";
        }
        elseif($subs[0]['used_bw']+$space>=$pack[0]['bandwidth'])
        {
                $err = "You cannot use more than ".format_size($pack[0]['bandwidth'])." bandwidth per month";
                $type = "bw";
        }
        elseif($subs[0]['used_space']+$space>=$pack[0]['space'])
        {
                $err = "You cannot upload more than ".format_size($pack[0]['space'])." space";
                $type = "space";
        }
        
        if($err!="")
                header("Location: upgrade.php?type=$type&err=$err");

/*
        echo "<pre>";
        print_r($subs[0]);
        print_r($pack[0]);
        echo "</pre>";
*/
}

function insert_subscriber_info($v)
{
        global $conn;
        $sql = "select s.pack_id, pack_name, used_space, used_bw, total_video, expired_time from subscriber s, package p where UID=$v[uid] and s.pack_id=p.pack_id";
        $rs = $conn->execute($sql);
        
        $subscriber = $rs->getrows();
        
        return $subscriber[0];
}

function insert_id_to_uploaddate($v)
{
       
                global $conn;
                $sql="SELECT  adddate FROM video WHERE VID='$v[un]'";
                $rss=$conn->execute($sql);
                 $list=explode('-',$rss->fields['adddate']);

                 print_r($list[2]);print_r('-');
                 print_r($list[1]);print_r('-');
                  print_r($list[0]);
                //$my_array=$rss->getarray();
                //print_r($my_array);


                
        #$sql = "select s.pack_id, pack_name, used_space, used_bw, total_video, expired_time from subscriber s, #package p where UID=$v[uid] and s.pack_id=p.pack_id";
        #$rs = $conn->execute($sql);
        
       # $subscriber = $rs->getrows();
        
        #$return $subscriber[0];
}


function insert_pollanswer($v){
        return explode("|",$v['anspot']);
        
}




	function insert_pollresult($id){
		global $conn;
	
		# GET ANSWER OF VOTE CATE GORY
		$sql="SELECT * from poll_question  where poll_id=' $id[pollid]'";
		$rsc=$conn->execute($sql);
		$poll_answer=$rsc->fields['poll_answer']; 
		
		# SPLIT IN ARRAY 
		$list=explode("|",$poll_answer);

		#COUT OF EACH CATEGORY
		for($i=0;$list[$i];$i++){
			$sql="select count(*) as poll_id from vote_result WHERE answer='" . $list[$i] . "'"  ;
			$rs=$conn->execute($sql);
			$Countlist[$i]=$rs->fields['poll_id'];
			
			
		}


		# CALCULATE THE PARCENTAGE 
		return clulateParcentage($Countlist);
	}


# PARCENTAGE CALCULATING  FUNCTION 
	function clulateParcentage($Countlist){
		
		# Get Totla
		$totla=0;
		for($i=0;$Countlist[$i];$i++){
			$totla=$totla+$Countlist[$i];
			
		}
		# Get parcentage
		for($i=0;$Countlist[$i];$i++){
			$Countlist[$i]=ceil(($Countlist[$i]*100)/$totla);
			
		}


		return $Countlist;
	}







function fx_replace($key, $value,$new_value){        
        $re_value=str_replace($key,$new_value,$value);
        return $re_value;


}

function checklogin(){
        if ($_SESSION[UID]!="")return true;
        else false;
}


# convertine row to col
////*
/*$myarray = array (
    "0"  => array(11,12,13,14),
    "1" => array(21,22, 23,24),
    "2"   => array(31,32,33,34),
    "3"   => array(41,42,43,44)
	);

$myarray=array_rowtocol($myarray);
 for($j=0;$j<=3;$j++)
	  {
	 		echo "[" .  $myarray[0][$j] . "]" ;
	  }

*////*/

/*
function array_rowtocol($myarray){
  for($i=0;$myarray[$i][0];$i++)
  {
	  for($j=0;$j<=count($myarray[0]);$j++)
	  {
	 		  $myarray2[$i][$j] = $myarray[$j][$i];
	  }
	  
  }
  return $myarray2;
}
*/


?>
