{if $err ne ""}
<table width="100%" align="center" bgcolor="#FFE2D5"cellpadding="6" cellspacing="3" border="0">
<tr><td align="center" bgcolor="#FFFFFF"><span class="error">{$err}</span></td></tr>
</table>
<br>
{/if}
{if $msg ne ""}
<table width="100%" align="center" bgcolor="#FFE2D5" cellpadding="6" cellspacing="3" border="0">
<tr><td align="center" bgcolor="#FFFFFF"><span class="success">{$msg}</span></td></tr>
</table>
<br>
{/if}
