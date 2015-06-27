<HTML><HEAD>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="{$BASE_URL}/css/admin.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="{$BASE_URL}/include/main.js" type=text/javascript></SCRIPT>
<SCRIPT language=javascript src="{$BASE_URL}/include/menu.js" type=text/javascript></SCRIPT>
</HEAD>
<BODY bgColor=#eeeeee>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<tr>
        <td height="5"></td>
</tr>
<TR>
      <TD vAlign=top style="padding-left : 10px;">
	 <DIV id=mnpMenuTop>
		<DIV class=mnpInherit>
		        {section name=aa loop=$MainLinks}
 { if $MainLinks[aa].2 eq "1" }
	      <DIV class="MenuHead">
		<font class="MenuHead"><b>{$MainLinks[aa].0}</b></font>
	</DIV>
	<br>
        
	{section name=bb loop=$ChildLinks}
		{ if $ChildLinks[bb].2 eq $smarty.section.aa.index }
		       <DIV class=mnpMenuRow  style="width: 188">
				&nbsp;<img src="{$IMG_URL}/arrow_orange.gif" border="0">
			        <A class=menu_item href="{$ChildLinks[bb].1}" target="body">{$ChildLinks[bb].0}</A>
			</DIV><br>
		{/if}
       {/section}

{else}
      <DIV ><a HREF="{$MainLinks[aa].1}" target="body" class="menuhead">{$MainLinks[aa].0}</a></DIV><br>
{/if}
      {/section}
        
      </DIV>
      </DIV>
      </TD>
</TR>
</TBODY>
</TABLE>

</BODY>
</HTML>
