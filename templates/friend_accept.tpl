{if $AID ne ""}
<TABLE cellSpacing=0 cellPadding=5 border=0 align="center"><TBODY>
<tr><td colspan="3"><br></td></tr>
<tr><td align="center" colspan="3">
<DIV class=moduleEntry align="center">
{insert name=id_to_name assign=uname un=$UID}
<DIV class=tableSubTitle>Friend Invitation from {$uname} </DIV>
Accept thisinvitation if you know this user and wish to share videos with each other.
<BR><BR>
</td></tr>
<TR>
<TD class=label align=right width=200>User:</TD>
<TD><A href="{$baseurl}/uprofile.php?UID={$smarty.session.UID}">{$smarty.session.USERNAME}</A></TD></TR>
<TR><TD style="FONT-SIZE: 1px" colSpan=2>&nbsp;</TD></TR>

<TR>
<FORM action="{$baseurl}/friend_accept.php" method=post>
<INPUT type=hidden value=150E0406E61EE03D name=friend_link_id>
<TD class=label align=right>Accept?</TD>
<TD>
<INPUT type="hidden" value="{$AID}" name="AID">
<INPUT type=submit value="Yes, I want to share videos." name="friend_accept">
</TD>
</FORM>
</TR>
<TR>
<TD>&nbsp;</TD>
<FORM onsubmit="return confirm('Are you sure you want to deny this friend request?');"
action="{$baseurl}/friend_accept.php" method=post>
<INPUT type="hidden" value="{$AID}" name="AID">
<TD><INPUT type=submit value="No thanks." name="friend_deny">
</TD>
</FORM>
</TR>
</TBODY></TABLE>
</DIV>
{/if}

<Br><br>
