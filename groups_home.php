<?php
session_start();
include("include/config.php");
include("include/function.php");

$sql = "select * from group_own where gurl='$_REQUEST[urlkey]'";
$rs = $conn->execute($sql);
$gposting = $rs->fields['gposting'];

STemplate::assign("gposting", $gposting);

$gupload = $rs->fields['gupload'];
STemplate::assign("gupload", $gupload);   
$type = $rs->fields['type'];              
STemplate::assign("type", $type);

if($type = $rs->fields['OID']==$_SESSION['UID']){
        $flag="self";        
}
else{
        $flag="guest";
}

$key1 = md5($_SESSION['UID'].$_REQUEST[urlkey]);


if($key1 == $key){
        STemplate::assign("accept_mem", "true");
}


# Group joning
if($_REQUEST[joingroup]!="")
{
        chk_member_login();
        
        if($type == "protected")
                $approved ="no";
        else
                $approved = "yes";


        $sql="insert into group_mem set GID=$_REQUEST[GRPID], MID=$_SESSION[UID], member_since='".date("Y-m-d H:i:s")."', approved='$approved'";

        $conn->execute($sql);
        if(mysql_affected_rows()==1)
        {
                if($type=="protected")
                        $msg = "You will become the member after owner approval";
                else
                        $msg="You became the member of this group!";
        }
}




if($_REQUEST[leavegroup]!=""){
        $sql="DELETE from group_mem WHERE GID=$_REQUEST[GRPID] and MID=$_SESSION[UID]";
        $conn->execute($sql);
        if(mysql_affected_rows()==1)$msg="Your group membership has been revoked.";
}


if($_REQUEST['apost_TID'] and $_SESSION[UID]==$rs->fields['OID']){
        $sql = "update group_tps set approved='yes' where TID='$_REQUEST[apost_TID]'";
        $conn->execute($sql);
}

if($_REQUEST['unapost_TID'] and $_SESSION[UID]==$rs->fields['OID']){
        $sql = "delete from group_tps where TID='$_REQUEST[unapost_TID]'";
        $conn->execute($sql);
}
                

if($_REQUEST['add_topic']){
        
        if($_REQUEST['topic_title'] != "")
        {
                if($flag=="self")
                {
                        $approved = 'yes';
                }
                else if($gposting=='owner_approve')
                {
                        $approved = 'no';
                }
                else
                {
                        $approved = 'yes';
                }

                $sql = "insert group_tps set
                        GID=$_REQUEST[GID],
                        UID=$_SESSION[UID],
                        addtime='".date("Y-m-d H:i:s")."',
                        title='$_REQUEST[topic_title]',
                        VID='$_REQUEST[topic_video]',
                        approved = '$approved'
                        ";
                $conn->execute($sql);

###  ADDING VIDO FROM LIST
               
         
                if($_REQUEST[topic_video]!=""){
                                                
                      $sql = "insert group_vdo set
                                GID=$_REQUEST[GID],
                                VID=$_REQUEST[topic_video],
                                MID=$_SESSION[UID],
                                approved='yes'
                               ";
                        $conn->execute($sql);
                }    
 
//# END
                


                if($gposting == "owner_approve" && $flag!='self')
                        header("Location: groups_home.php?urlkey=$_REQUEST[urlkey]&msg=Your+topic+will+be+appeared+after+owner+approval");
                else
                        header("Location: groups_home.php?urlkey=$_REQUEST[urlkey]");
        }
}


$sql="SELECT * from group_own WHERE gurl='$_REQUEST[urlkey]'";
$rs = $conn->Execute($sql);
if($rs->recordcount()>0){
        if($_REQUEST[page]=="")
        $page = 1;
        else
        $page=$_REQUEST[page];
        
        $sql = "SELECT count(*) as total from group_tps WHERE GID=".$rs->fields[GID]." limit $config[total_per_ini]";
        $ars = $conn->Execute($sql);
        if($ars->fields['total']<=$config[total_per_ini])$total = $ars->fields['total'];
        else $total = $config[total_per_ini];
        $tpage = ceil($total/$config[items_per_page]);
        if($tpage==0) $spage=$tpage+1;
        else $spage = $tpage;
        $startfrom = ($page-1)*$config[items_per_page];

        $sql="select * from group_tps WHERE GID=".$rs->fields[GID]." limit $startfrom, $config[items_per_page]";
        $rsx = $conn->Execute($sql);
        if($rsx->recordcount()>0){$tarry = $rsx->getrows();
                STemplate::assign('grptps',$tarry);}
        
        $start_num=$startfrom+1;
        $end_num=$startfrom+$rsx->recordcount();

        $page_link="";
        for($k=1;$k<=$tpage;$k++) $page_link.="<a href='groups_home.php?urlkey=$_REQUEST[urlkey]&page=$k&type=$_REQUEST[type]'>$k</a>&nbsp;&nbsp;";

        STemplate::assign('start_num',$start_num);
        STemplate::assign('end_num',$end_num);
        STemplate::assign('page_link',$page_link);
        //END PAGING

        $users = $rs->getrows();
}

/* Fetch recent videos from current group */

if ($users[0][GID]!=""){
$sql = "select * from group_vdo where GID=".$users[0][GID]." and approved ='yes' order by AID desc limit 0, 4";


$rs = $conn->execute($sql);


        while(!$rs->EOF)
        {
        $gvideo[] = $rs->fields['VID'];
        $rs->movenext();
        }
}
if($gvideo[0]!="")
{
        $group_video = implode(",", $gvideo);
        $sql = "select * from video where VID in ($group_video)";
        $rs = $conn->execute($sql);
        $gvideo = $rs->getrows();
        STemplate::assign('gvideo', $gvideo);
}

$sql = "select * from group_mem where GID=".$users[0][GID]." and MID='$_SESSION[UID]'";
$rs = $conn->execute($sql);
$is_mem = $rs->fields['approved'];
STemplate::assign("is_mem", $is_mem);

$sql = "select count(*) as total from group_vdo where approved='no' and GID=".$users[0][GID];
$rs = $conn->execute($sql);
STemplate::assign('total_new_video',$rs->fields['total']+0);

$sql = "select count(*) as total from group_mem where approved='no' and GID=".$users[0][GID];
$rs = $conn->execute($sql);
STemplate::assign('total_new_member',$rs->fields['total']+0);


/* Fetch recent members from current group */
$sql = "select * from group_mem where GID=".$users[0][GID]." and approved ='yes' order by AID desc limit 0, 4";
$rs = $conn->execute($sql);
while(!$rs->EOF)
{
        $gmember[] = $rs->fields['MID'];
        $rs->movenext();
}
if($gmember[0]!="")
{
        $group_member = implode(",", $gmember);
        $sql = "select * from signup where UID in ($group_member)";
        $rs = $conn->execute($sql);
        STemplate::assign('gmember', $rs->getrows());
}

/* Fetch login user video for combobox */
if($_SESSION['UID']!="")
{
        $sql = "select VID, title from video where UID='$_SESSION[UID]' order by VID desc";
        $rs = $conn->execute($sql);

        $video_ops = "<OPTION value='' selected>- Your Videos -</OPTION>";

                while(!$rs->EOF)
        {
                $video_ops .= "<option value=".$rs->fields['VID'].">".$rs->fields['title']."</option>";
                $rs->movenext();
        }
        
                $video_ops .="<OPTION value=''>- Your Favorite Videos -</OPTION>";
        
        $sql = "select VID from favourite where UID='$_SESSION[UID]'";
        $rs = $conn->execute($sql);

        while(!$rs->EOF)
        {
                $fav[] = $rs->fields['VID'];
                $rs->movenext();
        }

        if($fav[0]!="")
        {
                $fav_video = implode(",", $fav);
                $sql = "select VID, title from video where VID in ($fav_video) order by VID desc";
                $rs = $conn->execute($sql);
                while(!$rs->EOF)
                {
                        $video_ops .= "<option value=".$rs->fields['VID'].">".$rs->fields['title']."</option>";
                        $rs->movenext();
                }
        }

                STemplate::assign('video_ops', $video_ops);
}

$add = base64_encode("&urlkey=$_REQUEST[urlkey]");
STemplate::assign('add',$add);

STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('answers',$users);
STemplate::assign('head_bottom',"grouplinks.tpl");
if($_SESSION['UID']!="")STemplate::assign('head_bottom_add',"crglinks.tpl");
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('groups_home.tpl');
STemplate::display('footer.tpl');
?>
