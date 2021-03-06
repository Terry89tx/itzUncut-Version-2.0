<?php
        include("../include/config.php");
        include("../include/function.php");

        $sql = "select name from channel where CHID=$_REQUEST[chid]";
        $rs = $conn->execute($sql);
        STemplate::assign('channel_name', $rs->fields['name']);

        $listing_per_page = 20;

        /* All Groups */
        if($_REQUEST["a"]=="")
        {
                //DELETE A group
                if($_REQUEST[action]=="del")
                {
                        $sql = "select channel from group_own where GID=$_REQUEST[gid]";
                        $rs = $conn->execute($sql);
                        $ch = explode("|", $rs->fields['channel']);
                        if(count($ch)<=3)
                                $err = "This group contains only one channel. It cannot be removed from this group.";
                        else
                        {
                                $new_type = str_replace("|$_REQUEST[chid]|", "|", $rs->fields['channel']);
                                $sql = "update group_own set channel='$new_type' where GID=$_REQUEST[gid]";
                                $conn->execute($sql);
                        }
                }

                //MAKE THE SUBQUERY
                if($_REQUEST["a"]=="")
                        $query = " where channel like '%|$_REQUEST[chid]|%'";

                if($_REQUEST['sort']!="")
                        $query.=" order by $_REQUEST[sort]";
                else
                        $query.=" order by GID asc";

                //PAGING
                if($_REQUEST[page]=="")
                $page = 1;
                else
                $page = $_REQUEST[page];
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


//                $link = "You are in Page <b>$page</b> of <b>$spage</b>";
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


        Stemplate::assign('err',$err);
        Stemplate::assign('msg',$msg);
        STemplate::display("siteadmin/channelgroups.tpl");
?>
