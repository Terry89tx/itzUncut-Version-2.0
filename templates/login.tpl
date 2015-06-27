                  <tr>
                  <td height=5>&nbsp;</td></tr>
       <tr>
        <td>
      <TABLE cellSpacing=0 cellPadding=0 width=760 align=center border=0>
        <TBODY>

        <TR vAlign=top>
          <TD style="PADDING-RIGHT: 15px;" width=510 style="padding-bottom:10px;" >
          <table border=0  bgcolor="#F1F5F8"  bgcolor="#FFE2D5">
          <tr>
          <td height="24" colspan=2 bgcolor="#FFE2D5">
	  <table width="100%"  height=24 border="0" cellspacing="0" cellpadding="0" bgcolor="#FFE2D5">
		<tr>
                                    <td background="images/nv_2_l.jpg" class="style3" >
					<div align="left" class="white_bold">&nbsp;&nbsp; Information of {$site_name}</div>
				    </td>
                                    
         </tr></table>
	 
	 </td>
         </tr >   
          <tr bgcolor="#FFE2D5">
          <td style="PADDING-left: 15px;" style="padding-right:10px;" >
          <SPAN class=highlight>What
            is {$site_name}?</SPAN> {$site_name} is a way to get your videos to the people
            who matter to you. With {$site_name} you can:
            <UL>
              <LI>Show off your favorite videos to the world
              <LI>Blog the videos you take with your digital camera or cell
              phone
              <LI>Securely and privately show videos to your friends and family
              around the world
              <LI>... and much, much more! </LI></UL><BR><SPAN class=highlight><A
            href="{$baseurl}/signup.php">Sign up now</A> and open a new
            account.</SPAN> <BR><BR><BR>To learn more about our service, please
            see our <A href="{$baseurl}/help.php">Help</A>
            section.<BR><BR><BR>
            </td></tr></table>
            </TD>

          <TD width=250 valign=top style="PADDING-top: 3px;">
            <TABLE cellSpacing=0 cellPadding=0 width=250 align=center  border=0 bordercolor=red>
              <TBODY>


                <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0  bgcolor="#FFE2D5">
                <FORM name=loginForm method=post action="{$baseurl}/login.php?next={$smarty.request.next}{$smarty.request.add}">
                <TBODY>
                <tr>
                <td height="30" colspan=2>
		<table width="100%"  height=24 border="0" cellspacing="0" cellpadding="0" >
                                  <tr >
                                    
                                    <td background="images/nv_2_l.jpg" class="style3" >
					<div align="left" class="white_bold">{$site_name} Log In </div>
				   </td>                                    
                                  </tr>
                              </table>
			</td>
                </tr>
                
                <TR>
                <TD align=right><SPAN class=label><NOBR>User Name</NOBR>:</SPAN></TD>
                <TD style="PADDING-left: 5px;"><INPUT tabIndex=1 name=username value={$smarty.request.username}></TD>
                </TR>
                        <TR>
                        <TD align=right>
				<SPAN class=label>
					<NOBR>Password</NOBR>:
				</SPAN>
			</TD>
                        <TD style="PADDING-left: 5px;">
				<INPUT tabIndex=2 type=password name=password>
			</TD>
		</TR>
                        <TR>
                        <TD align=right ><SPAN class=label>&nbsp;</SPAN></TD>
                        <TD style="PADDING-left: 5px;" align="center"><INPUT type=submit value="Log In" name=action_login></TD></TR>
                        <TR>
                        <TD align=middle colSpan=2><A
                        href="{$baseurl}/recoverpass.php">Forgot your
                        password?</A><BR><BR></TD></TR>
                        </FORM>
                        </TBODY>
                        </TABLE>
                </TD>
                </TR>
              </TBODY></TABLE></TD>


