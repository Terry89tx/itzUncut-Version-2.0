<DIV class=tableSubTitle>Edit Group: <A href="{$baseurl}/groups_home.php?urlkey={$smarty.request.urlkey}">
{$smarty.request.urlkey}</DIV>
<TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>

        <FORM name="groups_create" method="post" action="{$baseurl}/my_group_edit.php?urlkey={$smarty.request.urlkey}">
        <INPUT type=hidden value=create_group_submit name=field_command>
        <TBODY>
        <TR>
        <TD align=right width=200><SPAN class=label>Group Name:</SPAN></TD>
        <TD><INPUT maxLength=60 size=40 name="group_name" value="{$group.gname}"></TD>
        </TR>
        <TR>
        <TD vAlign=top align=right width=200><SPAN class=label>Tags:</SPAN></TD>
        <TD>
        <INPUT maxLength=60 size=40 name="tags" value="{$group.keyword}">
        <DIV class=formFieldInfo><STRONG>Enter one or more tags, separated
        by spaces.</STRONG> <BR>Tags are simply keywords used to describe
        your group so they are easily searched and organized.<BR>For
        example, if you have a group for surfers, you might tag it: surfing
        beach waves.<BR></DIV></TD>
        </TR>
        <TR>
        <TD vAlign=top align=right width=200><SPAN class=label>Description:</SPAN></TD>
        <TD>
        <TEXTAREA style="FONT-SIZE: 12px; WIDTH: 400px; FONT-FAMILY: Arial,
        Helvetica, sans-serif; HEIGHT: 80px" name="description">{$group.gdescn}</TEXTAREA>
        </TD>
        </TR>
        <TR>
        <TD vAlign=top align=right width=200><SPAN class=label>&nbsp;</SPAN></TD>
        <TD><SPAN class=label>Choose a unique group name URL:</SPAN>
        <BR>{$baseurl}/groups_home.php?urlkey=<INPUT style="WIDTH: 66px" maxLength=60 name="short_name" value="{$group.gurl}">
                <TABLE>
                <TBODY>
                <TR>
                <TD align=left width=400>
                <DIV style="FONT-SIZE: 11px; PADDING-BOTTOM: 5px; PADDING-TOP: 5px; FONT-FAMILY: Arial, Helvetica, sans-serif">Enter
                3-18 characters with no spaces (such as "skateboarding''),
                that will become part of your group's web address. Please
                note, the group name URL you pick is permanent and can not be
                changed. </DIV></TD></TR></TBODY></TABLE></TD></TR>
        <tr><td></td><td><DIV class=formFieldInfo><STRONG>Select between one to three
                channels that your group belong to.</STRONG><BR>It helps to use
                relevant channels so that others can find your group!</DIV></td></tr>
        <TR>
        <TD vAlign=top align=right width=200><SPAN class=label>Group Channels:</SPAN></TD>
          <TD>
                <TABLE>
                <TBODY>
                <TR>
                <TD vAlign=top>
                        {$ch_checkbox}
                </TD></TR>
                </TBODY></TABLE>
                </TD></TR>
        <TR>
        <TD vAlign=top align=right width=200><SPAN class=label>Type:</SPAN></TD>
        <TD><INPUT type=radio {if $group.type eq "public"}checked{/if} value=public name="group_type">Public,
        anyone can join. <BR><INPUT type=radio {if $group.type eq "protected"}checked{/if} value=protected
        name="group_type">Protected, requires founder approval to join.
        <BR><INPUT type=radio {if $group.type eq "private"}checked{/if} value=private
        name="group_type">Private, by founder invite only, only members can
        view group details. </TD>
        </TR>
        <TR>
        <TD vAlign=top align=right width=200><SPAN class=label>Video Uploads:</SPAN></TD>
        <TD>
        <INPUT type=radio {if $group.gupload eq "immediate"}checked{/if} value="immediate" name="video_upload_type">Post videos immediately. <BR>
        <INPUT type=radio {if $group.gupload eq "owner_approve"}checked{/if} value="owner_approve" name="video_upload_type">Founder approval required before video is available. <BR>
        <INPUT type=radio {if $group.gupload eq "owner_only"}checked{/if} value="owner_only" name="video_upload_type">Only Founder can add new videos.
        </TD>
        </TR>
        <TR>
        <TD vAlign=top align=right width=200><SPAN class=label>Forum Postings:</SPAN></TD>
        <TD><INPUT type=radio {if $group.gposting eq "immediate"}checked{/if} value="immediate" name="forum_upload_type">Post topics immediately.<BR>
        <INPUT type=radio {if $group.gposting eq "owner_approve"}checked{/if} value="owner_approve" name="forum_upload_type"> Founder approval required before topic is available.<BR>
        <INPUT type=radio {if $group.gposting eq "owner_only"}checked{/if} value="owner_only" name="forum_upload_type">Only Founder can create a new topic.
        </TD>
        </TR>
        <TR>
        <TD vAlign=top align=right width=200><SPAN class=label>Group Icon:</SPAN></TD>
        <TD><INPUT type=radio {if $group.gimage eq "immediate"}checked{/if}  value=immediate name=group_icon>
        Automatically set group icon to last uploaded video.
        <BR><INPUT type=radio {if $group.gimage eq "owner_only"}checked{/if}  value=owner_only name=group_icon>
        Let owner pick the video as group icon.
        </TD>
        </TR>
        <TR>
        <TD style="PADDING-TOP: 5px" vAlign=top align=right width=200><SPAN class=label>&nbsp;</SPAN></TD>
        <TD style="PADDING-TOP: 5px"><INPUT type=submit value="Update" name="edit_group"></TD>
        </TR>
        </FORM>
        </TBODY>
        </TABLE>
<DIV class=tableSubTitle></DIV>
</TD></TR></TBODY></TABLE>
