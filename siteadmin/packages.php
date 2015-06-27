<?php
        include("../include/config.php");
        include("../include/function.php");
        
        $listing_per_page = 20;

        /* All Packages */
        if($_REQUEST['a']=="")
        {
                //DELETE A USER
                if($_REQUEST[action]=="del")
                {
                        $sql="DELETE from package where pack_id=$_REQUEST[pack_id]";
                        $conn->Execute($sql);
                }

                //MAKE THE SUBQUERY

                if($_REQUEST['sort']!="")
                        $query=" order by $_REQUEST[sort]";
                else
                        $query=" order by price desc";

                //PAGING
                if($_REQUEST[page]=="")
                $page = 1;
                else
                $page = $_REQUEST['page'];
                $sql = "SELECT count(*) as total from package $query";
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
                                $page_no .= "<a href='packages.php?page=$i&sort=$sort' class='blue-n'>".$i."</a> ";
                }
                if($page_no!="")
                        $link = "Page $page_no of <b>$spage</b> Pages";
                else
                        $link = "<br><br><br><center>There is no $_REQUEST[a] package available</center><br>";


//                $link = "You are in Page <b>$page</b> of <b>$spage</b>";
                if($tpage>1)
                {
                        $nextpage=$page+1;
                        $prevpage=$page-1;
                        $prevlink="<a href='packages.php?page=$prevpage&sort=$sort'><img src='../images/icon/previous.gif' title='Previous' alt='Previous' border='0' style='vertical-align: middle;'></a>";
                        $nextlink="<a href='packages.php?page=$nextpage&sort=$sort'><img src='../images/icon/next.gif' title='Next' alt='Next' border='0' style='vertical-align: middle;'></a>";
                        if($page==$tpage)
                                $link.="&nbsp;&nbsp;|&nbsp;$prevlink";
                        elseif($tpage>$page && $page>1)
                                $link.="&nbsp;&nbsp;|&nbsp;$prevlink &nbsp;&nbsp;$nextlink";
                        elseif($tpage>$page && $page<=1)
                                $link.="&nbsp;&nbsp;|&nbsp;$nextlink";
                }

                $sql="SELECT * from package $query limit $startfrom, $listing_per_page";
                $rs = $conn->Execute($sql);
                $total = $rs->recordcount()+0;
                $packs = $rs->getrows();

                STemplate::assign('link',$link);
                STemplate::assign('grandtotal',$grandtotal+0);
                STemplate::assign('total',$total+0);
                STemplate::assign('page',$page+0);
                STemplate::assign('packs',$packs);
        }
        /* Search Packages */
        elseif($_REQUEST['a']=="Search")
        {
                if($_REQUEST['pack_id']!=null)
                {
                        $rs = $conn->execute("select * from package where pack_id=$_REQUEST[pack_id]");
                        $pack = $rs->getrows();
                        STemplate::assign("pack", $pack[0]);
                }
        }

        Stemplate::assign('err',$err);
        Stemplate::assign('msg',$msg);
        STemplate::display("siteadmin/packages.tpl");
?>
