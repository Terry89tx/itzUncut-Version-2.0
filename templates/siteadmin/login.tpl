<HTML>

<HEAD><title>Welcome to {$site_name}</title>

<META http-equiv=Content-Type content="text/html; charset=utf-8">
<META content="MSHTML 6.00.2600.0" name=GENERATOR>
<link href="{$BASE_URL}/css/admin.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="{$BASE_URL}/include/javascript.js"></script>
</HEAD>
<BODY bgColor=#ffffff leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">

<TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
<TBODY>
<TR bgColor=#009ACE> 
        <TD width="80%" height="42"><font class="sitename">{$site_name}</font></TD>
            <td align="right">&nbsp;</td>
</TR>
<TR bgColor=#cccccc>
        <TD height=15></TD>
        <td></td>
</TR>
<TR bgColor=#eeeeee>
        <TD height=15></TD>
        <td></td>
</TR>
</TBODY>
</TABLE>

<FORM id=_ctl0 name=_ctl0 action="login.php" method="post">
<div id=loading>
    <table  border=1 cellpadding=12 cellspacing=0 bordercolor=#F7D7B7 bgcolor="#FBF5F4">
      <tr> 
        <td width="314" align=middle noWrap><font  size="2">One moment please. 
          <b>Loading Page..........</b></font></td>
      </tr>
    </table>
</div>

<DIV id=mainbody><!--body-->
<TABLE cellSpacing=15 cellPadding=0 width=650 align=center border=0>
<TBODY>
<TR>
    <TD noWrap align=middle colSpan=2> &nbsp;
    {if $msg ne "" }
    <table width="50%" border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="#E3D7B7" bgcolor="#F8F5ED">
    <tr valign="middle"> 
        <td  valign="middle" >
        <table border="0" cellpadding="0" cellspacing="0">
        <tr>
                <td width="17"><img src="{$IMG_URL}/alert.gif" width="16" height="16"></td>
                <td align="center" width="500"><font size="2" face="Verdana, Arial, Helvetica, sans-serif" color="#FF0000">                        <strong>&nbsp;&nbsp;&nbsp;Invalid</strong> Username or Password</font></td>
        </tr>
        </table>
        </td>
    </tr>
    </table>
    {/if}
    </TD>
</TR>

<TR>
<TD vAlign=top width="55%"><!--col002--><!--padding-->
        <TABLE cellSpacing=0 cellPadding=2 width="100%" bgColor=#dddddd border=0><TBODY>
      <TR>
                 <TD>
              <TABLE cellSpacing=0 cellPadding=5 width="100%" bgColor=#ffffff border=0>
            <TBODY>
            <TR>
                    <TD>
                  <TABLE cellSpacing=0 cellPadding=5 width="100%" bgColor=#f7f7f7 border=0>
                  <TBODY>
                  <TR>
                          <TD colSpan=2>
                        <TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
                        <TBODY>
                        <TR>
                                <TD><B>.: Login</B></TD>
                                </TR>
                                </TBODY>
                                </TABLE>
                                </TD>
                        </TR>
                                        <TR><TD colspan=2>{include file="err_msg.tpl"}</TD></TR>
                  <TR>
                      <TD align=middle colSpan=2>Enter your username and password to log in </TD>
                        </TR>
                  <TR>
                      <TD class=bk align=right width="30%">Username</TD>
                      <TD><INPUT class="field" id="username" size="25" name="uname"></TD></TR>
                  <TR>
                      <TD class="bk" align="right" width="30%">Password</TD>
                      <TD> <INPUT class="field" id="pass" type="password" size="25" name="pass"></TD>
                        </TR>
                        <TR>
                            <TD>&nbsp;</TD>
                            <TD><INPUT language="javascript" class="bttn" onclick="Process(); if (typeof(Page_ClientValidate) == 'function') Page_ClientValidate(); " type="submit" value="Log In" name="login">
                            </TD>
                        </TR>
                        <TR><TD colSpan=2> </TD></TR>
                        </TBODY>
                        </TABLE>
                        </TD>
                </TR>
                </TBODY>
                </TABLE>
                </TD>
        </TR>
        </TBODY>
        </TABLE>
        </TD>
      <TD class=g vAlign=top width="45%">Enter your admin username and password to log-in and manage the site. <br>Username and password is case sensitive.<BR><BR>
      </TD>
</TR>
</TBODY>
</TABLE>
</DIV>
</FORM>
</BODY>
</HTML>

