{insert name=video_count assign=publicvdo uid=$smarty.request.UID type=public}
{insert name=video_count assign=privatvdo uid=$smarty.request.UID type=private}
{insert name=favour_count assign=favcount uid=$smarty.request.UID}
{insert name=group_count assign=grpcount uid=$smarty.request.UID}
{insert name=friends_count assign=friendcount uid=$smarty.request.UID}
{insert name=playlist_count assign=playcount uid=$smarty.request.UID}

<TABLE cellSpacing=0 cellPadding=0 align=center border=0>
<TBODY>
<TR>
        <TD><A href="{$baseurl}/uprofile.php?UID={$smarty.request.UID}">Profile</A> </TD>
        <TD style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px">|</TD>
        <TD><A href="{$baseurl}/uvideos.php?UID={$smarty.request.UID}&type=public">Public Videos</A> ({$publicvdo}) </TD>
        <TD style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px">|</TD>
        <TD><A href="{$baseurl}/uvideos.php?UID={$smarty.request.UID}&type=private">Private Videos</A> ({$privatvdo}) </TD>
        <TD style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px">|</TD>
        <TD><A href="{$baseurl}/ufavour.php?UID={$smarty.request.UID}">Favorites</A>({$favcount}) </TD>
        <TD style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px">|</TD>
        <TD><A href="{$baseurl}/ufriends.php?UID={$smarty.request.UID}">Friends</A>({$friendcount}) </TD>
        <TD style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px">|</TD>
        <TD><A href="{$baseurl}/uplaylist.php?UID={$smarty.request.UID}">Playlists</A>({$playcount}) </TD>
        <TD style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px">|</TD>
        <TD><A href="{$baseurl}/ugroups.php?UID={$smarty.request.UID}">Groups</A>({$grpcount}) </TD>
</TR>
</TBODY>
</TABLE>

