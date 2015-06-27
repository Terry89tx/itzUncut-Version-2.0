<?php
        include("../include/config.php");
        include("../include/function.php");
        
        $listing_per_page = 20;

        /* All Users */
        if($_REQUEST["a"]=="" or $_REQUEST["a"]=='Inactive' or $_REQUEST["a"]=='Active')
        {
	//DELETE A USER
	if($_REQUEST[action]=="del")
	{ 
		
		$table[]="comments";
		$table[]="comments_audio";
		$table[]="favourite";
		$table[]="avourite_audio";
		$table[]="friends group_tps"; 
		$table[]="group_tps_post"; 
		$table[]="playlist"; 
		$table[]="playlist_audio";
		$table[]="signup";
		$table[]="subscriber"; 
		$table[]="verify";
		$table[]="video";
		
		for($i=0;$table[$i];$i++)
		{
			$sql="DELETE from ";
			$sql.=$table[$i];
			$sql.=" where UID=$_REQUEST[uid]";
			$conn->Execute($sql);
		}
}

                //MAKE THE SUBQUERY
                if($_REQUEST["a"]=="")
                        $query = "";
                else
                        $query = "where account_status = '$_REQUEST[a]'";
                        
                if($_REQUEST['sort']!="")
                        $query.=" order by $_REQUEST[sort]";
                else
                        $query.=" order by UID desc";

                //PAGING
                if($_REQUEST[page]=="")
                $page = 1;
                else
                $page = $_REQUEST[page];
                $sql = "SELECT count(*) as total from signup $query";
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
                                $page_no .= "<a href='users.php?a=$_REQUEST[a]&status=$status&page=$i&sort=$sort' class='blue-n'>".$i."</a> ";
                }
                if($page_no!="")
                        $link = "Page $page_no of <b>$spage</b> Pages";
                else
                        $link = "<br><br><br><center>There is no $_REQUEST[a] user available</center><br>";


                if($tpage>1)
                {
                        $nextpage=$page+1;
                        $prevpage=$page-1;
                        $prevlink="<a href='users.php?a=$_REQUEST[a]&status=$status&page=$prevpage&sort=$sort'><img src='../images/icon/previous.gif' title='Previous' alt='Previous' border='0' style='vertical-align: middle;'></a>";
                        $nextlink="<a href='users.php?a=$_REQUEST[a]&status=$status&page=$nextpage&sort=$sort'><img src='../images/icon/next.gif' title='Next' alt='Next' border='0' style='vertical-align: middle;'></a>";
                        if($page==$tpage)
                                $link.="&nbsp;&nbsp;|&nbsp;$prevlink";
                        elseif($tpage>$page && $page>1)
                                $link.="&nbsp;&nbsp;|&nbsp;$prevlink &nbsp;&nbsp;$nextlink";
                        elseif($tpage>$page && $page<=1)
                                $link.="&nbsp;&nbsp;|&nbsp;$nextlink";
                }

                $sql="SELECT * from signup $query limit $startfrom, $listing_per_page";
                $rs = $conn->Execute($sql);
                $total = $rs->recordcount()+0;
                $users = $rs->getrows();

                STemplate::assign('link',$link);
                STemplate::assign('grandtotal',$grandtotal+0);
                STemplate::assign('total',$total+0);
                STemplate::assign('page',$page+0);
                STemplate::assign('users',$users);

        }

        /* Search Users */
        elseif($_REQUEST["a"]=="Search")
        {
                if($_REQUEST["userid"]!=null)
                {
                        if(is_numeric($_REQUEST["userid"]))
                        {
                                $rs = $conn->execute("select * from signup where UID=$_REQUEST[userid]");
                                $user = $rs->getrows();
                                if($user[0]["UID"] == "")
                                        $err = "User does not exists with user id $_REQUEST[userid]";
                                else
                                        STemplate::assign("user", $user[0]);
                        }
                        else
                                $err = "Enter integer value as user id";
                }
                elseif($_REQUEST["username"]!=null)
                {
                        $sql = "select * from signup where username='$_REQUEST[username]'";
                        $rs = $conn->execute($sql);
                        $user = $rs->getrows();
                        if($user[0]["UID"] == "")
                                $err = "User does not exists with user name '$_REQUEST[username]'";
                        else
                                STemplate::assign("user", $user[0]);
                }
        }

        Stemplate::assign('err',$err);
        Stemplate::assign('msg',$msg);
        STemplate::display("siteadmin/users.tpl");
?>
