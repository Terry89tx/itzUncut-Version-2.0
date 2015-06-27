<HTML>
<HEAD>
<TITLE>{$site_name}</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="{$baseurl}/css/admin.css" type=text/css rel=stylesheet>

</HEAD>
<body>

<table cellspacing="1" cellpadding="3"  width="100%" border=0>
<tr><td colspan="2"><h3>{if $smarty.request.action eq "add"}Add{else}Edit{/if} Email: {$email.email_id}</h3></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr bgcolor="#dddddd"><td valign=top>
        <table width=100% bgcolor="#dddddd">
        <tr><td colspan=3><b>Variables: (For Email Subject)</b><br></td></tr>
        <tr><td>Sender Name:</td><td>$sender_name</td></tr>
        <tr><td>Group Name: </td><td>$gname</td></tr>
        <tr><td>Site Name: </td><td>$config[site_name]</td></tr>
        </table>
</td><td valign=top>
        {literal}
        <table width=100% bgcolor="#dddddd">
        <tr><td colspan=3><b>Variables: (For Email Details)</b><br></td></tr>
        <tr><td>Sender User Name: </td><td>{$sender_name}</td></tr>
        <tr><td>Sender First Name: </td><td>{$sender_fname}</td></tr>
        <tr><td>Sender Last Name: </td><td>{$sender_lname}</td></tr>
        <tr><td>Receiver User Name: </td><td>{$receiver_name}</td></tr>
        <tr><td>Receiver First Name: </td><td>{$receiver_fname}</td></tr>
        <tr><td>Receiver Last Name: </td><td>{$receiver_lname}</td></tr>
        <tr><td>Sender Message: </td><td>{$message}</td></tr>
        <tr><td>Site Name: </td><td>{$site_name}</td></tr>
        </table>
        {/literal}
</td></tr>
<tr><td colspan="2">{include file='err_msg.tpl'}</td></tr>
</table>
        {if $smarty.request.action eq "add"}
                <form action='emailedit.php?action={$smarty.request.action}' method="POST">
                <table cellspacing="1" cellpadding="3"  width="100%" border=0>
                <tr class="tablerow1">
                        <td><b>Email ID: </b></td>
                        <td><input name='email_id' value='{$smarty.request.email_id}' size=30><i>(must be unique)</i></td>
                </tr>
                <tr class="tablerow1">
                        <td><b>Email File: </b></td>
                        <td>{$basedir}/templates/emails/<input name='email_path' value='{$smarty.request.email_path}' size=20><i>(Extension must be .tpl)</i></td>
                </tr>
                <tr class="tablerow1">
                        <td><b>Subject: </b></td>
                        <td><input name='email_subject' value='{$smarty.request.email_subject}' size=80></td>
                </tr>
                <tr class="tablerow1">
                        <td valign="top"><b>Details: </b></td>
                        <td><textarea name='email_details' rows=20 cols=77>{$smarty.request.email_details}</textarea></td>
                </tr>
                <tr class="tablerow1">
                        <td><b>Comments: </b><br><i>(for admin)</i></td>
                        <td><input name='comment' value='{$smarty.request.comment}' size=80></td>
                </tr>
                <tr class="tablerow1">
                        <td colspan="2" align="center"><input type='submit' name='update' value='Create Email'></td>
                </tr>
                </table>
                </form>
        {else}
                <form action='emailedit.php?email_id={$smarty.request.email_id}' method="POST">
                <table cellspacing="1" cellpadding="3"  width="100%" border=0>
                <tr class="tabletitle">
                <tr class="tablerow1">
                        <td><b>Subject: </b></td>
                        <td><input name='email_subject' value='{$email.email_subject}' size=80></td>
                </tr>
                <tr class="tablerow1">
                        <td valign="top"><b>Details: </b></td>
                        <td><textarea name='email_details' rows=20 cols=77>{$email_details}</textarea></td>
                </tr>
                <tr class="tablerow1">
                        <td><b>Comments: </b><br><i>(for admin)</i></td>
                        <td><input name='comment' value='{$email.comment}' size=80></td>
                </tr>
                <tr class="tablerow1">
                        <td colspan="2" align="center"><input type='submit' name='update' value='Update'></td>
                </tr>
                </table>
                </form>
        {/if}
                <br><br>
</BODY>
</HEAD>
</HTML>
