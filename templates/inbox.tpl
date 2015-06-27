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
                                          <td class="white_bold">Messages//Inbox</td>
                                          <td width="150" class="white_regular" align=right style="padding-right:10px;">{if $total ne "0"}Messages {$start_num} - {$end_num} of {$total}{/if} </td>
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

                <table width = 600 cellpadding=3 cellspacing=0 table="table" align=center border="0">
                <tr><td colspan="5" height="10"></td></tr>
                {if $total ne "0"}
                <tr>
                        <td width=20>&nbsp;</td>
                        <td><b>Subject</b></td>
                        <td width=70><b>From<b></td>
                        <td width=160><b>Date</b></td>
                        <td width=20>&nbsp;</td>
                </tr>
                {/if}

                {section name=i loop=$pm_id}
                <tr bgcolor="{cycle values="#eeeeee,#f5f5f5"}">
                  
			{if $seen[i] == "0"}
                                <td width=5><img src='{$baseurl}/images/newmail.gif' alt='New Message'></td>
                        {else}
                                <td width=5><img src='{$baseurl}/images/mail.gif'></td>
                        {/if}

                        <td>
			<a href="{$baseurl}/msg.php?id={$pm_id[i]}&s={$seen[i]}">{$subject[i]}</a></td>
                        <td>{$sender[i]}</td>
                        <td>{$date[i]|date_format:"%A, %B %e, %Y"}
                        <td width=10><a href="{$baseurl}/inbox.php?id={$pm_id[i]}&action=del" onclick="javascript:return confirm('Are you sure you want to delete this message?');">Delete</a></td>
                </td>
                </tr>
                {/section}
                {if $pm_id eq ""}
                <tr class=tablerow>
                        <td align=center colspan=5><br>You have no messages in your inbox<br><br></td>
                </tr>
                {/if}
                </table>

                <DIV>
                <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                <TR vAlign=top>
                <TD><br>
                {if $total ne "0"}
                        <DIV class=moduleTitle>Pages: {$page_link}</DIV></TD>
                {/if}
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
