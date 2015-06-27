<?php
        include("../include/config.php");
        include("../include/function.php");
        
        if($_REQUEST['submit'])
        {
                $sql = "update group_own set
                                gname = '$_REQUEST[gname]',
                                keyword = '$_REQUEST[keyword]',
                                gdescn = '$_REQUEST[gdescn]',
                                gurl = '$_REQUEST[gurl]',
                                type = '$_REQUEST[type]',
                                featured = '$_REQUEST[featured]',
                                gupload = '$_REQUEST[gupload]',
                                gposting = '$_REQUEST[gposting]',
                                gimage = '$_REQUEST[gimage]'
                                where GID=$_REQUEST[gid]";
                $conn->execute($sql);

                if(count($_REQUEST[channel])<1 or count($_REQUEST[channel])>3)
                $err = "Please check (1 to 3) channel/s.";
                else
                {
                        $sql = "update group_own set
                                        channel = '0|".implode("|",$_REQUEST[channel])."|0'
                                where GID=$_REQUEST[gid]";
                        $conn->execute($sql);
                }
                if($err == "")
                        header("Location: groupedit.php?action=edit&gid=$_REQUEST[gid]&page=$_REQUEST[page]&msg=User+information+updated+successfully");
        }

        $rs = $conn->execute("select * from group_own where GID=$_REQUEST[gid]");
        $group = $rs->getrows();
        STemplate::assign('country_box',country_box($group[0]['country']));
        
        if($group[0]['type']=="public")
                $pubsel = "selected";
        elseif($group[0]['type']=="private")
                $prisel = "selected";
        elseif($group[0]['type']=="protected")
                $prosel = "selected";
        $type_box = "<option value='public' $pubsel>Public</option>
                          <option value='private' $prisel>Private</option>
                          <option value='protected' $prosel>Protected</option>";
        STemplate::assign('type_box', $type_box);
        
        if($group[0]['gupload']=="immediate")
                $u1sel = "selected";
        elseif($group[0]['gupload']=="owner_approve")
                $u2sel = "selected";
        elseif($group[0]['gupload']=="owner_only")
                $u3sel = "selected";
        $upload_box = "<option value='immediate' $u1sel>immediate</option>
                          <option value='owner_approve' $u2sel>owner_approve</option>
                          <option value='owner_only' $u3sel>owner_only</option>";
        STemplate::assign('upload_box', $upload_box);
        
        if($group[0]['gposting']=="immediate")
                $p1sel = "selected";
        elseif($group[0]['gposting']=="owner_approve")
                $p2sel = "selected";
        elseif($group[0]['gposting']=="owner_only")
                $p3sel = "selected";
        $posting_box = "<option value='immediate' $p1sel>immediate</option>
                          <option value='owner_approve' $p2sel>owner_approve</option>
                          <option value='owner_only' $p3sel>owner_only</option>";
        STemplate::assign('posting_box', $posting_box);
        
        if($group[0]['gimage']=="immediate")
                $i1sel = "selected";
        elseif($group[0]['gimage']=="owner_only")
                $i2sel = "selected";
        $icon_box = "<option value='immediate' $i1sel>immediate</option>
                          <option value='owner_only' $i2sel>owner_only</option>";
        STemplate::assign('icon_box', $icon_box);
        
        if($group[0]['featured']=="yes")
                $activesel = "selected";
        else
                $inactivesel = "selected";
        $featured_box = "<option value='yes' $activesel>Yes</option>
                          <option value='no' $inactivesel>No</option>";
        STemplate::assign('featured_box', $featured_box);
        

$mych = explode("|",$group[0]['channel']);
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


        Stemplate::assign('group', $group[0]);
        Stemplate::assign('err',$err);
        Stemplate::assign('msg',$msg);
        STemplate::display("siteadmin/groupedit.tpl");
?>
