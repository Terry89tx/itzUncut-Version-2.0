<HTML>
<HEAD>
<TITLE>{$site_name}</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="{$baseurl}/css/admin.css" type=text/css rel=stylesheet>

</HEAD>
<body>

<table cellspacing="1" cellpadding="3"  width="100%" border=0>
<tr><td><h3>Channels</h3></td></tr>
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
                <td width="60"><b>ID</b>
                        <a href='channels.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=CHID+asc'><img src='{$IMG_URL}/up.gif' border='0'></a>
                        <a href='channels.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=CHID+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td><b>Name</b>
                        <a href='channels.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=name+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='channels.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=name+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td><b>Description</b></td>
                <td><b>Videos</b></td>
                <td><b>Groups</b></td>
                <td width="100" align="center"><b>Action</b></td>
                </tr>

                {section name=aa loop=$channels}
                {insert name=channel_count assign=count cid=$channels[aa].CHID}

                <tr bgcolor="{cycle values="#F8F8F8,#F2F2F2"}">
                <td >{$channels[aa].CHID}</td>
                <td ><a href="channels.php?a=Search&channelid={$channels[aa].CHID}&page={$smarty.request.page}">{$channels[aa].name}</a></td>
                <td>{$channels[aa].descrip}</td>
                <td align="center">{if $count[1] ne "0"}<a href="channelvideos.php?chid={$channels[aa].CHID}">{$count[1]}{else}0{/if}</a></td>
                <td align="center">{if $count[2] ne "0"}<a href="channelgroups.php?chid={$channels[aa].CHID}">{$count[2]}{else}0{/if}</a></td>
                <td align='center'><a href='channeledit.php?action=edit&chid={$channels[aa].CHID}&page={$smarty.request.page}&sort={$smarty.request.sort}'>Edit</a>
                |<a href='channels.php?a={$smarty.request.a}&action=del&chid={$channels[aa].CHID}&page={$smarty.request.page}&sort={$smarty.request.sort}' onClick='Javascript:return confirm("Are you sure you want to delete?");'>Del</a>
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
                <form action="channels.php" method="GET">
                        <input type="hidden" name="a" value="Search">
                        Channel ID:
                        <input type="text" name="channelid" size="10">
                        <input type="submit" name="search" value="Search"> &nbsp;&nbsp;
                        Channel Name:
                        <input type="text" name="channelname">
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
                
                {if $channel.CHID ne ""}
                        {insert name=channel_count assign=count cid=$channel.CHID}
                        <br>
                        <table width="70%" align="center" cellpadding="3" cellspacing="3">
                        <tr><td colspan=2 align="center">
                                <IMG class=moduleEntryThumb height=90 src="{$baseurl}/chimg/{$channel.CHID}.jpg" width=120>
                        </td></tr>
                        <tr><td colspan=2><hr></td></tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Channel ID</b></td>
                                <td>{$channel.CHID}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Channel Name</b></td>
                                <td><b>{$channel.name}</b></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Description</b></td>
                                <td>{$channel.descrip}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Total Videos</b></td>
                                <td>{$count[1]}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%" valign="top"><b>Total Groups</b></td>
                                <td>{$count[2]}</td>
                        </tr>
                        <tr class="tabletitle">
                                <td colspan="2" align="right"><a href='channeledit.php?action=edit&chid={$channel.CHID}&page={$smarty.request.page}'>Edit Channel</a></td>
                        </tr>
                        </table>
                        <br><br>
                {/if}
        {/if}

</BODY>
</HEAD>
</HTML>
