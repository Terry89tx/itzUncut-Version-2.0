<HTML><HEAD>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="{$baseurl}/css/admin.css" type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2600.0" name=GENERATOR></HEAD>
<BODY bgColor=#0e3985 leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
<TBODY>
<TR bgColor=#000066>
        <TD align=right height=5></TD>
</TR>
<TR bgColor=#009ACE>
        <TD>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
      <TR> 
              <TD width="80%" height="42"><font class="sitename">Administration Panel<font color="#000000"></font> </font><BR>
            </TD>
                  <TD class=w noWrap align=middle>{php} echo date("l, F d, Y"); {/php}</TD>
                  <TD noWrap align=middle width="1%"><IMG height=25 width=3></TD>
                  <TD class=w noWrap align=middle>current user: <B>{$smarty.session.AUID}</B></TD>
                  <TD noWrap align=middle width="1%"><IMG height=25 width=3></TD>
                  <TD noWrap align=middle><A class=w href="logout.php" target=_top><B>Logout</B></A></TD>
                  <TD width="1%">&nbsp;</TD>
        </TR>
        </TABLE>
        </TD>
</TR>
<TR bgColor=#009ACE>
        <TD>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
      <TBODY>
      <TR>
              <TD width=170></TD>
                {section name=aa loop=$HeadLinks}
              <TD width="15">
            <TABLE width="100%" border=0 cellPadding=5 cellSpacing=0 >
            <TBODY>
            <TR>
                    <TD align="middle" noWrap class="{if $active eq $HeadLinks[aa].0} tab_on {else} tab_s{/if}">
                        <A class="{if $active eq $HeadLinks[aa].0} tab_o {else} tab {/if}" href="{$HeadLinks[aa].1}" 
                  target="_top">{$HeadLinks[aa].0}</A></TD>
           </TR>
             </TBODY>
             </TABLE>
           </TD>
             {/section}
           <TD >&nbsp;</TD>
    </TR>
    </TBODY>
    </TABLE>
    
    <p class="sitename">&nbsp;</p>
    </TD>
</TR>
</TBODY>
</TABLE>

</BODY>
</HTML>



