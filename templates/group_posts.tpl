<table width="95%" bgcolor="#e0e0e0" align="center" cellpadding="2" cellspacing="2">
<tr>
        <td colspan=2><font size="2"><a href="groups_home.php?urlkey={$smarty.request.urlkey}"><b>{$gname}</b></a></font><hr></td>
</tr>
<tr>
        <td width=90 align="center">
                {if $topic.VID eq ""}<IMG class=moduleEntryThumb height=45 src="{$imgurl}/no_videos_groups.gif" width=60>
                {else}
                        {insert name=getfield assign=view_key field='vkey' table='video' qfield='VID' qvalue=$topic.VID}
                        <a href="view_video.php?viewkey={$view_key}">
                        <IMG class=moduleEntryThumb height=45 src="thumb/1_{$topic.VID}.jpg" width=60 border="0">
                        </a>
                {/if}
        </td>
        <td>
            <b>Topic:</b> {$topic.title}<br>
            <b>{$topic.addtime|date_format:"%A, %B %e, %Y, %H:%M %p"}</b><br>
            {insert name=id_to_name assign=uname un=$topic.UID}
            <b>Author:</b> <a href="uprofile.php?UID=$topic.UID">{$uname}</a>
        </td>
</tr>
</table>
<Br>

<table width="95%" bgcolor="#f5f5f5" align="center" cellpadding="2" cellspacing="2">
<tr>
<td colspan="2"><b>Comments({$total_post}):</b></td></tr>
{section name=i loop=$post}
<tr><td colspan="2"><hr></td></tr>
<tr>
        <td width="90" align="center">    {if $post[i].VID ne "0"}
                        {insert name=getfield assign=view_key field='vkey' table='video' qfield='VID' qvalue=$post[i].VID}
                        <a href="view_video.php?viewkey={$view_key}">
                        <IMG class=moduleEntryThumb height=45 src="thumb/1_{$post[i].VID}.jpg" width=60>
                        </a>

                {/if}
        </td>
        <td valign="top">
                {$post[i].post}<br>
                {insert name=id_to_name assign=uname un=$post[i].UID}
                <a href="uprofile.php?UID={$post[i].UID}">{$uname}</a>
                {insert name=video_count assign=video uid=$post[i].UID}
                {insert name=favour_count assign=favour uid=$post[i].UID}
                {insert name=friends_count assign=frnd uid=$post[i].UID}
                // <A href="uvideos.php?UID={$post[i].UID}">Videos</a> ({$video}</a>) |
                <A href="ufavour.php?UID={$post[i].UID}">Favorites</a> ({$favour}</a>) |
                <A href="ufriends.php?UID={$post[i].UID}">Friends</a> ({$frnd}</a>) -
                ({insert name=timediff value=var time=$post[i].date})
        </td>
        </tr>
{/section}
<tr><td colspan="2"><hr></td></tr>
</table>

        {if $smarty.session.UID ne ""}
                {insert name=check_group_mem assign=checkmem gid=$smarty.request.gid}
                {if $checkmem ne "0"}
                        <DIV style="PADDING-LEFT: 20px; FONT-WEIGHT: bold; PADDING-BOTTOM: 5px; COLOR: #444; PADDING-TOP: 8px">
                        Add New Topic:</DIV>
                        <DIV style="PADDING-LEFT: 20px; PADDING-BOTTOM: 5px">

                        <FORM name=add_group_post action="group_posts.php?urlkey={$smarty.request.urlkey}&gid={$smarty.request.gid}&tid={$smarty.request.tid}" method=post>
                        <TEXTAREA tabIndex=2 name=topic_title rows=3 cols=55></TEXTAREA>
                        <BR>Attach a video:
                        <SELECT name=topic_video>
                                {$video_ops}
                        </SELECT>
                        <INPUT type=submit value="Add Topic" name=add_topic>
                        </FORM>
                        </DIV>
                {else}
                        <div align="center">
                        <br>
                        <FORM name="Joingroup" id="Joingroup" method="post" action="{$baseurl}/groups_home.php?urlkey={$smarty.request.urlkey}">
                        <input type="hidden" name="joingroup" value=" Join to this Group ">
                        <input type="hidden" name="GRPID" value="{$smarty.request.gid}">
                        </form>
                        <b>Please <a href="javascript:void(0);" onclick="javascript:document.getElementById('Joingroup').submit();">join this group</a> to post a topic.</b>
                        <br>
                        </div>
                {/if}
        {else}
        <BR><BR>
        <DIV style="PADDING-LEFT: 5px; FONT-WEIGHT: bold; PADDING-BOTTOM: 5px; COLOR: #444; PADDING-TOP: 8px" align=center>
        Please <A href="{$baseurl}/signup.php?next=group_posts&add={$add}">Login</A> to post your comment</DIV>
        {/if}

<br>
