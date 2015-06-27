        <table width="535" align="center" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td valign="top">
                        <FIELDSET>
                        <LEGEND><img src="images/send_email.gif"></LEGEND>
                        <table width=100% cellpadding="5" cellspacing="0">
                        <tr align="center">
                                <td colspan=5><h1>Contact With Us</h1></td>
                        </tr>
                        <tr>
                                <td align="center">
{include file=errmsg.tpl}
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<td align=center width="100%" valign="top">

<FORM METHOD="POST" ACTION="contact.php" >
<table cellspacing="3" cellpadding="3" align=center border="0">
<tr>
<td>
        <b>Your Email Address</b>
        {if $smarty.session.USERID eq ""}
                <br><input type="text" name="email" size="40" value='{$smarty.request.email}'><br></td>
        {else}
                : <font color=blue>{$email}</font>
        {/if}
</tr><tr>
<td>
        <b>Write your email below</b><br>
        <textarea name='body' cols='60' rows='12'>{$smarty.request.body}</textarea>
</td>
</tr>

<tr>
<td align="center">
<INPUT TYPE="SUBMIT" name='Submit' VALUE="Send Email" class="v8">
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

