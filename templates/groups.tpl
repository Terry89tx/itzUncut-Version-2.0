<tr>
                <td align="center" valign="top">
                <table width="760"  border="0" cellspacing="0" cellpadding="0" >
                                        <tr><td height=5></td></tr>                         

                                 <tr>
                    <td>

<TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
<TBODY>
<tr>
        <TD vAlign=top align=left width=580><!--Begin Gray Table-->
        <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center bgColor=#cccccc border=0>
        <TBODY>
        <TR>
        <TD>

                <DIV class=watchTitleBar>
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
                                          <td class="white_bold">{$smarty.request.catgy}</td>
                                          <td width="150" class="white_regular" align=right style="padding-right:10px;">Groups {$start_num} - {$end_num} of {$total} </td>
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
                
                {section name=i loop=$answers}
                {insert name=group_img assign=groupimg gid=$answers[i].GID tbl=group_vdo}
                {insert name=group_info_count assign=gmemcount tbl=group_mem gid=$answers[i].GID}
                {insert name=group_info_count assign=gvdocount tbl=group_vdo gid=$answers[i].GID  query="and approved='yes'"}
                {insert name=group_info_count assign=gtpscount tbl=group_tps gid=$answers[i].GID  query="and approved='yes'"}
                <DIV class=moduleEntry>
                <TABLE cellSpacing=0 cellPadding=0 width="96%" border=0><TBODY>
                <TR vAlign=top>
                <TD>
                <A href="{$baseurl}/groups_home.php?urlkey={$answers[i].gurl}">
                {if $groupimg eq ""}<IMG class=moduleEntryThumb height=90 src="{$imgurl}/no_videos_groups.gif" width=120>
                {else}<IMG class=moduleEntryThumb height=90 src="thumb/1_{$groupimg}.jpg" width=120>
                {/if}</A>
                </TD>
                
                <TD width="74%">
                <DIV class=moduleEntryTitle>
                <A href="{$baseurl}/groups_home.php?urlkey={$answers[i].gurl}">{$answers[i].gname}</A></DIV>
                <DIV class=moduleEntryDescription>{$answers[i].gdescn}</DIV>
                <DIV class=moduleEntryTags>Tags // {$answers[i].keyword}</DIV>
                <DIV class=moduleEntryTags>Status // {$answers[i].type}</DIV>
                {insert name=time_to_date assign=todate tm=$answers[i].gcrtime}
                <DIV class=moduleEntryTags>Created // {$todate}</DIV>
                <DIV class=moduleEntryDescription>
                <A href="{$baseurl}/gmembers.php?urlkey={$answers[i].gurl}&gid={$answers[i].GID}">{$gmemcount} Members</A> |
                <A href="{$baseurl}/gvideos.php?urlkey={$answers[i].gurl}&gid={$answers[i].GID}">{$gvdocount} Videos</A> |
                <A href="{$baseurl}/groups_home.php?urlkey={$answers[i].gurl}">{$gtpscount} Topics</A>
                </DIV>
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
                
                
                <!-- begin paging --><!-- end paging -->
        </TD>
        </TR>
        </TBODY>
        </TABLE>
        <!--End Gray Table--></TD><!--End Rigth Side Group List Table-->
</TR></TBODY></TABLE></TD>




<td width=180 style="padding-bottom:10px; " valign=top><table border=0 cellspacing=0 cellpadding=0>

<tr>
                              <td height="24"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="5" height="24" background="images/nv_2_l.jpg"><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                    <th background="images/nv_2_bg.jpg"><span class="white_bold">Browse Groups</span></th>
                                    <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                  </tr>
                              </table></td>
                            </tr>


<TR><!--Begin Left Side Group Navigation Links-->
<TD  align=left  background="images/background_2_bg.jpg" valign=top style="padding-left:8px; padding-top:8px;">


<A href="{$baseurl}/groups.php?b=fr&catgy=Featured">Featured</A><BR>
<A href="{$baseurl}/groups.php?b=ra&catgy=Recently Added">Recently Added</A><BR>
<A href="{$baseurl}/groups.php?b=mm&catgy=Most Members">Most Members</A><BR>
<A href="{$baseurl}/groups.php?b=mv&catgy=Most Videos">Most Videos</A><BR>
<A href="{$baseurl}/groups.php?b=mt&catgy=Most Topics">Most Topics</A>
<BR><BR><BR></td></tr>

<tr>
                              <td height="24"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="5" height="24" background="images/nv_2_l.jpg"><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                    <th background="images/nv_2_bg.jpg"><span class="white_bold">Groups By Channel</span></th>
                                    <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                  </tr>
                              </table></td>
                            </tr>

<tr><td   background="images/background_3-_bg.jpg" valign=top style="padding-left:8px; padding-bottom:5px; padding-top:8px;">
{insert name=list_channel assign=channel}
{section name=k loop=$channel}
{insert name=group_count assign=gcount chid=$channel[k].id}
<A href="{$baseurl}/groups.php?chid={$channel[k].id}&catgy={$channel[k].ch}">{$channel[k].ch}</A>&nbsp;({$gcount})<BR>
{/section}
<BR><BR><form action="{$baseurl}/create_group.php"><INPUT type=submit value="Create a Group" name="creategroup"></form>

</TD></tr></table></td>
<!--End Left Side Group Navigation Links-->
<!--Begin Right Side Group List Table-->
</TR></TBODY></TABLE>
</td>
                        </tr>
                    </table> </td></tr>
                    
                                        </td></tr></table>
                                                            </td></tr></table>
