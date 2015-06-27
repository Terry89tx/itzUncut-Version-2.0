<tr><td valign="top" height="250">
        <form action='payment.php?pack={$smarty.request.pack}&uid={$smarty.request.uid}' method='post'>
        <center><h2>Confirm Payment</h2>
        Provide necessary information to complete your payment:
        {if $enable_package eq "yes"}
        <table width=350>
        <tr>
        <td colspan=2 bgcolor="#000000" align="center">
                <input type='hidden' name='period' value='{$smarty.request.period}'>
                <input type='hidden' name='method' value='{$smarty.request.method}'>
                <table width="100%" cellpadding=3 cellspacing=3 bgcolor="#F8F8FF" align="center">
                <tr><td width="17"></td><td width="35%"><b>Your Package:</b></td><td><b>{$package.pack_name}</b></input></td></tr>
                <tr><td></td><td><b>Total Price:</b></td><td><font color="#0055CC"><b>${$totalprice}</b></font> for <b>{$smarty.request.period}</b> {$package.period}(s)</td></tr>
                <tr><td></td><td><b>Payment Method:</b></td><td>{$smarty.request.method}</td></tr>

                {if $smarty.request.method eq "Paypal"}
                        <tr><td></td><td>&nbsp;</td></tr>
                        <tr><td></td><td><b>First Name:</b></td><td><input type=text name=fname size=20 maxlenth=40 value='{$fname}'></td></tr>
                        <tr><td></td><td><b>Last Name:</b></td><td><input type=text name=lname size=20 maxlenth=40 value='{$lname}'></td></tr>
                        <tr><td></td><td><b>City:</b></td><td><input type=text name=city size=20 maxlenth=80 value='{$city}'></td></tr>
                        <tr><td></td><td><b>Country:</b></td><td><select name=country>{$country}</select></td></tr>
                {elseif $smarty.request.method eq "Authorize.net"}
                        <tr><td colspan=3>


<table>
<tr>
<td valign="top">
<div style="padding-left: 20px; padding-right: 20px; padding-top: 10px; padding-bottom: 20px;">
<b>Billing Information</b>


{if $msg ne "" }
<br><br>
<table border="0" cellspacing="0" cellpadding="0" height="35">
<tr><td class='ymsgborder'>
<font size='2' face='verdana' color='red'><b>&nbsp;{$msg}.</b></font>
</td></tr>
</table>
{/if}


<p>In order to list your bold or feature for your festival or service please enter billing info.<br>
Your card will by processed by Authorize.net</p>
<p>
After successful payment It will be added to our list for admin approval.
</p>

<table cellspacing="3" cellpadding="3" class="v8">
<tr>
<td>First Name</td>
<td><input type=text size='30' name='cc_fname_txt' value='{$smarty.request.cc_fname_txt}'><br></td>
</tr><tr>
<td>Last Name</td>
<td><input type=text size='30' name='cc_lname_txt' value='{$smarty.request.cc_lname_txt}'><br></td>
</tr><tr>
<td>E-mail Address</td>
<td><input type=text size='30' name='cc_email_txt' value='{$smarty.request.cc_email_txt}'><br></td>
</tr><tr>
<td>Card Type</td>
<td>
<select name='cc_type_box' size=1>
        <option value='visa' selected>Visa</option>
        <option value='mastercard' >Mastercard</option>
        </select>
<br></td>
</tr><tr>
<td>Number</td>
<td><input type=text size='30' name='cc_num_txt' value='{$smarty.request.cc_num_txt}'><br></td>
</tr><tr>
<td>Expiration</td>
<td>        <select name='cc_exp_box1' size=1>
        {$cc_month}
        </select>
        &nbsp;-&nbsp;
        <select name='cc_exp_box2' size=1>
        {$cc_year}
        </select><br></td>
</tr><tr>
<td>CVV</td>
<td colspan="4"><input type=text size=4 name='cc_cvv_txt' value='{$smarty.request.cc_cvv_txt}'></td>
</tr>
<tr>
        <td >Street Address 1:  </td>
        <td align=left>
        <input type=text size='30' name='cc_address1_txt' value='{$smarty.request.cc_address1_txt}'></td>
</tr>
<tr>
        <td >Street Address 2:  </td>
        <td align=left><input type=text size='30' name='cc_address2_txt' value='{$smarty.request.cc_address2_txt}'></td>
</tr>
<tr>
        <td >City:  </td>
        <td align=left><input type=text size='30' name='cc_city_txt' value='{$smarty.request.cc_city_txt}'></td>
</tr>
<tr>
        <td >State:  </td>
        <td align=left>
        <select name='cc_states_box' size=1>
        {$state};
        </select></td>
</tr>
<tr>
        <td >Zip Code:  </td>
        <td align=left><input type=text size='11' name='cc_zipcode_txt' value='{$smarty.request.cc_zipcode_txt}'></td>
</tr>
<tr>
        <td >Country:  </td>
        <td align=left>
                <select name='cc_country'>
                {section name=i loop=$country_box}
                <option value='{$country_box[i][0]}'>{$country_box[i]}</option>
                {/section}
                </select>
        </td>
</tr>

<tr>
<td align="center">
<INPUT TYPE="HIDDEN" name='cc_description' VALUE="{$pmt_desc}">
<INPUT TYPE="HIDDEN" name='cc_total' VALUE="{$authorizecost}">
</td>
</tr>
</table>

</div>
</td>
</tr>
</table>


                        </td></tr>
                {/if}
                
                </table>
        </td>
        </tr>
        <tr><td>&nbsp;</td></tr>
        <td align='center'>
                        <input type=button name='back' value='<<Back' onclick="document.location='pack_ops.php?pack={$smarty.request.pack}&uid={$smarty.request.uid}'">&nbsp;&nbsp;&nbsp;
                        <input type=submit name='submit' value='Next >>'>
        </td></tr>
        </table>
        {/if}
        </center>
        </form>
<br><br>
</td></tr>
