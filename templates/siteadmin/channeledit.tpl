<HTML>
<HEAD>
<TITLE>{$site_name}</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="{$baseurl}/css/admin.css" type=text/css rel=stylesheet>

</HEAD>
<BODY>
                {include file="err_msg.tpl"}
                
                {if $smarty.request.action eq "edit"}
                        <form action='channeledit.php?a={$smarty.request.a}&action=edit&chid={$channel.CHID}&page={$smarty.request.page}&sort={$smarty.request.sort}' method='POST' enctype="multipart/form-data">
                        <table width="70%" align="center" cellpadding="3" cellspacing="3">
                        <tr><td><h3>Edit Channel</h3></td><td align='right'><a href='channels.php?a={$smarty.request.a}&page={$smarty.request.page}&sort={$smarty.request.sort}'>Back</a></td></tr>
                        <tr><td colspan=2><hr></td></tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Channel ID</b></td>
                                <td>{$channel.CHID}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Channel Name</b></td>
                                <td><b><input name='name' value='{$channel.name}' size="40"></b></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%" valign="top"><b>Channel Description</b></td>
                                <td><textarea name='descrip' rows=3 cols=40>{$channel.descrip}</textarea></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%" valign="top"><b>Channel Image</b></td>
                                <td><img src='{$baseurl}/chimg/{$channel.CHID}.jpg'><Br><br>
                                <input type="file" name="picture" size="30"><Br><br>
                                </td>
                        </tr>
                        <tr class="tabletitle">
                                <td colspan="2" align='center'><input type='submit' name='edit_channel' value='Update'></td>
                        </tr>
                        <tr class="tabletitle">
                                <td colspan="2">&nbsp;</td>
                        </tr>
                        </table>
                        </form>
                {elseif $smarty.request.action eq "add"}
                        <form action='channeledit.php?a={$smarty.request.a}&action=add' method='POST' enctype="multipart/form-data">
                        <table width="70%" align="center" cellpadding="3" cellspacing="3">
                        <tr><td><h3>Add Channel</h3></td><td align='right'><a href='channels.php'>View Channels</a></td></tr>
                        <tr><td colspan=2><hr></td></tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Channel Name</b></td>
                                <td><b><input name='name' value='{$smarty.request.name}' size="40"></b></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%" valign="top"><b>Channel Description</b></td>
                                <td><textarea name='descrip' rows=3 cols=40>{$smarty.request.descrip}</textarea></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%" valign="top"><b>Channel Image</b></td>
                                <td><input type="file" name="picture" size="30">
                                </td>
                        </tr>
                        <tr class="tabletitle">
                                <td colspan="2" align='center'><input type='submit' name='add_channel' value='Add Channel'></td>
                        </tr>
                        <tr class="tabletitle">
                                <td colspan="2">&nbsp;</td>
                        </tr>
                        </table>
                        </form>
                {/if}
</BODY>
</HEAD>
</HTML>

