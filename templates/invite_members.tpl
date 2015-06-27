<FORM action=invite_members.php?urlkey={$smarty.request.urlkey} id=fform name=fform method=post onsubmit="return false;">
<input type="hidden" name="send" value="send">
<div id='friends_div'></div>
  <tr>
                <td align="center" valign="top" width="764"><table width="737"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                  <td height=5 width="738">&nbsp;</td>
                 </tr>
                  
                  <tr><td width=738 style="padding-left:8px;">

                                                          <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="5" height="24" background="images/nv_2_l.jpg"><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                    <th background="images/nv_2_bg.jpg" align=left ><span class="white_bold" >Invite Friends to {$gname}</span></th>
                                    <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                  </tr>
                              </table>
<br>
<table width="100%">
<tr>
        <td align="center">
                <select name='myfriends' id='myfriends' size=10 style="width:200px;">
                {$fname}
                </select>
        </td>
        <td align="center">
                <input type='button' name='add_all' value='Add All >>' style="width:120px;" onclick='invite_mem_addall();'><br><br>
                <input type='button' name='add' value='Add >' style="width:120px;" onclick='invite_mem_add();'><br><br>
                <input type='button' name='remove' value='< Remove' style="width:120px;" onclick='invite_mem_remove();'><br><br>
                <input type='button' name='remove_all' value='<< Remove All' style="width:120px;" onclick='invite_mem_removeall();'><br><br>
        </td>
        <td align="center">
                <select name='invitefriends' id='invitefriends' size=10 style="width:200px;">
                </select>
        </td>
</tr>
</table>
<br><br>
<TABLE cellSpacing=0 cellPadding=5 width="738" border=0>
<TBODY>
<tr><td colspan=2><h3>Invite New Friends</h3><hr></td></tr>
<TR>
<TD align=right width="201"><SPAN class=label>Email Address: </SPAN></TD>
<TD width="524">
        Enter Email Addresses separated by Commas:<br>
        <textarea id=recipients name=recipients cols=40 rows=3>{$smarty.request.recipients}</textarea>
</TD>
</TR>
<TR><TD style="FONT-SIZE: 1px" colSpan=2 width="737">&nbsp;</TD></TR>
<TR vAlign=top>
<TD align=right width="201"><SPAN class=label>Your Message:</SPAN></TD>
<TD width="524">
<DIV class=formHighlight style="width: 499;">
<b>Subject:</b> {$smarty.session.USERNAME} has invited you to join {$site_name} group {$gname}
<br><br>Enter your message below,
<TEXTAREA name=message rows=5 cols=45>{$smarty.request.message}</TEXTAREA>
<BR><BR>Thanks, <BR>{if $first_name eq ""}[your first name]{else}{$first_name}{/if}<BR><BR></DIV></TD>
</TR>
<TR>
<TD width="201">&nbsp;</TD>
<TD width="524"><INPUT type=button value="Send" name=action_invite onclick="invite_mem_send();"></TD>
</TR>
</TBODY>
</TABLE>
</TD>
</TR>
</TABLE>

</td>
                        </tr>

</FORM>
