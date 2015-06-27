<script language=JavaScript src={$baseurl}/js/myjavascript.js></script>     
        
        <tr>
                <td align="center" valign="top">
                <table width="760"  border="0" cellspacing="0" cellpadding="0" >
                  <tr>
                    <td align="center" valign="top">
                    <table width="100%"  border="0" bordercolor=blue cellspacing="0" cellpadding="0" >
                        <tr>{if $smarty.session.UID eq ""}
                        
                          <td align="center" valign="top">
                          <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                            <tr>
                            <td height="1">&nbsp;</td>
                            </tr>
                            <tr>
                            <td height="1" bgcolor="#FFE2D5"></td>
                            </tr>
                            <tr>
                              <td align="center">

                              <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                  <td height="70" align="center" bgcolor="#FFE2D5">

                                                <table width="96%"  border="0" cellspacing="10" cellpadding="0" align=center>
                                                <tr>
                                                        <td>
                                                                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                        <td class="bold_blue_large"><A href="{$baseurl}/video.php">Watch</A></td>
                                                                </tr>
                                                                <tr>
                                                                        <td class="normal_gray">Better than TV watch what you want when you want it!</td>
                                                                 </tr>
                                                                </table>
                                                        </td>
                                                <td width="1" bgcolor="#7AAFCE"></td>
                                                        <td>
                                                                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                        <td class="bold_blue_large"><A href="{$baseurl}/upload.php">Upload</A></td>
                                                                </tr>
                                                                <tr>
                                                                        <td class="normal_gray">Quickly upload and tag videos in almost any video format.</td>
                                                                </tr>
                                                                </table>
                                                </td>
                                                <td width="1" bgcolor="#7AAFCE"></td>
                                                <td >
                                                                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                        <td class="bold_blue_large"><A href="{$baseurl}/invite_friends.php">Share</A></td>
                                                                </tr>
                                                                <tr>
                                                                        <td class="normal_gray">Easily share your videos with everyone, put videos on your space or watch them here.</td>
                                                                </tr>
                                                                </table>
                                                </td>
                                                </tr>
                                                </table>


                                  </td>
                               
                                 </tr>
                                 </table>

                            </td>
                            </tr>
                            <tr>
                              <td height="1" bgcolor="#E1E3E4"></td>
                            </tr>
                          </table>
                        </td>
                        </tr>
                        
                        <tr>
                          <td height="7" align="center" valign="top"></td>
                        </tr>
                        <tr>
                          <td align="center" valign="top">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                        <td align="center">{insert name=advertise adv_name='home_top_banner'}</td>
                                </tr>
                                </table>
                          </td>
                        </tr>
                        <tr>
                          <td height="7" align="center" valign="top"></td>
                        </tr>
                        <tr>
                        <td align="center" valign="top">
                        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td><table width="100%"  border="0" cellspacing="0" cellpadding="0" bgcolor=#FFE2D5>
                                <tr>
                                  <td width="5" height="24" background="images/nv_2_l.jpg"><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                  <th background="images/nv_2_bg.jpg"><div align="left">
                                    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                      <tr>
                                        <td width="150" class="white_bold">Recently Viewed</td>
                                        <td class="white_regular"><div id="recent_total">[1-4 of {$recent_total}]</div></td>
                                        <td align="right"><img src="images/arrow.jpg" width="28" height="10" alt=""></td>
                                        <td width="150"><A href="{$baseurl}/video.php?category=mv"><span class="white_regular">More Recently Viewed</span></a><span class="style14"></span></td>
                                      </tr>
                                    </table>
                                  </div></th>
                                  <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                </tr>
                              </table></td>
                            </tr>
                            <tr>
                              <td><table width="100%"  border="0" cellspacing="0" cellpadding="0" bgcolor="#F1F5F8">
                                <tr>
                                  <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="1" bgcolor="#E1E3E4"></td>
                                      <td><table width="100%"  border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                          <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                              <tr>
                                                <td width="25" align="center"><span class="bold_blue"><a href="javascript:void(0);" onclick="javascript:show_recent('left', {$recent_total});"><strong>B<br>A<br>C<br>K</strong></a></span></td>

                                                <td height="80"></td>
                                                <td align="center">
                                                        <div id="recent1">
                                                        <table width="100%" >
                                                        <tr>
                                                        {section name=i loop=$recent start=0 max=4}
                                                        <td width="25%" align="center">
                                                                <A href="{$baseurl}/view_video.php?viewkey={$recent[i].vkey}"><IMG class=moduleFeaturedThumb width=80 height=60 src="{$tmburl}/1_{$recent[i].VID}.jpg"><br>{$recent[i].title}</a><br>
                                                                <font size="1px">{insert name=timediff value=var time=$recent[i].viewtime}</font>
                                                        </td>
                                                        {/section}
                                                        </tr>
                                                        </table>
                                                        </div>

                                                        <div id="recent2" style="display:none;">
                                                        <table width="100%">
                                                        <tr>
                                                        {section name=i loop=$recent start=4 max=4}
                                                        <td width="25%" align="center">
                                                                <A href="{$baseurl}/view_video.php?viewkey={$recent[i].vkey}"><IMG class=moduleFeaturedThumb width=80 height=60 src="{$tmburl}/1_{$recent[i].VID}.jpg"><br>{$recent[i].title}</a><br>
                                                                <font size="1px">{insert name=timediff value=var time=$recent[i].viewtime}</font>
                                                        </td>
                                                        {/section}
                                                        </tr>
                                                        </table>
                                                        </div>
                                                        
                                                        <div id="recent3" style="display:none;">
                                                        <table width="100%">
                                                        <tr>
                                                        {section name=i loop=$recent start=8 max=4}
                                                        <td width="25%" align="center">
                                                                <A href="{$baseurl}/view_video.php?viewkey={$recent[i].vkey}"><IMG class=moduleFeaturedThumb width=80 height=60 src="{$tmburl}/1_{$recent[i].VID}.jpg"><br>{$recent[i].title}</a><br>
                                                                <font size="1px">{insert name=timediff value=var time=$recent[i].viewtime}</font>
                                                        </td>
                                                        {/section}
                                                        </tr>
                                                        </table>
                                                        </div>
                                                </td>
                                                <td width="25" align="center"><span class="bold_blue"><a href="javascript:void(0);" onclick="javascript:show_recent('right', {$recent_total});"><strong>N<br>E<br>X<br>T</strong></a></span></td>
                                              </tr>
                                          </table></td>
                                        </tr>
                                      </table></td>
                                      <td width="1" bgcolor="#E1E3E4"></td>
                                    </tr>
                                  </table></td>
                                </tr>
                                <tr>
                                  <td height="1" bgcolor="#E1E3E4"></td>
                                </tr>
                              </table></td>
                            </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td height="7" align="center" valign="top"></td>
                        </tr>
                        </td>
                                {else}

                        <td align="center" valign="top">
                        
                        {insert name=home_info assign=userinfo}
                                <TABLE class=roundedTable cellSpacing=0 cellPadding=5 width=100% align=center bgColor=#ffffff border=0 bordercolor=green>
                                <TBODY>
                                        <TR>
                                                <TD>
                                                <TABLE cellSpacing=0 cellPadding=4 width="100%" border=0 bordercolor=red bgcolor="#F1F5F8" >
                                                <TBODY>
                                                <TR vAlign=top>
                                                        <TD style="BORDER-RIGHT: #d7d7d7 1px dashed; PADDING-RIGHT: 10px; PADDING-LEFT: 10px" width="50%">
                                                        <DIV style="FONT-WEIGHT: bold; FONT-SIZE: 16px; MARGIN-BOTTOM: 10px; COLOR: #003366">Welcome, {$smarty.session.USERNAME} </DIV>

                                            <!--Begin My Stats Table-->
                                                        <TABLE cellSpacing=0 cellPadding=0>
                                                        <TBODY>
                                                        <TR><td height="24" valign=top>
                                                                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="5" height="24" background="images/nv_2_l.jpg" valign=top><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                                                    <th background="images/nv_2_bg.jpg" align=left><span class="white_bold" valign=top align=left>My stats</span></th>
                                                                    <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                                                </tr>
                                                                </table>
                                                           </td>
                                                        </TR>
                                                        <TR>
                                                        <TD>
                                                                <TABLE style="BORDER-RIGHT: #cccccc 1px solid; PADDING-RIGHT: 10px; BORDER-TOP: #cccccc 1px solid; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; BORDER-LEFT: #cccccc 1px solid; WIDTH: 271px; PADDING-TOP: 10px; BACKGROUND-COLOR: #ffffff; BORDER-BOTTOM: #cccccc 1px solid;" cellSpacing=0 cellPadding=0>
                                                                <TBODY><TR>
                                                                        <TD>
                                                                        <DIV style="FONT-SIZE: 12px; PADDING-BOTTOM: 5px; FONT-FAMILY: Arial, Helvetica, sans-serif; font-color: #666666">
                                                                        <A href="{$baseurl}/my_video.php">My Videos</A> have been viewed <b>{$userinfo[0].video_viewed}</b> times</DIV>
                                                                        <DIV style="FONT-SIZE: 12px; PADDING-BOTTOM: 5px; FONT-FAMILY: Arial, Helvetica, sans-serif; font-color: #666666">
                                                                        {insert name=friends_count assign=frcnt uid=$smarty.session.UID}
                                                                        I have <b>{$frcnt}</b> <A href="{$baseurl}/friends.php">friends</A></DIV>
                                                                        {if $enable_package eq "yes"}
                                                                                <DIV style="FONT-SIZE: 12px; PADDING-BOTTOM: 5px; FONT-FAMILY: Arial, Helvetica, sans-serif; font-color: #666666">
                                                                                I have uploaded <b>{$u_info.total_video}</b> <a href="{$baseurl}/my_video.php">videos</a> {if $pack.video_limit gt "0"} out of {$pack.video_limit} videos{/if}
                                                                                </div>
                                                                                <DIV style="FONT-SIZE: 12px; PADDING-BOTTOM: 5px; FONT-FAMILY: Arial, Helvetica, sans-serif; font-color: #666666">
                                                                                Space I have used <b>{insert name=format_size size=$u_info.used_space}</b> out of {insert name=format_size size=$pack.space}</div>
                                                                                <DIV style="FONT-SIZE: 12px; PADDING-BOTTOM: 5px; FONT-FAMILY: Arial, Helvetica, sans-serif; font-color: #666666">
                                                                                Bandwidth I have used <b>{insert name=format_size size=$u_info.used_bw}</b> out of {insert name=format_size size=$pack.bandwidth}</DIV>
                                                                        {else}
                                                                        <DIV style="FONT-SIZE: 12px; PADDING-BOTTOM: 5px; FONT-FAMILY: Arial, Helvetica, sans-serif; font-color: #666666">
                                                                        I've watched <b>{$userinfo[0].watched_video}</b> videos</DIV>
                                                                        <DIV style="FONT-SIZE: 12px; PADDING-BOTTOM: 5px; FONT-FAMILY: Arial, Helvetica, sans-serif; font-color: #666666">
                                                                        My Profile has been viewed <b>{$userinfo[0].profile_viewed}</b> times</DIV>
                                                                        {/if}
                                                                        </TD>
                                                                        </TR>
                                                                </TBODY></TABLE>
                                                        </TD>
                                                        </TR>
                                                        <TR>
                                                        <TD></TD>
                                                        </TR>
                                                        </TBODY>
                                                        </TABLE>
                                <!--End My Stats Table--></TD>

                                <!--Begin My Inbox Table-->
                                                                <TD style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px" width="50%">
                                                                <DIV style="FONT-WEIGHT: bold; FONT-SIZE: 16px; MARGIN-BOTTOM: 10px; COLOR: #003366">&nbsp;</DIV>
                                <!--Begin My Inbox Table-->
                                                                <TABLE cellSpacing=0 cellPadding=0>
                                                                <TBODY><TR>
                                                                                <td height="24" valign=top>
                                                                                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                        <td width="5" height="24" background="images/nv_2_l.jpg" valign=top><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                                                                        <th background="images/nv_2_bg.jpg" align=left><span class="white_bold" valign=top align=left>My Inbox</span></th>
                                                                                        <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                                                                        </tr>
                                                                                </table>
                                                                                </td>
                                                                        </TR>
                                                                        <TR><TD>
                                                                                <TABLE style="BORDER-RIGHT: #cccccc 1px solid; PADDING-RIGHT: 10px; BORDER-TOP: #cccccc 1px solid; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; BORDER-LEFT: #cccccc 1px solid; WIDTH: 271px; PADDING-TOP: 10px; BACKGROUND-COLOR: #ffffff; BORDER-BOTTOM: #cccccc 1px solid;" cellSpacing=0 cellPadding=0>
                                                                                <TBODY><TR>
                                                                                <TD>
                                                                                <DIV style="FONT-SIZE: 12px; PADDING-BOTTOM: 5px; FONT-FAMILY: Arial, Helvetica, sans-serif; font-color: #666666">
                                                                                <IMG style="PADDING-RIGHT: 5px; VERTICAL-ALIGN: middle" height=12 src="{$imgurl}/icon_mail_off.gif" width=14 border=0>
                                                                                        You have {insert name="msg_count" assign=total_msg} <A href="{$baseurl}/inbox.php"><b>{$total_msg}</b></A> new message</DIV>
                                                                                <DIV style="FONT-SIZE: 12px; PADDING-BOTTOM: 10px; FONT-FAMILY: Arial, Helvetica, sans-serif; font-color: #666666">
                                                                                        You have
                                                                                {insert name=frndreq_count assign=freqcnt}
                                                                                                <b>{$freqcnt}</b> friend request
                                                                                <br><br><br></DIV>
                                                                                </TD></TR>
                                                                                </TBODY></TABLE>
                                                                             </TD>
                                                                        </TR>
                                                                        <TR>
                                                                                <TD></TD>
                                                                        </TR>
                                                                </TBODY></TABLE>
                                        <!--End My Inbox Table-->
                                                                </TD></TR></TBODY></TABLE>

                                                        </TD></TR>


                       <tr>
                          <td height="7" align="center" valign="top"></td>
                        </tr>
                        <tr>
                          <td align="center" valign="top">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                        <td align="center">{insert name=advertise adv_name='home_top_banner'}</td>
                                </tr>
                                </table>
                          </td>
                        </tr>
                        <tr>
                          <td height="7" align="center" valign="top"></td>
                        </tr>



                        </td>

                        {/if}
                        </tr>

                       {if $total gt "0"}
                        <tr>
                          <td align="center" valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td align="center">
                              <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
                                <tr>
                                  <td width="5" height="24" background="images/nv_2_l.jpg"><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                  <th background="images/nv_2_bg.jpg"><div align="left">
                                      <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
                                        <tr>
                                          <td class="white_bold">Today's Featured Videos</td>
                                          <td width="150"><A href="{$baseurl}/video.php"><span class="white_regular">See More Videos</span></a></td>
                                          </tr>
                                      </table>
                                  </div></th>
                                  <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                </tr>
                              </table></td>
                            </tr>
                            {section name=i loop=$answers}
                            <tr>
                                <td align="center">
                                        <table width="100%"  border="0" cellspacing="0" cellpadding="0" style="border-bottom: 1px dashed #999999;">
                                        <tr>
                                                <td align="center">
                                                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                        <td width="1" bgcolor="#C0C0C0"></td>
                                                        <td>
                                                        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                                <td>
                                                                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                        <td height="154" align="center" valign="top" background="images/background_1-_bg.jpg" style="background-repeat:repeat-x; " bgcolor="#F3F3F3"><table width="100%"  border="0" cellspacing="11" cellpadding="0">
                                                                <tr>
                                                                        <td width="120" valign="top"><A href="{$baseurl}/view_video.php?viewkey={$answers[i].vkey}"><IMG class=moduleFeaturedThumb height=90 src="{$tmburl}/1_{$answers[i].VID}.jpg" width=120></a></td>
                                                                        <td align="center" valign="top">
                                                                        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                                <td><span class="bold_blue"><A href="{$baseurl}/view_video.php?viewkey={$answers[i].vkey}">{$answers[i].title}</A></span><br>
                                                                                <span class="normal_gray">{if $answers[i].featuredesc ne ""}{$answers[i].featuredesc}<br><br>{/if}{$answers[i].description}<br><br>
                                                                                Tags // </span><span class="normal_blue">{insert name=video_keyword assign=keyword vid=$answers[i].VID}
                                                                                {section name=j loop=$keyword}
                                                                                        <A href="{$baseurl}/search_result.php?search_id={$keyword[j]}">{$keyword[j]}</A>&nbsp;
                                                                                {/section}
                                                                                </span><span class="normal_gray"><br>
                                                                                        Added: {insert name=time_range assign=rtime field=addtime IDFR=VID id=$answers[i].VID tbl=video}{$rtime} by  </span>
                                                                                <span class="normal_blue">{insert name=id_to_name assign=uname un=$answers[i].UID}
                                                                                <A href="{$baseurl}/uprofile.php?UID={$answers[i].UID}">{$uname}</A>
                                                                                </span><span class="normal_gray"><br>
                                                                                Runtime: {$answers[i].duration|string_format:"%.2f"} |
                                                                                Views: {$answers[i].viewnumber} |
                                                                                {insert name=comment_count assign=commentcount vid=$answers[i].VID}
                                                                                Comments: {$commentcount} </span>
                                                                                </td>
                                                                        </tr>
                                                                        <tr><td height="5"></td></tr>
                                                                        <tr>
                                                                                <td>
                                                                                        {if $answers[i].ratedby gt "0"}
                                                                                                {insert name=show_rate assign=rate rte=$answers[i].rate}
                                                                                                {$rate}
                                                                                                <SPAN class=rating>({$answers[i].ratedby} ratings)</SPAN>
                                                                                        {else}
                                                                                                ( Not yet rated )
                                                                                        {/if}
                                                                                </td>
                                                                        </tr>
                                                                        <tr><td align="center">{insert name=advertise adv_name='home_feature_banner'}</td></tr>
                                                                        </table>
                                                                        </td></tr>
                                                                </table>
                                                                </td>
                                                        </tr>
                                                        </table>
                                                        </td>
                                                        <td width="1" bgcolor="#C0C0C0"></td>
                                                </tr>
                                                </table>
                                                </td>
                                        </tr>

                                        </table>
                                        </td>
                                        </table>
                                </td>
                            </tr>
                            {/section}

                                             </table>
                                             </td>
                                             </tr>

                                              {/if}


                                              </table></td>

