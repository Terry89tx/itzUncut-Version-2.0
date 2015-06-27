

 <tr>
                <td align="center" valign="top">
                <table width="760"  border="0" cellspacing="0" cellpadding="0" >
                  <tr><td width=10 rowspan=2>&nbsp;</td></tr>

                  <tr>
                    <td>

<TABLE cellSpacing=0 cellPadding=5 width="750" border=0>
<FORM method=post><INPUT type=hidden value=profile_submit name=command>
<input type="hidden" name=prevemail value={$answers[0].email}>
<TBODY>
<TR><TD colSpan=2><DIV class=tableSubTitle></DIV></TD></TR>
<TR>
        <TD colSpan=2>
        <DIV class=tableSubTitle>
        <DIV style="FONT-WEIGHT: normal; FONT-SIZE: 11px; FLOAT: right">
        <A href="{$baseurl}/uprofile.php?UID={$answers[0].UID}">
        View Your Profile Page</A>
        </DIV>Account Information: </DIV>* Indicates required field.</TD>
</TR>
<TR>
          <TD align=right width=200><SPAN class=label>Email:</SPAN></TD>
          <TD><INPUT maxLength=60 size=30 value="{$answers[0].email}" name=email> *</TD>
</TR>
<TR>
          <TD align=right><SPAN class=label>User Name:</SPAN></TD>
        <TD>{$answers[0].username}</TD>
</TR>
<TR>
          <TD align=right><SPAN class=label>Password:</SPAN></TD>
          <TD><INPUT type=password maxLength=20 value="{$answers[0].pwd}" name=password1> *</TD>
</TR>
<TR>
          <TD align=right><SPAN class=label>Retype Password:</SPAN></TD>
          <TD><INPUT type=password maxLength=20 value={$answers[0].pwd} name=password2> *</TD>
</TR>
<TR>
          <TD class=small colSpan=2>&nbsp;</TD>
</TR>
<TR>
          <TD colSpan=2>
          <DIV class=tableSubTitle>Personal Information:</DIV></TD></TR>
<TR>
          <TD align=right><SPAN class=label>First Name:</SPAN></TD>
          <TD><INPUT maxLength=30 size=30 name=fname value="{$answers[0].fname}"></TD></TR>
<TR>
          <TD align=right><SPAN class=label>Last Name:</SPAN></TD>
          <TD><INPUT maxLength=30 size=30 name=lname value="{$answers[0].lname}"></TD></TR>
<TR>
          <TD align=right><SPAN class=label>Birthday:</SPAN></TD>
          <TD>
          <SELECT name=month><OPTION>mm</OPTION>{$months}</SELECT>
          <SELECT name=day><OPTION>dd</OPTION>{$days}</SELECT>
          <SELECT name=year><OPTION>yyyy</OPTION>{$years}</SELECT>
          </TD>
</TR>
<TR>
          <TD align=right><SPAN class=label>Gender:</SPAN></TD>
          <TD>
          <SELECT name=gender>
          <OPTION value="">---</OPTION>
          <OPTION value=Female {if $answers[0].gender eq "Female"}selected{/if}>Female</OPTION>
          <OPTION value=Male {if $answers[0].gender eq "Male"}selected{/if}>Male</OPTION>
          </SELECT>
          </TD>
</TR>
<TR>
          <TD align=right><SPAN class=label>Relationship Status:</SPAN></TD>
          <TD>
          <SELECT name=relation>
          <OPTION value="">---</OPTION>
          <OPTION value=Single {if $answers[0].relation eq "Single"}selected{/if}>Single</OPTION>
          <OPTION value=Taken {if $answers[0].relation eq "Taken"}selected{/if}>Taken</OPTION>
          <OPTION value=Open {if $answers[0].relation eq "Open"}selected{/if}>Open</OPTION>
          </SELECT>
          </TD>
</TR>
<TR vAlign=top>
          <TD align=right>
          <SPAN class=label>About Me:</SPAN><BR>
          <SPAN class=small>(Describe Yourself)&nbsp;&nbsp;</SPAN>
          </TD>
          <TD><TEXTAREA name="aboutme" rows=5 cols=45>{$answers[0].aboutme}</TEXTAREA></TD>
</TR>
<TR>
          <TD align=right><SPAN class=label>Personal Website:</SPAN></TD>
          <TD><INPUT maxLength=255 size=40 name=url value="{$answers[0].website}"></TD>
</TR>
<TR>
          <TD class=small colSpan=2>&nbsp;</TD>
</TR>
<TR>
          <TD colSpan=2><DIV class=tableSubTitle>Location Information:</DIV></TD>
</TR>
<TR>
          <TD align=right><SPAN class=label>Hometown:</SPAN></TD>
          <TD><INPUT maxLength=120 size=30 name=hometown value="{$answers[0].town}"></TD></TR>
<TR>
          <TD align=right><SPAN class=label>Current City:</SPAN></TD>
          <TD><INPUT maxLength=120 size=30 name=city value="{$answers[0].city}"></TD></TR>
<TR>
          <TD align=right><SPAN class=label>Current Zip:</SPAN> <BR>
          <SPAN class=small>(US &amp; Canada Only)&nbsp;&nbsp;</SPAN>
          </TD>
          <TD><INPUT maxLength=5 size=5 name=zip value="{$answers[0].zip}"></TD>
</TR>
<TR>
          <TD align=right><SPAN class=label>Current Country:</SPAN></TD>
          <TD>
          <SELECT name=country>
          <OPTION value="">Select Country</OPTION>{$country}
          </SELECT>
          </TD>
</TR>
<TR>
          <TD class=small colSpan=2>&nbsp;</TD></TR>
<TR>
          <TD colSpan=2>
            <DIV class=tableSubTitle>Random Information:</DIV>Separate items
            with commas.</TD></TR>
<TR>
          <TD align=right><SPAN class=label>Occupations:</SPAN></TD>
          <TD><INPUT maxLength=500 size=40 name=occupation value="{$answers[0].occupation}"></TD></TR>
<TR>
          <TD align=right><SPAN class=label>Companies:</SPAN></TD>
          <TD><INPUT maxLength=500 size=40 name=companies value="{$answers[0].company}"></TD></TR>
<TR>
          <TD align=right><SPAN class=label>Schools:</SPAN></TD>
          <TD><INPUT maxLength=500 size=40 name=schools value="{$answers[0].school}"></TD></TR>
<TR vAlign=top>
          <TD align=right><SPAN class=label>Interests &amp; Hobbies:</SPAN></TD>
          <TD><TEXTAREA name=hobbies rows=5 cols=45>{$answers[0].interest_hobby}</TEXTAREA></TD></TR>
<TR vAlign=top>
          <TD align=right><SPAN class=label>Favorite Movies &amp;
          Shows:</SPAN></TD>
          <TD><TEXTAREA name=movies rows=5 cols=45>{$answers[0].fav_movie_show}</TEXTAREA></TD></TR>
<TR vAlign=top>
          <TD align=right><SPAN class=label>Favorite Music:</SPAN></TD>
          <TD><TEXTAREA name=music rows=5 cols=45>{$answers[0].fav_music}</TEXTAREA></TD></TR>
<TR vAlign=top>
          <TD align=right><SPAN class=label>Favorite Books:</SPAN></TD>
          <TD><TEXTAREA name=books rows=5 cols=45>{$answers[0].fav_book}</TEXTAREA></TD></TR>
<TR>
          <TD>&nbsp;</TD>
          <TD><INPUT type=submit value="Update Profile" name="update_profile"></TD>
</TR>
</FORM>
</TBODY>
</TABLE>
</td>
                        </tr>
                    </table> </td></tr>
