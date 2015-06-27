<tr>
        <td align="center" valign="top" width=760>
        <FORM id=friendsForm name=friendsForm method=post>
                <table width="760"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                  <td height=5>&nbsp;</td></tr>
                  <tr><td width=760>

      <TABLE cellSpacing=0 cellPadding=0 width="760" align=center border=0>
        <TBODY>
        <TR vAlign=top>
          <TD width=760 align="center">
            <TABLE cellSpacing=0 cellPadding=0 width="536" align=center border=0 bordercolor=red>
              <input type=hidden name=action_name id=action_name>
              <INPUT type=hidden name=view> <INPUT type=hidden value=t name=sort>
              <INPUT type=hidden value=1 name=page>
              <TBODY>
{if $total_friends eq "0"}
              <tr><td align="center">
                        <br><br><br>
                        <b>You have not invited any friends or family at this time!</b>
                        <br><br>
                        <a href='invite_friends.php'>Invite</a> your friends and family to start sharing videos today!
                        <br><br><br><br><br><br>
              </td></tr>
{else}
              <TR>
                
                <TD align="center">



                  <DIV class=moduleTitleBar>
                  <TABLE cellSpacing=0 cellPadding=0 border=0 align="center">
                    <TBODY>
                    <TR>
                          <td align="center" valign="top" width="551">
                            <table width="100%"  border="0" bordercolor=green cellspacing="0" cellpadding="0">
                            <tr>
                              <td align="center"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="5" height="24" background="images/nv_2_l.jpg">
                                                                        <img src="images/nv_2_l.jpg" width="9" height="24" alt=""></td>
                                  <td width="5" height="24" background="images/nv_2_l.jpg">
                                    &nbsp;</td>
                                  <th background="images/nv_2_bg.jpg" width=550><div align="left">
                                      <table width="102%"  border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td class="white_bold">My Contacts // {if $smarty.request.view eq ""}Overview{else}{$smarty.request.view}{/if}
                                                {if $smarty.request.view ne "" and $smarty.request.view ne "All"}
                                                        <font size=1px>(<a href="friends.php?del_list={$smarty.request.view}" style="color:#000000;" onclick="javascript: confirm('Are you sure you want to delete this contact group?')">delete list</a>)</font>
                                                {/if}
                                          </td>
                                          <td width="250" align="right">
                                                {if $smarty.request.sort ne "name"}
                                                        <A href="friends.php?sort=name"><span class="white_regular">Sort by Name</span></A>
                                                        <span class="white_regular"> | <b>Sort by Date Added</b> </span>
                                                {else}
                                                        <span class="white_regular"><b>Sort by Name</b> | </span>
                                                        <a href="friends.php"><span class="white_regular">Sort by Date Added </span></a>
                                                {/if}
                                                
                                                </td>
                                          </tr>
                                      </table>
                                  </div></th>
                                  <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                </tr>
                              </table></td></tr>

                         <tr><td colspan=2 align=right>View:
                                <SELECT onchange="javascript: document.location.href='friends.php?view='+this.value;" name=view>
                                        {$ftype_ops}
                                </SELECT>
                                {if $total ne "0"}{$link}{/if}

                      </TD></TR></TABLE>
                  <DIV class=moduleEntry>
                  <TABLE cellSpacing=0 cellPadding=0 width=100% bgcolor="#e8e8e8" border=0>
                    <TBODY>
                    {section name=i loop=$friends}

                                    <TR vAlign=top>
                                      <TD align=middle>
                                        <DIV class=moduleEntryThumb>
                                        <DIV style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; FONT-WEIGHT: bold; FONT-SIZE: 16px; PADDING-BOTTOM: 5px; PADDING-TOP: 5px">:-)
                                        </DIV><IMG height=1 src="YouTube - Broadcast Yourself_files/pixel.gif" width=60 border=0></DIV></TD>
                                      <TD width="100%">
                                        <DIV style="FONT-WEIGHT: bold; FONT-SIZE: 14px; PADDING-BOTTOM: 3px">
                                                <INPUT id=AID[] type=checkbox value={$friends[i].id} name=AID[]>
                                                {if $friends[i].friends_status eq "Confirmed"}
                                                        <A href="uprofile.php?UID={$friends[i].FID}">{$friends[i].friends_name}</A>
                                                {else}
                                                        {$friends[i].friends_name}
                                                {/if}
                                        </DIV>
                                        {if $friends[i].friends_status eq "Confirmed"}
                                                {insert name=video_count assign=video uid=$friends[i].FID}
                                                {insert name=favour_count assign=favour uid=$friends[i].FID}
                                                {insert name=friends_count assign=frnd uid=$friends[i].FID}
                                        
                                                <DIV style="FONT-SIZE: 12px; PADDING-BOTTOM: 5px">Videos: {if $video ne "0" and $video ne ""}<A
                                                        href="uvideos.php?UID={$friends[i].FID}">{$video}</A>{else}0{/if}
                                                        | Favorites: {if $favour ne "0"}<A
                                                        href="ufavour.php?UID={$friends[i].FID}">{$favour}</A>{else}0{/if}
                                                        | Friends: {if $frnd ne "0"}<A
                                                        href="ufriends.php?UID={$friends[i].FID}">{$frnd}</A>{else}0{/if}
                                                </DIV>
                                        {/if}
                                        {insert name=showlist assign=showlist id=$friends[i].id}
                                        <DIV style="FONT-SIZE: 11px; PADDING-BOTTOM: 3px">
                                                Lists: {$showlist}
                                        </DIV>
                                        <DIV style="FONT-SIZE: 11px">Status: {$friends[i].friends_status}
                                                {if $friends[i].friends_status eq "Pending"}
                                                ({$friends[i].invite_date|date_format:"%B %e, %Y"})
                                                {/if}
                                        </DIV>
                                    </TD></TR>
                                    <tr><td colspan=2><hr style="border-bottom: 0px dashed #999999;"></td></tr>
                    {/section}



                    </TBODY></TABLE></DIV>

                  <table width="100%" border=0>
                  <tr>
                        <td align="left">
                                <SELECT id=action onchange=doAction(this.value) name=action>
                                {$action_ops}
                                </SELECT> <A
                                  href="javascript:createNewList();">new list</A>
                        </td>
                        <td align="right">
                        {if $total ne "0"}
                        <b>Browse Pages: {$browse}{/if}</b>
                        </td>
                   </tr>
                   </table>
                   
                  </TD>
               </TR>

                </TBODY></TABLE>
                  </div>

                </TD>
                </tbody></table>



<TD valign=top>
<TABLE cellSpacing=0 cellPadding=0 width=192 align=center bgColor=#ffeebb border=0>
<TBODY>
<TR>

<TD width=201 valign=top>
<table border=0 cellspacing=0 cellpadding=0>
        <tr>
                              <td height="24"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="5" height="24" background="images/nv_2_l.jpg"><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                    <th background="images/nv_2_bg.jpg"><A href="invite_friends.php"><span class="white_bold">Share your
        videos with friends!</span></a></th>
                                    <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                  </tr>
                              </table></td>
                            </tr></table>
</TD>



{/if}
</TBODY></TABLE></TD>
</TR></TBODY></TABLE>
</TD></TR></TABLE>
</td>
                        </tr>
                        <tr>
                  <td height=5>&nbsp;</td></tr>
</table>
</FORM>
</td></tr>

