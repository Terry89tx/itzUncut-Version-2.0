<tr>
                  <td height=5>&nbsp;</td></tr>
<tr><td>
<TABLE cellSpacing=0 cellPadding=0 width="760" border=0><TBODY>


<TR vAlign=top style="padding-left:10px;" style="padding-bottom:10px;">
<TD style="PADDING-RIGHT: 10px" width="50%" valign=top>
<table align="center"><tr>
                              <td height="24" valign=top><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="5" height="24" background="images/nv_2_l.jpg" valign=top><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                    <th background="images/nv_2_bg.jpg" align=left><span class="white_bold" valign=top align=left>Sign up</span></th>
                                    <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                  </tr>
                              </table></td>
                            </tr>
        <tr>
        <td bgcolor="#FFE2D5" style="PADDING-left: 10px; PADDING-right: 10px">
        New Member? Just fill out the account information
        below.<BR><BR>

        <FORM id=signupForm name=signupForm method=post action="{$baseurl}/signup.php?next={$smarty.request.next}{$smarty.request.add}">

        <TABLE cellSpacing=1 cellPadding=1 width="100%" border=0><TBODY>
        <TR>
        <TD><SPAN class=label><NOBR>Email Address: </NOBR></SPAN></TD>
        <TD><INPUT type=text maxLength=60 size=20 name=email value={$smarty.request.email}></TD>
        </TR>
        <TR>
        <TD><SPAN class=label><NOBR>User Name: </NOBR></SPAN></TD>
        <TD><INPUT maxLength=20 name=username value={$smarty.request.username}></TD>
        </TR>
        <TR>
        <TD><SPAN class=label><NOBR>Password: </NOBR>
        </SPAN></TD>
        <TD><INPUT type=password maxLength=20 name=password1></TD></TR>
        <TR>
        <TD><SPAN class=label><NOBR>Confirm
        Password: </NOBR> </SPAN></TD>
        <TD><INPUT type=password maxLength=20 name=password2></TD></TR>

        {if $enable_package eq "yes"}
        <tr><td colspan="2">&nbsp;</td></tr>
        <tr>
        <td colspan=2 bgcolor="#000000" align="center">
                <table width="100%" cellpadding=3 cellspacing=3 bgcolor="#F8F8FF" align="center">
                <tr><td colspan=2><font size="3px"><b>Available Packages</b></font></td></tr>
                {section name=i loop=$package}
                <tr>
                <td valign="top" width=5><input type='radio' name='pack_id' value='{$package[i].pack_id}'></input></td>
                <td><b>{$package[i].pack_name}</b></input><br>
                        {$package[i].pack_desc}<br>
                        - <font color="#0055CC">{insert name=format_size size=$package[i].space}</font> video upload space<br>
                        - <font color="#0055CC">{insert name=format_size size=$package[i].bandwidth}</font> bandwidth per month<br>
                        {if $package[i].video_limit gt "0"}
                        - Maximum <font color="#0055CC">{$package[i].video_limit}</font> videos upload<br>
                        {/if}
                        {if $package[i].price gt "0"}
                        - Registration cost only <font color="#0055CC">${$package[i].price}</font> per {$package[i].period|lower}
                        {elseif $package[i].is_trial eq "yes"}
                        - Register for <font color="#0055CC">{$package[i].trial_period} days</font> free upload
                        {/if}
                </td>
                </tr>
                {/section}
                </table>
        </td>
        </tr>
        {/if}
        
        <TR>
        <TD colspan=2><BR>- I certify I am over 13 years old.<BR>- I agree to
        the <A href="{$baseurl}/terms.php"
        target=_blank>terms of use</A> and <A
        href="{$baseurl}/privacy.php" target=_blank>privacy
        policy</A>.<br><br></TD></TR>
        <TR>
        <TD>&nbsp;</TD>
        <TD><INPUT type=submit value="Sign Up" name=action_signup></TD></TR>
        </TBODY>
        </TABLE>

        </FORM>
        </td></tr></table>

</TD>

<TD style="PADDING-LEFT: 5px" width="50%" align=right style="padding-right:10px;">
        <table><tr>
                              <td height="24" valign=top><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="5" height="24" background="images/nv_2_l.jpg" valign=top><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                    <th background="images/nv_2_bg.jpg" align=left width=380><span class="white_bold" valign=top>Log in</span></th>
                                    <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                  </tr>
                              </table></td>
                            </tr>
        <tr>
        <td bgcolor="#FFE2D5" align=left style="PADDING-left: 15px">
        Already a Member? Log in here.<BR><BR>
        <FORM id=loginForm name=loginForm method=post action="{$baseurl}/login.php?next={$smarty.request.next}{$smarty.request.add}">
        <TABLE cellSpacing=0 cellPadding=5 width="100%" border=0><TBODY>
                <TR>
                <TD align=right><SPAN class=label><NOBR>User Name</NOBR>
                  :</SPAN></TD>
                <TD><INPUT tabIndex=1 name=username></TD></TR>
                <TR>
                <TD align=right><SPAN class=label><NOBR>Password</NOBR>
                  :</SPAN></TD>
                <TD><INPUT tabIndex=2 type=password name=password></TD></TR>
                <TR>
                <TD align=right><SPAN class=label>&nbsp;</SPAN></TD>
                <TD><INPUT type=submit value="Log In" name=action_login></TD></TR>
                <TR>
                <TD align=middle colSpan=2><A
                  href="{$baseurl}/recoverpass.php">Forgot your
                  password?</A><BR><BR></TD></TR>
        </TBODY></TABLE>
        </FORM>
            </td></tr></table>
</TD></TR></TBODY></TABLE><br></TD></TR>

