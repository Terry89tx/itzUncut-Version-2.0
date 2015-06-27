
<tr>
                <td align="center" valign="top">
<table width="746"  border="0" cellspacing="0" cellpadding="0">

                  <tr>
                  <td height=5>&nbsp;</td></tr>
                  <tr><td width=746 height=250>

{if $total gt "0"}
<DIV style="PADDING-BOTTOM: 12px"></DIV>
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
<TBODY>

<TD width=30></TD>
<TR vAlign=top>
<TD width=20></TD>
<TD style="PADDING-RIGHT: 15px">
        <TABLE class=roundedTable cellSpacing=0 cellPadding=0 width=540 align=center bgColor=#dddddd border=0s>
        <TBODY>
        <TR>

        <TD width=540 bgColor=#c0c0c0 >

        <table width="540"  border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td align="center"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="5" height="24" background="images/nv_2_l.jpg"><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                  <th background="images/nv_2_bg.jpg"><div align="left">
                                      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td class="white_bold">My Playlist</td>
                                          <td width="150" class="white_regular">Videos {$start_num}-{$end_num} of {$total}</td>
                                          </tr>
                                      </table>
                                  </div></th>
                                  <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                </tr>
                              </table>
                              </td></tr></table>



                <DIV>
                {section name=i loop=$answers}
                <DIV class=moduleEntry>
                <TABLE cellSpacing=0 cellPadding=4 width="100%" border=0>
                <TBODY>
                <TR vAlign=top>
                <TD align=middle>
                <A href="{$baseurl}/view_video.php?viewkey={$answers[i].vkey}">
                <IMG class=moduleEntryThumb height=90 src="{$tmburl}/1_{$answers[i].VID}.jpg" width=120>
                </A>
                </TD>
                <TD width="100%">
                <DIV class=moduleEntryTitle>
                <A href="{$baseurl}/view_video.php?viewkey={$answers[i].vkey}">{$answers[i].title}</A>
                </DIV>
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
                Comments: {$commentcount} </P>
                <P style="VERTICAL-ALIGN: middle">
                Rating: {insert name=show_rate assign=vrate rte=$answers[i].rate}{$vrate}</P>
                </DIV>
                </TD></TR></TBODY></TABLE></DIV>
                {/section}
                </DIV>
                
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
        <TD></TD></TR>
        </TBODY></TABLE></TD>
        <TD width=200>
        <TABLE class=roundedTable cellSpacing=0 cellPadding=0 width=180 align=center bgColor=#ffeebb border=0>
        <TBODY>
        <TR>
        <TD></TD>
        <TD width=200>
        <table border=0 cellspacing=0 cellpadding=0>
        <tr>
                              <td height="24"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="5" height="24" background="images/nv_2_l.jpg"><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                    <th background="images/nv_2_bg.jpg"><A href="{$baseurl}/invite_friends.php"><span class="white_bold">Share your
        videos with friends!</span></a></th>
                                    <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                  </tr>
                              </table></td>
                            </tr></table>

        </TD>
        <TD></TD>
        </TR>
        </TBODY></TABLE>
        <table border=0 cellspacing=0 cellpadding=0 bgcolor=#E1E3E4 width=200><tr><td valign=top>
        <DIV class=tag_list style="padding-left:8px;">My Tags: </DIV>
        <DIV class=tag_list style="padding-left:10px;">
        {section name=i loop=$mytags}
        <P>» <A style="FONT-SIZE: 12px" href="{$baseurl}/search_result.php?search_id={$mytags[i]}">{$mytags[i]}</A></P>
        {/section}
        </DIV>
        </td></tr></table>

</DIV></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
{else}
<center><b>There is no playlist found</b></center>
{/if}
</td>
                        </tr>
                        <tr>
                  <td height=5>&nbsp;</td></tr>


