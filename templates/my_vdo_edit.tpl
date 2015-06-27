<DIV style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px">
<TABLE cellSpacing=0 cellPadding=5 width=790 border=0>
<FORM action="{$baseurl}/my_vdo_edit.php?VID={$smarty.request.VID}" method="post">
<TBODY>
<TR>
<TD colSpan=2>
<DIV class=tableSubTitle><DIV style="FONT-WEIGHT: normal; FONT-SIZE: 11px; FLOAT: right">
<A href="{$baseurl}/my_video.php">Back to "My Videos"</A>
</DIV>Video Details:</DIV>
</TD>
</TR>
<TR>
<TD align=right width=200><SPAN class=label><NOBR>Title:</NOBR></SPAN></TD>
<TD><INPUT maxLength=60 size=40 name="vtitle" value="{$answers[0].title}"></TD>
</TR>
<TR>
<TD vAlign=top align=right><SPAN class=label><NOBR>Description:</NOBR> </SPAN></TD>
<TD><TEXTAREA name="vdescription" rows=4 cols=50>{$answers[0].description}</TEXTAREA></TD>
</TR>
{if $answers[0].featured eq "yes"}
<TR>
<TD vAlign=top align=right><SPAN class=label><NOBR>Feature Description:</NOBR> </SPAN></TD>
<TD><TEXTAREA name="featuredesc" rows=4 cols=50>{$answers[0].featuredesc}</TEXTAREA></TD>
</TR>
{/if}
<TR vAlign=top>
<TD align=right><SPAN class=label><NOBR>Tags:</NOBR> </SPAN></TD>
<TD><INPUT maxLength=120 size=40 name="vkeyword" value="{$answers[0].keyword}">
<DIV class=formFieldInfo><STRONG>Enter one or more tags, separated
by spaces.</STRONG> <BR>Tags are simply keywords used to describe
your video so they are easily searched and organized. For example,
if you have a surfing video, you might tag it: surfing beach
waves.<BR></DIV></TD>
</TR>
<TR vAlign=top>
<TD align=right><SPAN class=label><NOBR>Video Channels:</NOBR></SPAN></TD>
<TD>
        <TABLE><TBODY><TR><TD vAlign=top>
        {insert name=list_channel assign=chinfo vid=$VID}
        {section name=i loop=$chinfo}
        {assign var="status" value=""}
        {section name=j loop=$chid}
        {if $chid[j] eq $chinfo[i].id}{assign var="status" value="checked"}{/if}
        {/section}
        <INPUT type=checkbox name=chlist[] value={$chinfo[i].id} {$status}>{$chinfo[i].ch}<BR>
        {/section}
        </TD></TR></TBODY></TABLE>

<DIV class=formFieldInfo><STRONG>Select between one to three
channels that best describe your video.</STRONG><BR>It helps to use
relevant channels so that others can find your video!</DIV>
</TD></TR>
<TR>
<TD colSpan=2><DIV class=tableSubTitle>Date &amp; Location Details(Optional):</DIV></TD>
</TR>
        <TR vAlign=top>
          <TD align=right><SPAN class=label><NOBR>Date Recorded:</NOBR>
          </SPAN></TD>
          <TD>
                <SELECT name=month><OPTION>mm</OPTION>{$months}</SELECT>
                <SELECT name=day><OPTION>dd</OPTION>{$days}</SELECT>
                <SELECT name=year><OPTION>yyyy</OPTION>{$years}</SELECT>
          </TD></TR>
        <TR vAlign=top>
          <TD align=right><SPAN class=label><NOBR>Location Recorded:</NOBR>
            </SPAN></TD>
          <TD><INPUT maxLength=255 size=40 name=field_address value="{$answers[0].location}">
            <DIV class=formFieldInfo>Examples: "165 University Ave, Palo Alto,
            CA" &nbsp; "New York City, NY" &nbsp; "Tokyo"</DIV></TD></TR>
        <TR vAlign=top>
        <TD align=right><SPAN class=label><NOBR>Country:</NOBR> </SPAN></TD>
        <TD>
                <SELECT name=country>
                <OPTION>Select Country</OPTION>{$country}
                </SELECT>
        </TD>
        </TR>
        <TR>
        <TR>
          <TD colSpan=2>
            <DIV class=tableSubTitle>File Details:</DIV></TD></TR>
        <TR vAlign=top>
                <TD align=right><SPAN class=label>File:</SPAN></TD>
                <TD>Uploaded on
                {insert name=time_to_date assign=todate tm=$answers[i].addtime} {$todate}  as <I>{$answers[0].filehome}</I></TD>
</TR>
<TR>
<TD align=right><SPAN class=label>Broadcast:</SPAN></TD>
<TD>
<TABLE cellSpacing=0 cellPadding=1 border=0>
<TBODY>
<TR><TD><INPUT type=radio CHECKED value=public name=video_privacy {if $answers[0].type eq "public"}checked{/if}></TD>
<TD><SPAN class=bold>Public:</SPAN> Share your video with the world! (Recommended)</TD></TR>
</TBODY>
</TABLE>
</TD>
</TR>
<TR>
<TD align=right><SPAN class=label>&nbsp;</SPAN></TD>
<TD>
<TABLE cellSpacing=0 cellPadding=1 border=0>
<TBODY>
<TR>
<TD><INPUT type=radio value=private name=video_privacy {if $answers[0].type eq "private"}checked{/if}></TD>
<TD><SPAN class=bold>Private:</SPAN> Only viewable by you and those you send the video to through <A
href="javascript:openShare()">YouTube's share feature</A>.
</TD>
</TR>
</TBODY>
</TABLE>
</TD>
</TR>
<TR vAlign=top>
<TD align=right><SPAN class=label>Allow Comments:</SPAN></TD>
<TD>
<INPUT type=radio CHECKED value="yes" name=allow_comments {if $answers[0].be_comment eq "yes"}checked{/if}>&nbsp;<SPAN class=bold>Yes:</SPAN> Allow comments to be added to your video. <BR>
<INPUT type=radio value="no" name=allow_comments {if $answers[0].be_comment eq "no"}checked{/if}>&nbsp;<SPAN class=bold>No:</SPAN> Disallow comments to be added to your video.
</TD>
</TR>
<TR vAlign=top>
<TD align=right><SPAN class=label>Allow Ratings:</SPAN></TD>
<TD>
<INPUT type=radio CHECKED value="yes" name=allow_ratings {if $answers[0].be_rated eq "yes"}checked{/if}>&nbsp;
<SPAN class=bold>Yes:</SPAN> Allow people to rate your video. <BR>
<INPUT type=radio value="no" name=allow_ratings {if $answers[0].be_rated eq "no"}checked{/if}>&nbsp;<SPAN class=bold>No:</SPAN>
Disallow people from rating your video.
</TD>
</TR>

<TR vAlign=top>
<TD align=right><SPAN class=label>Allow External Sites to Embed This Video:</SPAN></TD>
<TD>
<INPUT type=radio CHECKED value=enabled name=allow_embed {if $answers[0].embed eq "enabled"}checked{/if}>&nbsp;
<SPAN class=bold>Enabled:</SPAN>External sites may embed and play this video. <BR>
<INPUT type=radio value=disabled name=allow_embed {if $answers[0].embed eq "disabled"}checked{/if}>&nbsp;
<SPAN class=bold>Disabled:</SPAN> External sites may NOT embed and play this video. <BR>
</TD>
</TR>

<TR>
<TD align=right>&nbsp;</TD>
<TD><INPUT type=submit value="Update Video" name="update_video"></TD>
</TR>
</TBODY></TABLE>
</TD></TR></TBODY></TABLE>
</FORM>

</TBODY></TABLE></DIV></TD></TR></TBODY></TABLE></TD></TR></TABLE>
