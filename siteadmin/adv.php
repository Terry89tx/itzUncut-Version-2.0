<?php
        include("../include/config.php");
        include("../include/function.php");
        
        $listing_per_page = 20;

        if($_REQUEST[action]=="Edit")
        {
                if($_REQUEST[submit] !="")
                {
                        if($_REQUEST[adv_text] == "")
                                $err = "Paste code for the advertise";
                        else
                        {
                                $sql = "update adv set adv_text='$_REQUEST[adv_text]' where adv_id='$_REQUEST[adv_id]'";
                                $conn->execute($sql);

                                $msg = "Advertise is updated successfully";
                                header("Location: adv.php?action=Edit&adv_id=$_REQUEST[adv_id]&msg=$msg");
                        }
                }
                $sql = "select * from adv where adv_id=$_REQUEST[adv_id]";
                $rs = $conn->execute($sql);
                $adv = $rs->getrows();
                STemplate::assign('adv', $adv[0]);
        }
        else
        {

                if($_REQUEST[action]=="Active" or $_REQUEST[action]=="Inactive")
                {
                        $sql="update adv set adv_status='$_REQUEST[action]' where adv_id='$_REQUEST[adv_id]'";
                        $conn->Execute($sql);
                }

                //MAKE THE SUBQUERY
                if($_REQUEST[a]=="")
                        $query = "";

                if($_REQUEST[sort]!="")
                        $query.=" order by $_REQUEST[sort]";

                //PAGING
                if($_REQUEST[page]=="")
                $page = 1;
                else
                $page = $_REQUEST[page];
                $sql = "SELECT count(*) as total from adv $query";
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
                                $page_no .= "<a href='adv.php?a=$_REQUEST[a]&status=$status&page=$i&sort=$_REQUEST[sort]' class='blue-n'>".$i."</a> ";
                }
                if($page_no!="")
                        $link = "Page $page_no of <b>$spage</b> Pages";
                else
                        $link = "<br><br><br><center>There is no advertise available</center><br>";


                if($tpage>1)
                {
                        $nextpage=$page+1;
                        $prevpage=$page-1;
                        $prevlink="<a href='adv.php?a=$_REQUEST[a]&status=$status&page=$prevpage&sort=$_REQUEST[sort]'><img src='../images/icon/previous.gif' title='Previous' alt='Previous' border='0' style='vertical-align: middle;'></a>";
                        $nextlink="<a href='adv.php?a=$_REQUEST[a]&status=$status&page=$nextpage&sort=$_REQUEST[sort]'><img src='../images/icon/next.gif' title='Next' alt='Next' border='0' style='vertical-align: middle;'></a>";
                        if($page==$tpage)
                                $link.="&nbsp;&nbsp;|&nbsp;$prevlink";
                        elseif($tpage>$page && $page>1)
                                $link.="&nbsp;&nbsp;|&nbsp;$prevlink &nbsp;&nbsp;$nextlink";
                        elseif($tpage>$page && $page<=1)
                                $link.="&nbsp;&nbsp;|&nbsp;$nextlink";
                }

                $sql="SELECT * from adv $query limit $startfrom, $listing_per_page";
                $rs = $conn->Execute($sql);
                $total = $rs->recordcount()+0;
                $adv = $rs->getrows();

                STemplate::assign('link',$link);
                STemplate::assign('grandtotal',$grandtotal+0);
                STemplate::assign('total',$total+0);
                STemplate::assign('page',$page+0);
                STemplate::assign('adv',$adv);
        }

        if($_REQUEST[msg]!="") $msg=$_REQUEST[msg];
        Stemplate::assign('err',$err);
        Stemplate::assign('msg',$msg);
        STemplate::display("siteadmin/adv.tpl");
?>
