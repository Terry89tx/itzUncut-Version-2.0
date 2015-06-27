

{if $secondpage ne "second" and $smarty.request.upload_final eq ""}
<table>
<tr>
<td height="24" valign=top align=center><table width="760"  border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="5" height="24" background="images/nv_2_l.jpg" valign=top><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                    <th background="images/nv_2_bg.jpg" align=left width=760><span class="white_bold" valign=top align=left>Audio(MP3) Upload (Step 1 of 2)</span></th>
                                    <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                  </tr>
                              </table></td>

</tr></table>


<FORM id=theForm name=theForm action="{$baseurl}/upload_music.php" method=post encType=multipart/form-data>
	<TABLE cellSpacing=0 cellPadding=5 width="100%" border=0><TBODY>
	<TR>
	<TD align=right width=200><SPAN class=label><NOBR>Title:</NOBR></SPAN></TD>
	<TD>
		<!-- # Video Title	 -->
		<INPUT maxLength=60 size=40 name="field_myvideo_title" value="{$smarty.request.field_myvideo_title}">
	</TD>
	</TR>
	<TR>
	<TD vAlign=top align=right><SPAN class=label><NOBR>Description:</NOBR> </SPAN></TD>
	<TD><TEXTAREA name="field_myvideo_descr" rows=4 cols=50>{$smarty.request.field_myvideo_descr}</TEXTAREA></TD>
	</TR>
	<TR vAlign=top>
	<TD align=right><SPAN class=label><NOBR>Tags:</NOBR> </SPAN></TD>
	<TD><INPUT maxLength=120 size=40 name="field_myvideo_keywords" value="{$smarty.request.field_myvideo_keywords}">
	<DIV class=formFieldInfo><STRONG>Enter one or more tags, separated
	by spaces.</STRONG> <BR>Tags are simply keywords used to describe
	your Audio(MP3) so they are easily searched and organized. For example,
	if you have a surfing Audio(MP3), you might tag it: surfing beach
	waves.<BR></DIV></TD>
	</TR>
	<TR vAlign=top>
	<TD align=right><SPAN class=label><NOBR>Audio(MP3) Channels:</NOBR></SPAN></TD>
	<TD>
		<TABLE><TBODY><TR><TD vAlign=top>
		{insert name=list_channel assign=chinfo vid=$VID}
		{section name=i loop=$chinfo}
		<INPUT type=checkbox name=chlist[] value={$chinfo[i].id}>{$chinfo[i].ch}<BR>
		{/section}
		</TD></TR></TBODY></TABLE>

	<DIV class=formFieldInfo><STRONG>Select between one to three
	channels that best describe your Audio(MP3).</STRONG><BR>It helps to use
	relevant channels so that others can find your Audio(MP3)!</DIV>
	</TD>
	</TR>
	<TR>
		<TD align=right>&nbsp;</TD>
		<TD>
			<INPUT type=submit value="Continue ->" name=action_upload>
		</TD>
	</TR>
	</TBODY>
	</TABLE>
</FORM>

{else}
<table>
<tr>
<td height="24" valign=top align=center><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="5" height="24" background="images/nv_2_l.jpg" valign=top><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                    <th background="images/nv_2_bg.jpg" align=left width=760><span class="white_bold" valign=top align=left>Audio(MP3) Upload (Step 2 of 2)</span></th>
                                    <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                  </tr>
                              </table></td>

</tr></table>



<FORM id=theForm name=theForm action="upload_music.php" method=post encType=multipart/form-data>

	<table width="100%" cellpadding="5" cellspacing="0" border="0">
	<tr valign="top">
        <td width="200" align="right">
		<span class="label">File:</span>
	</td>
        <td>
		<div class="formHighlight">
			<input type="hidden" name="MAX_FILE_SIZE" value="104857600">
		        <input type="file" name="field_uploadfile" size="30">
		<div class="formHighlightText"><strong>Max file size: 100 MB. No copyrighted or obscene material.</strong>
	        <br>After uploading, you can edit or remove this Audio(MP3) at anytime under the "My Audio(MP3)s" link on the top of the page.</div></div></td>
	</tr>
	<tr>
		<td align="right"><span class="label">Broadcast:</span></td>
		<td>
			<table cellpadding="1" cellspacing="0" border="0">
			<tr>
				<td><input name="field_privacy" type="radio" value="public" checked></td>
				<td><span class="bold">Public:</span> Share your Audio(MP3) with the world! (Recommended)</td>
			</tr>
			</table>
		</td>
		</tr>
		<tr>
		<td align="right"><span class="label">&nbsp;</span></td>
		<td>
				<table cellpadding="1" cellspacing="0" border="0">
			<tr>
			<td><input name="field_privacy" type="radio" value="private"></td>
			<td><span class="bold">Private:</span> Only viewable by you and those you share the Audio(MP3) with.</td>
			</tr>
			</table>
		</td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
		<td align="right">&nbsp;</td>
		<td>
				 <span class="bold">
				PLEASE BE PATIENT, THIS MAY TAKE SEVERAL MINUTES.
				<br>
					ONCE COMPLETED, YOU WILL SEE A CONFIRMATION MESSAGE.<br><br>
			 </span>

			<input type="hidden" name="field_myvideo_keywords" value="{$smarty.request.field_myvideo_keywords}">
			<input type="hidden" name="field_myvideo_title" value="{$smarty.request.field_myvideo_title}">
			<input type="hidden" name="field_myvideo_descr" value="{$smarty.request.field_myvideo_descr}">
			<input type="hidden" name="listch" value="{$listch}">
			
			<input name="upload_final" type="submit" value="Upload Audio(MP3)" ><!-- onclick='this.disabled = true;' -->
			
			<span id="hide_stuff" style="display:none;" class="bold">
			
				<table>
					<tr>
						<td valign=middle> 
							<img  src="{$imgurl}/LoadingGraphic.gif"></img>
						</td>
					<td valign=middle>
						<font size=4>Uploading..</font>
					</td>
					</tr>
				</table>
			
			</span> 
		</td>
		</tr>
		</table>
</FORM>
{/if}

