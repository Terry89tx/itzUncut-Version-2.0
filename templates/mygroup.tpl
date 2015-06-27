<tr>
                <td align="center" valign="top"><table width="760"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                  <td height=5>&nbsp;</td></tr>
                  <tr><td width=760 height=250>


{if $total ne "0"}
<TABLE cellSpacing=0 cellPadding=5 width=760 border=0>
<TBODY>
<TR><!--Begin Group List Table-->
<TD vAlign=top align=center width=760><!--Begin Gray Table-->
<TABLE cellSpacing=0 cellPadding=0 align=center  width="100%" border=0>
<TBODY>
<TR>
<TD>

<DIV class=watchTitleBar>
<TABLE cellSpacing=0 cellPadding=3 width="100%" border=0>
<TBODY>
<TR vAlign=top>
<TD bgColor=#cccccc>
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
                                          <td class="white_bold">My Groups</td>
                                          <td width="150" class="white_regular" align=right style="padding-right:10px;">Results {$start_num}-{$end_num} of {$total}  </td>
                                          </tr>
                                      </table>
                                  </div></th>
                                  <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                </tr>
                              </table></td>
                            </tr>
                

                </TBODY>
                </TABLE>


</TD>
</TR>
</TBODY>
</TABLE>
</DIV>
                {section name=i loop=$answers}
                {insert name=group_img assign=groupimg gid=$answers[i].GID tbl=group_vdo}
                {insert name=time_to_date assign=todate tm=$answers[i].gcrtime}
                {insert name=row_count assign=mcnt gid=$answers[i].GID tbl=group_mem}
                {insert name=row_count assign=vcnt gid=$answers[i].GID tbl=group_vdo}
                {insert name=check_group_own assign=WONID gid=$answers[i].GID}

                <DIV class=moduleEntry>
                <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0><TBODY>
                <TR vAlign=top>
                <TD>
                <A href="{$baseurl}/groups_home.php?urlkey={$answers[i].gurl}">
                {if $groupimg eq ""}<IMG class=moduleEntryThumb height=90 src="{$imgurl}/no_videos_groups.gif" width=120>
                {else}<IMG class=moduleEntryThumb height=90 src="thumb/1_{$groupimg}.jpg" width=120>
                {/if}</A>
                </TD>
                
                <TD width="100%">
                <DIV class=moduleEntryTitle>
                <A href="{$baseurl}/groups_home.php?urlkey={$answers[i].gurl}">{$answers[i].gname}</A></DIV>
                <DIV class=moduleEntryDescription>{$answers[i].gdescn}</DIV>
                <DIV class=moduleEntryTags>Tags // {$answers[i].keyword}</DIV>
                <DIV class=moduleEntryTags>Status // {$answers[i].type}</DIV>
                <DIV class=moduleEntryTags>Created // {$todate}</DIV>
                <DIV class=moduleEntryDescription>
                <A href="{$baseurl}/gmembers.php?urlkey={$answers[i].gurl}&gid={$answers[i].GID}">{$mcnt} Members</A> |
                <A href="{$baseurl}/gvideos.php?urlkey={$answers[i].gurl}&gid={$answers[i].GID}">{$vcnt} Videos</A> |
                {insert name=topic_count assign=total_topic GID=$answers[i].GID}
                <A href="{$baseurl}/groups_home.php?urlkey={$answers[i].gurl}">{$total_topic} Topics</A></DIV>
                {if $smarty.session.UID eq $WONID}
                <DIV class=moduleEntryTags><B>You are the owner of this group.</B></DIV>
                {/if}
                </TD>
                </TR>
                </TBODY>
                </TABLE>
                </DIV>
                {/section}
                
                <DIV>
                <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                <TR vAlign=top>
                <TD>
                <DIV class=moduleTitle>Pages: {$page_link}</DIV></TD>
                </TR>
                </TBODY>
                </TABLE>
                </DIV>
                
        </TD>
        </TR>
        </TBODY></TABLE>
        
        <!--End Gray Table--></TD><!--End Group List Table-->
        <td width=10>&nbsp;</td>
        <TD vAlign=top width=180 bgColor=#ccdcdd>
        <TABLE class=roundedTable cellSpacing=0 cellPadding=0 width=180 align=center  border=0>
        <TBODY>
        <TR>
        
        <TD width=180>
        <table border=0 cellspacing=0 cellpadding=0>

                                                        <tr>
                              <td height="24"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="5" height="24" background="images/nv_2_l.jpg"><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                    <th background="images/nv_2_bg.jpg" width=180><A href="{$baseurl}/groups.php"><span class="white_bold">Browse More Groups</span></A></th>
                                    <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                  </tr>
                              </table></td></tr></table>
        
       </TD>
        
        </TR>
        </TBODY></TABLE>
        <TABLE cellSpacing=0 cellPadding=0 align=top border=0>
        <TBODY>
        <TR >
        <TD width=180 style="padding-left:10px;" vAlign=top>
                <DIV class=tag_list>Group Tags: </DIV>
                <DIV class=tag_list>
                {section name=i loop=$mytags}
                <div>» <A style="FONT-SIZE: 12px" href="{$baseurl}/search_result.php?search_type=search_groups&search_id={$mytags[i]}">{$mytags[i]}</A></div>
                {/section}
                </DIV>
        </TD></TR></TBODY></TABLE>
</TD></TR></TBODY></TABLE></td></tr></tbody></table>
{else}
<center><b>There is no group found</b></center>
{/if}
</td>
     </tr>
     <tr><td height=5></td></tr>
     </table>
  </td></tr>                       </td></tr></table>

