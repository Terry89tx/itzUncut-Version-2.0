<HTML>
<HEAD>
<TITLE>{$site_name}</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="{$baseurl}/css/admin.css" type=text/css rel=stylesheet>

</HEAD>
<body>

<table cellspacing="1" cellpadding="3"  width="100%" border=0>
<tr><td><h3>Channel//{$channel_name} : Groups</h3></td></tr>
<tr><td><hr></td></tr>
{if $smarty.request.a ne "Search"}
<tr><td>{include file=err_msg.tpl}</td></tr>
<tr><td>
        Total: {$grandtotal}
</td></tr>
{/if}
<table>


                <table cellspacing="1" cellpadding="3"  width="100%" border=0>
                <tr class="tabletitle">
                <td><b>ID</b>
                        <a href='channelgroups.php?chid={$smarty.request.chid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=GID+asc'><img src='{$IMG_URL}/up.gif' border='0'></a>
                        <a href='channelgroups.php?chid={$smarty.request.chid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=GID+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td><b>Name</b>
                        <a href='channelgroups.php?chid={$smarty.request.chid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=gname+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='channelgroups.php?chid={$smarty.request.chid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=gname+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td><b>Owner</b></td>
                <td><b>Video</b></td>
                <td><b>Member</b></td>
                <td><b>Topics</b></td>
                <td align="center"><b>Type</b>
                        <a href='channelgroups.php?chid={$smarty.request.chid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=type+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='channelgroups.php?chid={$smarty.request.chid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=type+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td align="center"><b>Featured</b>
                        <a href='channelgroups.php?chid={$smarty.request.chid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=featured+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='channelgroups.php?chid={$smarty.request.chid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=featured+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td align="center"><b>Action</b></td>
                </tr>

                {section name=aa loop=$groups}
                {insert name=group_info_count assign=gmemcount tbl=group_mem gid=$groups[aa].GID query="and approved='yes'"}
                {insert name=group_info_count assign=gvdocount tbl=group_vdo gid=$groups[aa].GID query="and approved='yes'"}
                {insert name=group_info_count assign=gtpscount tbl=group_tps gid=$groups[aa].GID query="and approved='yes'"}
                
                {insert name=id_to_name assign=uname un=$groups[aa].OID}
                <tr bgcolor="{cycle values="#F8F8F8,#F2F2F2"}">
                <td >{$groups[aa].GID}</td>
                <td ><a href="groups.php?a=Search&groupid={$groups[aa].GID}&page={$smarty.request.page}">{$groups[aa].gname}</a></td>
                <td >{$uname}</td>
                <td align="right">{$gvdocount}</td>
                <td align="right">{$gmemcount}</td>
                <td align="right">{$gtpscount}</td>
                <td align="center">{$groups[aa].type}</td>
                <td align="center">{$groups[aa].featured}</td>
                <td align='center'><a href='groupedit.php?action=edit&gid={$groups[aa].GID}&page={$smarty.request.page}&sort={$smarty.request.sort}'>Edit</a>
                |<a href='channelgroups.php?chid={$smarty.request.chid}&action=del&gid={$groups[aa].GID}&page={$smarty.request.page}&sort={$smarty.request.sort}' onClick='Javascript:return confirm("Are you sure you want to remove the group from this channel?");'>Remove</a>
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
