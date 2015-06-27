<html>
<head>
<title>{$site_name}</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <script src="{$baseurl}/ajax/cpaint2.inc.js" type="text/javascript"></script>
        <script language='javascript'>
              var imgurl='{$imgurl}';
              var baseurl='{$baseurl}';
        </script>
        <script src="{$baseurl}/js/myjavascriptfx.js" type="text/javascript"></script>
        <script language=JavaScript src={$baseurl}/js/indexonly.js></script>
        <script language=JavaScript src={$baseurl}/js/myjavascriptajax.js></script>
        <script language=JavaScript src={$baseurl}/js/myjavascript.js></script>
        <link href="{$baseurl}/css/style.css" rel="stylesheet" type="text/css">
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background-color="#F2F2F2" >

<table width="780" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>

        <td><table width="778" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    
                    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                          <tr>


                            <TD vAlign=top>
                                 <TABLE cellSpacing=0 cellPadding=0 width=750 border=0>
                                <TBODY>
                                        <TR vAlign=center>
                                                <td height="50" align="right" width=212>
                                                        <img src="images/logo.gif"   alt="">
                                                                                        
                                                </td>
                                                <td height="40">
                                                <span class="style1">&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="deep_gray_ragular">Everyone should be on TV!  Now you can upload 2 TV</span></td>
                                                <TD align=center><span class="normal_blue">
                                                
                                                        {insert name="msg_count" assign=total_msg}
                                                        
                                                        
                                                        {if $smarty.session.USERNAME ne ""}
                                                                <TABLE cellSpacing=0 cellPadding=0 border=0><TBODY><TR>
                                                                <TD>
                                                                        <A href="{$baseurl}/my_profile.php">{$smarty.session.USERNAME}</A>!
                                                                                &nbsp; <A href="{$baseurl}/inbox.php"><IMG
                                                                                style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 1px; VERTICAL-ALIGN: text-bottom; PADDING-TOP: 1px"
                                                                                height=12
                                                                                {if $total_msg eq ""}
                                                                                src="{$imgurl}/icon_mail_off.gif" width=14 border=0>{else}
                                                                                src="{$imgurl}/newmail.gif" border=0>{/if}</A>
                                                                        (<A href="{$baseurl}/inbox.php">{$total_msg}</A>) </TD>
                                                                <TD style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px">|</TD>
                                                                <TD><A href="{$baseurl}/logout.php">Log Out</A></TD>
                                                                <TD style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px">|</TD>
                                                                <TD style="PADDING-RIGHT: 5px"><A
                                                                href="{$baseurl}/help.php">Help</A></TD></TR></TBODY></TABLE></TD></TR></TBODY>
                                                                </TABLE>

                                                        {else}

                                                                <TABLE cellSpacing=0 cellPadding=0 border=0>
                                                                <TBODY>
                                                                        <TR>
                                                                                
                                                                                <TD>
                                                                                        <A href="{$baseurl}/signup.php"><STRONG>Sign Up</STRONG></A>
                                                                                </TD>
                                                                                <TD
                                                                                        style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px">|
                                                                                </TD>
                                                                                <TD>
                                                                                        <A href="{$baseurl}/login.php">Log In</A></TD>
                                                                                <TD
                                                                                        style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px">|</TD>
                                                                                        <TD style="PADDING-RIGHT: 5px"><A
                                                                                                href="{$baseurl}/help.php">Help</A></TD></TR></TBODY></TABLE></TD></TR></TBODY>
                                                                </TABLE>
                                                        {/if}
                                                </span>
                                                </td>
                                        </tr>
                                </tbody>
                        </table>
                        
                        </td>
                      </tr>
                      <tr>
                        <td align="center">
                        <table width="750"  border="0" cellspacing="1" cellpadding="0">
                          <tr align="center">
                                                                                                
                            <td width="88" height="26" background="images/button.jpg"> <span class="navigation_bold"><a href="{$baseurl}/index.php">Home</a></span></td>
                            <td width="88" background="images/button.jpg" class="navigation_bold"> <a href="{$baseurl}/upload.php">Upload</a></td>
                            <td width="88" background="images/button.jpg" class="navigation_bold"> <a href="{$baseurl}/video.php?next=watch">Watch</a></td>
                            <td width="88" background="images/button.jpg" class="navigation_bold"> <a href="{$baseurl}/channels.php">Channels</a></td>
                            <td width="88" background="images/button.jpg" class="navigation_bold"> <a href="{$baseurl}/groups.php">Groups</a></td>
                            <td width="88" background="images/button.jpg" class="navigation_bold"> <a href="{$baseurl}/friends.php">Friends</a></td>
                          </tr>
                        </table></td>
                      </tr>
                    </table></td>
                  </tr>
                </table></td>
              </tr>
              
              
{if $head_bottom ne ""}
{include file = head_bottom/$head_bottom}
{else}
{include file = head_bottom/blank.tpl}
{/if}
{if $head_bottom_add ne ""}
{include file = head_bottom/$head_bottom_add}
{/if}
