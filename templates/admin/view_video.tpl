<TABLE cellSpacing=0 cellPadding=0 width=790 align=center border=0>
<TBODY>
<TR vAlign=top>
<TD style="PADDING-RIGHT: 15px" width=510>

                {insert name=video_info assign=vinfo vid=$VID}

                <DIV style="PADDING-LEFT: 22px; FONT-WEIGHT: bold; FONT-SIZE: 16px; COLOR: #333333"><!-- google_ad_section_start -->
                {$vinfo[0].title}
                
                <!-- google_ad_section_end --></DIV><!-- google_ad_section_start(weight=ignore) -->
                <DIV style="PADDING-BOTTOM: 8px; TEXT-ALIGN: center">
                <DIV id=flashcontent>
                <DIV style="PADDING-RIGHT: 20px; PADDING-LEFT: 20px; FONT-WEIGHT: bold; FONT-SIZE: 14px; PADDING-BOTTOM: 20px; PADDING-TOP: 20px">

                <embed name='RAOCXplayer' src='{$vdourl}/{$vinfo[0].vdoname}' type='application/x-mplayer2' width='300' height='300' ShowControls='1' ShowStatusBar='0' loop='true'
                EnableContextMenu='0' DisplaySize='0' pluginspage='http://www.microsoft.com/Windows/Downloads/Contents/Products/MediaPlayer/'> </DIV></DIV></DIV>



                <DIV style="FONT-WEIGHT: bold; FONT-SIZE: 12px; PADDING-BOTTOM: 10px; TEXT-ALIGN: center"><A
                href="http://www.youtube.com/signup_login?&amp;next=watch&amp;r=c&amp;v=f2CSpDUpwr8">Post
                Comments</A>&nbsp;&nbsp;//&nbsp;&nbsp;
                <A href="http://www.youtube.com/signup_login?&amp;next=watch&amp;r=a&amp;v=f2CSpDUpwr8">Add
                to Favorites</A> &nbsp;&nbsp;//&nbsp;&nbsp;
                <A href="http://www.youtube.com/signup_login?&amp;next=watch&amp;r=o&amp;v=f2CSpDUpwr8">Flag
                This Video</A> </DIV>
                <TABLE cellSpacing=0 cellPadding=0 width=400 align=center
                border=0><TBODY>
                <TR>
                <TD style="PADDING-BOTTOM: 15px">
                  <DIV id=ratingDiv
                  style="MARGIN-RIGHT: 5em; TEXT-ALIGN: center"><SPAN
                  id=ratingMessage>Be the first to rate this video!</SPAN><BR><A
                  title="Please sign up and login to rate this video."
                  style="TEXT-DECORATION: none"
                  href="http://www.youtube.com/signup_login?next=watch?v=f2CSpDUpwr8"><NOBR><IMG
                  class=rating src="YouTube - best ever_files/star_bg.gif"> <IMG
                  class=rating src="YouTube - best ever_files/star_bg.gif"> <IMG
                  class=rating src="YouTube - best ever_files/star_bg.gif"> <IMG
                  class=rating src="YouTube - best ever_files/star_bg.gif"> <IMG
                  class=rating src="YouTube - best ever_files/star_bg.gif">
                  </NOBR></A></DIV><!-- <br clear="all" />
                                </div> -->
</TD></TR></TBODY></TABLE><!-- google_ad_section_end -->

<TABLE cellSpacing=0 cellPadding=0 width=485 align=center border=0>
<TBODY>
<TR>
<TD>
<DIV class=watchDescription>
<!-- google_ad_section_start -->bubble skills are amazing when your name is me <!-- google_ad_section_end --></DIV>
        <DIV style="FONT-SIZE: 11px; PADDING-BOTTOM: 18px">

        Added on January 23, 2006, 12:12 AM by {insert name=id_to_name assign=uname un=$UID}
        <A href="{$baseurl}/uprofile.php?UID={$UID}">{$uname}</A>
        
        </DIV>
</TD></TR></TBODY></TABLE>
                
                
                <TABLE cellSpacing=0 cellPadding=0 width=485 align=center border=0><TBODY>
                <TR vAlign=top>
                <TD style="BORDER-RIGHT: #aaaaaa 1px dotted; PADDING-RIGHT: 5px"
                width=245>
                <DIV
                style="FONT-WEIGHT: bold; PADDING-BOTTOM: 7px; COLOR: #003399">Video
                Details //</DIV>
                <DIV style="FONT-SIZE: 11px; PADDING-BOTTOM: 10px">
                Runtime: {$vinfo[0].duration|string_format:"%.2f"} | Views: {$vinfo[0].viewnumber} |
                <A href="http://www.youtube.com/w/best-ever?v=f2CSpDUpwr8&amp;feature=Recent&amp;page=1&amp;t=t&amp;f=b#comment">
                Comments</A>: 1 </DIV>
                <DIV style="PADDING-BOTTOM: 10px"><SPAN
                style="PADDING-RIGHT: 2px; PADDING-LEFT: 2px; PADDING-BOTTOM: 2px; PADDING-TOP: 2px; BACKGROUND-COLOR: #ffffaa">Tags:</SPAN>&nbsp;
<!-- google_ad_section_start -->
                {insert name=video_keyword assign=keyword vid=$VID}
                {section name=j loop=$keyword}
                <A href="{$baseurl}/search.php?searchkey={$keyword[j]}">{$keyword[j]}</A>&nbsp;
                {/section}
<!-- google_ad_section_end --></DIV>
                <DIV style="PADDING-BOTTOM: 10px"><SPAN
                style="PADDING-RIGHT: 2px; PADDING-LEFT: 2px; PADDING-BOTTOM: 2px; PADDING-TOP: 2px; BACKGROUND-COLOR: #ffffaa">
                Channels:</SPAN>&nbsp;
<!-- google_ad_section_start -->
                {insert name=video_channel assign=channel vid=$VID}
                {section name=k loop=$channel}
                <A href="http://www.youtube.com/channels_portal?c=13">{$channel[k].name}</A>&nbsp;
                {/section}
<!-- google_ad_section_end --></DIV>
                <DIV style="FONT-SIZE: 11px; PADDING-BOTTOM: 10px"></DIV></TD>
                <TD style="PADDING-LEFT: 10px" width=240>
                <DIV style="FONT-WEIGHT: bold; FONT-SIZE: 12px; PADDING-BOTTOM: 7px; COLOR: #003399">User Details //</DIV>
                <DIV style="FONT-SIZE: 11px; PADDING-BOTTOM: 10px">
                <A href="http://www.youtube.com/profile_videos?user=kellyemeraldhart">Videos</A>:
                  1 | <A
                  href="http://www.youtube.com/profile_favorites?user=kellyemeraldhart">Favorites</A>:
                  0 | <A
                  href="http://www.youtube.com/profile_friends?user=kellyemeraldhart">Friends</A>:
                  0 </DIV>
                  <DIV style="PADDING-BOTTOM: 10px"><SPAN
                  style="PADDING-RIGHT: 2px; PADDING-LEFT: 2px; PADDING-BOTTOM: 2px; PADDING-TOP: 2px; BACKGROUND-COLOR: #ffffaa">User
                  Name:</SPAN>&nbsp;
                  <A href="{$baseurl}/uprofile.php?UID={$UID}">{$uname}</A>
                  </DIV>
                  <DIV style="PADDING-BOTTOM: 5px"><IMG
                  src="{$imgurl}/SubscribeIcon.gif"
                  align=absMiddle>&nbsp;<A
                  href="http://www.youtube.com/subscription_center?add_user=kellyemeraldhart">subscribe</A>
                  to {$uname}'s videos </DIV>
                  <DIV style="PADDING-BOTTOM: 10px"><IMG height=20
                  src="{$imgurl}/Little_Man.gif" width=15
                  align=absMiddle>&nbsp;I am online now! </DIV>
                  <DIV style="FONT-WEIGHT: bold; PADDING-BOTTOM: 10px"><A
                  href="http://www.youtube.com/signup?r=o&amp;v=f2CSpDUpwr8">Send
                  Me a Private Message!</A> </DIV></TD></TR></TBODY></TABLE><BR><!-- watchTable -->
            <TABLE style="TABLE-LAYOUT: fixed" cellSpacing=0 cellPadding=0
            width=485 align=center border=0>
              <TBODY>
              <TR>
                <TD>

                <FORM id=linkForm name=linkForm>
                        <TABLE style="TABLE-LAYOUT: fixed" cellSpacing=0 cellPadding=0 width=485 border=0>
                        <TBODY>
                        <TR>
                        <TD width="33%">
                        <DIV
                        style="FONT-WEIGHT: bold; FONT-SIZE: 12px; PADDING-BOTTOM: 7px; COLOR: #003399"
                        align=left>Share Details // &nbsp;<A
                        href="http://www.youtube.com/sharing">Help?</A>
                        </DIV></TD>
                        <TD width="67%">&nbsp;</TD></TR><!-- google_ad_section_start(weight=ignore) -->
                        <TR>
                        <TD vAlign=top><SPAN
                        style="PADDING-RIGHT: 2px; PADDING-LEFT: 2px; PADDING-BOTTOM: 2px; PADDING-TOP: 2px; BACKGROUND-COLOR: #ffffaa">Video
                        URL (Permalink):</SPAN><FONT
                        style="COLOR: #000000">&nbsp;&nbsp;</FONT></TD>
                        <TD vAlign=top><input
                        style="FONT-SIZE: 10px; WIDTH: 500px"
                        onclick=javascript:document.linkForm.video_link.focus();document.linkForm.video_link.select();
                        readOnly value="http://www.youtube.com/?v=f2CSpDUpwr8"
                        name=video_link>
                        <DIV style="FONT-SIZE: 11px">(E-mail or link
                        it)<BR><BR></DIV></TD></TR>
                        <TR>
                        <TD vAlign=top><SPAN
                        style="PADDING-RIGHT: 2px; PADDING-LEFT: 2px; PADDING-BOTTOM: 2px; PADDING-TOP: 2px; BACKGROUND-COLOR: #ffffaa">Embeddable
                        Player:</SPAN></TD>
                        <TD vAlign=top><INPUT
                        style="FONT-SIZE: 10px; WIDTH: 500px; TEXT-ALIGN: center"
                        onclick=javascript:document.linkForm.video_play.focus();document.linkForm.video_play.select();
                        readOnly
                        value="<embed name='RAOCXplayer' src='{$baseurl}/video/test.mpg' type='application/x-mplayer2' width='300' height='300' ShowControls='1' ShowStatusBar='0' loop='true'
                        EnableContextMenu='0' DisplaySize='0' pluginspage='http://www.microsoft.com/Windows/Downloads/Contents/Products/MediaPlayer/'>"
                        name=video_play>
                        <DIV style="FONT-SIZE: 11px">(Put this video on your
                        website. Works on Friendster, eBay, Blogger,
                        MySpace!)<BR><BR></DIV></TD></TR><!-- google_ad_section_end -->
                        <TR></TR></TBODY></TABLE>
                        </FORM></TD></TR></TBODY></TABLE><BR><A
            name=comment></A>
            <DIV
            style="FONT-WEIGHT: bold; PADDING-BOTTOM: 5px; COLOR: #444">Comment
            on this video:</DIV>
            <DIV id=div_main_comment></DIV></FORM>
            <DIV></DIV><BR>
            <TABLE width=495>
              <TBODY>
              <TR>
                <TD>
                  <TABLE class=commentsTitle width="100%">
                    <TBODY>
                    <TR>
                      <TD>Comments (1): </TD></TR></TBODY></TABLE></TD></TR>
              <TR>
                <TD><A name=6rk1N61CRTY>
                  <TABLE class=parentSection id=comment_6rk1N61CRTY
                  style="MARGIN-LEFT: 0px" width="100%">
                    <TBODY>
                    <TR vAlign=top>
                      <TD>You really BLEW that bubble nicely
                        <DIV class=userStats><A
                        href="http://www.youtube.com/profile?user=smoocher333">smoocher333</A>
                        // <A
                        href="http://www.youtube.com/profile_videos?user=smoocher333">Videos</A>
                        (0) | <A
                        href="http://www.youtube.com/profile_favorites?user=smoocher333">Favorites</A>
                        (1) | <A
                        href="http://www.youtube.com/profile_friends?user=smoocher333">Friends</A>
                        (1) - (7 seconds ago) </DIV>
                        <DIV class=userStats
                        id=container_comment_form_id_6rk1N61CRTY
                        style="DISPLAY: none"></DIV>
                        <DIV class=userStats
                        id=reply_comment_form_id_6rk1N61CRTY>(<A
                        href="javascript:showCommentReplyForm('comment_form_id_6rk1N61CRTY',%20'6rk1N61CRTY',%20false);">Reply
                        to this</A>) &nbsp; (<A
                        href="javascript:showCommentReplyForm('comment_form_id_6rk1N61CRTY',%20'',%20false);">Create
                        new thread</A>) &nbsp; </DIV>
                        <DIV
                    id=div_comment_form_id_6rk1N61CRTY></DIV></TD></TR></TBODY></TABLE></A></TD></TR></TBODY></TABLE><A
            name=flag></A>
            <TABLE style="MARGIN-TOP: 10px" cellSpacing=0 cellPadding=0
            width=495 align=center bgColor=#ffeebb border=0>
              <TBODY>
              <TR>
                <TD><IMG height=5
                  src="YouTube - best ever_files/box_login_tl.gif" width=5></TD>
                <TD><IMG height=5 src="YouTube - best ever_files/pixel.gif"
                  width=1></TD>
                <TD><IMG height=5
                  src="YouTube - best ever_files/box_login_tr.gif"
width=5></TD></TR>
              <TR>
                <TD><IMG height=1 src="YouTube - best ever_files/pixel.gif"
                  width=5></TD>
                <TD
                style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 10px; PADDING-TOP: 5px; TEXT-ALIGN: center"
                width=485>
                  <DIV style="FONT-SIZE: 14px; PADDING-BOTTOM: 5px">Please help
                  keep this site <STRONG>FUN</STRONG>, <STRONG>CLEAN</STRONG>,
                  and <STRONG>REAL</STRONG>. </DIV>
                  <DIV style="FONT-SIZE: 12px">Flag this video:&nbsp; <A
                  href="http://www.youtube.com/flag_video?v=f2CSpDUpwr8&amp;flag=F">Feature
                  This!</A> &nbsp; <A
                  href="http://www.youtube.com/flag_video?v=f2CSpDUpwr8&amp;flag=I">Inappropriate</A>
                  </DIV></TD>
                <TD><IMG height=1 src="YouTube - best ever_files/pixel.gif"
                  width=5></TD></TR>
              <TR>
                <TD><IMG height=5
                  src="YouTube - best ever_files/box_login_bl.gif" width=5></TD>
                <TD><IMG height=5 src="YouTube - best ever_files/pixel.gif"
                  width=1></TD>
                <TD><IMG height=5
                  src="YouTube - best ever_files/box_login_br.gif" width=5>
</TD></TR></TBODY></TABLE>
</TD>
<TD width=300>

        <DIV style="PADDING-BOTTOM: 10px">
        <TABLE cellSpacing=0 cellPadding=0 width=300 align=center bgColor=#eeeeee border=0>
        <TBODY>
        <TR>
        <TD><IMG height=5
                  src="YouTube - best ever_files/box_login_tl.gif" width=5></TD>
        <TD><IMG height=5 src="YouTube - best ever_files/pixel.gif"
                  width=1></TD>
        <TD><IMG height=5
                  src="YouTube - best ever_files/box_login_tr.gif" width=5></TD>
        </TR>
        <TR>
        <TD><IMG height=1 src="YouTube - best ever_files/pixel.gif" width=5></TD>
        <TD style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 5px; PADDING-TOP: 5px" width=300>

                <TABLE cellSpacing=0 cellPadding=0 width=300 border=0>
                <TBODY>
                <TR>
                <TD align=middle>
                {if $link[0].vid ne "" and $link[0].key ne ""}
                <A href="{$baseurl}/view_video.php?viewkey={$link[0].key}&viewtype={$smarty.request.viewtype}&category={$smarty.request.category}">
                <IMG style="BORDER-RIGHT: #ffffff 5px solid; BORDER-TOP: #ffffff 5px solid; BORDER-LEFT: #ffffff 5px solid; BORDER-BOTTOM: #ffffff 5px solid"
                height=45 src="{$tmburl}/1_{$link[0].vid}.jpg" width=60>
                </A>
                <DIV style="FONT-WEIGHT: bold; FONT-SIZE: 10px; PADDING-TOP: 3px">
                <A href="{$baseurl}/view_video.php?viewkey={$link[0].key}&viewtype={$smarty.request.viewtype}&category={$smarty.request.category}">&lt; PREV</A>
                </DIV>
                {else}
                <IMG style="BORDER-RIGHT: #ffffff 5px solid; BORDER-TOP: #ffffff 5px solid; BORDER-LEFT: #ffffff 5px solid; BORDER-BOTTOM: #ffffff 5px solid"
                height=45 src="{$imgurl}/no_prev.gif" width=60><BR>&lt; PREV
                {/if}
                </TD>

                <TD align=middle>
                {if $link[1].vid ne "" and $link[1].key ne ""}
                <IMG style="BORDER-RIGHT: #ffffff 5px solid; BORDER-TOP: #ffffff 5px solid; BORDER-LEFT: #ffffff 5px solid; BORDER-BOTTOM: #ffffff 5px solid" height=60
                src="{$tmburl}/1_{$link[1].vid}.jpg" width=80>
                <DIV style="FONT-WEIGHT: bold; FONT-SIZE: 10px; PADDING-TOP: 3px">NOW PLAYING</DIV>
                {/if}
                </TD>

                <TD align=middle>
                {if $link[2].vid ne "" and $link[2].key ne ""}
                <A href="{$baseurl}/view_video.php?viewkey={$link[2].key}&viewtype={$smarty.request.viewtype}&category={$smarty.request.category}">
                <IMG style="BORDER-RIGHT: #ffffff 5px solid; BORDER-TOP: #ffffff 5px solid; BORDER-LEFT: #ffffff 5px solid; BORDER-BOTTOM: #ffffff 5px solid" height=45
                src="{$tmburl}/1_{$link[2].vid}.jpg" width=60>
                </A>
                <DIV style="FONT-WEIGHT: bold; FONT-SIZE: 10px; PADDING-TOP: 3px">
                <A href="{$baseurl}/view_video.php?viewkey={$link[2].key}&viewtype={$smarty.request.viewtype}&category={$smarty.request.category}">NEXT &gt;</A>
                </DIV>
                {else}
                <IMG style="BORDER-RIGHT: #ffffff 5px solid; BORDER-TOP: #ffffff 5px solid; BORDER-LEFT: #ffffff 5px solid; BORDER-BOTTOM: #ffffff 5px solid"
                height=45 src="{$imgurl}/no_prev.gif" width=60><BR>NEXT &gt;
                {/if}
                </TD>
                
                </TR>
                </TBODY>
                </TABLE>

        </TD>
        <TD><IMG height=1 src="YouTube - best ever_files/pixel.gif" width=5></TD>
        </TR>
        <TR>
        <TD><IMG height=5 src="YouTube - best ever_files/box_login_bl.gif" width=5></TD>
        <TD><IMG height=5 src="YouTube - best ever_files/pixel.gif" width=1></TD>
        <TD><IMG height=5 src="YouTube - best ever_files/box_login_br.gif" width=5></TD>
</TR>
</TBODY>
</TABLE>
</DIV>
              

<TABLE cellSpacing=0 cellPadding=0 width=300 align=center bgColor=#cccccc border=0>
<TBODY>
<TR>
<TD><IMG height=5 src="YouTube - best ever_files/box_login_tl.gif" width=5></TD>
                <TD><IMG height=5 src="YouTube - best ever_files/pixel.gif"
                  width=1></TD>
                <TD><IMG height=5
                  src="YouTube - best ever_files/box_login_tr.gif"
width=5></TD></TR>
              <TR>
                <TD><IMG height=1 src="YouTube - best ever_files/pixel.gif" width=5></TD>
                <TD width=300>


                <DIV class=moduleTitleBar>
                <TABLE cellSpacing=0 cellPadding=0 width=300 border=0>
                <TBODY>
                <TR vAlign=top>
                
                <TD>
                <DIV class=moduleFrameBarTitle>
                {insert name=tag_to_name assign=tagname tag=$smarty.request.category}
                {$tagname} {$start_num}-{$end_num} of {$total}
                </DIV>
                </TD>
                
                <TD align=right>
                <DIV style="FONT-SIZE: 11px; MARGIN-RIGHT: 5px">
                <A href="{$baseurl}/video.php?page={$smarty.request.page}&viewtype={$smarty.request.viewtype}&category={$smarty.request.category}" target=_parent>
                See All Results</A></DIV>
                </TD></TR></TBODY></TABLE></DIV>
                
                <DIV id=side_results
                style="OVERFLOW: auto; WIDTH: 301px; HEIGHT: 350px"
                onscroll=render_full_side(); name="side_results">

                        {section name=i loop=$answers}
                        <DIV class=moduleFrameEntry>
                        <TABLE cellSpacing=0 cellPadding=0 width=235 border=0>
                        <TBODY>
                        <TR vAlign=top>
                        <TD width=90>
                        <A class=bold href="{$baseurl}/view_video.php?viewkey={$answers[i].vkey}&page={$smarty.request.page}&viewtype={$smarty.request.viewtype}&category={$smarty.request.category}" target=_parent>
                        {insert name=video_to_thumb assign=thname vdo=$answers[i].vdoname}
                        <IMG class=moduleEntryThumb height=60 src="{$tmburl}/1_{$thname}" width=80>
                        </A>
                        </TD>
                        <TD>
                        <DIV class=moduleFrameTitle>
                        <A href="{$baseurl}/view_video.php?viewkey={$answers[i].vkey}&page={$smarty.request.page}&start_num={$start_num}&viewtype={$smarty.request.viewtype}&category={$smarty.request.category}" target=_parent>
                        {$answers[i].title}</A></DIV>
                        <DIV class=moduleFrameDetails>by <A
                        href="http://www.youtube.com/profile?user=queerinmesoftly"
                        target=_parent>queerinmesoftly</A> </DIV>
                        <DIV class=moduleFrameDetails>Runtime: {$answers[i].duration|string_format:"%.2f"}<BR>
                        Views: {$answers[i].viewnumber}<BR>Comments: 0 </DIV>
                        {if $smarty.request.viewkey eq $answers[i].vkey}
                        <DIV style="PADDING-RIGHT: 6px; PADDING-LEFT: 6px; FONT-WEIGHT: bold; FONT-SIZE: 10px;
                        PADDING-BOTTOM: 3px; COLOR: #cc6600; PADDING-TOP: 3px; BACKGROUND-COLOR: #ffcc66">
                        <NOBR>&lt;&lt;&lt;NOW PLAYING!</NOBR>
                        </DIV>
                        {/if}
                        </TD></TR></TBODY></TABLE>
                        </DIV>
                        {/section}

                <DIV class=moduleFrameEntry>
                <TABLE cellSpacing=0 cellPadding=0 width=235 border=0>
                <TBODY>
                <TR vAlign=top align=middle>
                <TD>
                <A href="{$baseurl}/video.php?page={$smarty.request.page}&viewtype={$smarty.request.viewtype}&category={$smarty.request.category}" target=_parent>
                See All Results</A></TD></TR></TBODY></TABLE></DIV></DIV>
                </TD><TD><IMG height=1 src="YouTube - best ever_files/pixel.gif" width=5></TD></TR>
                <TR>
                <TD><IMG height=5 src="YouTube - best ever_files/box_login_bl.gif" width=5></TD>
                <TD><IMG height=5 src="YouTube - best ever_files/pixel.gif" width=1></TD>
                <TD><IMG height=5 src="YouTube - best ever_files/box_login_br.gif" width=5></TD>
                </TR>
                </TBODY>
                </TABLE>
                <DIV style="FONT-WEIGHT: bold; MARGIN: 10px 0px 5px; COLOR: #333">Related Tags:</DIV>


            <DIV style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 5px; COLOR: #999; PADDING-TOP: 0px">
            »<A href="http://www.youtube.com/results?search=video">video</A></DIV>
            
</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
