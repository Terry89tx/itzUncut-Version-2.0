<HTML>
<HEAD>
<TITLE>{$site_name}</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="{$baseurl}/css/admin.css" type=text/css rel=stylesheet>

</HEAD>
<BODY>
                        {include file="err_msg.tpl"}

                        <form action='useredit.php?a={$smarty.request.a}action=edit&uid={$user.UID}&page={$smarty.request.page}&sort={$smarty.request.sort}' method='POST'>
                        <table width="70%" align="center" cellpadding="3" cellspacing="3">
                        <tr><td><h3>Edit User</h3></td><td align='right'><a href='users.php?a={$smarty.request.a}&page={$smarty.request.page}&sort={$smarty.request.sort}'>Back</a></td></tr>
                        <tr><td colspan=2><hr></td></tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>User ID</b></td>
                                <td>{$user.UID}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>User Name</b></td>
                                <td><b>{$user.username}</b></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Email Address</b></td>
                                <td><input name='email' value='{$user.email}' size=43></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Full Name</b></td>
                                <td><input name='fname' value='{$user.fname}'> <input name='lname' value='{$user.lname}'></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>City</b></td>
                                <td><input name='city' value='{$user.city}'></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Country</b></td>
                                <td><select name="country">{$country_box}</select></td>
                        </tr>
                        <tr><td colspan=2><hr></td></tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Website</b></td>
                                <td><input name='website' value='{$user.website}'></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Occupation</b></td>
                                <td><textarea name='occupation' rows=3 cols=40>{$user.occupation}</textarea></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Company Name</b></td>
                                <td><textarea name='company' rows=3 cols=40>{$user.company}</textarea></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>School</b></td>
                                <td><textarea name='school' rows=3 cols=40>{$user.school}</textarea></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Interest/Hobby</b></td>
                                <td><textarea name='interest_hobby' rows=3 cols=40>{$user.interest_hobby}</textarea></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Favourate Movie</b></td>
                                <td><textarea name='fav_movie_show' rows=3 cols=40>{$user.fav_movie_show}</textarea></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Favourate Book</b></td>
                                <td><textarea name='fav_book' rows=3 cols=40>{$user.fav_book}</textarea></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Favourate Music</b></td>
                                <td><textarea name='fav_music' rows=3 cols=40>{$user.fav_music}</textarea></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>About Me</b></td>
                                <td><textarea name='aboutme' rows=3 cols=40>{$user.aboutme}</textarea></td>
                        </tr>
                        <tr><td colspan=2><hr></td></tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Email Verified</b></td>
                                <td><select name='emailverified'>{$email_ver_box}</select></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Account Status</b></td>
                                <td><select name='account_status'>{$account_status_box}</select></td>
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
