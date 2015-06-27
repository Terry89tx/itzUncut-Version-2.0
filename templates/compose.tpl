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
                {include file=err_msg.tpl}
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

<form action="compose.php" method="POST">
        <table width=50% cellpadding=5 cellspacing=1>
        <tr>
                <td align=right>
                        <b>To:</b>
                </td>
                <td>
                        <input type="text" name="receiver" maxlength=40 value={$smarty.request.receiver}>
                        or
                        <select name=buddy_name>
                                {html_options values=$buddy_name output=$buddy_name selected=$receiver_name}
                        </select>
                </td>
        </tr>
        <tr>
                <td align=right>
                        <b>Subject:</b>
                </td>
                <td>
                        <input type="text" name="subject" value="{$smarty.request.subject}" maxlength=200 size=50>
                </td>
        </tr>
        <tr>
                <td colspan=2>
                        <textarea name="details" cols=60 rows=10>{$smarty.request.details}</textarea>
                </td>
        </tr>
        <tr>
                <td colspan=2 align=center><input type=submit name="send" value="Send"></td>
        </tr>
        </table>
<form>

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

