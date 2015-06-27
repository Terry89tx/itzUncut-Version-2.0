<HTML>
<HEAD>
<TITLE>{$site_name}</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="{$baseurl}/css/admin.css" type=text/css rel=stylesheet>

</HEAD>
<BODY><br>
        <table width="95%" align="center" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td valign="top">
                        <table width=100% cellpadding="5" cellspacing="0">
                        <tr align="center">
                                <td colspan=5><h3>Send Email to {if $smarty.request.a eq "user"}User{elseif $smarty.request.a eq "group"}Group{else}{$smarty.request.uname}{/if}</h3></td>
                        </tr>
                        <tr>
                                <td align="center">
{include file=err_msg.tpl}
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td align=center width="100%" valign="top">

{if $smarty.request.a eq "user"}
        <FORM METHOD="POST" ACTION="muser.php?a=user" >
{elseif $smarty.request.a eq "group"}
        <FORM METHOD="POST" ACTION="muser.php?a=group" >
{else}
        <FORM METHOD="POST" ACTION="muser.php?email={$smarty.request.email}&uname={$smarty.request.uname}" >
{/if}

<table width="100%" cellspacing="3" cellpadding="3" align=center border="0">
<tr>
<td>
        {if $smarty.request.a eq "user"}
        <b>Email To:</b>
        <select name='UID'>
                {$user_ops}
        </select>
        {elseif $smarty.request.a eq "group"}
        <b>Email To:</b>
        <select name='GID'>
                {$group_ops}
        </select>
        {else}
        <b>To: </b><br><input type="text" name="email" size="30" value='{$smarty.request.email}'><br></td>
        {/if}
</tr>
<tr>
<td>
        <b>Subject:</b><br>
        <input type="text" name="subj" size="60" value='{$smarty.request.subj}'><br></td>
</tr>
<tr>
<td>
        <b>Write your email below:</b><br>
<!--    <textarea name='body' cols='60' rows='12'>{$smarty.request.body}</textarea>     -->
        {$txt}
</td>
</tr>

<tr>
<td align="center">
<INPUT TYPE="SUBMIT" name='submit' VALUE="Send Email" class="v8">
</td>
</tr>
</table>
</td>
</tr>
</table>


                                </td>
                        </tr>
                        </table>
                        </FIELDSET>
                </td>
        </tr>

        </table>
        <br>
</body>
</html>
