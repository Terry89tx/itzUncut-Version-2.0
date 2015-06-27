<?php
        include("../include/config.php");
        include("../include/function.php");
        
        $listing_per_page = 20;

        /* All videos */
        if($_REQUEST["a"]=="" or $_REQUEST["a"]=='public' or $_REQUEST["a"]=='private')
        {
                //DELETE A video
                if($_REQUEST[action]=="del")
                {
                        $sql="DELETE from video where VID=$_REQUEST[VID]";
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
                        $query.=" order by VID desc";

                //PAGING
                if($_REQUEST[page]=="")
                $page = 1;
                else
                $page = $_REQUEST[page];
                $sql = "SELECT count(*) as total from video $query";
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
                                $page_no .= "<a href='videos.php?a=$_REQUEST[a]&status=$status&page=$i&sort=$sort' class='blue-n'>".$i."</a> ";
                }
                if($page_no!="")
                        $link = "Page $page_no of <b>$spage</b> Pages";
                else
                        $link = "<br><br><br><center>There is no $_REQUEST[a] video available</center><br>";


//                $link = "You are in Page <b>$page</b> of <b>$spage</b>";
                if($tpage>1)
                {
                        $nextpage=$page+1;
                        $prevpage=$page-1;
                        $prevlink="<a href='videos.php?a=$_REQUEST[a]&status=$status&page=$prevpage&sort=$sort'><img src='../images/icon/previous.gif' title='Previous' alt='Previous' border='0' style='vertical-align: middle;'></a>";
                        $nextlink="<a href='videos.php?a=$_REQUEST[a]&status=$status&page=$nextpage&sort=$sort'><img src='../images/icon/next.gif' title='Next' alt='Next' border='0' style='vertical-align: middle;'></a>";
                        if($page==$tpage)
                                $link.="&nbsp;&nbsp;|&nbsp;$prevlink";
                        elseif($tpage>$page && $page>1)
                                $link.="&nbsp;&nbsp;|&nbsp;$prevlink &nbsp;&nbsp;$nextlink";
                        elseif($tpage>$page && $page<=1)
                                $link.="&nbsp;&nbsp;|&nbsp;$nextlink";
                }

                $sql="SELECT * from video $query limit $startfrom, $listing_per_page";
                $rs = $conn->Execute($sql);
                $total = $rs->recordcount()+0;
                $videos = $rs->getrows();

                STemplate::assign('link',$link);
                STemplate::assign('grandtotal',$grandtotal+0);
                STemplate::assign('total',$total+0);
                STemplate::assign('page',$page+0);
                STemplate::assign('videos',$videos);

        }
        /* Search videos */
        elseif($_REQUEST["a"]=="Search")
        {
                if($_REQUEST["videoid"]!=null)
                {
                        if(is_numeric($_REQUEST["videoid"]))
                        {
                                $rs = $conn->execute("select * from video where VID=$_REQUEST[videoid]");
                                $video = $rs->getrows();
                                if($video[0]["VID"] == "")
                                        $err = "Video does not exists with id $_REQUEST[videoid]";
                                else
                                        STemplate::assign("video", $video[0]);
                        }
                        else
                                $err = "Enter integer value as video id";
                }
        }
        elseif($_REQUEST["a"]=="feature")
        {
                //DELETE A video
                if($_REQUEST[action]=="del")
                {
                        $sql="DELETE from feature_req where VID=$_REQUEST[VID]";
                        $conn->Execute($sql);
                }

                $query = "where fr.VID=v.VID and v.featured = 'no'";
                if($_REQUEST['sort']!="")
                        $query.=" order by fr.".$_REQUEST['sort'];
                else
                        $query.=" order by date desc";

                //PAGING
                if($_REQUEST[page]=="")
                $page = 1;
                else
                $page = $_REQUEST[page];
                $sql = "SELECT count(fr.VID) as total from feature_req fr, video v $query";
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
                                $page_no .= "<a href='videos.php?a=$_REQUEST[a]&status=$status&page=$i&sort=$sort' class='blue-n'>".$i."</a> ";
                }
                if($page_no!="")
                        $link = "Page $page_no of <b>$spage</b> Pages";
                else
                        $link = "<br><br><br><center>There is no $_REQUEST[a] request available</center><br>";


                if($tpage>1)
                {
                        $nextpage=$page+1;
                        $prevpage=$page-1;
                        $prevlink="<a href='videos.php?a=$_REQUEST[a]&status=$status&page=$prevpage&sort=$sort'><img src='../images/icon/previous.gif' title='Previous' alt='Previous' border='0' style='vertical-align: middle;'></a>";
                        $nextlink="<a href='videos.php?a=$_REQUEST[a]&status=$status&page=$nextpage&sort=$sort'><img src='../images/icon/next.gif' title='Next' alt='Next' border='0' style='vertical-align: middle;'></a>";
                        if($page==$tpage)
                                $link.="&nbsp;&nbsp;|&nbsp;$prevlink";
                        elseif($tpage>$page && $page>1)
                                $link.="&nbsp;&nbsp;|&nbsp;$prevlink &nbsp;&nbsp;$nextlink";
                        elseif($tpage>$page && $page<=1)
                                $link.="&nbsp;&nbsp;|&nbsp;$nextlink";
                }

                $sql="SELECT * from feature_req fr, video v $query limit $startfrom, $listing_per_page";
                $rs = $conn->Execute($sql);
                $total = $rs->recordcount()+0;
                $videos = $rs->getrows();

                STemplate::assign('link',$link);
                STemplate::assign('grandtotal',$grandtotal+0);
                STemplate::assign('total',$total+0);
                STemplate::assign('page',$page+0);
                STemplate::assign('videos',$videos);
        }
        elseif($_REQUEST["a"]=="inappropriate")
        {
                //DELETE A video
                if($_REQUEST[action]=="del")
                {
                        $sql="DELETE from inappro_req where VID=$_REQUEST[VID]";
                        $conn->Execute($sql);
                }
                
                //DELETE A video
                if($_REQUEST[action]=="del_video")
                {
                        $sql="DELETE from video where VID=$_REQUEST[VID]";
                        $conn->Execute($sql);
                        $sql="DELETE from inappro_req where VID=$_REQUEST[VID]";
                        $conn->Execute($sql);
                }

                $query = "";
                if($_REQUEST['sort']!="")
                        $query.=" order by ".$_REQUEST['sort'];
                else
                        $query.=" order by date desc";

                //PAGING
                if($_REQUEST[page]=="")
                $page = 1;
                else
                $page = $_REQUEST[page];
                $sql = "SELECT count(VID) as total from inappro_req $query";
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
                                $page_no .= "<a href='videos.php?a=$_REQUEST[a]&status=$status&page=$i&sort=$sort' class='blue-n'>".$i."</a> ";
                }
                if($page_no!="")
                        $link = "Page $page_no of <b>$spage</b> Pages";
                else
                        $link = "<br><br><br><center>There is no $_REQUEST[a] request available</center><br>";


                if($tpage>1)
                {
                        $nextpage=$page+1;
                        $prevpage=$page-1;
                        $prevlink="<a href='videos.php?a=$_REQUEST[a]&status=$status&page=$prevpage&sort=$sort'><img src='../images/icon/previous.gif' title='Previous' alt='Previous' border='0' style='vertical-align: middle;'></a>";
                        $nextlink="<a href='videos.php?a=$_REQUEST[a]&status=$status&page=$nextpage&sort=$sort'><img src='../images/icon/next.gif' title='Next' alt='Next' border='0' style='vertical-align: middle;'></a>";
                        if($page==$tpage)
                                $link.="&nbsp;&nbsp;|&nbsp;$prevlink";
                        elseif($tpage>$page && $page>1)
                                $link.="&nbsp;&nbsp;|&nbsp;$prevlink &nbsp;&nbsp;$nextlink";
                        elseif($tpage>$page && $page<=1)
                                $link.="&nbsp;&nbsp;|&nbsp;$nextlink";
                }

                $sql="SELECT * from inappro_req $query limit $startfrom, $listing_per_page";
                $rs = $conn->Execute($sql);
                $total = $rs->recordcount()+0;
                $videos = $rs->getrows();

                STemplate::assign('link',$link);
                STemplate::assign('grandtotal',$grandtotal+0);
                STemplate::assign('total',$total+0);
                STemplate::assign('page',$page+0);
                STemplate::assign('videos',$videos);
        }


        Stemplate::assign('err',$err);
        Stemplate::assign('msg',$msg);
        STemplate::display("siteadmin/videos.tpl");
?>
