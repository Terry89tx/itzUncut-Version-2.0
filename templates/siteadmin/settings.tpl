<HTML>
<HEAD>
<TITLE>{$site_name}</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="{$baseurl}/css/admin.css" type=text/css rel=stylesheet>

</HEAD>
<BODY>
                        {include file="err_msg.tpl"}
<br>
                        <form action='settings.php' method='POST'>
                        <table width="70%" align="center" cellpadding="3" cellspacing="3">
                        <tr><td><h3>System Settings</h3></td><td align='right'><a href='groups.php?a={$smarty.request.a}&page={$smarty.request.page}&sort={$smarty.request.sort}'>Back</a></td></tr>
                        <tr><td colspan=2><hr></td></tr>

                        <tr class="tablerow1">
                                <td width="40%"><b>Site Name</b></td>
                                <td><input name='site_name' value='{$site_name}' size="40"></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Admin Name</b></td>
                                <td><input name='admin_name' value='{$admin_name}' size="40"></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Admin Email</b></td>
                                <td><input name='admin_email' value='{$admin_email}' size="40"></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Admin Password</b></td>
                                <td><input type='password' name='admin_pass' value='{$admin_pass}' size="40"></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>List Per Page</b></td>
                                <td><input name='items_per_page' value='{$items_per_page}' size="40"></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Service Type</b></td>
                                <td><select name='enable_package'>{$service_ops}</select></td>
                        </tr>
			<tr class="tablerow1">
                                <td width="40%"><b>Last Five User Panel</b></td>
                                <td>
					<select name='selLFUBannar'>
						<OPTION> Enable </OPTION>
						<OPTION> Disable </OPTION>
						
					</select>	(Currently <b>{$lfubannar}d</b>).
				</td>
                        </tr>
			<tr class="tablerow1">
                                <td width="40%"><b>Polls Panel</b></td>
                                <td>
					<select name='selPPanel'>
						<OPTION> Enable </OPTION>
						<OPTION> Disable </OPTION>
						
					</select>
					(Currently <b>{$pollinganel}d</b>).
				</td>
                        </tr>
                        
                        {if $enable_package eq "yes"}
                        <tr><td colspan=2>&nbsp;</td></tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Payment Method</b></td>
                                <td>{$payment_method_ops}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Enable Test Payment?</b></td>
                                <td><input type=radio name=enable_test_payment value='yes' {if $enable_test_payment eq "yes"}checked{/if}> Yes<br>
                                    <input type=radio name=enable_test_payment value='no' {if $enable_test_payment ne "yes"}checked{/if}> No<br>
                                </td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Paypal Receiver Email</b></td>
                                <td><input name='paypal_receiver_email' value='{$paypal_receiver_email}' size="40"></td>
                        </tr>
                        <tr><td colspan=2>&nbsp;</td></tr>
                        {/if}
                        
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
