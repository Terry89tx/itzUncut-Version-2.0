<tr>
                <td align="center" valign="top">
<table width="746"  border="0" cellspacing="0" cellpadding="0">
                 
                  <tr>
                  <td height=5>&nbsp;</td></tr>
                  <tr><td width=746>
<TABLE cellSpacing=0 cellPadding=0 width=728 align=center bgColor=#cccccc border=0>
<TBODY>
        <TR>
        <TD width=750>
        <DIV class=moduleTitleBar>
        <TABLE cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR vAlign=top>
        

                          <td align="center" valign="top">
                                                        <table width="741"  border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td align="center">
                                                                <table width="739"  border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="5" height="24" background="images/nv_2_l.jpg"><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                  <th background="images/nv_2_bg.jpg"  width=729><div align="left">
                                      <table width="728"  border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td class="white_bold" width="307">{if $smarty.request.category eq ""}{assign var="catgy" value=mr}{else}{assign var="catgy" value=$smarty.request.category}{/if}
        {insert name=tag_to_name assign=tagname tag=$catgy}
        {$tagname}</td>
                                          <td align=center width="300" >{if $smarty.request.viewtype eq "detailed"}
        <A href="{$baseurl}/video.php?page={$page}&viewtype=basic"><span class="white_regular">Basic View</span></A>
        {else}
        <STRONG><span class="white_regular">Basic View</span></STRONG>
        {/if} | {if $smarty.request.viewtype eq "" or $smarty.request.viewtype eq "basic"}
        <A href="{$baseurl}/video.php?page={$page}&viewtype=detailed"><span class="white_regular">Detailed View</span></A>
        {else}
        <STRONG><span class="white_regular">Detailed View</span></STRONG>
        {/if}</td>                         <td  class="white_regular" align=right>  Videos {$start_num}-{$end_num} of {$total}</td>
                                          </tr>
                                      </table>
                                  </div></th>
                                  <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                </tr>
                              </table></td>
                            </tr>
                            </table></td>
          </TR>
          </TBODY></TABLE></DIV>
        
       

        <DIV class=moduleFeatured>
        <TABLE cellSpacing=0 cellPadding=0 width=712 border=0 >
        <TBODY>
        <TR vAlign=top>
        {if $smarty.request.viewtype eq "" or $smarty.request.viewtype eq "basic"}
        {section name=i loop=$answers}
        {if $smarty.section.i.index mod 2 eq "0" and $smarty.section.i.index gt "0"}</tr>
        <tr>{/if}
        <TD align=middle width="166">
        <A href="{$baseurl}/view_video.php?viewkey={$answers[i].vkey}&page={$page}&viewtype={$smarty.request.viewtype}&category={$catgy}">
        <IMG class=moduleFeaturedThumb height=90 src="{$tmburl}/1_{$answers[i].VID}.jpg" width=120>
        </A>
        <DIV class=moduleFeaturedTitle>
        <A href="{$baseurl}/view_video.php?viewkey={$answers[i].vkey}&page={$page}&viewtype={$smarty.request.viewtype}&category={$catgy}">
        {$answers[i].title}
        </A>
        </DIV>
        <DIV class=moduleFeaturedDetails>
        Added: {insert name=time_range assign=rtime field=addtime IDFR=VID id=$answers[i].VID tbl=video}{$rtime}<BR>by
        {insert name=id_to_name assign=uname un=$answers[i].UID}
        <A href="{$baseurl}/uprofile.php?UID={$answers[i].UID}" target=_parent>{$uname}</A>
        </DIV>
        <DIV class=moduleFeaturedDetails>
        Runtime: {$answers[i].duration|string_format:"%.2f"}<BR>Views: {$answers[i].viewnumber} |
        {insert name=comment_count assign=commentcount vid=$answers[i].VID}
        Comments: {$commentcount}
        </DIV>
        <DIV class=moduleEntryDetails>
        {if $answers[i].ratedby gt "0"}
        {insert name=show_rate assign=rate rte=$answers[i].rate}
        {$rate}
        {/if}
        </DIV>
        
        </TD>
        {/section}
        {/if}</tr>
        
        {if $smarty.request.viewtype eq "detailed"}
        {section name=i loop=$answers}
        <TR vAlign=top>
        <TD width=166 height="96">
        <A href="{$baseurl}/view_video.php?viewkey={$answers[i].vkey}&page={$page}&viewtype={$smarty.request.viewtype}&category={$catgy}">
        <IMG class=moduleFeaturedThumb height=70 src="{$tmburl}/1_{$answers[i].VID}.jpg" width=100></A>
        </TD>
        <TD width=100 height="96">
        <A href="{$baseurl}/view_video.php?viewkey={$answers[i].vkey}&page={$page}&viewtype={$smarty.request.viewtype}&category={$catgy}">
        <IMG class=moduleFeaturedThumb height=70 src="{$tmburl}/2_{$answers[i].VID}.jpg" width=100></A>
        </TD>
        <TD width=110 height="96">
        <A href="{$baseurl}/view_video.php?viewkey={$answers[i].vkey}&page={$page}&viewtype={$smarty.request.viewtype}&category={$catgy}">
        <IMG class=moduleFeaturedThumb height=70 src="{$tmburl}/3_{$answers[i].VID}.jpg" width=100></A>
        </TD>
        <TD width=10 height="96"></TD>
        <TD height="96">
        <DIV class=moduleFeaturedTitle>
        <A href="{$baseurl}/view_video.php?viewkey={$answers[i].vkey}&page={$page}&viewtype={$smarty.request.viewtype}&category={$catgy}">
        {$answers[i].title}
        </A>
        </DIV>
        <DIV class=moduleFeaturedDetails>{$answers[i].description}</DIV>
        <DIV class=moduleFeaturedDetails>
        Added: {insert name=time_range assign=rtime field=addtime IDFR=VID id=$answers[i].VID tbl=video}{$rtime} by
        {insert name=id_to_name assign=uname un=$answers[i].UID}
        <A href="{$baseurl}/uprofile.php?UID={$answers[i].UID}" target=_parent>{$uname}</A>
        </DIV>
        <DIV class=moduleFeaturedDetails>
        Runtime: {$answers[i].duration|string_format:"%.2f"}<BR>Views: {$answers[i].viewnumber} |
        {insert name=comment_count assign=commentcount vid=$answers[i].VID}
        Comments: {$commentcount}
        </DIV>
        <DIV class=moduleEntryDetails>
        {if $answers[i].ratedby gt "0"}
        {insert name=show_rate assign=rate rte=$answers[i].rate}
        {$rate}
        {/if}
        </DIV>
        </TD></tr>
        <TR>
        {/section}
        {/if}
        
        </TR></TBODY>
        </TABLE>
        </DIV>


            <!-- begin paging -->
            <DIV
            style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; FONT-WEIGHT: bold; FONT-SIZE: 13px; PADDING-BOTTOM: 5px; COLOR: #444; PADDING-TOP: 5px; TEXT-ALIGN: right">Browse
            Pages:
            {$page_link}
            </DIV><!-- end paging --></TD>
          <TD></TD>
          </TR>
</TBODY></TABLE>
 </td>
                        </tr>
                        <tr>
                  <td height=5>&nbsp;</td></tr>

                    </table> </td></tr>
                    
                    
                    </td></tr></table>                    </td></tr></table>
