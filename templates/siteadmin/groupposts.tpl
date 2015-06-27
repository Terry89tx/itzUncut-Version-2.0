<HTML>
<HEAD>
<TITLE>{$site_name}</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="{$baseurl}/css/admin.css" type=text/css rel=stylesheet>

</HEAD>
<body>
<br>
{include file=err_msg.tpl}
<br>
<table width="95%" bgcolor="#e0e0e0" align="center" cellpadding="2" cellspacing="2">
<tr>
        <td colspan=3><b>Group//</b><font size="2"><a href="groups.php?a=Search&groupid={$smarty.request.gid}"><b>{$gname}</b></a></font>: Topics<hr></td>
</tr>
<tr>
        <td width=90 align="center" valign=top><br>
                {if $topic.VID eq ""}<IMG class=moduleEntryThumb height=45 src="{$imgurl}/no_videos_groups.gif" width=60>
                {else}
                        {insert name=getfield assign=view_key field='vkey' table='video' qfield='VID' qvalue=$topic.VID}

                        <IMG class=moduleEntryThumb height=45 src="{$baseurl}/thumb/1_{$topic.VID}.jpg" width=60 border="0">

                {/if}<br><br>
        </td>
        <td>
            <b>Topic:</b>
            {if $smarty.request.action eq "edit"}
                <form action="groupposts.php?gid={$smarty.request.gid}&TID={$smarty.request.TID}&action=edit" method="POST">
                        <textarea name='title' rows=5 cols=70>{$topic.title}</textarea><br><br>
                        <b>Approved: </b>
                        <select name='approved'>
                                <option value='yes' {if $topic.approved eq "yes"}selected{/if}>Yes</option>
                                <option value='no' {if $topic.approved eq "no"}selected{/if}>No</option>
                        </select>
                        <center><input type=submit name=update value=Update></center><br>
                </form>
            {else}
                {$topic.title}<br>
            {/if}
            <b>{$topic.addtime|date_format:"%A, %B %e, %Y, %H:%M %p"}</b><br>
            {insert name=id_to_name assign=uname un=$topic.UID}
            <b>Author:</b> <a href="users.php?a=Search&userid={$topic.UID}">{$uname}</a>
        </td>
        <td align="center" width="50">{if $smarty.request.action ne "edit"}<a href="groupposts.php?gid={$smarty.request.gid}&TID={$smarty.request.TID}&action=edit">Edit</a>{/if}</td>
</tr>
</table>
<Br>

<table width="95%" bgcolor="#f5f5f5" align="center" cellpadding="2" cellspacing="2">
<tr>
<td colspan="3"><b>Comments({$total_post}):</b></td></tr>
{section name=i loop=$post}
<tr><td colspan="3"><hr></td></tr>
<tr>
        <td width="90" align="center" valign="top">    {if $post[i].VID ne "0"}
                        {insert name=getfield assign=view_key field='vkey' table='video' qfield='VID' qvalue=$post[i].VID}

                        <IMG class=moduleEntryThumb height=45 src="{$baseurl}/thumb/1_{$post[i].VID}.jpg" width=60>


                {/if}
        </td>
        <td valign="top">
            {if $smarty.request.action eq "pedit" and $post[i].PID eq $smarty.request.PID}
                <form action="groupposts.php?gid={$smarty.request.gid}&TID={$smarty.request.TID}&PID={$smarty.request.PID}&action=pedit" method="POST">
                        <textarea name='post' rows=5 cols=60>{$post[i].post}</textarea><br><br>
                        <center><input type=submit name=pupdate value=Update></center>
                </form>
            {else}
                {$post[i].post}<br>
            {/if}
            <br>
                {insert name=id_to_name assign=uname un=$post[i].UID}
                <a href="users.php?a=Search&userid={$post[i].UID}">{$uname}</a>
                {insert name=video_count assign=video uid=$post[i].UID}
                {insert name=favour_count assign=favour uid=$post[i].UID}
                {insert name=friends_count assign=frnd uid=$post[i].UID}
                // Videos ({$video}</a>) |
                Favorites ({$favour}</a>) |
                Friends ({$frnd}</a>) -
                ({insert name=timediff value=var time=$post[i].date})
        </td>
        <td><a href="groupposts.php?gid={$smarty.request.gid}&TID={$smarty.request.TID}&PID={$post[i].PID}&action=pedit">Edit</a>
         | <a href="groupposts.php?gid={$smarty.request.gid}&TID={$smarty.request.TID}&PID={$post[i].PID}&action=pdel" onClick='Javascript:return confirm("Are you sure you want to delete?");'>Del</a></td>
        </tr>
{/section}
<tr><td colspan="3"><hr></td></tr>
</table>
<br>

</BODY>
</HEAD>
</HTML>
