<tr>
                <td align="center" valign="top">
<table width="760"  border="0" cellspacing="0" cellpadding="0">

                  <tr>
                  <td height=5>&nbsp;</td></tr>
                  <tr><td width=760 height=250>

{if $total gt "0"}
<DIV style="PADDING-BOTTOM: 12px"></DIV>
<TABLE cellSpacing=0 cellPadding=4 width="760" align=center border=0>
<TBODY>
<TR vAlign=top>
<TD style="PADDING-RIGHT: 0px">
        <TABLE class=roundedTable cellSpacing=0 cellPadding=0 width=760 align=center border=0>
        <TBODY>
        <TR>
        <TD width=30></TD>
        <TD width=520 bgColor=#c0c0c0 >
        
        <table width="520"  border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td align="center"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="5" height="24" background="images/nv_2_l.jpg"><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                  <th background="images/nv_2_bg.jpg"><div align="left">
                                      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td class="white_bold">My audios</td>
                                          <td width="150" class="white_regular">audios {$start_num}-{$end_num} of {$total}</td>
                                          </tr>
                                      </table>
                                  </div></th>
                                  <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                </tr>
                              </table>






        {section name=i loop=$answers}
        <DIV>
        <DIV class=moduleEntry>
        <TABLE cellSpacing=0 cellPadding=4 width="89%" border=0>
        <TBODY>
        <TR vAlign=top>
                <TD align=middle>
                <A href="{$baseurl}/view_audio.php?viewkey={$answers[i].vkey}">
                <IMG class=moduleEntryThumb height=90 src="{$tmburl}/1_{$answers[i].VID}.jpg" width=120>
                </A>
                <FORM name=editVideoForm action="{$baseurl}/my_vdo_edit.php?VID={$answers[i].VID}" method=POST>
                <INPUT type=hidden value={$answers[i].VID} name="VID">
                <INPUT type=submit value="Edit audio" name="Edit Video">
                </FORM>
                <FORM name=removeVideoForm action="{$baseurl}/my_video.php" method=post>
                <INPUT type=hidden value=1 name=action_removevideo>
                <INPUT type=hidden value={$answers[i].VID} name="VID">
                <INPUT onclick="return confirm('Are you sure you want to remove this audio?');" type=submit value="Remove audio" name="remove_video">
                </FORM>
                </TD>
                <TD width="64%">
                <DIV class=moduleEntryTitle><A href="{$baseurl}/view_video.php?viewkey={$answers[i].vkey}">{$answers[i].title}</A></DIV>
                <DIV class=moduleEntryDescription>{$answers[i].description}</DIV>
                <DIV class=moduleEntryTags>Tags //
                {insert name=video_keyword assign=tags vid=$answers[i].VID}
                {section name=j loop=$tags}
                <A href="{$baseurl}/search_result.php?search_id={$tags[j]}">{$tags[j]}</A>&nbsp;
                {/section}
                </DIV>
                <DIV class=moduleEntryDetails>
                {insert name=time_to_date assign=todate tm=$answers[i].addtime}
                <P>Added: {$todate} </P>
                <P>Runtime: {$answers[i].duration|string_format:"%.2f"} | Views: {$answers[i].viewnumber} |
                {insert name=comment_count assign=commentcount vid=$answers[i].VID}
                Comments: {$commentcount}  </P>
                <P style="VERTICAL-ALIGN: middle">
                </P>
                <HR>
                <P>{$answers[i].filehome}</P>
                <P>Broadcast: <SPAN style="FONT-WEIGHT: bold; COLOR: #007700">{$answers[i].type} audio</SPAN> </P>
                <P>Status: <A href="{$baseurl}/help.php">Live!</A> </P>
                <P>
                <INPUT style="FONT-SIZE: 10px; TEXT-ALIGN: center" readOnly size=62
                 value="{$baseurl}/view_audio.php?viewkey={$answers[i].vkey}" name=video_link></P>
                <P>Share this audio with friends! Copy and paste the link above to an email or website.</P>
                </DIV>
                </TD>
        </TR>
        </TBODY>
        </TABLE>
        </DIV></DIV>
        {/section}
        
        
        
        
        <DIV>
        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR vAlign=top>
                <TD>
                <DIV class=moduleTitle>Pages: {$page_link}</DIV></TD>

        </TR>
        </TBODY>
        </TABLE>
        </DIV>
        
        </TD>
        </TR>
        </TBODY></TABLE></TD>
        <td width=10>&nbsp;</td>
        <TD width=200 valign=top >
        <TABLE class=roundedTable cellSpacing=0 cellPadding=0 width=200
        align=center  border=0 >
        <TBODY>
        <TR>

        <TD width=200>
       <table border=0 cellspacing=0 cellpadding=0>
        <tr>
                              <td height="24"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="5" height="24" background="images/nv_2_l.jpg"><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                    <th background="images/nv_2_bg.jpg"><A href="http://www.youtube.com/my_friends_invite"><span class="white_bold">Share your
        audios with friends!</span></a></th>
                                    <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                  </tr>
                              </table></td>
                            </tr></table>
       </TD>
        </TR>
        </TBODY></TABLE>
         <table border=0 cellspacing=0 cellpadding=0 bgcolor=#E1E3E4 width=200><tr><td valign=top>
        <DIV class=tag_list style="padding-left:10px;">My Tags: </DIV>
        <DIV class=tag_list style="padding-left:10px;">
        {section name=i loop=$mytags}
        <P>» <A style="FONT-SIZE: 12px" href="{$baseurl}/search_result.php?search_id={$mytags[i]}">{$mytags[i]}</A></P>
        {/section}
        </DIV> </td></tr></table>
        </TD>

</TR></TBODY></TABLE>
</TD></TR></TBODY></TABLE>
{else}
<center><b>There is no audio found</b></center>
{/if}
</td>
                        </tr>
                        <tr>
                  <td height=5>&nbsp;</td></tr> </table></td></tr>


