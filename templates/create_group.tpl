
<tr>
                <td align="center" valign="top"><table width="760"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                  <td height=5>&nbsp;</td></tr>
                  <tr><td width=750>


<TABLE cellSpacing=0 cellPadding=5 width="750" border=0>

        <FORM name="groups_create" method="post" action="{$baseurl}/create_group.php">
        <INPUT type=hidden value=create_group_submit name=field_command>
        <TBODY>
        <TR>
        <TD align=right width=200><SPAN class=label>Group Name:</SPAN></TD>
        <TD width="500"><INPUT maxLength=60 size=40 name="group_name" value="{$smarty.request.group_name}"></TD>
        </TR>
        <TR>
        <TD vAlign=top align=right width=201><SPAN class=label>Tags:</SPAN></TD>
        <TD width="500">
        <INPUT maxLength=60 size=40 name="tags" value="{$smarty.request.tags}">
        <DIV class=formFieldInfo><STRONG>Enter one or more tags, separated
        by spaces.</STRONG> <BR>Tags are simply keywords used to describe
        your group so they are easily searched and organized.<BR>For
        example, if you have a group for surfers, you might tag it: surfing
        beach waves.<BR></DIV></TD>
        </TR>
        <TR>
        <TD vAlign=top align=right width=201><SPAN class=label>Description:</SPAN></TD>
        <TD width="500">
        <TEXTAREA style="FONT-SIZE: 12px; WIDTH: 400px; FONT-FAMILY: Arial,
        Helvetica, sans-serif; HEIGHT: 80px" name="description" rows="1" cols="20">{$smarty.request.description}</TEXTAREA>
        </TD>
        </TR>
        <TR>
        <TD vAlign=top align=right width=201><SPAN class=label>&nbsp;</SPAN></TD>
        <TD width="500"><SPAN class=label>Choose a unique group name URL:</SPAN>
        <BR>{$baseurl}/groups_home.php?urlkey=<INPUT style="WIDTH: 66px" maxLength=60 name="short_name" value="{$smarty.request.short_name}">
                <TABLE>
                <TBODY>
                <TR>
                <TD align=left width=400>
                <DIV style="FONT-SIZE: 11px; PADDING-BOTTOM: 5px; PADDING-TOP: 5px; FONT-FAMILY: Arial, Helvetica, sans-serif">Enter
                3-18 characters with no spaces (such as "skateboarding''),
                that will become part of your group's web address. Please
                note, the group name URL you pick is permanent and can not be
                changed. </DIV></TD></TR></TBODY></TABLE></TD></TR>
        <TR>
        <TD vAlign=top align=right width=201><SPAN class=label>Group Channels:</SPAN></TD>
          <TD width="500">
                <TABLE>
                <TBODY>
                <TR>
                <TD vAlign=top>
                {insert name=list_channel assign=chinfo vid=$VID}
                {section name=i loop=$chinfo}
                <INPUT type=checkbox name=chlist[] value={$chinfo[i].id}>{$chinfo[i].ch}<BR>
                {/section}<BR>
                </TD></TR>
                </TBODY></TABLE>
                <DIV class=formFieldInfo><STRONG>Select between one to three
                channels that your group belong to.</STRONG><BR>It helps to use
                relevant channels so that others can find your group!</DIV>
                </TD></TR>
        <TR>
        <TD vAlign=top align=right width=201><SPAN class=label>Type:</SPAN></TD>
        <TD width="500"><INPUT type=radio CHECKED value=public name="group_type">Public,
        anyone can join. <BR><INPUT type=radio value=private_owner_approval
        name="group_type">Protected, requires founder approval to join.
        <BR><INPUT type=radio value=private_owner_invite
        name="group_type">Private, by founder invite only, only members can
        view group details. </TD>
        </TR>
        <TR>
        <TD vAlign=top align=right width=201><SPAN class=label>Video Uploads:</SPAN></TD>
        <TD width="500">
        <INPUT type=radio CHECKED value="immediate" name="video_upload_type">Post videos immediately. <BR>
        <INPUT type=radio value="owner_approve" name="video_upload_type">Founder approval required before video is available. <BR>
        <INPUT type=radio value="owner_only" name="video_upload_type">Only Founder can add new videos.
        </TD>
        </TR>
        <TR>
        <TD vAlign=top align=right width=201><SPAN class=label>Forum Postings:</SPAN></TD>
        <TD width="500"><INPUT type=radio CHECKED value="immediate" name="forum_upload_type">Post topics immediately.<BR>
        <INPUT type=radio value="owner_approve" name="forum_upload_type"> Founderapproval required before topic is available.<BR>
        <INPUT type=radio value="owner_only" name="forum_upload_type">Only Founder can create a new topic.
        </TD>
        </TR>
        <TR>
        <TD vAlign=top align=right width=200><SPAN class=label>Group Icon:</SPAN></TD>
        <TD><INPUT type=radio checked  value=immediate name=group_icon>
        Automatically set group icon to last uploaded video.
        <BR><INPUT type=radio value=owner_only name=group_icon>
        Let owner pick the video as group icon.
        </TD>
        </TR>
        <TR>
        <TD style="PADDING-TOP: 5px" vAlign=top align=right width=201><SPAN class=label>&nbsp;</SPAN></TD>
        <TD style="PADDING-TOP: 5px" width="565">
		<INPUT type=submit value=Submit name="create_group">
	</TD>
        </TR>
        </FORM>
        </TBODY>
        </TABLE>
        
        </td>
                        </tr>                     </table>    </td></tr>
                        </td></tr></table>

