<head>
<title>{$site_name}</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
</style>
<link href="{$baseurl}/css/style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="{$baseurl}/js/javascript.js"></script>
<script language="javascript" src="{$baseurl}/js/install.js"></script>
</head>

<TABLE cellSpacing=0 cellPadding=0 width=800 align=center border=0>
  <TBODY>
  <TR>
    <TD style="PADDING-BOTTOM: 25px" bgColor=#ffffff>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR vAlign=top>
          <TD
          style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 5px; PADDING-TOP: 0px"
          width=130 rowSpan=2><A href="{$baseurl}/index.php"><IMG
            style="VERTICAL-ALIGN: middle" height=48 alt=YouTube
            src="{$imgurl}/logo_sm.gif" width=120
            border=0></A></TD>
          <TD vAlign=top>
                <TABLE cellSpacing=0 cellPadding=0 width=570 border=0>
                <TBODY>
                <TR vAlign=top>
                <TD style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; FONT-STYLE: italic">Broadcast
                yourself. Watch and share your videos worldwide!</TD>
                <TD align=right>


                        {if $smarty.session.USERNAME ne ""}
                        <TABLE cellSpacing=0 cellPadding=0 border=0><TBODY><TR>
                        <TD>Hello,
                        <A href="{$baseurl}/my_profile.php">{$smarty.session.USERNAME}</A>!
                        &nbsp; <A href="http://www.youtube.com/my_messages"><IMG
                        style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 1px; VERTICAL-ALIGN: text-bottom; PADDING-TOP: 1px"
                        height=12
                        src="{$imgurl}/icon_mail_off.gif" width=14 border=0></A>
                        (<A href="http://www.youtube.com/my_messages">0</A>) </TD>
                        <TD style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px">|</TD>
                        <TD><A href="{$baseurl}/logout.php">Log Out</A></TD>
                        <TD style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px">|</TD>
                        <TD style="PADDING-RIGHT: 5px"><A
                        href="http://www.youtube.com/help">Help</A></TD></TR></TBODY></TABLE></TD></TR></TBODY>
                        </TABLE>

                        {else}
                        
                        <TABLE cellSpacing=0 cellPadding=0 border=0>
                        <TBODY>
                        <TR>
                        <TD><A href="{$baseurl}/signup.php"><STRONG>Sign Up</STRONG></A></TD>
                        <TD
                        style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px">|</TD>
                        <TD><A href="{$baseurl}/login.php">Log In</A></TD>
                        <TD
                        style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px">|</TD>
                        <TD style="PADDING-RIGHT: 5px"><A
                        href="{$baseurl}/help.php">Help</A></TD></TR></TBODY></TABLE></TD></TR></TBODY>
                        </TABLE>
                        {/if}
                        
                        
                </TD></TR>
                <TR vAlign=bottom>
                <TD><!-- tab table -->
                <TABLE cellSpacing=0 cellPadding=0 border=1 bordercolor=#FFFFFF>
                <TBODY>
                <TR>

                <TD>
                
                        <TABLE style="MARGIN: 5px 2px 1px 0px; BORDER-BOTTOM: #dddddd 1px solid; BACKGROUND-COLOR: #dddddd" cellSpacing=0 cellPadding=0 border=0>
                        <TBODY>
                        <TR>
                        <TD><IMG height=5 src="YouTube - Broadcast Yourself_files/box_login_tl.gif" width=5></TD>
                        <TD><IMG height=5 src="YouTube - Broadcast Yourself_files/pixel.gif" width=1></TD>
                        <TD><IMG height=5 src="YouTube - Broadcast Yourself_files/box_login_tr.gif" width=5></TD></TR>
                        <TR>
                        <TD><IMG height=1 src="YouTube - Broadcast Yourself_files/pixel.gif" width=5></TD>
                        <TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 20px; FONT-WEIGHT: bold; FONT-SIZE: 13px; PADDING-BOTTOM: 5px; PADDING-TOP: 0px"><A
                        href="{$baseurl}/index.php">Home</A></TD>
                        <TD><IMG height=1
                        src="YouTube - Broadcast Yourself_files/pixel.gif"
                        width=5></TD>
                        </TR>
                        </TBODY>
                        </TABLE>
                </TD>
                <TD>
                       <TABLE style="MARGIN: 5px 2px 1px 0px; BORDER-BOTTOM: #dddddd 1px solid; BACKGROUND-COLOR: #dddddd" cellSpacing=0 cellPadding=0 border=0>
                        <TBODY>
                        <TR>
                        <TD><IMG height=5 src="YouTube - Broadcast Yourself_files/box_login_tl.gif" width=5></TD>
                        <TD><IMG height=5 src="YouTube - Broadcast Yourself_files/pixel.gif" width=1></TD>
                        <TD><IMG height=5 src="YouTube - Broadcast Yourself_files/box_login_tr.gif" width=5></TD></TR>
                        <TR>
                        <TD><IMG height=1 src="YouTube - Broadcast Yourself_files/pixel.gif" width=5></TD>
                        <TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 20px; FONT-WEIGHT: bold; FONT-SIZE: 13px; PADDING-BOTTOM: 5px; PADDING-TOP: 0px"><A
                        href="{$baseurl}/video.php">Videos</A></TD>
                        <TD><IMG height=1 src="YouTube - Broadcast Yourself_files/pixel.gif" width=5></TD>
                        </TR>
                        </TBODY>
                        </TABLE>
                </TD>
                <TD>
                        <TABLE style="MARGIN: 5px 2px 1px 0px; BORDER-BOTTOM: #dddddd 1px solid; BACKGROUND-COLOR: #dddddd" cellSpacing=0 cellPadding=0 border=0>
                        <TBODY>
                        <TR>
                        <TD><IMG height=5 src="YouTube - Broadcast Yourself_files/box_login_tl.gif" width=5></TD>
                        <TD><IMG height=5 src="YouTube - Broadcast Yourself_files/pixel.gif" width=1></TD>
                        <TD><IMG height=5 src="YouTube - Broadcast Yourself_files/box_login_tr.gif" width=5></TD></TR>
                        <TR>
                        <TD><IMG height=1 src="YouTube - Broadcast Yourself_files/pixel.gif" width=5></TD>
                        <TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 20px; FONT-WEIGHT: bold; FONT-SIZE: 13px; PADDING-BOTTOM: 5px; PADDING-TOP: 0px"><A
                        href="{$baseurl}/channels.php">Channels</A></TD>
                        <TD><IMG height=1
                        src="YouTube - Broadcast Yourself_files/pixel.gif"
                        width=5></TD>
                        </TR>
                        </TBODY>
                        </TABLE>
                </TD>
                <TD>
                        <TABLE style="MARGIN: 5px 2px 1px 0px; BORDER-BOTTOM: #dddddd 1px solid; BACKGROUND-COLOR: #dddddd" cellSpacing=0 cellPadding=0 border=0>
                        <TBODY>
                        <TR>
                        <TD><IMG height=5 src="YouTube - Broadcast Yourself_files/box_login_tl.gif" width=5></TD>
                        <TD><IMG height=5 src="YouTube - Broadcast Yourself_files/pixel.gif" width=1></TD>
                        <TD><IMG height=5 src="YouTube - Broadcast Yourself_files/box_login_tr.gif" width=5></TD></TR>
                        <TR>
                        <TD><IMG height=1 src="YouTube - Broadcast Yourself_files/pixel.gif" width=5></TD>
                        <TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 20px; FONT-WEIGHT: bold; FONT-SIZE: 13px; PADDING-BOTTOM: 5px; PADDING-TOP: 0px"><A
                        href="{$baseurl}/groups.php">Groups</A></TD>
                        <TD><IMG height=1
                        src="YouTube - Broadcast Yourself_files/pixel.gif"
                        width=5></TD>
                        </TR>
                        </TBODY>
                        </TABLE>
                </TD>
                <TD>
                        <TABLE style="MARGIN: 5px 2px 1px 0px; BORDER-BOTTOM: #dddddd 1px solid; BACKGROUND-COLOR: #dddddd" cellSpacing=0 cellPadding=0 border=0>
                        <TBODY>
                        <TR>
                        <TD><IMG height=5 src="YouTube - Broadcast Yourself_files/box_login_tl.gif" width=5></TD>
                        <TD><IMG height=5 src="YouTube - Broadcast Yourself_files/pixel.gif" width=1></TD>
                        <TD><IMG height=5 src="YouTube - Broadcast Yourself_files/box_login_tr.gif" width=5></TD></TR>
                        <TR>
                        <TD><IMG height=1 src="YouTube - Broadcast Yourself_files/pixel.gif" width=5></TD>
                        <TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 20px; FONT-WEIGHT: bold; FONT-SIZE: 13px; PADDING-BOTTOM: 5px; PADDING-TOP: 0px"><A
                        href="{$baseurl}/friends.php">Friends</A></TD>
                        <TD><IMG height=1
                        src="YouTube - Broadcast Yourself_files/pixel.gif"
                        width=5></TD>
                        </TR>
                        </TBODY>
                        </TABLE>
                </TD>
                <TD>
                        <TABLE style="MARGIN: 5px 2px 1px 0px; BORDER-BOTTOM: #dddddd 1px solid; BACKGROUND-COLOR: #dddddd" cellSpacing=0 cellPadding=0 border=0>
                        <TBODY>
                        <TR>
                        <TD><IMG height=5 src="YouTube - Broadcast Yourself_files/box_login_tl.gif" width=5></TD>
                        <TD><IMG height=5 src="YouTube - Broadcast Yourself_files/pixel.gif" width=1></TD>
                        <TD><IMG height=5 src="YouTube - Broadcast Yourself_files/box_login_tr.gif" width=5></TD></TR>
                        <TR>
                        <TD><IMG height=1 src="YouTube - Broadcast Yourself_files/pixel.gif" width=5></TD>
                        <TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 20px; FONT-WEIGHT: bold; FONT-SIZE: 13px; PADDING-BOTTOM: 5px; PADDING-TOP: 0px"><A
                        href="{$baseurl}/upload.php">Upload</A></TD>
                        <TD><IMG height=1
                        src="YouTube - Broadcast Yourself_files/pixel.gif"
                        width=5></TD>
                        </TR>
                        </TBODY>
                        </TABLE>
                </TD>
                </TR>
                </TBODY>
                </TABLE>
</TD></TR></TBODY>
</TABLE>

{if $head_bottom ne ""}
{include file = head_bottom/$head_bottom}
{else}
{include file = head_bottom/blank.tpl}
{/if}
{if $head_bottom_add ne ""}
{include file = head_bottom/$head_bottom_add}
{/if}
