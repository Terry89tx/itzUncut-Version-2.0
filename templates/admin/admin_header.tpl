<head>
<title>Video Website</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
</style>
<link href="{$baseurl}/css/style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="{$baseurl}/js/javascript.js"></script>
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
          width=130 rowSpan=2><A href="http://www.youtube.com/index"><IMG
            style="VERTICAL-ALIGN: middle" height=48 alt=YouTube
            src="{$imgurl}/logo_sm.gif" width=120
            border=0></A></TD>
          <TD vAlign=top>
                <TABLE cellSpacing=0 cellPadding=0 width=670 border=0>
                <TBODY>
                <TR vAlign=top>
                <TD style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; FONT-STYLE: italic">Broadcast
                yourself. Watch and share your videos worldwide!</TD>
                <TD align=right>


                        {if $smarty.session.ADMINUID ne ""}
                        <TABLE cellSpacing=0 cellPadding=0 border=0>
                        <TBODY>
                        <TR>
                        <TD><A href="{$baseurl}/admin/logout.php">Log Out</A></TD>
                        </TR></TBODY></TABLE></TD></TR></TBODY>
                        </TABLE>

                        {else}

                        <TABLE cellSpacing=0 cellPadding=0 border=0>
                        <TBODY>
                        <TR>
                        <TD><A href="{$baseurl}/admin/login.php">Log In</A></TD>
                        </TR></TBODY></TABLE></TD></TR></TBODY>
                        </TABLE>
                        {/if}


                </TD></TR>
                <TR vAlign=bottom>
                <TD><!-- tab table -->
</TD></TR></TBODY>
</TABLE>
{if $smarty.session.ADMINUID ne ""}
{include file = admin/admin_list.tpl}
{else}
{include file = admin/admin_blank.tpl}
{/if}

