<tr><td align="center">
<table width=90% align="center">
<tr><td>
{if $smarty.request.upload eq "yes"}<SPAN class=highlight>Your audio was successfully added!</SPAN>{/if}
<BR>Your audio is currently being processed and will be available to
view in a few minutes.<BR>Want to upload more audios? <B><A
href="{$baseurl}/upload.php">Click here</A></B>
<BR><BR>Now that
your audio is uploaded, you can share it with others, embed it into your
Web site (and others), and include more details. <BR><BR>
<DIV style="FONT-WEIGHT: bold; FONT-SIZE: 14px; PADDING-BOTTOM: 10px; COLOR: #cc6633">Share
      your audio (Optional):</DIV>Use the share manager application below to
      easily share your audio with friends, family, and other contacts. <BR>If
      that's not your thing, you can copy and paste the audio url (permalink)
      into an e-mail. <BR><BR><BR><!-- KEEP THIS IN SYNC WITH WATCH.PHP! -->
      <DIV style="PADDING-BOTTOM: 10px">
      <TABLE>
        <TBODY>
        <TR>
        <TD vAlign=top align=left
        width=376><!-- Begin audio URL Section--><SPAN
        style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; FONT-WEIGHT: bold; FONT-SIZE: 12px; PADDING-BOTTOM: 5px; COLOR: #cc6633; PADDING-TOP: 5px">audio
        URL (Permalink):</SPAN> &nbsp;<B>Email or link it!</B> <BR><B><A
        href="javascript:openShare()">Share this audio with your
        friends</A></B> <BR>
        <DIV style="FONT-SIZE: 11px; PADDING-BOTTOM: 15px; PADDING-TOP: 5px">

        <INPUT style="FONT-SIZE: 10px; WIDTH: 290px; TEXT-ALIGN: center" 
	onclick=javascript:document.linkForm.video_link.focus();document.linkForm.video_link.select();
        readOnly value="{$baseurl}/view_audio.php?viewkey={$smarty.request.viewkey}" name=video_link>

        </DIV><!--End Video URL Section--><BR><!--Begin Embed your audio Section--><SPAN
        style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; FONT-WEIGHT: bold; FONT-SIZE: 12px; PADDING-BOTTOM: 5px; COLOR: #cc6633; PADDING-TOP: 5px">Embed
        your audio:</SPAN> &nbsp;<B>Put this audio on your Web site!</B>
        <B>Copy and paste the code below to embed the audio.</B>

        <DIV style="FONT-SIZE: 11px; PADDING-BOTTOM: 8px; PADDING-TOP: 5px">
        
	<TEXTAREA style="FONT-SIZE: 11px; WIDTH: 290px; FONT-FAMILY: Arial, Helvetica, sans-serif; HEIGHT: 120px;
        TEXT-ALIGN: center" onclick=javascript:document.linkForm.video_play.focus();
        document.linkForm.video_play.select(); name=video_play readOnly wrap=physical><embed name='RAOCXplayer' src='{$adourl}/{$vinfo[0].vdoname}/27.wav' type='application/x-mplayer2' width='300' height='300' ShowControls='1' ShowStatusBar='0' loop='true'EnableContextMenu='0' DisplaySize='0' pluginspage='http://www.microsoft.com/Windows/Downloads/Contents/Products/MediaPlayer/'></TEXTAREA>

        </DIV>

        <TABLE cellSpacing=0 cellPadding=5 border=0>
        <FORM action="{$baseurl}/upload_success_music.php?viewkey={$smarty.request.viewkey}" method=post>
        <INPUT type=hidden value={$smarty.request.viewkey} name=viewkey>
        <TBODY>
        <TR>
          <TD colSpan=2>
            <DIV class=tableSubTitle>Date &amp; Location Details
            (Optional):</DIV></TD></TR>
        <TR vAlign=top>
          <TD align=right><SPAN class=label><NOBR>Date Recorded:</NOBR>
          </SPAN></TD>
          <TD>
                <SELECT name=month><OPTION>mm</OPTION><OPTION>{$months}</OPTION></SELECT>
                <SELECT name=day><OPTION>dd</OPTION><OPTION>{$days}</OPTION></SELECT>
                <SELECT name=year><OPTION>yyyy</OPTION><OPTION>{$years}</OPTION></SELECT>
          </TD></TR>
        <TR vAlign=top>
          <TD align=right><SPAN class=label><NOBR>Location Recorded:</NOBR>
            </SPAN></TD>
          <TD><INPUT maxLength=255 size=40 name=field_address value="{$smarty.request.field_address}">
            <DIV class=formFieldInfo>Examples: "165 University Ave, Palo Alto,
            CA" &nbsp; "New York City, NY" &nbsp; "Tokyo"</DIV></TD></TR>
        <TR vAlign=top>
        <TD align=right><SPAN class=label><NOBR>Country:</NOBR> </SPAN></TD>
        <TD>
                <SELECT name=country>
                <OPTION>Select Country</OPTION>
                <OPTION>{$country}</OPTION>
                </SELECT>
        </TD>
        </TR>
        <TR>
          <TD align=right>&nbsp;</TD>
          <TD>
	  
	  <INPUT type=hidden value=1 name=action_update>
          <INPUT type=submit value="Update audio" name="action_update">

        </TD></TR>
	</FORM>
	
	</TBODY>
	</TABLE></DIV>
</TD></TR></TBODY></TABLE>

</td></tr>
</table>

</td></tr>

