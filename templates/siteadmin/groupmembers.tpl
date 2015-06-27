<HTML>
<HEAD>
<TITLE>{$site_name}</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="{$baseurl}/css/admin.css" type=text/css rel=stylesheet>

</HEAD>
<body>
<table cellspacing="1" cellpadding="3"  width="100%" border=0>
<tr><td><h3>Group//{$gname} : Members</h3></td></tr>
<tr><td><hr></td></tr>
<tr><td>{include file=err_msg.tpl}</td></tr>
{if $smarty.request.a ne "Search"}
<tr><td>
        Total: {$grandtotal}
</td></tr>
{/if}
<table>


                <table cellspacing="1" cellpadding="3"  width="100%" border=0>
                <tr class="tabletitle">
                <td><b>ID</b>
                        <a href='groupmembers.php?gid={$smarty.request.gid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=UID+asc'><img src='{$IMG_URL}/up.gif' border='0'></a>
                        <a href='groupmembers.php?gid={$smarty.request.gid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=UID+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td><b>Name</b>
                        <a href='groupmembers.php?gid={$smarty.request.gid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=username+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='groupmembers.php?gid={$smarty.request.gid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=username+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td><b>Country</b>
                        <a href='groupmembers.php?gid={$smarty.request.gid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=country+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='groupmembers.php?gid={$smarty.request.gid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=country+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td><b>Last Login</b>
                        <a href='groupmembers.php?gid={$smarty.request.gid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=logintime+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='groupmembers.php?gid={$smarty.request.gid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=logintime+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td><b>Video</b>
                </td>
                <td><b>Status</b>
                        <a href='groupmembers.php?gid={$smarty.request.gid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=account_status+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='groupmembers.php?gid={$smarty.request.gid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=account_status+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td align="center"><b>Action</b></td>
                </tr>

                {section name=aa loop=$users}
                <tr bgcolor="{cycle values="#F8F8F8,#F2F2F2"}">
                <td >{$users[aa].UID}</td>
                <td ><a href="users.php?a=Search&userid={$users[aa].UID}">{$users[aa].username}</a>
                        <br>{insert name=check_group_own assign=OID }
                </td>
                <td>{$users[aa].country}</td>
                <td>{$users[aa].logintime|date_format}</td>
                <td align="right">{insert name=video_count assign=vdo uid=$users[aa].UID}
                                {if $vdo ne "0"}<a href="uservideos.php?uid={$users[aa].UID}">{$vdo}</a>{else}{$vdo}{/if}</td>
                <td align="center">{$users[aa].account_status}</td>
                <td align='center'><a href='useredit.php?action=edit&uid={$users[aa].UID}&page={$smarty.request.page}&sort={$smarty.request.sort}'>Edit</a>
                |<a href='groupmembers.php?gid={$smarty.request.gid}&a={$smarty.request.a}&action=del&uid={$users[aa].UID}&page={$smarty.request.page}&sort={$smarty.request.sort}' onClick='Javascript:return confirm("Are you sure you want to remove the member from this group?");'>Remove</a>
                |<a href='muser.php?email={$users[aa].email}&uname={$users[aa].username}'>Mail</a>
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
