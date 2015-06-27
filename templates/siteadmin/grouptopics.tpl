<HTML>
<HEAD>
<TITLE>{$site_name}</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="{$baseurl}/css/admin.css" type=text/css rel=stylesheet>

</HEAD>
<body>
<table cellspacing="1" cellpadding="3"  width="100%" border=0>
<tr><td><h3>Group//{$gname} : Topics</h3></td></tr>
<tr><td><hr></td></tr>
{if $smarty.request.a ne "Search"}
<tr><td>
        Total: {$grandtotal}
</td></tr>
{/if}
<table>


                <table cellspacing="1" cellpadding="3"  width="100%" border=0>
                <tr class="tabletitle">
                <td><b>Topics</b>
                        <a href='grouptopics.php?gid={$smarty.request.gid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=title+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='grouptopics.php?gid={$smarty.request.gid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=title+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td><b>Author</b>
                </td>
                <td><b>Posts</b>
                </td>
                <td><b>Created On</b>
                        <a href='grouptopics.php?gid={$smarty.request.gid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=addtime+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='grouptopics.php?gid={$smarty.request.gid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=addtime+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td><b>Approved</b>
                        <a href='grouptopics.php?gid={$smarty.request.gid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=approved+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='grouptopics.php?gid={$smarty.request.gid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=approved+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td align="center"><b>Action</b></td>
                </tr>

                {insert name=getfield assign=owner_id field='OID' table='group_own' qfield=GID qvalue=$answers[0].GID}

                {section name=i loop=$grptps}
                {insert name=id_to_name assign=uname un=$grptps[i].UID}
                {insert name=post_count assign=total_post TID=$grptps[i].TID}
                {insert name=getfield assign=lastpost field='date' table='group_tps_post' qfield='TID' qvalue=$grptps[i].TID order='order by PID desc'}
                <tr bgcolor="{cycle values="#F8F8F8,#F2F2F2"}">
                        <td><a href="groupposts.php?gid={$grptps[i].GID}&TID={$grptps[i].TID}">{$grptps[i].title|truncate:40}</a></td>
                        <td><A href="users.php?a=Search&userid={$grptps[i].UID}">{$uname}</a></b></td>
                        <td align="center">{$total_post}</td>
                        <td>{$grptps[i].addtime|date_format}</td>
                        <td align="center">{$grptps[i].approved}</td>
                        <td align='center'><a href='groupposts.php?gid={$smarty.request.gid}&action=edit&TID={$grptps[i].TID}&page={$smarty.request.page}&sort={$smarty.request.sort}'>Edit</a>
                        |<a href='grouptopics.php?gid={$smarty.request.gid}&action=del&TID={$grptps[i].TID}' onClick='Javascript:return confirm("Are you sure you want to delete?");'>Del</a>
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
