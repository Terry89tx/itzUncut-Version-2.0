<HTML>
<HEAD>
<TITLE>{$site_name}</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="{$baseurl}/css/admin.css" type=text/css rel=stylesheet>

</HEAD>
<body>
<table cellspacing="1" cellpadding="3"  width="100%" border=0>
<tr><td><h3>Static Pages:</h3></td></tr>
<tr><td><hr></td></tr>
<table>
<form action="spages.php?action=edit&page={$smarty.request.page}" method="POST">
                <table cellspacing="3" cellpadding="3"  width="100%" border=0>
                <tr>
                        <td>
                                <table width="100%">
                                <tr>
                                        <td align="center"><a href="spages.php?action=view&page=about.tpl">About Us</a></td>
                                        <td align="center"><a href="spages.php?action=view&page=dev.tpl">Developers</a></td>
                                        <td align="center"><a href="spages.php?action=view&page=help.tpl">Help</a></td>
                                        <td align="center"><a href="spages.php?action=view&page=terms.tpl">Terms of Use</a></td>
                                        <td align="center"><a href="spages.php?action=view&page=privacy.tpl">Privacy Policy</a></td>
                                </tr>
                                </table>
                        </td>
                </tr>
                {if $smarty.request.action eq "view"}
                <tr><td valign="top"><br><b>Preview:</b> {$smarty.request.page} (<a href="spages.php?action=edit&page={$smarty.request.page}">Edit</a>)<br><br>
                        <table width=100% height=300 cellpadding=1 cellspacing=1 bgcolor="#000000">
                        <tr><td bgcolor="#ffffff" valign="top">
                                {include file=$smarty.request.page}
                        </td></tr>
                        </table>
                </td></tr>
                {elseif $smarty.request.action eq "edit"}
                <tr>
                        <td>{include file=err_msg.tpl}</td>
                </tr>
                <tr>
                        <td align=center><textarea name=body rows=30 cols=90>{include file=$smarty.request.page}</textarea></td>
                </tr>
                <tr>
                        <td align="center"><input type='submit' name='update' value='Update'></td>
                </tr>
                {/if}
                </table>
</form>
                <br><br>
</BODY>
</HEAD>
</HTML>
