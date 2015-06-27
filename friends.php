<?php
include("include/config.php");
session_start();
include("include/function.php");
chk_member_login();

if($_REQUEST['add_list'])
{
        add_item("signup", "friends_type", "UID=$_SESSION[UID]", $_REQUEST['add_list']);
        header("Location: friends.php");
}

if($_REQUEST['del_list'])
{
        remove_item("signup", "friends_type", "UID = $_SESSION[UID]", $_REQUEST[del_list]);
        $sql = "select id from friends where UID=$_SESSION[UID]";
        $rs = $conn->execute($sql);
        while(!$rs->EOF)
        {
                remove_item("friends", "friends_type", "id = ".$rs->fields['id'], $_REQUEST[del_list]);
                $rs->movenext();
        }
        header("Location: friends.php");
}

if($_REQUEST['action_name'])
{
        if($_REQUEST[action_name]=="delete")
        {
			
                while(list($k, $v) = @each($_REQUEST[AID]))
                {
                        $conn->execute("delete from friends where id=$v");
                }
                header("Location: friends.php");
        }
        else
        {
			
                $sql = "select friends_type from signup where UID=$_SESSION[UID]";
				
                $rs = $conn->execute($sql);
                $type = explode("|", $rs->fields['friends_type']);
				 
                $cmd = explode("_", $_REQUEST[action_name]);
				
                if($cmd[0]=="add" and $cmd[1]!="")
                {
                        while(list($k, $v) = @each($_REQUEST[AID]))
                        {
							echo $v;
                                add_item("friends", "friends_type", "id = $v", $type[$cmd[1]]);
                        }
                }
                elseif($cmd[0]=="delete" and $cmd[1]!="")
                {		
					  while(list($k, $v) = @each($_REQUEST[AID]))
                      {	
                            remove_item("friends", "friends_type", "id = $v", $type[$cmd[1]]);
                      }
                }
                header("Location: friends.php");
        }
}


if($_REQUEST[invite_signup]!="")
{

        for($i=0;$i<count($friends_email);$i++)
        {
                if($friends_email[$i]!="")
                {
                $emails[]=$friends_email[$i];
                $tag="yes";
                if($friends_fname[$i]==""){$err="Please provide the firstname of your email.";break;}
                $fnames[]=$friends_fname[$i];
                $rtype[]=$type[$i];
                }
        }
        if($tag!="yes")$err="Please provide at least an e-mail";


        if($err=="")
        {
			$to=$_SESSION[EMAIL];
			$name=$_SESSION[USERNAME];
			$from=$config[amdin_email];
			$subj="Invitation";
			STemplate::assign('message',$message);
			STemplate::assign('freqkey',base64_encode($_SESSION[UID]));

			for($i=0;$i<count($emails);$i++)
			{
				$sql="insert into relation set FAID=$_SESSION[UID], type='$rtype[$i]', e_mail='$emails[$i]'";
				$conn->execute($sql);
				echo $sql;
				$id=mysql_insert_id();
				STemplate::assign('id',base64_encode($id));
				STemplate::assign('firstname',$fnames[$i]);
				$mailbody=STemplate::fetch('emails/invite_email.tpl');
				$mailbody=nl2br($mailbody);
				mailing($to,$name,$from,$subj,$mailbody);

			}
		}
}


//Paging
$listing = $config['items_per_page'];

if($_REQUEST[view]!="" and $_REQUEST[view]!="All")
        $query = "and friends_type like '%$_REQUEST[view]%'";

if($_REQUEST[page]=="")
{
     $page = 1;
}else
{
	$page=$_REQUEST[page];
}

	
$sql = "select count(*) as total from friends where UID=$_SESSION[UID] $query";
$rs = $conn->Execute($sql);

$total = $rs->fields['total'];
$tpage = ceil($total/$listing);
if($tpage==0) $spage=$tpage+1;
else $spage = $tpage;
$startfrom = ($page-1)*$listing;
$start = $startfrom + 1;
$last = ($startfrom+$listing>$total)?$total:$startfrom+$listing;
$link = "<b>$start - $last of $total</b>&nbsp;&nbsp;";
$browse = "";
for($i=1; $i<=$tpage; $i++)
{
        $browse .= "&nbsp;<a href='friends.php?page=$i&sort=$sort'>$i</a>&nbsp;";
}

/*
if($tpage>1)
{
        $nextpage=$page+1;
        $prevpage=$page-1;
        $prevlink="<a href='friends.php?status=$status&page=$prevpage&sort=$sort'>Previous</a>";
        $nextlink="<a href='friends.php?status=$status&page=$nextpage&sort=$sort'>Next</a>";
        $np = "";
        if($page==$tpage)
                $link.="&nbsp;&nbsp;|&nbsp;$prevlink";
        elseif($tpage>$page && $page>1)
                $link.="&nbsp;&nbsp;|&nbsp;$prevlink &nbsp;|&nbsp;$nextlink";
        elseif($tpage>$page && $page<=1)
                $link.="&nbsp;&nbsp;|&nbsp;$nextlink";
}
*/

if($_REQUEST['sort']=="name")
        $sort = " order by friends_name ";
else
        $sort = " order by id ";



$sql = "select DISTINCT * from friends where UID=$_SESSION[UID] $query $sort limit $startfrom, $listing";
$rs = $conn->execute($sql);
$friends = $rs->getrows();

STemplate::assign('friends', $friends);
STemplate::assign('total', count($friends));

$sql = "select DISTINCT * from friends where UID=$_SESSION[UID]";
$rs = $conn->execute($sql);

STemplate::assign('total_friends', count($rs->getrows()));

$sql = "select friends_type from signup where UID='$_SESSION[UID]'";
$rs = $conn->execute($sql);

$ftype = explode("|", $rs->fields['friends_type']);
sort($ftype);

$ftype_ops = "";
for($i=0; $i<count($ftype); $i++)
{
	if($ftype[$i]!="")
	{
        if($_REQUEST[view]==$ftype[$i])
		{
			$sel = "selected";
		}
		else
		{
			$sel="";
		}

        $ftype_ops .= "<option value='".$ftype[$i]."' $sel>".$ftype[$i]."</option>";
	}
}
STemplate::assign('ftype_ops',$ftype_ops);


$sql = "select friends_type from signup where UID=$_SESSION[UID]";
$rs = $conn->execute($sql);
$type = explode("|", $rs->fields['friends_type']);
$type = array_splice($type, 1-count($type));

$action_ops = " <OPTION value='' selected>--- Select Action ---</OPTION>
                <OPTION disabled>Add to list:</OPTION>";

for($i=0; $i<count($type); $i++)
{
        $action_ops .= "<option value='add_".($i+1)."'>&nbsp;&nbsp;&nbsp;&nbsp;$type[$i]</option>";
}
$action_ops .= "<OPTION disabled>delete from list:</OPTION>";

for($i=0; $i<count($type); $i++)
{
        $action_ops .= "<option value='delete_".($i+1)."'>&nbsp;&nbsp;&nbsp;&nbsp;$type[$i]</option>";
}
$action_ops .= "<OPTION value='delete'>Delete Selected</OPTION>";
                                    
STemplate::assign('action_ops', $action_ops);


STemplate::assign(err,$err);
STemplate::assign('msg',$msg);
STemplate::assign('link', $link);
STemplate::assign('browse', $browse);
STemplate::assign('head_bottom',"friendlinks.tpl");
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('search.tpl');
STemplate::display('friends.tpl');
STemplate::display('footer.tpl');
?>
