<?php
        include("../include/config.php");
        include("../include/function.php");
        
        $sql = "select gname from group_own where GID=$_GET[gid]";
        $rs = $conn->execute($sql);
        STemplate::assign('gname', $rs->fields['gname']);

        $listing_per_page = 20;

        /* All topics */
        if($_GET["a"]=="")
        {
                //DELETE A topic
                if($action=="del")
                {
                        $sql = "delete from group_tps where TID=$TID";
                        $conn->execute($sql);
                }

                //MAKE THE SUBQUERY
                if($_GET["a"]=="")
                        $query = " where GID=$gid";

                if($sort != "")
                        $query .= " order by $sort";
                else
                        $query .= " order by TID desc";

                //PAGING
                if($page=="")
                $page = 1;
                $sql = "SELECT count(*) as total from group_tps $query";
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
                                $page_no .= "<a href='grouptopics.php?a=$_GET[a]&status=$status&page=$i&sort=$sort' class='blue-n'>".$i."</a> ";
                }
                if($page_no!="")
                        $link = "Page $page_no of <b>$spage</b> Pages";
                else
                        $link = "<br><br><br><center>There is no $_GET[a] topic available</center><br>";


//                $link = "You are in Page <b>$page</b> of <b>$spage</b>";
                if($tpage>1)
                {
                        $nextpage=$page+1;
                        $prevpage=$page-1;
                        $prevlink="<a href='grouptopics.php?a=$_GET[a]&status=$status&page=$prevpage&sort=$sort'><img src='../images/icon/previous.gif' title='Previous' alt='Previous' border='0' style='vertical-align: middle;'></a>";
                        $nextlink="<a href='grouptopics.php?a=$_GET[a]&status=$status&page=$nextpage&sort=$sort'><img src='../images/icon/next.gif' title='Next' alt='Next' border='0' style='vertical-align: middle;'></a>";
                        if($page==$tpage)
                                $link.="&nbsp;&nbsp;|&nbsp;$prevlink";
                        elseif($tpage>$page && $page>1)
                                $link.="&nbsp;&nbsp;|&nbsp;$prevlink &nbsp;&nbsp;$nextlink";
                        elseif($tpage>$page && $page<=1)
                                $link.="&nbsp;&nbsp;|&nbsp;$nextlink";
                }

                $sql="SELECT * from group_tps $query limit $startfrom, $listing_per_page";
                $rs = $conn->Execute($sql);
                $topics = $rs->getrows();

                STemplate::assign('link',$link);
                STemplate::assign('grandtotal',$grandtotal+0);
                STemplate::assign('total',$total+0);
                STemplate::assign('page',$page+0);
                STemplate::assign('grptps',$topics);

        }



        Stemplate::assign('err',$err);
        Stemplate::assign('msg',$msg);
        STemplate::display("siteadmin/grouptopics.tpl");
?>
