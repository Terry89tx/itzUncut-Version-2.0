
<tr>
                <td align="center" valign="top" width=760>
<table width="771"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                  <td height=5>&nbsp;</td></tr>
                  <tr><td width=771>



<table width=760 border=0>
<tr><td align=center style="PADDING-left: 20px">
<TABLE cellSpacing=0 cellPadding=0 width=746 align=center border=0>
<TBODY>
 <tr>
                              
                              <td height="1" bgcolor="#E1E3E4" colspan=3></td>
                            </tr>
                            
<TR vAlign=top>
                        <td width="1" bgcolor="#E1E3E4" ></td>
                           
                <TD  style="PADDING-bottom: 10px" width=414 align=center>

                 {insert name=video_info assign=vinfo vid=$VID}

                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="5" height="24" background="images/nv_2_l.jpg"><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                    <th background="images/nv_2_bg.jpg" align=left width=283><span class="white_bold" >{$vinfo[0].title}</span></th>
                                    <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                  </tr>
                              </table>

               
                
                <!-- google_ad_section_end --></DIV><!-- google_ad_section_start(weight=ignore) -->



                <DIV style="PADDING-BOTTOM: 8px; TEXT-ALIGN: center">
                <DIV id=flashcontent>
                <DIV style="PADDING-RIGHT: 20px; PADDING-LEFT: 20px; FONT-WEIGHT: bold; FONT-SIZE: 14px; PADDING-BOTTOM: 20px; PADDING-TOP: 20px">

                <object type="application/x-shockwave-flash" width="320" height="240"
                        wmode="transparent" data="{$flvdourl}/flvplayer.swf?file={$flvdourl}/{$vinfo[0].flvdoname}&autoStart=false">
                        <param name="movie" value="{$flvdourl}/flvplayer.swf?file={$flvdourl}/{$vinfo[0].flvdoname}&autoStart=false" />
                        <param name="wmode" value="transparent" />
                </object>
                </DIV></DIV></DIV>


                <DIV style="FONT-WEIGHT: bold; FONT-SIZE: 12px; PADDING-BOTTOM: 10px; TEXT-ALIGN: center">
                {if $smarty.session.UID eq ""} 
                <A href="{$baseurl}/view_video.php?viewkey={$smarty.request.viewkey}&page={$smarty.request.page}&viewtype={$smarty.request.viewtype}&category={$smarty.request.category}&action=comment">
                {else}
                <A href="#postcomment">
                {/if}
                Post Comments</A>&nbsp;&nbsp;//&nbsp;&nbsp;

                <A href="{$baseurl}/view_video.php?viewkey={$smarty.request.viewkey}&page={$smarty.request.page}&viewtype={$smarty.request.viewtype}&category={$smarty.request.category}&action=addfavour">
                Add to Favorites</A> &nbsp;&nbsp;//&nbsp;&nbsp;

                <A href="#flagvideo">Flag This Video</A>
                </DIV>
                
           {if $isvideorated ne "no"}             
                <TABLE cellSpacing=0 cellPadding=0 width=393 align=center border=0>
                <TBODY>
                <TR>
                
                <TD style="PADDING-BOTTOM: 15px" style="PADDING-left: 10px">

<!--         # VORE PRECESS RESULT  -->

                        <DIV class=moduleEntryDetails ID='divVoteResult'>
                                {if $vinfo[0].ratedby gt "0"}
                                        <!--         Showing vote -->
                                                
                                                <TABLE BORDER=0 ID='idVoteView'>
                                                <TR>    <TD>Average (</TD>
                                                        <TD>{$vinfo[0].ratedby}</TD>
                                                        <TD>votes)</TD>
                                                </TR>
                                                </TABLE>
                                        
                                        <DIV ID=idViewVoteResult>
                                
                                        {insert name=show_rate assign=rate rte=$vinfo[0].rate}
                                        {$rate}
                                        </DIV

                                        <DIV>
                                                <TABLE ID="tblViewResult">
                                                <TR>
                                                        <TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD>
                                                <TR>
                                                </TABLE>
                                        </DIV>
                                        
                                {/if}
                        </DIV>
<!-- // VORE PRECESS RESULT END-->
                
                </TD>

                <TD style="PADDING-BOTTOM: 15px">

<!--# VOTE PROCESS                                                                -->
                        <DIV id=ratingDiv style="MARGIN-RIGHT: 5em; TEXT-ALIGN: center">               
                                {if $smarty.session.UID ne ""}

                                        
                                                
                                                <DIV class=moduleEntryDetails ID=voteProcess>
                                                        Rate this video.!
                                                        <BR>
                                                        <NOBR>
                                                                <IMG class=rating src="{$imgurl}/blank_star.gif" onClick="fxRate('{$smarty.request.viewkey}',2,'voteProcess','voteProcessthank','{$VID}')">
                                                                <IMG class=rating src="{$imgurl}/blank_star.gif" onClick="fxRate('{$smarty.request.viewkey}',4,'voteProcess','voteProcessthank','{$VID}')">
                                                                <IMG class=rating src="{$imgurl}/blank_star.gif" onClick="fxRate('{$smarty.request.viewkey}',6,'voteProcess','voteProcessthank','{$VID}')">
                                                                <IMG class=rating src="{$imgurl}/blank_star.gif" onClick="fxRate('{$smarty.request.viewkey}',8,'voteProcess','voteProcessthank','{$VID}')">
                                                                <IMG class=rating src="{$imgurl}/blank_star.gif" onClick="fxRate('{$smarty.request.viewkey}',10,'voteProcess','voteProcessthank','{$VID}')">
                                                        </NOBR>
                                                </DIV>
                                                
                                                <DIV ID=voteProcessthank style='display:none'>
                                                        Thanks for rating!
                                                </DIV>
                                        

                                {else}
                                        <SPAN id=ratingMessage>Please sign up<BR> and login to rate this video.!</SPAN><BR>
                                {/if}
                        </DIV>

<!-- // VOTE PROCESS end                                                                 -->


                </TD>
                
                </TR>
                </TBODY>
                </TABLE>
{/if}

<!-- google_ad_section_end -->

<TABLE cellSpacing=0 cellPadding=0 width=391 align=center border=0>
<TBODY>
<TR>
<TD style="PADDING-left: 10px">
<DIV class=watchDescription>
        {$answers[0].description}<br><br>
        <DIV style="FONT-SIZE: 11px; PADDING-BOTTOM: 18px">

        Added on  {insert name=id_to_uploaddate assign=DID un=$VID} by {insert name=id_to_name assign=uname un=$UID}
        <A href="{$baseurl}/uprofile.php?UID={$UID}"><font color=#3399FF SIZE=3>{$uname}</FONT></A>
        
        </DIV>
</TD></TR></TBODY></TABLE>

                                
                <TABLE cellSpacing=0 cellPadding=0 width=393 align=center border=0><TBODY>
                <TR vAlign=top>

                <TD style="BORDER-RIGHT: #aaaaaa 1px dotted; PADDING-RIGHT: 5px" width=245 style="PADDING-left: 10px">
                                        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="5" height="24" background="images/nv_2_l.jpg"><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                    <th background="images/nv_2_bg.jpg" align=left width=283><span class="white_bold" > Video Details //</span></th>
                                    <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                  </tr>
                              </table>
               

                <DIV style="FONT-SIZE: 11px; PADDING-BOTTOM: 10px">
                Runtime: {$vinfo[0].duration|string_format:"%.2f"} | Views: {$vinfo[0].viewnumber} |
                {insert name=comment_count assign=commentcount vid=$vinfo[0].VID}
                <A href="#commentview">Comments:</A>  {$commentcount}
                <DIV style="PADDING-BOTTOM: 10px"><SPAN
                style="PADDING-RIGHT: 2px; PADDING-LEFT: 2px; PADDING-BOTTOM: 2px; PADDING-TOP: 2px; BACKGROUND-COLOR: #ffffaa">Tags:</SPAN>&nbsp;
<!-- google_ad_section_start -->
                {insert name=video_keyword assign=keyword vid=$VID}
                {section name=j loop=$keyword}
                <A href="{$baseurl}/search_result.php?search_id={$keyword[j]}">{$keyword[j]}</A>&nbsp;
                {/section}
<!-- google_ad_section_end --></DIV>
                <DIV style="PADDING-BOTTOM: 10px"><SPAN
                style="PADDING-RIGHT: 2px; PADDING-LEFT: 2px; PADDING-BOTTOM: 2px; PADDING-TOP: 2px; BACKGROUND-COLOR: #ffffaa">
                Channels:</SPAN>&nbsp;
<!-- google_ad_section_start -->
                {insert name=video_channel assign=channel vid=$VID}
                {section name=k loop=$channel}
                <A href="{$baseurl}/channel_detail.php?chid={$channel[k].CHID}">{$channel[k].name}</A>&nbsp;
                {/section}
<!-- google_ad_section_end --></DIV>
                <DIV style="FONT-SIZE: 11px; PADDING-BOTTOM: 10px"></DIV>
                </TD>

                <TD style="PADDING-LEFT: 10px" width=154>
                
                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="5" height="24" background="images/nv_2_l.jpg"><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                    <th background="images/nv_2_bg.jpg" align=left width=283><span class="white_bold" >User Details //</span></th>
                                    <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                  </tr>
                              </table>

               
                <DIV style="FONT-SIZE: 11px; PADDING-BOTTOM: 10px">
                {insert name=video_count assign=vdocount uid=$UID}
                <A href="{$baseurl}/uvideos.php?UID={$UID}">Videos</A>: {$vdocount} |
                {insert name=favour_count assign=favcount uid=$UID}
                <A href="{$baseurl}/ufavour.php?UID={$UID}">Favorites</A>: {$favcount} |
                {insert name=friends_count assign=friendcount uid=$UID}
                <A href="{$baseurl}/ufriends.php?UID={$UID}">Friends</A>: {$friendcount}
                </DIV>
                <DIV style="PADDING-BOTTOM: 10px">
                <SPAN style="PADDING-RIGHT: 2px; PADDING-LEFT: 2px; PADDING-BOTTOM: 2px; PADDING-TOP: 2px; BACKGROUND-COLOR: #ffffaa">User Name:</SPAN>&nbsp;
                <A href="{$baseurl}/uprofile.php?UID={$UID}"><font color=#3399FF SIZE=3>{$uname}</FONT></A>
                </DIV>
<!--
                <DIV style="PADDING-BOTTOM: 5px">
                <IMG src="{$imgurl}/SubscribeIcon.gif" align=absMiddle>&nbsp;
                <A href="http://www.youtube.com/subscription_center?add_user=kellyemeraldhart">subscribe</A>
                to {$uname}'s videos
                </DIV>

                <DIV style="PADDING-BOTTOM: 10px">
                <IMG height=20 src="{$imgurl}/Little_Man.gif" width=15 align=absMiddle>&nbsp;I am online now!
                </DIV>
-->
                <DIV style="FONT-WEIGHT: bold; PADDING-BOTTOM: 10px">
                <A href="{$baseurl}/compose.php?receiver={$uname}">Send Me a Private Message!</A>
                </DIV>
                </TD>
                </TR>
                </TBODY>
                </TABLE><BR><!-- watchTable -->





            <TABLE style="TABLE-LAYOUT: fixed" cellSpacing=0 cellPadding=0
            width=394 align=center border=0>
              <TBODY>
              <TR>
                <TD style="PADDING-left: 10px" width="394">

                        <FORM id=linkForm name=linkForm>
                        <TABLE style="TABLE-LAYOUT: fixed" cellSpacing=0 cellPadding=0 width=383 border=0>
                        <TBODY>
                        <TR>
                        
                          <TD width="100%" colspan=2>
                                 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="5" height="24" background="images/nv_2_l.jpg"><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                    <th background="images/nv_2_bg.jpg" align=left width=283><span class="white_bold" >Share Details // </span></th>
                                    <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                  </tr>
                              </table>

                        
                       </TD></tr>
                       <tr><td colspan=2 height=5></td></tr>
                      <!-- google_ad_section_start(weight=ignore) -->
                        <TR>
                        <TD vAlign=top width=150>
                        <SPAN style="PADDING-RIGHT: 2px; PADDING-LEFT: 2px; PADDING-BOTTOM: 2px; PADDING-TOP: 2px; BACKGROUND-COLOR: #ffffaa">Video
                        URL (Permalink):</SPAN><FONT
                        style="COLOR: #000000">&nbsp;&nbsp;</FONT></TD>
                        <TD vAlign=top width=233>
                        
                        <TEXTAREA NAME="video_link" ROWS="2" COLS="22" onclick=javascript:document.linkForm.video_link.focus();document.linkForm.video_link.select();readOnly  name=video_link>{$baseurl}/view_video.php?viewkey={$smarty.request.viewkey}</TEXTAREA>
                        
                        <DIV style="FONT-SIZE: 11px">(E-mail or link
                        it)<BR><BR></DIV></TD></TR>
                       {if $isvideoembabed eq "enabled"} 
                                <TR>
                                <TD vAlign=top width="168"><SPAN
                                style="PADDING-RIGHT: 2px; PADDING-LEFT: 2px; PADDING-BOTTOM: 2px; PADDING-TOP: 2px; BACKGROUND-COLOR: #ffffaa">
                                Embeddable
                                Player:</SPAN></TD>
                                <TD vAlign=top>
                                <TEXTAREA  name=video_play ROWS="3" COLS="22"                         
                                onclick=javascript:document.linkForm.video_play.focus();document.linkForm.video_play.select();
                                readOnly><object type="application/x-shockwave-flash" width="320" height="240"
                                wmode="transparent" data="{$flvdourl}/flvplayer.swf?file={$flvdourl}/{$vinfo[0].flvdoname}&autoStart=false">
                                <param name="movie" value="{$flvdourl}/flvplayer.swf?file={$flvdourl}/{$vinfo[0].flvdoname}&autoStart=false" />
                                <param name="wmode" value="transparent" />
                        </object></TEXTAREA>
                                         
                                <DIV style="FONT-SIZE: 11px">(Put this video on your
                                website. Works on Friendster, eBay, Blogger,
                                MySpace!)<BR><BR></DIV></TD></TR>
                        {/if}
                        
                        <!-- google_ad_section_end -->
                        </TBODY></TABLE>
                        </FORM></TD></TR></TBODY></TABLE><BR>



                        <A name=postcomment></A>

                        <DIV style="FONT-WEIGHT: bold; PADDING-BOTTOM: 5px; COLOR: #444" style="PADDING-left: 10px">Comment on this video:</DIV>
                        
                        {if $smarty.session.UID ne "" and $isvideocommented ne "no"}
                                <DIV ID=divComments>
                                        <FORM name="Add_comment" method="post" action="{$baseurl}/view_video.php?viewkey={$smarty.request.viewkey}&page={$smarty.request.page}&viewtype={$smarty.request.viewtype}&category={$smarty.request.category}">
                                        <DIV id=div_main_comment style="PADDING-left: 10px">

                                        <textarea name=addcomment ID=txtComments rows=5 cols=30></textarea>
                                        <br>
                                                <input type="button" name="commentpost" value="Post Comment" onClick=fxSendComments('divComments','txtComments',{$smarty.session.UID},{$VID})>
                                        </DIV>
                                        </FORM>
                                </DIV >
                                <DIV ID=divComResult1 style='display:none'>
                                        <B><FONT COLOR=#339900>Your Comments has posted successfully.</FONT></B>
                                </DIV>
                                <DIV ID=divComResult2 style='display:none'>
                                        <B><FONT COLOR=#FF0033>Your already posted you comments.</FONT></B>
                                </DIV>
                        {/if}


                        <TABLE width=372><TBODY>
                        <TR><TD style="PADDING-left: 10px">

                        <TABLE class=commentsTitle width="96%"><TBODY><TR>
                        <TD style="PADDING-left: 10px">Comments ({$commentcount}): </TD>
                        </TR></TBODY></TABLE>
                        
                        </TD></TR>

                        <TR><TD style="PADDING-left: 10px">
                        <A name=commentview>
                        {insert name=comment_info assign=cominfo vid=$VID}
                        {section name=i loop=$cominfo}
                        <TABLE class=parentSection id=comment_6rk1N61CRTY style="MARGIN-LEFT: 0px" width="99%">
                        <TBODY>
                        <TR vAlign=top>
                        <TD>{$cominfo[i].commen}
                        <DIV class=userStats>
                        {insert name=id_to_name assign=uname un=$cominfo[i].UID}
                        <A href="{$baseurl}/uprofile.php?UID={$cominfo[i].UID}">{$uname}</A>//
                        {insert name=video_count assign=vdocount uid=$cominfo[i].UID}
                        <A href="{$baseurl}/uvideos.php?UID={$cominfo[i].UID}">Videos</A>({$vdocount}) |
                        {insert name=favour_count assign=favcount uid=$cominfo[i].UID}
                        <A href="{$baseurl}/ufavour.php?UID={$cominfo[i].UID}">Favorites</A>({$favcount}) |
                        <A href="{$baseurl}/ufriends.php?UID={$cominfo[i].UID}">Friends</A>(1) -
                        {insert name=time_range assign=stime field=addtime IDFR=COMID id=$cominfo[i].COMID tbl=comments}
                        ({$stime})
                        </DIV>
                        <DIV class=userStats id=container_comment_form_id_6rk1N61CRTY style="DISPLAY: none"></DIV>
                        <DIV class=userStats id=reply_comment_form_id_6rk1N61CRTY>
                        (<A href="compose.php?receiver={$uname}&subject=Re:{$cominfo[i].commen|truncate:180}">Reply to this</A>)&nbsp;
                        <DIV id=div_comment_form_id_6rk1N61CRTY></DIV>
                        </TD>
                        </TR></TBODY></TABLE>
                        </A>
                        {/section}
                        </TD></TR></TBODY></TABLE>

                        <A name=flagvideo></A>
                        <TABLE style="MARGIN-TOP: 10px" cellSpacing=0 cellPadding=0 width=378 align=center bgColor=#ffeebb border=0>
                        <TBODY>
                        <TR>
                        <TD align=center style="PADDING-RIGHT: 5px;  PADDING-BOTTOM: 10px; PADDING-TOP: 5px; TEXT-ALIGN: center"
                        width=378 style="PADDING-left: 10px">
                        <DIV style="FONT-SIZE: 10px; PADDING-BOTTOM: 5px">Please help
                        keep this site <STRONG>FUN</STRONG>, <STRONG>CLEAN</STRONG>,
                        and <STRONG>REAL</STRONG>. </DIV>
                        <DIV style="FONT-SIZE: 12px">Flag this video:&nbsp; <A
                        href="{$baseurl}/view_video.php?viewkey={$smarty.request.viewkey}&flag=F">Feature
                        This!</A> &nbsp; <A
                        href="{$baseurl}/view_video.php?viewkey={$smarty.request.viewkey}&flag=I">Inappropriate</A>
                        </DIV>
                        </TD>
                        </TR>
                        </TBODY>
                        </TABLE>
</TD>
                           
                 
                   <td width="1" bgcolor="#E1E3E4"></td>
<td width=7>&nbsp;</td>  
                          
<TD width=323 >
        <DIV style="PADDING-BOTTOM: 10px">
                        
        <TABLE cellSpacing=0 cellPadding=0 width=300 align=center bgColor=#eeeeee border=0>
        <TBODY>
        <TR>
        

 <td width="1" bgcolor="#BABDBF"></td>

        <TD style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; " width=298>

                <TABLE cellSpacing=0 cellPadding=0 width=298 border=0 >
                <TBODY>
                <TR>
                <td width=298 colspan=3><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="5" height="24" background="images/nv_2_l.jpg"><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                    <th background="images/nv_2_bg.jpg" align=left><span class="white_bold" >&nbsp;</span></th>
                                    <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                  </tr>
                              </table>
                </td>
                </tr>
                <tr>              

                
                <TD align=middle width="104" style="padding-left:5px;">
                {if $rowcount eq "$rowmincount"}
                <IMG style="BORDER-RIGHT: #ffffff 5px solid; BORDER-TOP: #ffffff 5px solid; BORDER-LEFT: #ffffff 5px solid; BORDER-BOTTOM: #ffffff 5px solid"
                height=45 src="{$imgurl}/no_prev.gif" width=60><BR>&lt; PREV
                {else}
                {if $link[0].vid ne "" and $link[0].key ne ""}
                <A href="{$baseurl}/view_video.php?viewkey={$link[0].key}&page={$smarty.request.page}&viewtype={$smarty.request.viewtype}&category={$smarty.request.category}">
                <IMG style="BORDER-RIGHT: #ffffff 5px solid; BORDER-TOP: #ffffff 5px solid; BORDER-LEFT: #ffffff 5px solid; BORDER-BOTTOM: #ffffff 5px solid"
                height=45 src="{$tmburl}/1_{$link[0].vid}.jpg" width=60>
                </A>
                <DIV style="FONT-WEIGHT: bold; FONT-SIZE: 10px; PADDING-TOP: 3px">
                <A href="{$baseurl}/view_video.php?viewkey={$link[0].key}&page={$smarty.request.page}&viewtype={$smarty.request.viewtype}&category={$smarty.request.category}">&lt; PREV</A>
                </DIV>
                {/if}
                {/if}
                </TD>

                <TD align=middle style="padding-top:10px;">
                {insert name=adv_status assign=status adv_name='video_right_single'}
                {if $status eq "Active"}
                        {insert name=advertise adv_name='video_right_single'}
                {else}
                        {if $link[1].vid ne "" and $link[1].key ne ""}
                        <IMG style="BORDER-RIGHT: #ffffff 5px solid; BORDER-TOP: #ffffff 5px solid; BORDER-LEFT: #ffffff 5px solid; BORDER-BOTTOM: #ffffff 5px solid" height=60
                        src="{$tmburl}/1_{$link[1].vid}.jpg" width=80>
                        <DIV style="FONT-WEIGHT: bold; FONT-SIZE: 10px; PADDING-TOP: 3px">NOW PLAYING</DIV>
                        {/if}
                {/if}
                </TD>

                <TD align=middle style="padding-left:8px;">
                {if $rowcount eq "$rowmaxcount"}
                <IMG style="BORDER-RIGHT: #ffffff 5px solid; BORDER-TOP: #ffffff 5px solid; BORDER-LEFT: #ffffff 5px solid; BORDER-BOTTOM: #ffffff 5px solid"
                height=45 src="{$imgurl}/no_next.gif" width=60><BR>NEXT &gt;
                {else}
                {if $link[2].vid ne "" and $link[2].key ne ""}
                <A href="{$baseurl}/view_video.php?viewkey={$link[2].key}&page={$smarty.request.page}&viewtype={$smarty.request.viewtype}&category={$smarty.request.category}">
                <IMG style="BORDER-RIGHT: #ffffff 5px solid; BORDER-TOP: #ffffff 5px solid; BORDER-LEFT: #ffffff 5px solid; BORDER-BOTTOM: #ffffff 5px solid" height=45
                src="{$tmburl}/1_{$link[2].vid}.jpg" width=60>
                </A>
                <DIV style="FONT-WEIGHT: bold; FONT-SIZE: 10px; PADDING-TOP: 3px">
                <A href="{$baseurl}/view_video.php?viewkey={$link[2].key}&page={$smarty.request.page}&viewtype={$smarty.request.viewtype}&category={$smarty.request.category}">NEXT &gt;</A>
                </DIV>
                {/if}
                {/if}
                </TD>
                

                
        
                </TR>
                </TBODY>
                </TABLE>
                

        </TD>
        <td width="1" bgcolor="#BABDBF"></td>
       </tr>
        <tr><td height="1" bgcolor="#BABDBF" colspan=3></td></tr>
</TBODY>
</TABLE>
</DIV>
              

<TABLE cellSpacing=0 cellPadding=0 width=300 align=center bgColor=#cccccc border=0>
<TBODY>


<TR>
<TD width=300>

        {if $smarty.request.category eq ""}
        <table border=0 cellspacing=0 cellpadding=0>

               
                                                        <tr>
                              <td align="center">
                                                                <table width="102%"  border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="5" height="24" background="images/nv_2_l.jpg"><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                  <th background="images/nv_2_bg.jpg"><div align="left">
                                      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td class="white_bold"> Related Video's {$items_per_page} of {$total}</td>
                                          <td width="150" class="white_regular"><A href="{$baseurl}/search_result.php?search_type=related&search_key={$smarty.request.viewkey}" target=_parent>
                See All Results</A></td>
                                          </tr>
                                      </table>
                                  </div></th>
                                  <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                </tr>
                              </table></td>
                            </tr>
                            </table>
                            </td>
                            </tr>
                            <tr>
                            <td>





                
                <DIV id=side_results
                style="OVERFLOW: auto; WIDTH: 300px; HEIGHT: 350px"
                onscroll=render_full_side(); name="side_results" align=center>

                {section name=i loop=$answers}
                {if $smarty.request.viewkey eq $answers[i].vkey}<DIV class=moduleFrameEntrySelected>{else}<DIV class=moduleFrameEntry>{/if}
                <TABLE cellSpacing=0 cellPadding=0 width=284 border=0>
                <TBODY>
                <TR vAlign=top>
                <TD width=90>
                <A class=bold href="{$baseurl}/view_video.php?viewkey={$answers[i].vkey}&page={$smarty.request.page}&viewtype={$smarty.request.viewtype}&category={$smarty.request.category}" target=_parent>
                <IMG class=moduleEntryThumb height=60 src="{$tmburl}/1_{$answers[i].VID}.jpg" width=80>
                </A>
                </TD>
                <TD>
                <DIV class=moduleFrameTitle>
                <A href="{$baseurl}/view_video.php?viewkey={$answers[i].vkey}&page={$smarty.request.page}&viewtype={$smarty.request.viewtype}&category={$smarty.request.category}" target=_parent>
                {$answers[i].title}</A></DIV>
                <DIV class=moduleFrameDetails>by
                {insert name=id_to_name assign=uname un=$answers[i].UID}
                <A href="{$baseurl}/uprofile.php?UID={$answers[i].UID}" target=_parent>{$uname}</A>
                </DIV>
                <DIV class=moduleFrameDetails>Runtime: {$answers[i].duration|string_format:"%.2f"}<BR>
                Views: {$answers[i].viewnumber}<BR>
                {insert name=comment_count assign=commentcount vid=$answers[i].VID}
                Comments: {$commentcount}
                </DIV>
                {if $smarty.request.viewkey eq $answers[i].vkey}
                <DIV style="PADDING-RIGHT: 6px; PADDING-LEFT: 6px; FONT-WEIGHT: bold; FONT-SIZE: 10px;
                PADDING-BOTTOM: 3px; COLOR: #cc6600; PADDING-TOP: 3px; BACKGROUND-COLOR: #ffcc66">
                <NOBR>&lt;&lt;&lt;NOW PLAYING!</NOBR>
                </DIV>
                {/if}
                <DIV style="FONT-SIZE: 11px; MARGIN-RIGHT: 5px">
                <A href="{$baseurl}/search_result.php?search_type=related&search_key={$smarty.request.viewkey}" target=_parent>
                See All Results</A></DIV>
                </TD></TR></TBODY></TABLE>
                </DIV>
                {/section}
                
        {else}

                <DIV class=moduleTitleBar>
                <TABLE cellSpacing=0 cellPadding=0 width=300 border=0>
                <TBODY>
                <TR vAlign=top>
                <TD>
                
                <table border=0 cellspacing=0 cellpadding=0 width=300>

               
                                                        <tr>
                              <td align="center"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="5" height="24" background="images/nv_2_l.jpg"><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                  <th background="images/nv_2_bg.jpg"><div align="left">
                                      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td class="white_bold"> {insert name=tag_to_name assign=tagname tag=$smarty.request.category}
                {$tagname} {$start_num}-{$end_num} of {$total}
</td>
                                          <td width="150" class="white_regular"><A href="{$baseurl}/video.php?page={$smarty.request.page}&viewtype={$smarty.request.viewtype}&category={$smarty.request.category}" target=_parent>
                See All Results</A></td>
                                          </tr>
                                      </table>
                                  </div></th>
                                  <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                </tr>
                              </table></td>
                            </tr>
                            </table>
                
                
                </TD>
                </TR>
                </TBODY>
                </TABLE>
                </DIV>

                <DIV id=side_results
                style="OVERFLOW: auto; WIDTH: 300px; HEIGHT: 350px"
                onscroll=render_full_side(); name="side_results">

                {section name=i loop=$answers}
                {if $smarty.request.viewkey eq $answers[i].vkey}<DIV class=moduleFrameEntrySelected>{else}<DIV class=moduleFrameEntry>{/if}
                <TABLE cellSpacing=0 cellPadding=0 width=284 border=0>
                <TBODY>
                <tr><td height=8></td></tr>
                <TR vAlign=top>
                <TD width=90>
                <A class=bold href="{$baseurl}/view_video.php?viewkey={$answers[i].vkey}&page={$smarty.request.page}&viewtype={$smarty.request.viewtype}&category={$smarty.request.category}" target=_parent>
                <IMG class=moduleEntryThumb height=60 src="{$tmburl}/1_{$answers[i].VID}.jpg" width=80>
                </A>
                </TD>
                <TD>
                <DIV class=moduleFrameTitle>
                <A href="{$baseurl}/view_video.php?viewkey={$answers[i].vkey}&page={$smarty.request.page}&viewtype={$smarty.request.viewtype}&category={$smarty.request.category}" target=_parent>
                {$answers[i].title}</A></DIV>
                <DIV class=moduleFrameDetails>by
                {insert name=id_to_name assign=uname un=$answers[i].UID}
                <A href="{$baseurl}/uprofile.php?UID={$answers[i].UID}" target=_parent>{$uname}</A>
                </DIV>
                <DIV class=moduleFrameDetails>Runtime: {$answers[i].duration|string_format:"%.2f"}<BR>
                Views: {$answers[i].viewnumber}<BR>
                {insert name=comment_count assign=commentcount vid=$answers[i].VID}
                Comments: {$commentcount}
                </DIV>
                {if $smarty.request.viewkey eq $answers[i].vkey}
                <DIV style="PADDING-RIGHT: 6px; PADDING-LEFT: 6px; FONT-WEIGHT: bold; FONT-SIZE: 10px;
                PADDING-BOTTOM: 3px; COLOR: #cc6600; PADDING-TOP: 3px; BACKGROUND-COLOR: #ffcc66">
                <NOBR>&lt;&lt;&lt;NOW PLAYING!</NOBR>
                </DIV>
                {/if}
                <DIV style="FONT-SIZE: 11px; MARGIN-RIGHT: 5px">
                <A href="{$baseurl}/video.php?page={$smarty.request.page}&viewtype={$smarty.request.viewtype}&category={$smarty.request.category}" target=_parent>
                See All Results</A></DIV>
                </TD></TR></TBODY></TABLE>
                </DIV>
                {/section}
                
        {/if}

</TD>
</TR>
</TBODY>
</TABLE>
                <table width="312"  border="0" cellspacing="0" cellpadding="0">
          <tr>
          <td width=12></td>
            <td width="5" height="24" background="images/nv_2_l.jpg"><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
            <th background="images/nv_2_bg.jpg" align=left width=283><span class="white_bold" style=" PADDING-LEFT: 15px; MARGIN: 10px 0px 5px;" >Related Tags:</span></th>
            <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
          </tr>
      </table>

        <DIV style="FONT-WEIGHT: bold; PADDING-LEFT: 15px; MARGIN: 10px 0px 5px; COLOR: #333">Related Tags:</DIV>
        <DIV style="PADDING-RIGHT: 0px; PADDING-LEFT: 15px; PADDING-BOTTOM: 5px; COLOR: #999; PADDING-TOP: 0px">
        {section name=i loop=$tags}
        »<A style="FONT-SIZE: 12px" href="{$baseurl}/search_result.php?search_id={$tags[i]}">{$tags[i]}</A><BR>
        {/section}
        </DIV>
        <tr>
                              
                              <td height="1" bgcolor="#E1E3E4" colspan=3></td>
                            </tr>

            
</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></td></tr>
<tr><td width=771></td></tr>
</td>
                        </tr>


