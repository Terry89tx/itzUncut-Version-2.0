<HTML>
<HEAD>
<TITLE>{$site_name}</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="{$baseurl}/css/admin.css" type=text/css rel=stylesheet>

</HEAD>
<body>
<table cellspacing="1" cellpadding="3"  width="100%" border=0>
<tr><td><h3>Channel//{$channel_name} : Videos</h3></td></tr>
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
                        <a href='channelvideos.php?chid={$smarty.request.chid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=VID+asc'><img src='{$IMG_URL}/up.gif' border='0'></a>
                        <a href='channelvideos.php?chid={$smarty.request.chid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=VID+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                
                <td><b>Title</b>
                        <a href='channelvideos.php?chid={$smarty.request.chid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=title+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='channelvideos.php?chid={$smarty.request.chid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=title+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td><b>Type</b>
                        <a href='channelvideos.php?chid={$smarty.request.chid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=type+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='channelvideos.php?chid={$smarty.request.chid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=type+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td><b>Duration</b>
                        <a href='channelvideos.php?chid={$smarty.request.chid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=duration+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='channelvideos.php?chid={$smarty.request.chid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=duration+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td><b>Featured</b>
                        <a href='channelvideos.php?chid={$smarty.request.chid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=featured+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='channelvideos.php?chid={$smarty.request.chid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=featured+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td><b>Date</b>
                        <a href='channelvideos.php?chid={$smarty.request.chid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=adddate+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='channelvideos.php?chid={$smarty.request.chid}&a={$smarty.request.a}&status={$smarty.request.status}&sort=adddate+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td align="center"><b>Action</b></td>
                </tr>

                {section name=aa loop=$videos}
                <tr bgcolor="{cycle values="#F8F8F8,#F2F2F2"}">
                <td >{$videos[aa].VID}</td>
                <td ><a href="videos.php?a=Search&videoid={$videos[aa].VID}&page={$smarty.request.page}">{$videos[aa].title}</a></td>
                <td align="center">{$videos[aa].type}</td>
                <td align="center">{$videos[aa].duration|string_format:"%.2f"}</td>
                <td align="center">{$videos[aa].featured}</td>
                <td align="center">{$videos[aa].adddate|date_format}</td>
                <td align='center'><a href='videoedit.php?action=edit&VID={$videos[aa].VID}&page={$smarty.request.page}&sort={$smarty.request.sort}'>Edit</a>
                |<a href='channelvideos.php?chid={$smarty.request.chid}&action=del&VID={$videos[aa].VID}' onClick='Javascript:return confirm("Are you sure you want to remove the video from this channel?");'>Remove</a>
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
