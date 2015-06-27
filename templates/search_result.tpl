<tr><td valign=top height=250>

{if $total gt "0"}
<DIV style="MARGIN-BOTTOM: 10px; COLOR: #333; PADDING-TOP: 10px">
<B>Related Tags:</B>
{section name=i loop=$tags}
<A style="FONT-SIZE: 12px" href="{$baseurl}/search_result.php?search_id={$tags[i]}">{$tags[i]}</A>&nbsp;
{/section}
</DIV>

<DIV style="MARGIN-BOTTOM: 10px; COLOR: #333; PADDING-TOP: 10px">
<B>Sort by:</B> Relevance -
<A href="{$baseurl}/search_result.php?page={$page}&search_type={$smarty.request.search_type}&search_id={$smarty.request.search_id}&sort=adddate">Date Added</A> -
<A href="{$baseurl}/search_result.php?page={$page}&search_type={$smarty.request.search_type}&search_id={$smarty.request.search_id}&sort=title">Title</A> -
<A href="{$baseurl}/search_result.php?page={$page}&search_type={$smarty.request.search_type}&search_id={$smarty.request.search_id}&sort=viewnum">View Count</A> -
<A href="{$baseurl}/search_result.php?page={$page}&search_type={$smarty.request.search_type}&search_id={$smarty.request.search_id}&sort=rate">Rating</A>
</DIV>
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center bgColor=#cccccc border=0>
<TBODY>
<TR><TD>

        <DIV class=moduleTitleBar>
        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR vAlign=top>
        <TD>
        <DIV class=moduleTitle>Search // {$smarty.request.search_id}</DIV></TD>
        <TD align=right>
        <DIV style="MARGIN-RIGHT: 5px">Results <B>{$start_num}</B>-<B>{$end_num}</B> of <B>{$total}</B> for
        <B>
        ' {if $smarty.request.search_type eq "related"}
        {section name=k loop=$ch}{$ch[k]}&nbsp;{/section}
        {else}
        {$smarty.request.search_id}
        {/if} '
        </B>
        <SPAN style="FONT-SIZE: smaller"> ({$ttime} seconds)</SPAN>
        </DIV>
        </TD>
        </TR>
        </TBODY>
        </TABLE>
        </DIV>


        {section name=i loop=$answers}
        <DIV class=moduleEntry>
        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR vAlign=top>
        <TD>
        <TABLE cellSpacing=0 cellPadding=0 border=0><TBODY><TR>
        <TD><A href="{$baseurl}/view_video.php?viewkey={$answers[i].vkey}">
        <IMG class=moduleEntryThumb height=75 src="{$tmburl}/1_{$answers[i].VID}.jpg" width=100>
        </A>
        </TD>
        <TD>
        <A href="{$baseurl}/view_video.php?viewkey={$answers[i].vkey}">
        <IMG class=moduleEntryThumb height=75 src="{$tmburl}/2_{$answers[i].VID}.jpg" width=100>
        </A>
        </TD>
        <TD>
        <A href="{$baseurl}/view_video.php?viewkey={$answers[i].vkey}">
        <IMG class=moduleEntryThumb height=75 src="{$tmburl}/3_{$answers[i].VID}.jpg" width=100>
        </A>
        </TD>
        </TR></TBODY></TABLE>
        </TD>
        
        <TD width=100%>
        <DIV class=moduleEntryTitle>
        <A href="{$baseurl}/view_video.php?viewkey={$answers[i].vkey}">{$answers[i].title}</A></DIV>
        <DIV class=moduleEntryDescription>{$answers[i].description}</DIV>
        <DIV class=moduleEntryTags>Tags //
        {insert name=video_keyword assign=tags vid=$answers[i].VID}
        {section name=j loop=$tags}
        <A href="{$baseurl}/search_result.php?search_id={$tags[j]}">{$tags[j]}</A>&nbsp;
        {/section}
        </DIV>

        <DIV class=moduleEntryDetails>Channels //
        {insert name=video_channel assign=channel vid=$answers[i].VID}
        {section name=k loop=$channel}
        <A href="{$baseurl}/channel_detail.php?chid={$channel[k].CHID}">{$channel[k].name}</A>&nbsp;
        {/section}
        </DIV>
        
        <DIV class=moduleEntryDetails>Added:
        {insert name=time_range assign=timeran vid=$answers[i].VID}{$timeran} by
        {insert name=id_to_name assign=uname un=$answers[i].UID}
        <A href="{$baseurl}/uprofile.php?UID={$answers[i].UID}">{$uname}</A>
        </DIV>
        <DIV class=moduleEntryDetails>
        Runtime: {$answers[i].duration|string_format:"%.2f"} | Views: {$answers[i].viewnumber} |
        {insert name=comment_count assign=commentcount vid=$answers[i].VID}
        Comments: {$commentcount}
        </DIV>
        <NOBR>{insert name=show_rate assign=rate rte=$answers[i].rate}{$rate}</NOBR>
        </TD></TR>
        </TABLE>
        </DIV>
        {/section}

        </TBODY>
        </TABLE>
        </DIV>

        <DIV class=moduleTitleBar>
        <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR vAlign=top>
        <TD>
        <DIV class=moduleTitle>Pages: {$page_link}</DIV></TD>
        </TR>
        </TBODY>
        </TABLE>
        </DIV>
        

</TD><TR></TBODY>
</TABLE>
{/if}

</td></tr>

