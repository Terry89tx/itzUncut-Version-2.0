<HTML>
<HEAD>
<TITLE>{$site_name}</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="{$baseurl}/css/admin.css" type=text/css rel=stylesheet>

</HEAD>
<body>

<table cellspacing="1" cellpadding="3"  width="100%" border=0>
<tr><td><h3>{$smarty.request.a|capitalize} Groups</h3></td></tr>
<tr><td><hr></td></tr>
{if $smarty.request.a ne "Search"}
<tr><td>
        Total: {$grandtotal}
</td></tr>
{/if}
<table>


        {if $smarty.request.a ne "Search"}
                <table cellspacing="1" cellpadding="3"  width="100%" border=0>
                <tr class="tabletitle">
                <td><b>ID</b>
                        <a href='groups.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=GID+asc'><img src='{$IMG_URL}/up.gif' border='0'></a>
                        <a href='groups.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=GID+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td><b>Name</b>
                        <a href='groups.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=gname+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='groups.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=gname+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td><b>Owner</b></td>
                <td><b>Video</b></td>
                <td><b>Member</b></td>
                <td><b>Topics</b></td>
                <td align="center"><b>Type</b>
                        <a href='groups.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=type+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='groups.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=type+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td align="center"><b>Featured</b>
                        <a href='groups.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=featured+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='groups.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=featured+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td align="center"><b>Action</b></td>
                </tr>

                {section name=aa loop=$groups}
                {insert name=group_info_count assign=gmemcount tbl=group_mem gid=$groups[aa].GID query="and approved='yes'"}
                {insert name=group_info_count assign=gvdocount tbl=group_vdo gid=$groups[aa].GID query="and approved='yes'"}
                {insert name=group_info_count assign=gtpscount tbl=group_tps gid=$groups[aa].GID}
                
                {insert name=id_to_name assign=uname un=$groups[aa].OID}
                <tr bgcolor="{cycle values="#F8F8F8,#F2F2F2"}">
                <td >{$groups[aa].GID}</td>
                <td ><a href="groups.php?a=Search&groupid={$groups[aa].GID}&page={$smarty.request.page}">{$groups[aa].gname}</a></td>
                <td ><a href="users.php?a=Search&userid={$groups[aa].OID}">{$uname}</a></td>
                <td align="right">{if $gvdocount ne "0"}<a href="groupvideos.php?gid={$groups[aa].GID}">{$gvdocount}</a>{else}{$gvdocount}{/if}</td>
                <td align="right">{if $gmemcount ne "0"}<a href="groupmembers.php?gid={$groups[aa].GID}">{$gmemcount}</a>{else}{$gmemcount}{/if}</td>
                <td align="right">{if $gtpscount ne "0"}<a href="grouptopics.php?gid={$groups[aa].GID}">{$gtpscount}</a>{else}{$gtpscount}{/if}</td>
                <td align="center">{$groups[aa].type}</td>
                <td align="center">{$groups[aa].featured}</td>
                <td align='center'><a href='groupedit.php?action=edit&gid={$groups[aa].GID}&page={$smarty.request.page}&sort={$smarty.request.sort}'>Edit</a>
                |<a href='groups.php?a={$smarty.request.a}&action=del&gid={$groups[aa].GID}&page={$smarty.request.page}&sort={$smarty.request.sort}' onClick='Javascript:return confirm("Are you sure you want to delete?");'>Del</a>
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
                
        {elseif $smarty.request.a eq "Search"}

                <table align="center">
                <tr><td>
                <form action="groups.php" method="GET">
                        <input type="hidden" name="a" value="Search">
                        Group ID:
                        <input type="text" name="groupid" size="10">
                        <input type="submit" name="search" value="Search"> &nbsp;&nbsp;
                        Group Name:
                        <input type="text" name="groupname">
                        <input type="submit" name="search" value="Search">
                </form>
                </td></tr>
                </table>
                
                {if $err ne "" or $msg ne ""}
                        <div class=subdiv align="center">
                        <br><br>
                        <div id="error">
                        </div>
                        <br><br>
                        {include file="err_msg.tpl"}
                {/if}
                
                {if $group.GID ne ""}
                        {insert name=group_info_count assign=gmemcount tbl=group_mem gid=$group.GID query="and approved='yes'"}
                        {insert name=group_info_count assign=gvdocount tbl=group_vdo gid=$group.GID query="and approved='yes'"}
                        {insert name=group_info_count assign=gtpscount tbl=group_tps gid=$group.GID query="and approved='yes'"}
                        {insert name=id_to_name assign=uname un=$group.OID}
                        <br>
                        <table width="70%" align="center" cellpadding="3" cellspacing="3">
                        <tr><td colspan=2 align="center">
                                {insert name=group_img assign=groupimg gid=$group.GID tbl=group_vdo}
                                {if $groupimg eq ""}<IMG class=moduleEntryThumb height=90 src="{$imgurl}/no_videos_groups.gif" width=120>
                                {else}<IMG class=moduleEntryThumb height=90 src="{$baseurl}/thumb/1_{$groupimg}.jpg" width=120>
                                {/if}
                        </td></tr>
                        <tr><td colspan=2><hr></td></tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Group ID</b></td>
                                <td>{$group.GID}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Group Name</b></td>
                                <td><b>{$group.gname}</b></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Owner</b></td>
                                <td><b>{$uname}</b></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Tags</b></td>
                                <td>{$group.keyword}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%" valign="top"><b>Group Description</b></td>
                                <td>{$group.fname} {$group.gdescn}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>URL Name</b></td>
                                <td>{$group.gurl}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%" valign="top"><b>Channel</b></td>
                                <td>{$ch_checkbox}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Total Video</b></td>
                                <td>{$gvdocount}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Total Member</b></td>
                                <td>{$gmemcount}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Total Topics</b></td>
                                <td>{$gtpscount}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Group Type</b></td>
                                <td>{$group.type}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Upload Type</b></td>
                                <td>{$group.gupload}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Topic Posting Type</b></td>
                                <td>{$group.gposting}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Group Image</b></td>
                                <td>{$group.gimage}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Is Featured?</b></td>
                                <td>{$group.featured}</td>
                        </tr>
                        <tr class="tabletitle">
                                <td colspan="2" align="right"><a href='groupedit.php?action=edit&gid={$group.GID}&page={$smarty.request.page}'>Edit Group</a></td>
                        </tr>
                        </table>
                        <br><br>
                {/if}
        {/if}

</BODY>
</HEAD>
</HTML>
