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
        <TABLE class=roundedTable cellSpacing=5 cellPadding=2 width=550 align=center bgColor=#dddddd border=0>
        <TBODY>
        <TR>
        <TD width=540 colspan=2>

                <DIV class=sunkenTitleBar><DIV class=sunkenTitle>
                <DIV style="FONT-WEIGHT: bold; FONT-SIZE: 12px; FLOAT: right; VERTICAL-ALIGN: bottom; COLOR: #444; MARGIN-RIGHT: 5px">
                Members {$start_num}-{$end_num} of {$total} </DIV>
                <SPAN><font size="2px"><b><a href="{$baseurl}/groups_home.php?urlkey={$gurl}">{$gname}</a> // Members</b></font></SPAN>
                </DIV></DIV>
        </td></tr>

                <DIV>
                {insert name=getfield assign=owner_id field='OID' table='group_own' qfield=GID qvalue=$smarty.request.gid}
                {section name=i loop=$friends}
                {if $smarty.session.UID eq $owner_id or $friends[i].approved eq "yes"}

                    <TR vAlign=top>
                      <TD align=middle>
                        <DIV>

                        {insert name=member_img UID=$friends[i].MID}</DIV></TD>
                      <TD width="100%">
                        <DIV style="FONT-WEIGHT: bold; FONT-SIZE: 14px; PADDING-BOTTOM: 3px">
                                        {insert name=id_to_name assign=uname un=$friends[i].MID}
                                        <A href="uprofile.php?UID={$friends[i].MID}">{$uname}</A>
                        </DIV>
                                {insert name=video_count assign=video uid=$friends[i].MID}
                                {insert name=favour_count assign=favour uid=$friends[i].MID}
                                {insert name=friends_count assign=frnd uid=$friends[i].MID}

                                <DIV style="FONT-SIZE: 12px; PADDING-BOTTOM: 5px">Videos: {if $video ne "0" and $video ne ""}<A
                                        href="uvideos.php?UID={$friends[i].MID}">{$video}</A>{else}0{/if}
                                        | Favorites: {if $favour ne "0"}<A
                                        href="ufavour.php?UID={$friends[i].MID}">{$favour}</A>{else}0{/if}
                                        | Friends: {if $frnd ne "0"}<A
                                        href="ufriends.php?UID={$friends[i].MID}">{$frnd}</A>{else}0{/if}
                                </DIV>
                        <DIV style="FONT-SIZE: 11px; PADDING-BOTTOM: 3px">Member Since: {$friends[i].member_since|date_format}
                        </DIV>

                        {insert name=getfield assign=owner_id field='OID' table='group_own' qfield=GID qvalue=$smarty.request.gid}
                        {if $smarty.session.UID eq $owner_id and $friends[i].approved eq "no"}
                                <form action="{$baseurl}/gmembers.php?urlkey={$smarty.request.urlkey}&gid={$smarty.request.gid}" method="POST" >
                                <input type=hidden name=AID value={$friends[i].AID}>
                                <input type=hidden name=MID value={$friends[i].MID}>
                                <input type=submit name=approve_mem value="Approve {$uname}">
                                </form>
                        {/if}
                        {if $smarty.session.UID eq $owner_id and $owner_id ne $friends[i].MID}
                                <form action="{$baseurl}/gmembers.php?urlkey={$smarty.request.urlkey}&gid={$smarty.request.gid}" method="POST" onsubmit="javascript: return confirm('Are you sure to delete this member from the group?');">
                                <input type=hidden name=MID value={$friends[i].MID}>
                                <input type=submit name=remove_mem value="Remove From Group">
                                </form>
                        {/if}
                    </TD></TR>
                    <tr><td colspan=2><hr style="border-bottom: 0px dashed #999999;"></td></tr>
                {/if}
                {/section}
                    <tr><TD colspan=2><DIV class=moduleTitle>Pages: {$page_link}</DIV></TD></tr>
                </DIV>


        </TBODY></TABLE></TD>
        <TD width=180 valign="top">
        <TABLE class=roundedTable cellSpacing=0 cellPadding=0 width=180 align=center bgColor=#ffeebb border=0>
        <TBODY>
        <TR>
        <TD></TD>
        <TD width=170>
        <DIV style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; FONT-WEIGHT: bold; FONT-SIZE: 16px; PADDING-BOTTOM: 10px; PADDING-TOP: 5px; TEXT-ALIGN: center">
        <A href="{$baseurl}/invite_members.php?urlkey={$smarty.request.urlkey}">Share your videos with friends!</A>
        </DIV>
        </TD>
        <TD></TD>
        </TR>
        </TBODY></TABLE>
        </TD>
        
</TR></TBODY></TABLE>
</TD></TR></TBODY></TABLE>
{/if}
  </td>
                        </tr>
                        <tr>
                  <td height=5>&nbsp;</td></tr>



