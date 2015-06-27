<HTML>
<HEAD>
<TITLE>{$site_name}</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="{$baseurl}/css/admin.css" type=text/css rel=stylesheet>

</HEAD>
<body>

<table cellspacing="1" cellpadding="3"  width="100%" border=0>
<tr><td><h3>Emails</h3></td></tr>
<tr><td><hr></td></tr>
{if $smarty.request.a ne "Search"}
<tr><td>
        Total: {$grandtotal}
</td></tr>
{/if}
<table>

                <table cellspacing="1" cellpadding="3"  width="100%" border=0>
                <tr class="tabletitle">
                <td width="60"><b>Email ID</b>
                        <a href='emailsettings.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=email_id+asc'><img src='{$IMG_URL}/up.gif' border='0'></a>
                        <a href='emailsettings.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=email_id+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td><b>Email Subject</b>
                        <a href='emailsettings.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=email_subject+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='emailsettings.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=email_subject+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td><b>Comments</b></td>
                <td width="100" align="center"><b>Action</b></td>
                </tr>

                {section name=aa loop=$emails}

                <tr bgcolor="{cycle values="#F8F8F8,#F2F2F2"}">
                <td >{$emails[aa].email_id}</td>
                <td >{$emails[aa].email_subject}</td>
                <td>{$emails[aa].comment}</td>
                <td align='center'><a href='emailedit.php?action=edit&email_id={$emails[aa].email_id}&page={$smarty.request.page}&sort={$smarty.request.sort}'>Edit</a>
                |<a href='emailsettings.php?a={$smarty.request.a}&action=del&email_id={$emails[aa].email_id}&page={$smarty.request.page}&sort={$smarty.request.sort}' onClick='Javascript:return confirm("Are you sure you want to delete?");'>Del</a>
                </td>
                </tr>
                {/section}
                <tr class="tablerow"><td colspan=8 ><br>{$link}</td></tr>
                </table>

                </div>
                </td>
                </tr>
                </table>
                <br><br>
</BODY>
</HEAD>
</HTML>
