<HTML>
<HEAD>
<TITLE>{$site_name}</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="{$baseurl}/css/admin.css" type=text/css rel=stylesheet>

</HEAD>
<BODY>
                        {include file="err_msg.tpl"}

                        <form action='videoedit.php?a={$smarty.request.a}action=edit&VID={$video.VID}&page={$smarty.request.page}&sort={$smarty.request.sort}' method='POST'>
                        <table width="70%" align="center" cellpadding="3" cellspacing="3">
                        <tr><td><h3>Edit Video</h3></td><td align='right'><a href='videos.php?a={$smarty.request.a}&page={$smarty.request.page}&sort={$smarty.request.sort}'>Back</a></td></tr>
                        <tr><td colspan=2><hr></td></tr>
                        <tr class="tablerow1">
                                <td><b>Video ID</b></td>
                                <td><b>{$video.VID}</b></td>
                        </tr>
                        <tr class="tablerow1">
                                <td><b>Title</b></td>
                                <td><input name='title' value='{$video.title}' size="40"></td>
                        </tr>
                        <tr class="tablerow1">
                                <td valign="top"><b>Description</b></td>
                                <td><textarea name='description' rows=3 cols=40>{$video.description}</textarea></td>
                        </tr>
                        <tr class="tablerow1">
                                <td valign="top"><b>Feature Description</b></td>
                                <td><textarea name='featuredesc' rows=3 cols=40>{$video.featuredesc}</textarea></td>
                        </tr>
                        <tr class="tablerow1">
                                <td valign="top"><b>Channel</b></td>
                                <td>{$ch_checkbox}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td valign="top"><b>Type</b></td>
                                <td><select name='type'>{$type_box}</select></td>
                        </tr>
                        <tr class="tablerow1">
                                <td><b>Is featured?</b></td>
                                <td><select name='featured'>{$featured_box}</select></td>
                        </tr>
                        <tr class="tablerow1">
                                <td><b>Can be commented?</b></td>
                                <td><select name='be_comment'>{$comment_box}</select></td>
                        </tr>
                        <tr class="tablerow1">
                                <td><b>Can be rated?</b></td>
                                <td><select name='be_rated'>{$rate_box}</select></td>
                        </tr>
                        <tr class="tablerow1">
                                <td><b>Can be embaded?</b></td>
                                <td><select name='embed'>{$embed_box}</select></td>
                        </tr>
                        <tr class="tabletitle">
                                <td colspan="2"><hr></td>
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
