<br>

<TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
<TBODY>
<tr>
        <TD vAlign=top align="center"><!--Begin Gray Table-->
        <TABLE cellSpacing=0 cellPadding=0 width=580 align=center bgColor=#f5f5f5 border=0>
        <TBODY>
        <TR>
        <TD>

                <DIV>
                <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                 <tr>
                          <td align="center" valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td align="center">
                                                                <table width="101%"  border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="5" height="24" background="images/nv_2_l.jpg"><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                  <th background="images/nv_2_bg.jpg"><div align="left">
                                      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td class="white_bold">Messages//Details</td>
                                          <td width="150" class="white_regular" align=right style="padding-right:10px;"></td>
                                          </tr>
                                      </table>
                                  </div></th>
                                  <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                </tr>
                              </table></td>
                            </tr>


                </TBODY>
                </TABLE>
                </DIV>

                <table width = 500 cellpadding=3 cellspacing=0 table="table" align=center>
                <tr><td>

<table width = 100% cellpadding=5 cellspacing=1 table="table">
<tr class="tablerow">
        <td valign=top rowspan=3 align=center>
                <b>Sender: </b><a href="{$baseurl}/uprofile.php?UID={$userid}">{$sender}</a><br><br>
                {insert name=member_img UID=$userid}
        </td>
        <td colspan=2>
                <b>Subject: </b>{$subject}
        </td>
</tr>
<tr class="tablerow">
        <td colspan=2 valign=top><br><b>Details: </b><br>{$body}<br><br></td>
</tr>
<tr class="tablerow">
        <td colspan=2>
                <a href="{$baseurl}/compose.php?receiver={$sender}&subject=Re: {$subject}">Reply</a><br><br>
                <b>Sent: </b>{$date|date_format:"%A, %B %e, %Y"} at {$date|date_format:"%I:%M:%S %p"}
        </td>
</tr>
</table>

                </td>
                </tr>
                </table>

                <DIV>
                <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                <TR vAlign=top>
                <TD><br>
                </TR>
                </TBODY>
                </TABLE>
                </DIV>


                <!-- begin paging --><!-- end paging -->
        </TD>
        </TR>
        </TBODY>
        </TABLE>
        <!--End Gray Table--></TD><!--End Rigth Side Group List Table-->
</TR></TBODY></TABLE>

</td></tr>
</table>

<br>


