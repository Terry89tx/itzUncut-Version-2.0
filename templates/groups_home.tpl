{if $answers ne ""}
<DIV style="width: 706; height: 19" >
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Group // <A href="{$baseurl}/groups_home.php?urlkey={$smarty.request.urlkey}">
{$smarty.request.urlkey}</A></b>
</DIV>
{if $is_mem eq "" and $type eq "private" and $accept_mem ne "true"}
        <div align="center">
                Sorry! You are not allowed to view this private group.
                <Br><br>
        </div>
{else}
<TABLE class=tableSubTitle cellSpacing=0 cellPadding=0 width=720 align=center bgColor=#efefef border=0>
<TBODY>
<TR>
<TD><IMG height=1 src="YouTube - Broadcast Yourself_files/pixel.gif" width=5></TD>
<TD width=710><BR><DIV style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px">
        <TABLE height=28 cellSpacing=0 cellPadding=0 width=708 background="/LongGenericTab.jpg" border=0>
        <TBODY>
        <TR>
        <TD align=left>
        <SPAN style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; FONT-WEIGHT: bold; FONT-SIZE: 13px; COLOR: #6d6d6d">
        {$answers[0].gname}</SPAN>
        </TD>
        <TD align=right></TD>
        </TR>
        </TBODY>
        </TABLE>
        </DIV>
        <DIV style="PADDING-LEFT: 10px">
        <TABLE style="BORDER-RIGHT: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid; BORDER-BOTTOM: #cccccc 1px
        solid; BACKGROUND-COLOR: #ffffff" height=121 cellSpacing=0 cellPadding=0 width=708>
        <TBODY>
        <TR>
        <TD>
                <TABLE cellSpacing=0 cellPadding=0 width="100%">
                <TBODY>
                <TR>
                <TD style="PADDING-LEFT: 5px; PADDING-TOP: 5px" vAlign=top width=100>
                {insert name=group_info_count assign=gmemcount tbl=group_mem gid=$answers[0].GID query="and approved='yes'"}
                {insert name=group_info_count assign=gvdocount tbl=group_vdo gid=$answers[0].GID query="and approved='yes'"}
                {insert name=group_info_count assign=gtpscount tbl=group_tps gid=$answers[0].GID query="and approved='yes'"}
                {insert name=check_group_mem assign=checkmem gid=$answers[0].GID}
                {insert name=group_img assign=groupimg gid=$answers[0].GID tbl=group_vdo}

                {if $groupimg eq ""}<IMG class=moduleEntryThumb height=90 src="{$imgurl}/no_videos_groups.gif" width=120>
                {else}<IMG class=moduleEntryThumb height=90 src="thumb/1_{$groupimg}.jpg" width=120>
                {/if}

                {if $smarty.session.UID ne "" and $checkmem ne "0"}

                {if $smarty.session.UID eq $answers[0].OID}
                <DIV style="PADDING-BOTTOM: 5px; PADDING-TOP: 5px" align=center>
                <TABLE class=roundedTable cellSpacing=0 cellPadding=2 width=130 align=center bgColor=#ffeebb border=0>
                <TBODY><TR>
                <TD width=120>
                <A href="{$baseurl}/my_group_edit.php?urlkey={$smarty.request.urlkey}">Edit this Group</A><BR>
                
                {insert name=getfield assign=owner_id field='OID' table='group_own' qfield=GID qvalue=$answers[0].GID}

                {if $smarty.session.UID eq $owner_id and $gupload eq "owner_only"}
                        <A href="{$baseurl}/add_video.php?urlkey={$smarty.request.urlkey}&gid={$answers[0].GID}">Add Videos</A><BR>
                {/if}
                {if $gupload ne "owner_only"}
                        <A href="{$baseurl}/add_video.php?urlkey={$smarty.request.urlkey}&gid={$answers[0].GID}">Add Videos</A><BR>
                {/if}
                <A href="invite_members.php?urlkey={$smarty.request.urlkey}">Invite Members</A><BR>
                </TD>
                </TR></TBODY></TABLE>
                </DIV>
                {else}
                <DIV style="PADDING-BOTTOM: 5px; PADDING-TOP: 5px" align=center>
                <TABLE class=roundedTable cellSpacing=0 cellPadding=2 width=130 align=center bgColor=#ffeebb border=0>
                <TBODY><TR>
        {if $is_mem eq "yes"}
                <TD width=120 align=cenetr>

                {insert name=getfield assign=owner_id field='OID' table='group_own' qfield=GID qvalue=$answers[0].GID}

                {if $smarty.session.UID eq $owner_id and $gupload eq "owner_only"}
                        <A href="{$baseurl}/add_video.php?urlkey={$smarty.request.urlkey}&gid={$answers[0].GID}">Add Videos</A><BR>
                {/if}
                {if $gupload ne "owner_only"}
                        <A href="{$baseurl}/add_video.php?urlkey={$smarty.request.urlkey}&gid={$answers[0].GID}">Add Videos</A><BR>
                {/if}
                <A href="invite_members.php?urlkey={$smarty.request.urlkey}">Invite Members</A><BR>

                </TD>

        {/if}
                </TR></TBODY></TABLE>
                </DIV>
                {/if}
                
                {/if}
                
                </TD>
                <TD style="PADDING-LEFT: 5px; PADDING-TOP: 5px" vAlign=top width=600>
                <TABLE width="100%">
                <TBODY>
                <TR>
                <TD><DIV style="PADDING-BOTTOM: 3px; PADDING-TOP: 3px; BORDER-BOTTOM: #999999 1px dashed">
                {$answers[0].gdescn}</DIV></TD>
                </TR>
                </TBODY>
                </TABLE>
                <TABLE width="100%">
                <TBODY>
                <TR>
                <TD><DIV style="PADDING-LEFT: 3px; PADDING-BOTTOM: 5px; PADDING-TOP: 3px">
                <SPAN style="PADDING-RIGHT: 3px; FONT-WEIGHT: bold; FONT-SIZE: 13px; COLOR: #666666; FONT-FAMILY: Arial, Helvetica, sans-serif; pading-bottom: 3px">
                Tags:</SPAN>{$answers[0].keyword} <BR>
                <SPAN style="PADDING-RIGHT: 3px; FONT-WEIGHT: bold; FONT-SIZE: 13px; COLOR: #666666; FONT-FAMILY: Arial, Helvetica, sans-serif; pading-bottom: 3px">
                Channels:</SPAN>
                {insert name=video_channel assign=grpchannel tbl=group_own gid=$answers[0].GID}
                {section name=k loop=$grpchannel}
                <A href="{$baseurl}/channel_detail.php?chid={$grpchannel[k].CHID}">{$grpchannel[k].name}</A>&nbsp;
                {/section}
                <BR>
                <SPAN style="PADDING-RIGHT: 3px; FONT-WEIGHT: bold; FONT-SIZE: 13px; COLOR: #666666; FONT-FAMILY: Arial, Helvetica, sans-serif; pading-bottom: 3px">
                Type:</SPAN>{$answers[0].type} <BR>
                <SPAN style="PADDING-RIGHT: 3px; FONT-WEIGHT: bold; FONT-SIZE: 13px; COLOR: #666666; FONT-FAMILY: Arial, Helvetica, sans-serif; pading-bottom: 3px">
                Videos:</SPAN>
                <A href="{$baseurl}/gvideos.php?urlkey={$smarty.request.urlkey}&gid={$answers[0].GID}">{$gvdocount}</A>

                {if $smarty.session.UID eq $answers[0].OID}
                        {if $total_new_video ne "0"}
                        &nbsp;&nbsp;&nbsp;<b>({$total_new_video} new)</b>
                        {/if}
                {/if}
                
                <BR>
                <SPAN style="PADDING-RIGHT: 3px; FONT-WEIGHT: bold; FONT-SIZE: 13px; COLOR: #666666; FONT-FAMILY: Arial, Helvetica, sans-serif; pading-bottom: 3px">
                Members:</SPAN>
                <A href="{$baseurl}/gmembers.php?urlkey={$smarty.request.urlkey}&gid={$answers[0].GID}">{$gmemcount}</A>
                
                {if $smarty.session.UID eq $answers[0].OID}
                        {if $total_new_member ne "0"}
                        &nbsp;&nbsp;&nbsp;<b>({$total_new_member} new)</b>
                        {/if}
                {/if}
                
                <BR>
                <SPAN style="PADDING-RIGHT: 3px; FONT-WEIGHT: bold; FONT-SIZE: 13px; COLOR: #666666; FONT-FAMILY: Arial, Helvetica, sans-serif; pading-bottom: 3px">
                Created By:</SPAN> <A href="{$baseurl}/uprofile.php?UID={$answers[0].OID}">{insert name=id_to_name assign=uname un=$answers[0].OID}{$uname}</A><BR>
                <SPAN style="PADDING-RIGHT: 3px; FONT-WEIGHT: bold; FONT-SIZE: 13px; COLOR: #666666; FONT-FAMILY: Arial, Helvetica, sans-serif; pading-bottom: 3px">
                Membership Status:</SPAN><B>
                {if $smarty.session.UID eq $answers[0].OID}You are the owner of this group.
                {elseif $is_mem eq "no"}
                Your request is sent to the owner.
                {elseif $is_mem eq "yes"}
                You are the member of this group.
                {else}
                You are not the member of this group.
                {/if}
                </B> <BR>
                <SPAN style="PADDING-RIGHT: 3px; FONT-WEIGHT: bold; FONT-SIZE: 13px; COLOR: #666666; FONT-FAMILY: Arial, Helvetica, sans-serif; pading-bottom: 3px">
                Group URL:</SPAN>
                <A href="{$baseurl}/groups_home.php?urlkey={$smarty.request.urlkey}">
                {$baseurl}/groups_home.php?urlkey={$smarty.request.urlkey}</A><BR>
                </DIV>
                <DIV>
                {if $smarty.session.UID ne $answers[0].OID}
                <FORM name="Joingroup" method="post" action="{$baseurl}/groups_home.php?urlkey={$smarty.request.urlkey}">
                {if $checkmem eq "0"}
                           <input type="submit" name="joingroup" value=" Join to this Group ">
                {elseif $is_mem eq "yes"}
                <input type="submit" name="leavegroup" value=" Leave this Group ">
                {/if}
                <input type="hidden" name="GRPID" value="{$answers[0].GID}">
                </FORM>
                {/if}
                </DIV>
                </TD>
                </TR>
                </TBODY>
                </TABLE>
                </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV><BR>

        <DIV style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px">
        <TABLE height=28 cellSpacing=0 cellPadding=0 width=708 background="YouTube - Broadcast Yourself_files/LongGenericTab.jpg" border=0>
        <TBODY>
        <TR>
        <TD align=left>
        <SPAN style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; FONT-WEIGHT: bold; FONT-SIZE: 13px; COLOR: #6d6d6d">
        Forum Messages</SPAN>
        </TD>
        <TD align=right colSpan=2>
        {insert name=topic_count assign=total_topic GID=$answers[0].GID}
        <DIV style="FONT-WEIGHT: bold; COLOR: #444444; MARGIN-RIGHT: 5px">{if $total_topic ne "0"}Topics {$start_num} - {$end_num} of {$total_topic}{/if}</DIV>
        </TD>
        </TR>
        </TBODY>
        </TABLE>
        </DIV>
        
        <DIV style="PADDING-LEFT: 10px">
        <TABLE style="BORDER-RIGHT: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid; BORDER-BOTTOM: #cccccc 1px
        solid; BACKGROUND-COLOR: #ffffff" height=121 cellSpacing=0 cellPadding=0 width=708>
        <TBODY>
        <TR>
        <TD>
        {if $grptps eq ""}
        <DIV style="PADDING-LEFT: 5px; FONT-WEIGHT: bold; PADDING-BOTTOM: 5px; COLOR: #444; PADDING-TOP: 8px" align=center>
        There are no topics for this group!</DIV>
        {else}
                <table width="100%">
                <tr>
                        <td><b>Topics</b></td>
                        <td><b>Author</b></td>
                        <td align="center"><b>Posts</b></td>
                        <td><b>Created On</b></td>
                        <td><b>Last Post</b></td>
                </tr>

                {insert name=getfield assign=owner_id field='OID' table='group_own' qfield=GID qvalue=$answers[0].GID}
                {section name=i loop=$grptps}

                        {if $smarty.session.UID eq $owner_id or $grptps[i].approved eq "yes"}
                        {insert name=id_to_name assign=uname un=$grptps[i].UID}
                        {insert name=post_count assign=total_post TID=$grptps[i].TID}
                        {insert name=getfield assign=lastpost field='date' table='group_tps_post' qfield='TID' qvalue=$grptps[i].TID order='order by PID desc'}
                        <tr bgcolor="{cycle values="#eeeeee,#f5f5f5"}">
                                <td width="300"><a href="group_posts.php?urlkey={$smarty.request.urlkey}&gid={$answers[0].GID}&tid={$grptps[i].TID}">{$grptps[i].title|truncate:110}</a></td>
                                <td><A href="{$baseurl}/uprofile.php?UID={$grptps[i].UID}">{$uname}</a></b></td>
                                <td align="center">{$total_post}</td>
                                <td>{$grptps[i].addtime|date_format:"%b %e, %Y, %I:%M %p"}</td>
                                <td>{if $lastpost eq ""}N/A{else}{insert name=timediff time=$lastpost}{/if}</td>
                            {if $smarty.session.UID eq $owner_id and $grptps[i].approved eq "no"}
                                <td>
                                        <form name=apostform{$grptps[i].TID} id=apostform{$grptps[i].TID} action="groups_home.php?urlkey={$smarty.request.urlkey}" method=POST>

                                                 <a href="javascript:void(0);" ID="hlinkAprove" onclick="approve_post('{$grptps[i].TID}','hlinkAprove');">Approve</a>
                                                 <input type="hidden" name="apost_TID" value={$grptps[i].TID}>

                                        </form>
                                </td>
                                <td>
                                        <form name=unapostform{$grptps[i].TID} id=unapostform{$grptps[i].TID} action="groups_home.php?urlkey={$smarty.request.urlkey}" method=POST>

                                                 <a href="javascript:void(0);" ID="hlinkAprove" onclick="unapprove_post('{$grptps[i].TID}','hlinkAprove');">Delete</a>
                                                 <input type="hidden" name="unapost_TID" value={$grptps[i].TID}>

                                        </form>
                                </td>
                            {/if}
                        </tr>
                        {/if}
                {/section}
                <tr><td colspan=5 align="right">Page: <b>{$page_link}</b></td></tr>
                </table>
        {/if}

{insert name=getfield assign=owner_id field='OID' table='group_own' qfield=GID qvalue=$answers[0].GID}
{if $smarty.session.UID eq $owner_id or $answers[0].gposting ne "owner_only"}
        {if $smarty.session.UID ne ""}
                {if $checkmem ne "0"}
                        {if $is_mem eq "yes"}
                        <DIV style="PADDING-LEFT: 5px; FONT-WEIGHT: bold; PADDING-BOTTOM: 5px; COLOR: #444; PADDING-TOP: 8px">
                        Add New Topic:</DIV>
                        <DIV style="PADDING-LEFT: 5px; PADDING-BOTTOM: 5px">

                        <FORM name=add_group_topic action="groups_home.php?urlkey={$smarty.request.urlkey}" method=post>
                        <TEXTAREA tabIndex=2 name=topic_title rows=3 cols=55></TEXTAREA>
                        <BR>Attach a video:
                        <SELECT name=topic_video>
                                {$video_ops}
                        </SELECT>
                        <input type=hidden name=GID value={$answers[0].GID}>
                        <INPUT type=submit value="Add Topic" name=add_topic>
                        </FORM>
                        </DIV>
                        {/if}
                {else}
                        <div align="center">
                        <FORM name="Joingroup" id="Joingroup" method="post" action="{$baseurl}/groups_home.php?urlkey={$smarty.request.urlkey}">
                        <input type="hidden" name="joingroup" value=" Join to this Group ">
                        <input type="hidden" name="GRPID" value="{$smarty.request.gid}">
                        </form>
                        <b>Please <a href="javascript:void(0);" onclick="javascript:document.getElementById('Joingroup').submit();">join this group</a> to post a topic.</b>
                        <br><br>
                        </div>
                {/if}
        {else}
        <BR><BR>
        <DIV style="PADDING-LEFT: 5px; FONT-WEIGHT: bold; PADDING-BOTTOM: 5px; COLOR: #444; PADDING-TOP: 8px" align=center>
        Please <A href="{$baseurl}/signup.php?next=groups_home&add={$add}">Login</A> to post new topic</DIV>
        {/if}
{/if}
        </TD>
        </TR>
        </TBODY>
        </TABLE>
        </DIV><BR>
        <!--Begin Group Members Horizontal Scrolling Box-->
        <DIV style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px">
        <TABLE height=28 cellSpacing=0 cellPadding=0 width=708 border=0>
        <TBODY>
        <TR>
        <TD width=480><SPAN style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; FONT-WEIGHT: bold; FONT-SIZE: 13px; COLOR: #6d6d6d">
        Recently Added Videos</SPAN>
        <SPAN style="FONT-SIZE: 10px; COLOR: #999999">
        <SPAN id=counter_group_videos></SPAN></SPAN></TD>
        <TD align=left></TD>
        <TD align=right>
        <SPAN style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px">
        <A href="{$baseurl}/gvideos.php?gid={$answers[0].GID}">View All Videos</A>
        </SPAN>
        </TD>
        </TR>
        </TBODY>
        </TABLE>
        </DIV>
        <DIV style="PADDING-LEFT: 1px">
        <TABLE height=121 cellSpacing=0 cellPadding=0 width=21 align="center">
        <TBODY>
        <TR>
        <TD></TD>
        <TD>
        <TABLE style="BORDER-BOTTOM: #cccccc 1px solid; BACKGROUND-COLOR: #ffffff" height=121 cellSpacing=0 cellPadding=0 width=685>
        <TBODY>
        <TR>
        {section name=i loop=$gvideo}
        <TD align="center">
                <a href="view_video.php?viewkey={$gvideo[i].vkey}">
                <IMG class=moduleEntryThumb height=90 src="thumb/1_{$gvideo[i].VID}.jpg" width=120><br>
                {$gvideo[i].title}
                </a>
        </TD>
        {/section}
        </TR></TBODY></TABLE></TD>
                <TD></TD></TR></TBODY></TABLE></DIV><BR>



        <DIV style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px">
        <TABLE height=28 cellSpacing=0 cellPadding=0 width=708 border=0>
        <TBODY>
        <TR>
        <TD width=480><SPAN style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; FONT-WEIGHT: bold; FONT-SIZE: 13px; COLOR: #6d6d6d">
        Recent Members</SPAN>
        <SPAN style="FONT-SIZE: 10px; COLOR: #999999">
        <SPAN id=counter_group_videos></SPAN></SPAN></TD>
        <TD align=left></TD>
        <TD align=right>
        <SPAN style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px">
        <A href="{$baseurl}/gmembers.php?gid={$answers[0].GID}">View All Members</A>
        </SPAN>
        </TD>
        </TR>
        </TBODY>
        </TABLE>
        </DIV>
        <DIV style="PADDING-LEFT: 1px">
        <TABLE height=121 cellSpacing=0 cellPadding=0 width=21 align="center">
        <TBODY>
        <TR>
        <TD></TD>
        <TD>
        <TABLE style="BORDER-BOTTOM: #cccccc 1px solid; BACKGROUND-COLOR: #ffffff" height=121 cellSpacing=0 cellPadding=0 width=685>
        <TBODY>
        <TR>
        {section name=i loop=$gmember}
        <TD align="center">
                {insert name=id_to_name assign=uname un=$gmember[i].UID}
                <a href="uprofile.php?UID={$gmember[i].UID}">
                {insert name=member_img UID=$gmember[i].UID}<br>{$uname}
                </a>
        </TD>
        {/section}
        </TR></TBODY></TABLE></TD>
                <TD></TD></TR></TBODY></TABLE></DIV><BR>



        </TD>
        <TD><IMG height=1 src="YouTube - Broadcast Yourself_files/pixel.gif" width=5></TD>
        </TR>
        </TBODY>
        </TABLE>

{/if}

{/if}
