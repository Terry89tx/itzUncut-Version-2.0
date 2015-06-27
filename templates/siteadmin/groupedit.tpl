<HTML>
<HEAD>
<TITLE>{$site_name}</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="{$baseurl}/css/admin.css" type=text/css rel=stylesheet>

</HEAD>
<BODY>
                        {include file="err_msg.tpl"}

                        <form action='groupedit.php?a={$smarty.request.a}&action=edit&gid={$group.GID}&page={$smarty.request.page}&sort={$smarty.request.sort}' method='POST'>
                        <table width="70%" align="center" cellpadding="3" cellspacing="3">
                        <tr><td><h3>Edit Group</h3></td><td align='right'><a href='groups.php?a={$smarty.request.a}&page={$smarty.request.page}&sort={$smarty.request.sort}'>Back</a></td></tr>
                        <tr><td colspan=2><hr></td></tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Group ID</b></td>
                                <td>{$group.GID}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Group Name</b></td>
                                <td><b><input name='gname' value='{$group.gname}' size="40"></b></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Tags</b></td>
                                <td><input name='keyword' value='{$group.keyword}' size="40"></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%" valign="top"><b>Group Description</b></td>
                                <td><textarea name='gdescn' rows=3 cols=40>{$group.gdescn}</textarea></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>URL Name</b></td>
                                <td><input name='gurl' value='{$group.gurl}' size="40"></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%" valign="top"><b>Channel</b></td>
                                <td>{$ch_checkbox}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Group Type</b></td>
                                <td><select name="type">{$type_box}</select></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Video Uploads</b></td>
                                <td><select name="gupload">{$upload_box}</select></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Forum Postings</b></td>
                                <td><select name="gposting">{$posting_box}</select></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Group Icon</b></td>
                                <td><select name="gimage">{$icon_box}</select></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Is Featured?</b></td>
                                <td><select name="featured">{$featured_box}</select></td>
                        </tr>
                        <tr class="tabletitle">
                                <td colspan="2" align='center'><input type='submit' name='submit' value='Update'></td>
                        </tr>
                        <tr class="tabletitle">
                                <td colspan="2">&nbsp;</td>
                        </tr>
                        </table>
                        </form>
</BODY>
</HEAD>
</HTML>
