{if $is_mem eq "" and $type eq "private"}
        <div align="center">
                Sorry! You are not allowed to view this private group.
                <Br><br>
        </div>
{else}


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
<TR vAlign=top>
<TD style="PADDING-RIGHT: 15px">
        <TABLE class=roundedTable cellSpacing=0 cellPadding=0 width=550 align=center bgColor=#dddddd border=0>
        <TBODY>
        <TR>
        <TD></TD>
        <TD width=550>

                <DIV class=sunkenTitleBar><DIV class=sunkenTitle>
                <DIV style="FONT-WEIGHT: bold; FONT-SIZE: 12px; FLOAT: right; VERTICAL-ALIGN: bottom; COLOR: #444; MARGIN-RIGHT: 5px">
                Videos {$start_num}-{$end_num} of {$total} </DIV>
                <SPAN><font size="2px"><b><a href="{$baseurl}/groups_home.php?urlkey={$gurl}">{$gname}</a> // Videos</b></font></SPAN>
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
                
                {insert name=getfield assign=owner_id field='OID' table='group_own' qfield=GID qvalue=$smarty.request.gid}
                {if $smarty.session.UID eq $owner_id and $answers[i].approved eq "no"}
                <form action="{$baseurl}/gvideos.php?urlkey={$smarty.request.urlkey}&gid={$smarty.request.gid}" method="POST">
                <input type=hidden name=VID value={$answers[i].VID}>
                <input type=submit name=approve_it value="Approve It" >
                </form>
                {/if}
                
                {if $smarty.session.UID eq $owner_id}
                <form action="{$baseurl}/gvideos.php?urlkey={$smarty.request.urlkey}&gid={$smarty.request.gid}" method="POST" onsubmit="javascript: return confirm('Are you sure to delete this video from the group?');">
                <input type=hidden name=VID value={$answers[i].VID}>
                <input type=submit name=remove_image value="Remove From Group">
                </form>
                <form action="{$baseurl}/gvideos.php?urlkey={$smarty.request.urlkey}&gid={$smarty.request.gid}" method="POST">
                <input type=hidden name=VID value={$answers[i].VID}>
                {if $gimage eq "owner_only"}
                <input type=submit name=group_image value="Make Default Image" >
                {/if}
                </form>
                {/if}
                
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
                {insert name=id_to_name assign=uname un=$answers[i].UID}
                <P>Added: {$todate} by <a href="{$baseurl}/uprofile.php?UID={$answers[i].UID}">{$uname}</a></P>
                <P>Runtime: {$answers[i].duration|string_format:"%.2f"} | Views: {$answers[i].viewnumber} |
                {insert name=comment_count assign=commentcount vid=$answers[i].VID}
                Comments: {$commentcount}</P>
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
        <A href="http://www.youtube.com/my_friends_invite">Share your videos with friends!</A>
        </DIV>
        </TD>
        <TD></TD>
        </TR>
        </TBODY></TABLE>
        <DIV class=tag_list>My Tags: </DIV>
        <DIV class=tag_list>
        {section name=k loop=$vtags}
        <P>» <A style="FONT-SIZE: 12px" href="{$baseurl}/search_result.php?search_id={$vtags[k]}">{$vtags[k]}</A></P>
        {/section}
        </DIV>
</TD></TR></TBODY></TABLE>
</TD></TR></TBODY></TABLE>
{else}
<center><b>There is no video in this group</b></center>
{/if}
</td>
                        </tr>
                        <tr>
                  <td height=5>&nbsp;</td></tr>

{/if}
