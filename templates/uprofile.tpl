<table>
  <tr>
                <td align="center" valign="top"><table width="760"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                  <td height=5 width="750">&nbsp;</td></tr>
                  <tr><td width=750>

<table width="750" border=0 cellspacing=0 cellpadding=0>
  <tr>
                <td align="center" valign="top" width="750">
                <table width="750"  border="0" cellspacing="0" cellpadding="0" >
                  <tr>
                    <td width="750">
<br>

<!-- Information tab -->

<TABLE BORDER=0 CELLPADDING=0 CELLSPACING=0 BORDERCOLOR=#E0E0E0>
<TR>
        <TD>
                <TABLE BORDER=0 CELLPADDING=5 HEIGHT=5> 
                        <TD background={$imgurl}/_button.jpg >
                                <A HREF="javascript:void(0)" ID='showaccinfo' onclick="fxShowAccInfo('divAccInfo','divRandominfo')">Account Information</A>
                        </TD>
                        <TD background={$imgurl}/_button.jpg>
                                <A HREF="javascript:void(0)" onClick="fxShowAccInfo('divRandominfo','divAccInfo')">Random Information</A>
                        </TD>
                </TABLE>
        </TD>
</TR>
</TABLE>

<TABLE cellSpacing=0 cellPadding=0 width="750" align=center border=0>
<TBODY>
<TR vAlign=top>
<TD style="PADDING-RIGHT: 15px" width=473>

<DIV style="width: 421px; border: 1px solid #cccccc; padding-left: 15px; padding-right: 15px; padding-top: 15px; padding-bottom: 30px">


        
                                <DIV style="font-weight: bold; font-size: 18px; color: #cc6633; width: 328px; height: 21px; margin-bottom: 2px">
                                        Hello. I'm {$answers[0].username}.
                                </DIV>
                


 <DIV ID='divAccInfo'>

        <DIV class=text_white style="width: 321px; height: 25px">
                Last Login: {insert name=time_range assign=rtime field=logintime IDFR=UID id=$answers[0].UID tbl=signup}
        </DIV>
        {$rtime}

        <DIV class=profileLabel style="width: 306px; height: 25px">
        Signed up: {insert name=time_range assign=stime field=addtime IDFR=UID id=$answers[0].UID tbl=signup}
        </DIV>{$stime}
                
        {if $answers[0].fname ne ""}



        <DIV class=profileLabel style="width: 285px; height: 20px">
        Name:</DIV>{$answers[0].fname}&nbsp;{$answers[0].lname}
        {/if}
        {if $answers[0].bdate ne "0000-00-00"}
        <DIV class=profileLabel style="width: 281px; height: 21px">
        Age:</DIV>{$profileage}
        {/if}
        {if $answers[0].gender ne ""}
        <DIV class=profileLabel style="width: 285px; height: 16px">
        Gender:</DIV>{$answers[0].gender}
        {/if}
        {if $answers[0].relation ne ""}
        <DIV class=profileLabel style="width: 304px; height: 19px">
        Relation:</DIV>{$answers[0].relation}
        {/if}
        {if $answers[0].aboutme ne ""}
        <DIV class=profileLabel style="width: 312px; height: 21px">
        About Me:</DIV>{$answers[0].aboutme}
        {/if}
        {if $answers[0].website ne ""}
        <DIV class=profileLabel style="width: 297; height: 19">
        Website:</DIV>{$answers[0].website}
        {/if}
        {if $answers[0].town ne ""}
        <DIV class=profileLabel style="width: 298; height: 19">
        Hometown:</DIV>{$answers[0].town}
        {/if}
        {if $answers[0].city ne ""}
        <DIV class=profileLabel style="width: 263; height: 19">
        Current City:</DIV>{$answers[0].city}
        {/if}
        {if $answers[0].zip ne ""}
        <DIV class=profileLabel style="width: 284; height: 19">
        Current Zip:</DIV>{$answers[0].zip}
        {/if}
        {if $answers[0].country ne ""}
        <DIV class=profileLabel style="width: 322; height: 22">
        Country:</DIV>{$answers[0].country}
        {/if}
</DIV>
<!--   # End of Account information -->


<!-- # Random information  -->

<DIV ID="divRandominfo" style='display:none' >


        {if $answers[0].occupation ne ""}
        <DIV class=profileLabel style="width: 314; height: 19">
        Occupation:</DIV>{$answers[0].occupation}
        {/if}
        {if $answers[0].company ne ""}
        <DIV class=profileLabel style="width: 290; height: 19">
        Companies:</DIV>{$answers[0].company}
        {/if}
        {if $answers[0].school ne ""}
        <DIV class=profileLabel style="width: 256; height: 19">
        Schools:</DIV>{$answers[0].school}
        {/if}
        {if $answers[0].interest_hobby ne ""}
        <DIV class=profileLabel style="width: 262; height: 19">
        Interests & Hobbies:</DIV>{$answers[0].interest_hobby}
        {/if}
        {if $answers[0].fav_movie_show ne ""}
        <DIV class=profileLabel style="width: 280; height: 19">
        Favourite Movies & Shows:</DIV>{$answers[0].occupation}
        {/if}
        {if $answers[0].fav_music ne ""}
        <DIV class=profileLabel style="width: 312; height: 19">
        Favourite Music:</DIV>{$answers[0].fav_music}
        {/if}
        {if $answers[0].fav_book ne ""}
        <DIV class=profileLabel style="width: 282; height: 19">
        Favourite Books:</DIV>{$answers[0].fav_book}
        {/if}
        </DIV>
</DIV>
                  
</TD>
<TD width=439>





<TABLE cellSpacing=0 cellPadding=0 width=180 align=center bgColor=#e5ecf9 border=0>
<TBODY>
<TR>
        <TD style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 5px; PADDING-TOP: 5px" align=middle>
        <DIV style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 5px; PADDING-TOP: 5px; TEXT-ALIGN: center">
        <DIV style="FONT-WEIGHT: bold; FONT-SIZE: 14px; COLOR: #003366">
        Latest Video Added
        </DIV>

        <DIV style="PADDING-BOTTOM: 10px">
        {if $videos[0].vkey eq ""}
                <IMG class=moduleEntryThumb height=90 src="{$imgurl}/no_videos_groups.gif" width=120>
        {else}
                <A href="{$baseurl}/view_video.php?viewkey={$videos[0].vkey}">
                <IMG class=moduleFeaturedThumb height=90 src="{$tmburl}/1_{$videos[0].VID}.jpg" width=120>
                </A>
        {/if}
        <DIV class=moduleFeaturedTitle><A href="{$baseurl}/view_video.php?viewkey={$videos[0].vkey}">{$videos[0].title}</A></DIV>
        <DIV class=moduleFeaturedDetails>
        {if $videos[0].VID ne ""}
        {insert name=time_range assign=rtime field=addtime IDFR=VID id=$videos[0].VID tbl=video}
        Added: {$rtime}
        {/if}
        </DIV>
         
        {if $smarty.session.UID ne $videos[0].VID}

                {if $chkuserflag eq ""}
                        <DIV style="PADDING-BOTTOM: 10px">
                        <A href="{$baseurl}/signup.php">Sign up</A> or
                        <A href="{$baseurl}/login.php">log in</A> to add {$answers[0].username} as a friend.
                        </DIV>
                {/if}

        {/if}



                {if $chkuserflag ne "self"}                

                        {if $chkuserflag eq "guest"}        

                                
        
                                        
                                <DIV ID='himr' style='display:none'>
                                        Here is my rating
                                </DIV>
                                        
                                <TABLE ID='tblViewUserVote' border=0  ALIGN=CENTER>
                                <TR>
                                        <TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD>
                                <TR>
                                </TABLE>
                                <TABLE BORDER=0 ID="tblViewUserTate" WIDTH="120"  ALIGN=CENTER>
                                        <TR>
                                                        <TD ALIGN=CENTER>        I'm {$answers[0].username}
                                                        
                                                                 

                                                                                Rate me
                                                        <BR>
                                                                <IMG class=rating src="{$imgurl}/blank_star.gif" onClick="rateuser({$smarty.session.UID},{$smarty.request.UID},2)">
                                                                <IMG class=rating src="{$imgurl}/blank_star.gif" onClick="rateuser({$smarty.session.UID},{$smarty.request.UID},4)">
                                                                <IMG class=rating src="{$imgurl}/blank_star.gif" onClick="rateuser({$smarty.session.UID},{$smarty.request.UID},6)">
                                                                <IMG class=rating src="{$imgurl}/blank_star.gif" onClick="rateuser({$smarty.session.UID},{$smarty.request.UID},8)">
                                                                <IMG class=rating src="{$imgurl}/blank_star.gif" onClick="rateuser({$smarty.session.UID},{$smarty.request.UID},10)">
                                                        </TD>
                                        </TR>
                                </TABLE>
                        {/if}
                                
                        <BR>
                        <BR>

                        <FORM action="{$baseurl}/invite_friends.php?UID={$answers[0].UID}" method="post">
                        <INPUT type=submit value="Add to Friends" name="addfriend"></FORM>
                        

                        <FORM action=compose.php?receiver={$answers[0].username} method=post>
                        <INPUT type=submit value="Send Message"></FORM>
                        <!--<FORM action=/subscription_center?add_user=arefin method=post>
                        <INPUT type=submit value="Subscribe to {$answers[0].username}'s Videos">
                        </FORM>
                {/if}

        </DIV>
        </TD>
        </TR></TBODY></TABLE>
        </TD></TR></TBODY></TABLE>
        </TD></TR></TABLE>
        </TD></TR>

</table>
</td>
                        </tr>

                  </table>  </td></tr>
