<table align=center><tr><td valign="top" bgcolor="#FFFFFF" class="v9">

<b>Login To Administrate The Site</b><br><br>
{include file = admin/admin_err_msg.tpl}

<FORM METHOD="POST" ACTION="login.php" class="v8">
<table cellspacing="3" cellpadding="3" class="v8">
<tr>
<td>User Name</td>
<td><input type="text" name="uname" size="25"><br></td>
</tr>
<tr>
<td>Password</td>
<td><input type="password" name="pass" size="10"><br></td>
</tr>
<tr>
<td></td>
<td>
<INPUT TYPE='HIDDEN' name='ref' value='{$smarty.request.ref}'>
<INPUT TYPE="SUBMIT" name='adminlogin' VALUE="Login" class="v8">
</td>
</tr>
</table>
</FORM>

</td></tr></table>
