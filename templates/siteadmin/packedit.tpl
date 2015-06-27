<HTML>
<HEAD>
<TITLE>{$site_name}</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="{$baseurl}/css/admin.css" type=text/css rel=stylesheet>

</HEAD>
<BODY>
                {include file="err_msg.tpl"}
                
                {if $smarty.request.action eq "edit"}
                        <form action='packedit.php?a={$smarty.request.a}&action=edit&pack_id={$package.pack_id}&page={$smarty.request.page}&sort={$smarty.request.sort}' method='POST' enctype="multipart/form-data">
                        <table width="80%" align="center" cellpadding="3" cellspacing="3">
                        <tr><td><h3>Edit Package</h3></td><td align='right'><a href='packages.php?a={$smarty.request.a}&page={$smarty.request.page}&sort={$smarty.request.sort}'>Back</a></td></tr>
                        <tr><td colspan=2><hr></td></tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Package ID</b></td>
                                <td>{$package.pack_id}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Package Name</b></td>
                                <td><input name='pack_name' value='{$package.pack_name}' size=30></td>
                        </tr>
                        <tr class="tablerow1" valign="top">
                                <td width="40%"><b>Description</b></td>
                                <td><textarea name='pack_desc' rows=5 cols=30>{$package.pack_desc}</textarea></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Space (MB)</b></td>
                                <td><input name='space' value='{$package.space}' size=10></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Bandwidth (MB)</b></td>
                                <td><input name='bandwidth' value='{$package.bandwidth}' size=10></td>
                        </tr>
                        {if $package.is_trial ne "yes"}
                        <tr class="tablerow1">
                                <td width="40%"><b>Price</b></td>
                                <td>$ <input name='price' value='{$package.price}' size=8></td>
                        </tr>
                        {/if}
                        <tr class="tablerow1">
                                <td width="40%"><b>Video Limit (Optional)</b></td>
                                <td><input name='video_limit' value='{$package.video_limit}' size=10><br>
                                        (Leave blank or enter 0 for unlimited upload)
                                </td>
                        </tr>
                        {if $package.is_trial ne "yes"}
                        <tr class="tablerow1">
                                <td width="40%"><b>Subscription Period</b></td>
                                <td><select name='period'>{$period_ops}</select></td>
                        </tr>
                        {else}
                        <tr class="tablerow1">
                                <td width="40%"><b>Trial Period (Day)</b></td>
                                <td><input name='trial_period' value='{$package.trial_period}' size=8></td>
                        </tr>
                        {/if}
                        <tr class="tablerow1">
                                <td width="40%"><b>Status</b></td>
                                <td><select name='status'>{$status_ops}</select></td>
                        </tr>
                        <tr class="tabletitle">
                                <td colspan="2" align='center'><input type='submit' name='edit_package' value='Update'></td>
                        </tr>
                        <tr class="tabletitle">
                                <td colspan="2">&nbsp;</td>
                        </tr>
                        </table>
                        </form>
                {elseif $smarty.request.action eq "add"}
                        <form action='packedit.php?a={$smarty.request.a}&action=add' method='POST' enctype="multipart/form-data">
                        <table width="80%" align="center" cellpadding="3" cellspacing="3">
                        <tr><td><h3>Add Package</h3></td><td align='right'><a href='packages.php?a={$smarty.request.a}&page={$smarty.request.page}&sort={$smarty.request.sort}'>Back</a></td></tr>
                        <tr><td colspan=2><hr></td></tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Package Name</b></td>
                                <td><input name='pack_name' value='{$smarty.request.pack_name}' size=30></td>
                        </tr>
                        <tr class="tablerow1" valign="top">
                                <td width="40%"><b>Description</b></td>
                                <td><textarea name='pack_desc' rows=5 cols=30>{$smarty.request.pack_desc}</textarea></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Space (MB)</b></td>
                                <td><input name='space' value='{$smarty.request.space}' size=10></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Bandwidth (MB)</b></td>
                                <td><input name='bandwidth' value='{$smarty.request.bandwidth}' size=10></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Price</b></td>
                                <td>$ <input name='price' value='{$smarty.request.price}' size=8></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Video Limit (Optional)</b></td>
                                <td><input name='video_limit' value='{$smarty.request.video_limit}' size=10><br>
                                        (Leave blank or enter 0 for unlimited upload)
                                </td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Subscription Period</b></td>
                                <td><select name='period'>{$period_ops}</select></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Status</b></td>
                                <td><select name='status'>{$status_ops}</select></td>
                        </tr>
                        <tr class="tabletitle">
                                <td colspan="2" align='center'><input type='submit' name='add_package' value='Add Package'></td>
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

