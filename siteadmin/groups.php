<?php
        include("../include/config.php");
        include("../include/function.php");
        
        $listing_per_page = 20;

        /* All Groups */
        if($_REQUEST['a']=="" or $_REQUEST["a"]=='public' or $_REQUEST["a"]=='private' or $_REQUEST["a"]=='protected')
        {
                //DELETE A group
                if($_REQUEST[action]=="del")
                {
                        $sql="DELETE from group_own where GID=$_REQUEST[gid]";
                        $conn->Execute($sql);
                }

                //MAKE THE SUBQUERY
                if($_REQUEST["a"]=="")
                        $query = "";
                else
                        $query = "where type = '$_REQUEST[a]'";
                        
                if($_REQUEST['sort']!="")
                        $query.=" order by $_REQUEST[sort]";
                else
                        $query.=" order by GID desc";

                //PAGING
                if($_REQUEST[page]=="")
                $page = 1;
                else
                $page = $_REQUEST['page'];
                $sql = "SELECT count(*) as total from group_own $query";
                $ars = $conn->Execute($sql);
                $total = $ars->fields['total'];
                $grandtotal = $total;
                $tpage = ceil($total/$listing_per_page);
                if($tpage==0) $spage=$tpage+1;
                else $spage = $tpage;
                $startfrom = ($page-1)*$listing_per_page;
                

                $page_no = "";
                for($i=1; $i<=10 and $i<=$tpage; $i++)
                {
                        if($i==$page)
                                $page_no .= "<b class='orange'>$i</b> ";
                        else
                                $page_no .= "<a href='groups.php?a=$_REQUEST[a]&status=$status&page=$i&sort=$sort' class='blue-n'>".$i."</a> ";
                }
                if($page_no!="")
                        $link = "Page $page_no of <b>$spage</b> Pages";
                else
                        $link = "<br><br><br><center>There is no $_REQUEST[a] group available</center><br>";


                if($tpage>1)
                {
                        $nextpage=$page+1;
                        $prevpage=$page-1;
                        $prevlink="<a href='groups.php?a=$_REQUEST[a]&status=$status&page=$prevpage&sort=$sort'><img src='../images/icon/previous.gif' title='Previous' alt='Previous' border='0' style='vertical-align: middle;'></a>";
                        $nextlink="<a href='groups.php?a=$_REQUEST[a]&status=$status&page=$nextpage&sort=$sort'><img src='../images/icon/next.gif' title='Next' alt='Next' border='0' style='vertical-align: middle;'></a>";
                        if($page==$tpage)
                                $link.="&nbsp;&nbsp;|&nbsp;$prevlink";
                        elseif($tpage>$page && $page>1)
                                $link.="&nbsp;&nbsp;|&nbsp;$prevlink &nbsp;&nbsp;$nextlink";
                        elseif($tpage>$page && $page<=1)
                                $link.="&nbsp;&nbsp;|&nbsp;$nextlink";
                }

                $sql="SELECT * from group_own $query limit $startfrom, $listing_per_page";
                $rs = $conn->Execute($sql);
                $total = $rs->recordcount()+0;
                $groups = $rs->getrows();

                STemplate::assign('link',$link);
                STemplate::assign('grandtotal',$grandtotal+0);
                STemplate::assign('total',$total+0);
                STemplate::assign('page',$page+0);
                STemplate::assign('groups',$groups);

        }
        /* Search groups */
        elseif($_REQUEST["a"]=="Search")
        {
                if($_REQUEST["groupid"]!=null)
                {
                        if(is_numeric($_REQUEST["groupid"]))
                        {
                                $rs = $conn->execute("select * from group_own where GID=$_REQUEST[groupid]");
                                $group = $rs->getrows();
                                if($group[0]["GID"] == "")
                                        $err = "group does not exists with group id $_REQUEST[groupid]";
                                else
                                        STemplate::assign("group", $group[0]);
                        }
                        else
                                $err = "Enter integer value as group id";
                }
                elseif($_REQUEST["groupname"]!=null)
                {
                        $rs = $conn->execute("select * from group_own where gname='$_REQUEST[groupname]'");
                        $group = $rs->getrows();
                        if($group[0]["GID"] == "")
                                $err = "Group does not exists with name '$_REQUEST[groupname]'";
                        else
                                STemplate::assign("group", $group[0]);
                }
        }

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


        Stemplate::assign('err',$err);
        Stemplate::assign('msg',$msg);
        STemplate::display("siteadmin/groups.tpl");
?>
