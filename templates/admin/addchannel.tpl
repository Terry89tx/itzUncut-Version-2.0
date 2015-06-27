<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>

<td width="100%" valign="top" bgcolor="#FFFFFF" >
<br><b>Add Channel</b><br><br><br>
{include file = admin/admin_err_msg.tpl}


<FORM METHOD="POST" ACTION="addchannel.php" encType=multipart/form-data>
<TABLE cellSpacing=0 cellPadding=5 width="100%" border=0><TBODY>
<TR>
<TD align=right width=200><SPAN class=label><NOBR>Name: </NOBR></SPAN></TD>
<TD><INPUT type=text maxLength=60 size=40 name=channel></TD>
</TR>
<TR>
<TD align=right width=200><SPAN class=label><NOBR>Description: </NOBR></SPAN></TD>
<TD><INPUT type=text maxLength=60 size=40 name=descrip></TD>
</TR>
<td>&nbsp;</td>
<td><INPUT TYPE="SUBMIT" name='addchannel' VALUE="Add" class="buttonwhite"></td>
</tr>

</table>
</FORM>
</td>
</tr>
</table>
