<HTML>
<HEAD>
<TITLE>{$site_name}</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<!--#	 My style -->
		<LINK href="{$baseurl}/css/admin.css" type=text/css rel=stylesheet>

</HEAD>
<body>

{if $smarty.request.action ne "Edit"}
<table cellspacing="1" cellpadding="3"  width="100%" border=0>
<tr><td><h3>Advertise</h3></td></tr>
<tr><td><hr></td></tr>
{if $smarty.request.a ne "Search"}
<tr><td>
        Total: {$grandtotal}
</td></tr>
{/if}
<table>

                <table cellspacing="1" cellpadding="3"  width="100%" border=0>
                <tr class="tabletitle">
                <td width="60"><b>ID</b>
                        <a href='adv.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=adv_id+asc'><img src='{$IMG_URL}/up.gif' border='0'></a>
                        <a href='adv.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=adv_id+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td><b>Advertise Name</b>
                        <a href='adv.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=adv_name+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='adv.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=adv_name+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td><b>Status</b></td>
                <td width="100" align="center"><b>Action</b></td>
                </tr>

                {section name=aa loop=$adv}

                <tr bgcolor="{cycle values="#F8F8F8,#F2F2F2"}">
                <td >{$adv[aa].adv_id}</td>
                <td >{$adv[aa].adv_name}</td>
                <td>{$adv[aa].adv_status}</td>
                <td align='center'><a href='adv.php?action=Edit&adv_id={$adv[aa].adv_id}&page={$smarty.request.page}&sort={$smarty.request.sort}'>Edit</a>
                |<a href='adv.php?action=Active&adv_id={$adv[aa].adv_id}&page={$smarty.request.page}&sort={$smarty.request.sort}'>Active</a>
                |<a href='adv.php?action=Inactive&adv_id={$adv[aa].adv_id}&page={$smarty.request.page}&sort={$smarty.request.sort}'>Inactive</a>
                </td>
                </tr>
                {/section}
                <tr class="tablerow"><td colspan=8 ><br>{$link}</td></tr>
                </table>

                </div>
                </td>
                </tr>
                </table>
{else}
<form action="adv.php?action=Edit&adv_id={$smarty.request.adv_id}" method="POST">
<table cellspacing="1" cellpadding="3"  width="100%" border=0>
<tr><td><h3>Edit Advertise: {$adv.adv_name}</h3></td></tr>
<tr><td><hr></td></tr>
<tr><td>{include file=err_msg.tpl}</td></tr>
<tr><td align="center">
        <table cellspacing="1" cellpadding="3"  width="70%" border=0 align="center">
        <tr><td><b>Preview:</b><br>
                {insert name=advertise adv_name=$adv.adv_name}
        </td></tr>
        <tr><td>&nbsp;</td></tr>
        <tr><td><b>Edit Code:</b><br>
        <textarea name='adv_text' rows=15 cols=80>{$adv.adv_text}</textarea>
        </td></tr>
        <tr><td align="center"><input type='submit' name='submit' value='Update'></td></tr>
        </table>
</td></tr>
</table>
{/if}
                <br><br>
</BODY>
</HEAD>
</HTML>
