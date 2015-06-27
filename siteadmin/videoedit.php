<?php
        include("../include/config.php");
        include("../include/function.php");

        if($_REQUEST['submit'])
        {
                $sql = "update video set
                                title = '$_REQUEST[title]',
                                description = '$_REQUEST[description]',
                                featuredesc = '$_REQUEST[featuredesc]',
                                type = '$_REQUEST[type]',
                                featured = '$_REQUEST[featured]',
                                be_comment = '$_REQUEST[be_comment]',
                                be_rated = '$_REQUEST[be_rated]',
                                embed = '$_REQUEST[embed]'
                        where VID=$_REQUEST[VID]";
                $conn->execute($sql);
                
                if(count($_REQUEST[channel])<1 or count($_REQUEST[channel])>3)
                $err = "Please check (1 to 3) channel/s.";
                else
                {
                        $sql = "update video set
                                channel = '0|".implode("|",$_REQUEST[channel])."|0'
                        where VID=$_REQUEST[VID]";
                        $conn->execute($sql);
                }
                if($err == "")
                        header("Location: videoedit.php?action=edit&VID=$_REQUEST[VID]&page=$_REQUEST[page]&msg=Video+information+updated+successfully");
        }

        $rs = $conn->execute("select * from video where VID=$_REQUEST[VID]");
        $video = $rs->getrows();
        
$mych = explode("|",$video[0]['channel']);
$ch = insert_list_channel();
for($i=0; $ch[$i]['ch']!=""; $i++)
{
        if(in_array($ch[$i]['id'], $mych))
                $checked = "checked";
        else
                $checked = "";
        $ch_checkbox .= "<input type=checkbox name=channel[] value=".$ch[$i]['id']." $checked>".$ch[$i]['ch']."</input><br>";
}
STemplate::assign('ch_checkbox',$ch_checkbox);


        if($video[0]['type']=="public")
                $publicsel = "selected";
        else
                $privatesel = "selected";
        $type_box = "<option value='public' $publicsel>Public</option>
                          <option value='private' $privatesel>Private</option>";
        STemplate::assign('type_box', $type_box);
        
        if($video[0]['featured']=="yes")
                $yessel = "selected";
        else
                $nosel = "selected";
        $featured_box = "<option value='yes' $yessel>Yes</option>
                          <option value='no' $nosel>No</option>";
        STemplate::assign('featured_box', $featured_box);
        
        if($video[0]['be_comment']=="yes")
                $yessel = "selected";
        else
                $nosel = "selected";
        $comment_box = "<option value='yes' $yessel>Yes</option>
                          <option value='' $nosel>No</option>";
        STemplate::assign('comment_box', $comment_box);
        
        if($video[0]['be_rated']=="yes")
                $yessel = "selected";
        else
                $nosel = "selected";
        $rate_box = "<option value='yes' $yessel>Yes</option>
                          <option value='' $nosel>No</option>";
        STemplate::assign('rate_box', $rate_box);
        
        if($video[0]['embed']=="enabled")
                $yessel = "selected";
        else
                $nosel = "selected";
        $embed_box = "<option value='enabled' $yessel>Enable</option>
                          <option value='' $nosel>Disable</option>";
        STemplate::assign('embed_box', $embed_box);

        if($_REQUEST[msg]!="") $msg=$_REQUEST[msg];
        Stemplate::assign('video', $video[0]);
        Stemplate::assign('err',$err);
        Stemplate::assign('msg',$msg);
        STemplate::display("siteadmin/videoedit.tpl");
?>
