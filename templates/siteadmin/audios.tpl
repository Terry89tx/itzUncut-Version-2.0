<HTML>
<HEAD>
<TITLE>{$site_name}</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="{$baseurl}/css/admin.css" type=text/css rel=stylesheet>

</HEAD>
<body>
<table cellspacing="1" cellpadding="3"  width="100%" border=0>
<tr><td><h3>{$smarty.request.a|capitalize} Audios</h3></td></tr>
<tr><td><hr></td></tr>
{if $smarty.request.a ne "Search"}
<tr><td>
        Total: {$grandtotal}
</td></tr>
{/if}
<table>

        {if $smarty.request.a eq "feature"}
                <table cellspacing="1" cellpadding="3"  width="100%" border=0>
                <tr class="tabletitle">
                <td align="center"><b>ID</b>
                        <a href='audios.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=VID+asc'><img src='{$IMG_URL}/up.gif' border='0'></a>
                        <a href='audios.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=VID+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td align="center"><b>Audio Title</b>
                </td>
                <td align="center"><b>Total Request</b>
                        <a href='audios.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=req+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='audios.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=req+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td align="center"><b>Last Reqeust Date</b>
                        <a href='audios.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=date+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='audios.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=dae+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td align="center"><b>Action</b></td>
                </tr>

                {section name=aa loop=$videos}
                {insert name=getfield assign=title field='title' table='video' qfield='VID' qvalue=$videos[aa].VID}
                <tr bgcolor="{cycle values="#F8F8F8,#F2F2F2"}">
                <td  align="center">{$videos[aa].VID}</td>
                <td ><a href="audios.php?a=Search&videoid={$videos[aa].VID}&page={$smarty.request.page}">{$title}</a></td>
                <td  align="center">{$videos[aa].req}</td>
                <td align="center">{$videos[aa].date|date_format}</td>
                <td align='center'><a href='audioedit.php?action=edit&VID={$videos[aa].VID}&page={$smarty.request.page}&sort={$smarty.request.sort}'>Edit Audio</a>
                |<a href='audios.php?a={$smarty.request.a}&action=del&VID={$videos[aa].VID}&page={$smarty.request.page}&sort={$smarty.request.sort}' onClick='Javascript:return confirm("Are you sure you want to delete?");'>Delete Request</a>
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
        {elseif $smarty.request.a eq "inappropriate"}
                <table cellspacing="1" cellpadding="3"  width="100%" border=0>
                <tr class="tabletitle">
                <td align="center"><b>ID</b>
                        <a href='audios.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=VID+asc'><img src='{$IMG_URL}/up.gif' border='0'></a>
                        <a href='audios.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=VID+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td align="center"><b>Audio Title</b>
                </td>
                <td align="center"><b>Total Request</b>
                        <a href='audios.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=req+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='audios.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=req+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td align="center"><b>Last Reqeust Date</b>
                        <a href='audios.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=date+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='audios.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=dae+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td align="center"><b>Action</b></td>
                </tr>

                {section name=aa loop=$videos}
                {insert name=getfield assign=title field='title' table='video' qfield='VID' qvalue=$videos[aa].VID}
                <tr bgcolor="{cycle values="#F8F8F8,#F2F2F2"}">
                <td  align="center">{$videos[aa].VID}</td>
                <td ><a href="audios.php?a=Search&videoid={$videos[aa].VID}&page={$smarty.request.page}">{$title}</a></td>
                <td  align="center">{$videos[aa].req}</td>
                <td align="center">{$videos[aa].date|date_format}</td>
                <td align='center'><a href='audios.php?a={$smarty.request.a}&action=del_video&VID={$videos[aa].VID}&page={$smarty.request.page}&sort={$smarty.request.sort}' onClick='Javascript:return confirm("Are you sure you want to delete this audio?");'>Delete Audio</a>
                |<a href='audios.php?a={$smarty.request.a}&action=del&VID={$videos[aa].VID}&page={$smarty.request.page}&sort={$smarty.request.sort}' onClick='Javascript:return confirm("Are you sure you want to delete?");'>Delete Request</a>
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
        {elseif $smarty.request.a ne "Search"}
                <table cellspacing="1" cellpadding="3"  width="100%" border=0>
                <tr class="tabletitle">
                <td><b>ID</b>
                        <a href='audios.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=VID+asc'><img src='{$IMG_URL}/up.gif' border='0'></a>
                        <a href='audios.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=VID+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                
                <td><b>Title</b>
                        <a href='audios.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=title+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='audios.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=title+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td><b>Type</b>
                        <a href='audios.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=type+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='audios.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=type+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td><b>Duration</b>
                        <a href='audios.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=duration+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='audios.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=duration+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td><b>Featured</b>
                        <a href='audios.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=featured+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='audios.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=featured+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td><b>Date</b>
                        <a href='audios.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=adddate+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='audios.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=adddate+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td align="center"><b>Action</b></td>
                </tr>

                {section name=aa loop=$videos}
                <tr bgcolor="{cycle values="#F8F8F8,#F2F2F2"}">
                <td >{$videos[aa].VID}</td>
                <td ><a href="audios.php?a=Search&videoid={$videos[aa].VID}&page={$smarty.request.page}">{$videos[aa].title}</a></td>
                <td align="center">{$videos[aa].type}</td>
                <td align="center">{$videos[aa].duration|string_format:"%.2f"}</td>
                <td align="center">{$videos[aa].featured}</td>
                <td align="center">{$videos[aa].adddate|date_format}</td>
                <td align='center'><a href='audioedit.php?action=edit&VID={$videos[aa].VID}&page={$smarty.request.page}&sort={$smarty.request.sort}'>Edit</a>
                |<a href='audios.php?a={$smarty.request.a}&action=del&VID={$videos[aa].VID}&page={$smarty.request.page}&sort={$smarty.request.sort}' onClick='Javascript:return confirm("Are you sure you want to delete?");'>Del</a>
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
                <form action="audios.php" method="GET">
                        <input type="hidden" name="a" value="Search">
                        Audio ID:
                        <input type="text" name="videoid" size="10">
                        <input type="submit" name="search" value="Search"> &nbsp;&nbsp;
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
                
                {if $video.VID ne ""}
                        <br>
                <table width="100%" align="center" cellpadding="3" cellspacing="3">
                <tr>
                <td width="60%">
                        <table width="80%" cellpadding="3" cellspacing="3" align="center">
                        <tr class="tablerow1">
                                <td><b>Audio ID</b></td>
                                <td><b>{$video.VID}</b></td>
                        </tr>
                        <tr class="tablerow1">
                                <td><b>Title</b></td>
                                <td>{$video.title}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td valign="top"><b>Description</b></td>
                                <td>{$video.description}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td valign="top"><b>Tags</b></td>
                                <td>{$video.keyword}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td valign="top"><b>Channel</b></td>
                                <td>{insert name=video_channel assign=channel vid=$video.VID}
                                        {section name=j loop=$channel}
                                                {$channel[j].name},
                                        {/section}
                                </td>
                        </tr>
                        
                        <tr class="tablerow1">
                                <td><b>Type</b></td>
                                <td>{$video.type}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td><b>Date</b></td>
                                <td>{$video.adddate|date_format}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td><b>Rate</b></td>
                                <td>{$video.rate}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td><b>Is featured?</b></td>
                                <td>{$video.featured}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td><b>Can be commented?</b></td>
                                <td>{$video.be_comment}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td><b>Can be rated?</b></td>
                                <td>{$video.be_rated}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td><b>Can be embaded?</b></td>
                                <td>{$video.embed}</td>
                        </tr>
                        <tr class="tabletitle">
                                <td colspan="2" align="right"></td>
                        </tr>
                        </table>
                </td>
                <td align="center" valign="top">
                        <embed name='RAOCXplayer' src='{$vdourl}/{$video.vdoname}' type='application/x-mplayer2' width='200' height='200' ShowControls='1' ShowStatusBar='0' loop='true'
                        EnableContextMenu='0' DisplaySize='0' pluginspage='http://www.microsoft.com/Windows/Downloads/Contents/Products/MediaPlayer/'>
                        <br><br>
                        <a href='audioedit.php?action=edit&VID={$video.VID}&page={$smarty.request.page}'>Edit Audio</a>
                </td>
                </tr>
                </table>
                {/if}
                
        {elseif $smarty.request.a eq "email"}

        {/if}

</BODY>
</HEAD>
</HTML>
