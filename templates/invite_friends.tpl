
  <tr>
                <td align="center" valign="top" width="764"><table width="737"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                  <td height=5 width="738">&nbsp;</td>
                 </tr>
                  
                  <tr><td width=738 style="padding-left:8px;">

                                                          <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="5" height="24" background="images/nv_2_l.jpg"><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                    <th background="images/nv_2_bg.jpg" align=left ><span class="white_bold" >Invite Your Friends</span></th>
                                    <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                  </tr>
                              </table>
<br>


<DIV style="PADDING-BOTTOM: 15px padding-left:8px;">
We'll send each person you list below an
email invitation to join YouTube as your friend or family.
</DIV><br>
<TABLE cellSpacing=0 cellPadding=5 width="738" border=0>
<FORM action=invite_friends.php method=post>
<TBODY>
<TR>
<TD align=right width=201><SPAN class=label><NOBR>Your First Name:</NOBR> </SPAN></TD>
<TD width="524">{if $first_name eq ""}<INPUT maxLength=60 size=30 name=first_name value="{$first_name}">{else}{$first_name}{/if}</TD>
</TR>
<TR>
<TD align=right width="201"><SPAN class=label>{if $smarty.request.UID eq ""}Email Addresses:{else}Send to:{/if}</SPAN></TD>
<TD width="524">
{if $smarty.request.UID eq ""}
Enter Email Addresses separated by Commas:<br>
<textarea id=recipients name=recipients cols=40 rows=3>{$smarty.request.recipients}</textarea>
{else}
<input type="hidden" name=UID value="{$smarty.request.UID}">
{insert name=id_to_name assign=uname un=$smarty.request.UID}
{$uname}
{/if}
</TD>
</TR>
<TR><TD style="FONT-SIZE: 1px" colSpan=2 width="737">&nbsp;</TD></TR>
<TR><TD style="FONT-SIZE: 1px" colSpan=2 width="737">&nbsp;</TD></TR>
<TR vAlign=top>
<TD align=right width="201"><SPAN class=label>Your Message:</SPAN></TD>
<TD width="524">
<DIV 
	{if $smarty.request.UID eq ""}
		class="formHighlight2"
	{else}
		class="formHighlight"
	{/if}

style="width: 499; height: 364">
{if $smarty.request.UID eq ""}
Hello [first name],
{else}
{insert name=id_to_name assign=uname un=$smarty.request.UID}
Hello {$uname},
{/if}
<BR><BR>

{$site_name} is a
new site for sharing and hosting personal videos. I have been
<BR>using YouTube to share videos with my friends and family. I
would like to add <BR>you to the list of people I may share videos
with. <BR><BR>Personal message from [first name]: <BR><BR>
<TEXTAREA name=message rows=5 cols=45>Have you heard about YouTube? I love this site.</TEXTAREA>
<BR><BR>Thanks, <BR>{if $first_name eq ""}[your first name]{else}{$first_name}{/if}<BR><BR></DIV></TD>
</TR>
<TR>
<TD width="201">&nbsp;</TD>
<TD width="524"><INPUT type=submit value="Send Invite" name=action_invite></TD>
</TR>
</FORM>
</TBODY>
</TABLE>
</TD>
</TR>
</TABLE>

</td>
                        </tr>


