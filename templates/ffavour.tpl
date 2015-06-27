
 <tr>
                <td align="center" valign="top">
<table width="746"  border="0" cellspacing="0" cellpadding="0">

                  <tr>
                  <td height=5>&nbsp;</td></tr>
                  <tr><td width=746>

{if $total gt "0"}
<DIV style="PADDING-BOTTOM: 12px"></DIV>
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
<TBODY>
<TR vAlign=top>
<TD style="PADDING-RIGHT: 15px">
        <TABLE class=roundedTable cellSpacing=0 cellPadding=0 width=550 align=center bgColor=#dddddd border=0>
        <TBODY>
        <TR>
        <TD></TD>
        <TD width=540>

                <DIV class=sunkenTitleBar><DIV class=sunkenTitle>
                <DIV style="FONT-WEIGHT: bold; FONT-SIZE: 12px; FLOAT: right; VERTICAL-ALIGN: bottom; COLOR: #444; MARGIN-RIGHT: 5px">
                Videos {$start_num}-{$end_num} of {$total} </DIV>
                {insert name=id_to_name assign=uname un=$smarty.request.UID}
                <SPAN>My Friends' Favorites</SPAN>
                </DIV></DIV>


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
                {insert name=id_to_name assign=uname un=$answers[i].UID}
                {insert name=time_to_date assign=todate tm=$answers[i].addtime}
                <P>Added: {$todate} by <a href="{$baseurl}/uprofile.php?UID={$answers[i].UID}">{$uname}</a> </P>
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
        <TD width=180>
        <TABLE class=roundedTable cellSpacing=0 cellPadding=0 width=180 align=center bgColor=#ffeebb border=0>
        <TBODY>
        <TR>
        <TD></TD>
        <TD width=170>
        <DIV style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; FONT-WEIGHT: bold; FONT-SIZE: 16px; PADDING-BOTTOM: 10px; PADDING-TOP: 5px; TEXT-ALIGN: center">
        <A href="{$baseurl}/invite_friends.php">Share your videos with friends!</A>
        </DIV>
        </TD>
        <TD></TD>
        </TR>
        </TBODY></TABLE>
        <DIV class=tag_list>My Tags: </DIV>
        <DIV class=tag_list>
        {section name=i loop=$tags}
        <P>» <A style="FONT-SIZE: 12px" href="{$baseurl}/search_result.php?search_id={$tags[i]}">{$tags[i]}</A></P>
        {/section}
        </DIV>
        </TD>
        
</TR></TBODY></TABLE>
</TD></TR></TBODY></TABLE>
{else}
<TABLE class=roundedTable cellSpacing=0 cellPadding=0 width=550 align=center border=0>
        <TBODY>
        <TR>
        <TD width=550 align=center>
                        <br><br><br>
                        <b>You have not invited any friends or family at this time!</b>
                        <br><br>
                        <a href='invite_friends.php'>Invite</a> your friends and family to start sharing videos today!
                        <br><br><br><br><br><br>
        </td></tr>
        </tbody>
        </table>
{/if}
  </td>
                        </tr>
                        <tr>
                  <td height=5>&nbsp;</td></tr>



