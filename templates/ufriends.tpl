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
        <TABLE class=roundedTable cellSpacing=5 cellPadding=2 width=550 align=center bgColor=#dddddd border=0>
        <TBODY>
        <TR>
        <TD width=540 colspan=2>

                <DIV class=sunkenTitleBar><DIV class=sunkenTitle>
                <DIV style="FONT-WEIGHT: bold; FONT-SIZE: 12px; FLOAT: right; VERTICAL-ALIGN: bottom; COLOR: #444; MARGIN-RIGHT: 5px">
                Friends {$start_num}-{$end_num} of {$total} </DIV>
                {insert name=id_to_name assign=uname un=$smarty.request.UID}
                <SPAN>Friends // {$uname}</SPAN>
                </DIV></DIV>
        </td></tr>

                <DIV>
                {section name=i loop=$friends}
                    <TR vAlign=top>
                      <TD align=middle>
                        <DIV class=moduleEntryThumb>
                        <DIV style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; FONT-WEIGHT: bold; FONT-SIZE: 16px; PADDING-BOTTOM: 5px; PADDING-TOP: 5px">:-)
                        </DIV><IMG height=1 src="YouTube - Broadcast Yourself_files/pixel.gif" width=60 border=0></DIV></TD>
                      <TD width="100%">
                        <DIV style="FONT-WEIGHT: bold; FONT-SIZE: 14px; PADDING-BOTTOM: 3px">
                                {if $friends[i].friends_status eq "Confirmed"}
                                        <A href="uprofile.php?UID={$friends[i].FID}">{$friends[i].friends_name}</A>
                                {else}
                                        {$friends[i].friends_name}
                                {/if}
                        </DIV>
                        {if $friends[i].friends_status eq "Confirmed"}
                                {insert name=video_count assign=video uid=$friends[i].FID}
                                {insert name=favour_count assign=favour uid=$friends[i].FID}
                                {insert name=friends_count assign=frnd uid=$friends[i].FID}

                                <DIV style="FONT-SIZE: 12px; PADDING-BOTTOM: 5px">Videos: {if $video ne "0" and $video ne ""}<A
                                        href="uvideos.php?UID={$friends[i].FID}">{$video}</A>{else}0{/if}
                                        | Favorites: {if $favour ne "0"}<A
                                        href="ufavour.php?UID={$friends[i].FID}">{$favour}</A>{else}0{/if}
                                        | Friends: {if $frnd ne "0"}<A
                                        href="ufriends.php?UID={$friends[i].FID}">{$frnd}</A>{else}0{/if}
                                </DIV>
                        {/if}
                        {insert name=showlist assign=showlist id=$friends[i].id}
                        <DIV style="FONT-SIZE: 11px; PADDING-BOTTOM: 3px">Lists: {$showlist}
                        </DIV>
                        <DIV style="FONT-SIZE: 11px">Status: {$friends[i].friends_status}
                                {if $friends[i].friends_status eq "Pending"}
                                ({$friends[i].invite_date|date_format:"%B %e, %Y"})
                                {/if}
                        </DIV>
                    </TD></TR>
                    <tr><td colspan=2><hr style="border-bottom: 0px dashed #999999;"></td></tr>
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
        <A href="{$baseurl}/invite_friends.php">Share your videos with friends!</A>
        </DIV>
        </TD>
        <TD></TD>
        </TR>
        </TBODY></TABLE>
        </TD>
        
</TR></TBODY></TABLE>
</TD></TR></TBODY></TABLE>
{else}
<center><b>There is no friends found</b></center>
{/if}
  </td>
                        </tr>
                        <tr>
                  <td height=5>&nbsp;</td></tr>



