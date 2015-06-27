<TABLE cellSpacing=0 cellPadding=0 align=center border=0>
<TBODY>
<TR>
{if $smarty.request.gid eq ""}
        <TD><A href="{$baseurl}/groups_home.php?urlkey={$smarty.request.urlkey}&gid={$answers[0].GID}">Group Home</A></TD>
        <TD style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px">|</TD>
        <TD><A href="{$baseurl}/gvideos.php?urlkey={$smarty.request.urlkey}&gid={$answers[0].GID}">Group Videos</A></TD>
        <TD style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px">|</TD>
        <TD><A href="{$baseurl}/gmembers.php?urlkey={$smarty.request.urlkey}&gid={$answers[0].GID}">Group Members</A></TD>
        <TD style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px">|</TD>
        
        {insert name=getfield assign=owner_id field='OID' table='group_own' qfield=GID qvalue=$answers[0].GID}
        {if $smarty.session.UID eq $owner_id and $gupload eq "owner_only"}
        <TD><A href="{$baseurl}/add_video.php?urlkey={$smarty.request.urlkey}&gid={$answers[0].GID}">Add Videos</A></TD>
        <TD style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px">|</TD>
        {/if}
        {if $gupload ne "owner_only"}
        <TD><A href="{$baseurl}/add_video.php?urlkey={$smarty.request.urlkey}&gid={$answers[0].GID}">Add Videos</A></TD>
        <TD style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px">|</TD>
        {/if}
        
        <TD><A href="{$baseurl}/invite_members.php?urlkey={$smarty.request.urlkey}&gid={$answers[0].GID}">Invite Members</A></TD>
{else}
<TD><A href="{$baseurl}/groups_home.php?urlkey={$smarty.request.urlkey}&gid={$smarty.request.gid}">Group Home</A></TD>
        <TD style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px">|</TD>
        <TD><A href="{$baseurl}/gvideos.php?urlkey={$smarty.request.urlkey}&gid={$smarty.request.gid}">Group Videos</A></TD>
        <TD style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px">|</TD>
        <TD><A href="{$baseurl}/gmembers.php?urlkey={$smarty.request.urlkey}&gid={$smarty.request.gid}">Group Members</A></TD>
        <TD style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px">|</TD>

        {insert name=getfield assign=owner_id field='OID' table='group_own' qfield=GID qvalue=$smarty.request.gid}
        {if $smarty.session.UID eq $owner_id and $gupload eq "owner_only"}
        <TD><A href="{$baseurl}/add_video.php?urlkey={$smarty.request.urlkey}&gid={$smarty.request.gid}">Add Videos</A></TD>
        <TD style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px">|</TD>
        {/if}
        {if $gupload ne "owner_only"}
        <TD><A href="{$baseurl}/add_video.php?urlkey={$smarty.request.urlkey}&gid={$smarty.request.gid}">Add Videos</A></TD>
        <TD style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px">|</TD>
        {/if}

        <TD><A href="{$baseurl}/invite_members.php?urlkey={$smarty.request.urlkey}&gid={$smarty.request.gid}">Invite Members</A></TD>
{/if}
</TR>
</TBODY>
</TABLE><BR>
