<tr>
                <td align="center" valign="top"><table width="760"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                  <td height=5>&nbsp;</td></tr>
                  <tr><td width=760 height=250>

{if $total gt "0"}

<TABLE cellSpacing=0 cellPadding=0 width=760 align=center border=0>
<TBODY>
<TR vAlign=top>
<TD ><!-- Begin Most Active Users in the Channel Section -->

        <TABLE cellSpacing=0 cellPadding=0 width=580 align=center bgColor=#eae9ef border=0>
        <TBODY>
        <tr>
                              <td height="24" valign=top><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="5" height="24" background="images/nv_2_l.jpg"><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                    <th background="images/nv_2_bg.jpg" align=left><span class="white_bold" align=left>Most Active Users in the Channel</span></th>
                                    <td width="11" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                  </tr>
                              </table></td>
                            </tr>
        <TR>
        <TD width=580>

        <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
        <TR>

        {section name=i loop=$actuser}
        <TD style="WIDTH: 20%; TEXT-ALIGN: center" vAlign=top>
        {insert name=get_photo assign=imgid uid=$actuser[i].UID}
        <A href="{$baseurl}/uprofile.php?UID={$actuser[i].UID}">
        {if $imgid ne ""}
        <IMG class=moduleEntryThumb height=60 src="{$tmburl}/1_{$imgid}.jpg" width=80>
        {else}<IMG class=moduleEntryThumb height=60 src="{$tmburl}/no_videos_groups.gif" width=80>{/if}
        </A>
        
        <DIV class=moduleEntryDetails style="PADDING-TOP: 5px">
        {insert name=id_to_name assign=uname un=$actuser[i].UID}
        <A href="{$baseurl}/uprofile.php?UID={$actuser[i].UID}">{$uname}</A> ({$actuser[i].total})
        </DIV>
        </TD>
        {/section}

        
        </TR></TBODY></TABLE></DIV></TD>
        </TR>
        </TBODY>
        </TABLE>
        </DIV>

<!-- End Most Active Users in the Channel Section -->
<!-- Begin Recently Added to Channel Section -->
        <DIV style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 7px; PADDING-TOP: 7px">
        <TABLE cellSpacing=0 cellPadding=0 width=580 align=center bgcolor="#F3F3F3" border=0>
        <TBODY>
        
        <tr>
                              <td height="24" valign=top><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="5" height="24" background="images/nv_2_l.jpg"><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                    <th background="images/nv_2_bg.jpg" align=left><span class="white_bold" align=left>
				    Recently Added to {$answers[0].name}</span>
				    </th>
                                    <td width="13" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                  </tr>
                              </table></td>
                            </tr>
        
        <TR>
        <TD width=580>

        <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
        <TR>

        {section name=j loop=$recadd}

			<TD style="WIDTH: 20%; TEXT-ALIGN: center" vAlign=top>

			<A href="{$baseurl}/view_video.php?viewkey={$recadd[j].vkey}">

				<IMG style="BORDER-RIGHT: #ffffff 5px solid; BORDER-TOP: #ffffff 5px solid; MARGIN-TOP: 10px; BORDER-LEFT: #ffffff
				5px solid; BORDER-BOTTOM: #ffffff 5px solid" height=60 src="{$tmburl}/1_{$recadd[j].VID}.jpg" width=80>
			</A>

			<DIV class=moduleEntrySpecifics style="FONT-WEIGHT: bold; PADDING-TOP: 5px">

				<A href="{$baseurl}/view_video.php?viewkey={$recadd[j].vkey}">{$recadd[j].title}</A>
			</DIV>
			<DIV class=moduleEntrySpecifics>
				By:   {insert name=id_to_name assign=uname un=$recadd[j].UID}

				<A href="{$baseurl}/uprofile.php?UID={$recadd[j].UID}">{$uname}</A>
			</DIV>

			<DIV class=moduleEntrySpecifics>
				Runtime: {$recadd[j].duration|string_format:"%.2f"}
			</DIV>

			<DIV class=moduleEntrySpecifics>Views: {$recadd[j].viewnumber}</DIV>
			<DIV class=moduleEntrySpecifics>
			{insert name=comment_count assign=commentcount vid=$recadd[j].VID}
			Comments: {$commentcount}
			</DIV>

			<!--Begin Rated Section-->
			<SPAN class=rating>
			{if $recadd[j].ratedby gt "0"}
			{insert name=show_rate assign=rate rte=$recadd[j].rate}
			{$rate}<BR>
			(rated by {$recadd[j].ratedby})
			{/if}
			</SPAN>
			<!--End Rated Section-->
     
			</TD>
        {/section}

	
        </TR></TBODY></TABLE>
</DIV>
        </TD>
        </TR>
        </TBODY></TABLE>


        </DIV>




<!-- End Recently Added to Channel Section -->
<!-- Begin Top Watched in Channel Section -->
        <DIV style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 7px; PADDING-TOP: 7px">
        <TABLE cellSpacing=0 cellPadding=0 width=580 align=center bgColor=#eae9ef border=0>
        <TBODY>
        
        <tr>
                              <td height="24" valign=top><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="5" height="24" background="images/nv_2_l.jpg"><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                    <th background="images/nv_2_bg.jpg" align=left><span class="white_bold" align=left>Top Watched videos in {$answers[0].name} Channel</span></th>
                                    <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
                                  </tr>
                              </table></td>
                            </tr>
        
        <TR>
        <TD width=580>

        <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
        <TBODY>
        <TR>

        {section name=k loop=$mostview}
        <TD style="WIDTH: 20%; TEXT-ALIGN: center" vAlign=top>
        <A href="{$baseurl}/view_video.php?viewkey={$mostview[k].vkey}">
        <IMG style="BORDER-RIGHT: #ffffff 5px solid; BORDER-TOP: #ffffff 5px solid; MARGIN-TOP: 10px; BORDER-LEFT: #ffffff
        5px solid; BORDER-BOTTOM: #ffffff 5px solid" height=60 src="{$tmburl}/1_{$mostview[k].VID}.jpg" width=80></A>
        <DIV class=moduleEntrySpecifics style="FONT-WEIGHT: bold; PADDING-TOP: 5px">
        <A href="{$baseurl}/view_video.php?viewkey={$mostview[k].vkey}">{$mostview[k].title}</A></DIV>
        <DIV class=moduleEntrySpecifics>By:
        {insert name=id_to_name assign=uname un=$mostview[k].UID}
        <A href="{$baseurl}/uprofile.php?UID={$mostview[k].UID}">{$uname}</A></DIV>
        <DIV class=moduleEntrySpecifics>Runtime: {$mostview[k].duration|string_format:"%.2f"}</DIV>
        <DIV class=moduleEntrySpecifics>Views: {$mostview[k].viewnumber}</DIV>
        <DIV class=moduleEntrySpecifics>
	 {insert name=comment_count assign=commentcount vid=$recadd[j].VID}
        Comments: {$commentcount}
        </DIV>
        <!--Begin Rated Section-->

        <SPAN class=rating>
        {if $mostview[k].ratedby gt "0"}
        {insert name=show_rate assign=rate rte=$mostview[k].rate}
        {$rate}<BR>
        (rated by {$mostview[k].ratedby})
        {/if}
        </SPAN>
        <!--End Rated Section-->
        </TD>
        {/section}

        </TR>
        </TBODY>
        </TABLE>
        </DIV>
        </TD>
        </TR>
        </TBODY>
        </TABLE>
        </DIV>
<!-- End Top Watched in Channel Section -->
</TD>
<td width=7></td>

<TD width=180>
			<table> 
			        <tr>
                              <td height="24" valign=top><table width="100%"  border="0" cellspacing="0" cellpadding="0">

                                   <tr>
                                    <td width="3" height="24"><img src="images/nv_2_l.jpg" width="3" height="38" alt=""></td>
                                    <td background="images/nv_2_l.jpg" class="style3"><div align="left" class="white_bold"><A href="{$baseurl}/signup.php"><span class="white_regular" align=left>Sign up for your free account!</span></A></div></td>
                                    <td width="4"><img src="images/nv_2_l.jpg" width="4" height="38" alt=""></td>
                                  </tr>


                              </table>
			      
			      </td>
                            </tr>

<!--Begin Top Right Links Section-->

<!--End Top Right Links Section-->
<!--Begin Recent Tags Section-->
<tr><td bgcolor="#F2F2F2" valign=top>
        <DIV style="FONT-WEIGHT: bold; FONT-SIZE: 12px; MARGIN: 10px 0px 5px; ">Recent
        Tags for this Channel:</DIV>
        {section name=i loop=$tags}
        <A style="FONT-SIZE: 12px" href="{$baseurl}/search_result.php?search_id={$tags[i]}">{$tags[i]}</A>&nbsp;
        {/section}
        <DIV></DIV>
        <DIV style="FONT-SIZE: 13px; COLOR: #333333">
        <DIV style="MARGIN-TOP: 10px; FONT-WEIGHT: bold; FONT-SIZE: 14px">
        </DIV></DIV><!--End Recent Tags Section--></TD></TR></table>
</td></tr>
        </TBODY></TABLE>
</TD></TR></TBODY></TABLE>
{else}
<center><b>There is no video in this channel</b></center>
{/if}

</td>
                        </tr>
                        
                                            </td></tr></table>


