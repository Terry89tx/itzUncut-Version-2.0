

<!-- !!!!!!!!!!!!!!!  JAVA SCRIPT LIB !!!!!!!!!!!!!!! -->
<script language="JavaScript" src="{$baseurl}/js/foldeing/effects.js"></script>
<script language="JavaScript" src="{$baseurl}/js/foldeing/prototype.js"></script>
<script language="JavaScript" src="{$baseurl}/js/foldeing/scriptaculous.js"></script>
<!-- !!!!!!!!!!!!!!!!!!!!!! -->


<td width="7" bgcolor="#FFFFFF" valign=top></td>
                    <td width="180" align="right" valign="top" class="normal_blue"><br>
                    <table width="98%"  border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td valign=top>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                        <td align="center">{insert name=advertise adv_name='home_right_box'}</td>
                                </tr>
                                </table>
                        </td>
                      </tr>
                      <tr>
                        <td height="7" align="center"></td>
                      </tr>
                      <tr>
                        <td align="center">
			
			<table width="100%"  border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="7"></td>
                          </tr>
                          <tr>
                            <td class="normal_blue"><b>Recent Tags:</b><div align="left">
			    {section name=i loop=$tags}
			                <A style="FONT-SIZE: 12px" href="{$baseurl}/search_result.php?search_id={$tags[i]}">{$tags[i]}</A>&nbsp;
				{/section} 
		<br><br><A href="{$baseurl}/more_tags.php"><b>See More Tags</b></A></div></td>
                          </tr>
                          <tr>
                            <td height="20"></td>
                          </tr>
                        </table>
			
			</td>
                      </tr>

                      <tr>
                        <td>

{ if $lfubannar ne 'Disable'}

<!-- 			# Show last five user bannar -->

			<table width="100%"  border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td>
			      
			      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="5" height="24" background="images/nv_2_l.jpg"><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                    <td background="images/nv_2_bg.jpg" class="white_bold">Last 5 Users Online
				    </TD>
				    <TD  background="images/nv_2_l.jpg">
					
					 <a href="javascript:void(0);" onClick="Effect.toggle('divShowuser','slide');"><img src="images/tougle_button.png"  title="Show five user pan" BORDER="0"></a>
				    </td>
                                    <td width="5" background="images/nv_2_r.jpg">
				    				    <img src="images/nv_2_r.jpg" width="5" height="24" alt="">
				    </td>
                                  </tr>
                              </table>
			      
			      </td>
                            </tr>

                            <tr>

                              <td>
<DIV ID="divShowuser" >			    
			      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                    {insert name=5users_count assign=5users tbl=last_5users}
                                        {section name=i loop=$5users}
                                        <tr>
                                                <td width="1" bgcolor="#BABDBF"></td>
                                                <td valign="top">
                                                        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                                <td align="center" valign="top">
                                                                <table width="90%"  border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                        <td height="25" valign="bottom" class="bold_blue">{insert name=id_to_name assign=uname un=$5users[i].UID}<A href="{$baseurl}/uprofile.php?UID={$5users[i].UID}">{$uname}</A></td>
                                                                </tr>
                                                                <tr>
                                                                        <td align="center">
                                                                                <table width="94%"  border="0" cellspacing="0" cellpadding="0">
                                                                                <tr>
                                                                                        <td>
                                                                                                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                                                                <tr>
                                                                                                        <td><img src="images/bullet.jpg" width="14" height="12" alt=""></td>
                                                                                                        <td class="style7"><strong class="bold_gray">{insert name=video_count assign=vdocount uid=$5users[i].UID}<A href="{$baseurl}/uvideos.php?UID={$5users[i].UID}">({$vdocount})</A></strong></td>
                                                                                                        <td><img src="images/heart.jpg" width="16" height="13" alt=""></td>
                                                                                                        <td><span class="bold_gray"><strong>{insert name=favour_count assign=favcount uid=$5users[i].UID}<A href="{$baseurl}/ufavour.php?UID={$5users[i].UID}">({$favcount})</A></strong></span></td>
                                                                                                        <td><img src="images/smile.jpg" width="16" height="16" alt=""></td>
                                                                                                        <td height="30"><span class="bold_gray">{insert name=friends_count assign=friends uid=$5users[i].UID}<strong><A href="{$baseurl}/ufriends.php?UID={$5users[i].UID}">({$friends})</A></strong></span></td>
                                                                                                </tr>
                                                                                                </table>
                                                                                        </td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td height="1" background="images/blueline_bg-.jpg"></td>
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
                                        {/section}

                                              <tr>
                                                <td width="1" bgcolor="#BABDBF"></td>
                                                <td align="center" valign="top">
                                                  <table width="100%"  border="0"  cellspacing="0" cellpadding="0">
                                                    <tr>
                                                      <td height="10"></td>
                                                    </tr>
                                                    <tr>
                                                      <td align="center"><table width="90%"  border="0" cellspacing="6" cellpadding="0">
                                                          <tr><td colspan=2><b>Icon Key:</b></td></tr>
                                                          <tr>
                                                            <td width="20"><img src="images/bullet.jpg" width="14" height="12" alt=""></td>
                                                            <td><span class="blue_regular">Videos</span></td>
                                                          </tr>
                                                          <tr>
                                                            <td><img src="images/heart.jpg" width="16" height="13" alt=""></td>
                                                            <td><span class="blue_regular">Favorites</span></td>
                                                          </tr>
                                                          <tr>
                                                            <td><img src="images/smile.jpg" width="16" height="16" alt=""></td>
                                                            <td class="blue_regular"> Friends </td>
                                                          </tr>
                                                      </table></td>
                                                    </tr>
                                                </table>
						</td>
                                              </tr>
                                          </table>
					  </td>
                                          <td width="1" bgcolor="#BABDBF"></td>
                                        </tr>
                                        <tr>
                                    <td height="1" bgcolor="#BABDBF"></td>
                                  </tr>
                                 </table>
				  </td>
                                  </tr>
                                  <tr>
                                    <td height="1" bgcolor="#BABDBF"></td>
                                  </tr>
                              </table>

<!--  			# Show five user END  			       -->

</DIV>	

{/if}


{ if $pollinganel ne 'Disable'}


<!-- 			# SOW VOTING -->

			<table width="100%"  border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td>
			      
			      <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
                                  <tr>
                                    <td width="5" height="24" background="images/nv_2_l.jpg"><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
                                    <td background="images/nv_2_bg.jpg" class="white_bold">Vote Here
				    <TD background="images/nv_2_l.jpg" width=5 height=30 ALIGN=RIGHT>
				    <DIV ID='divVoteImage'>	
				    <a href="javascript:void(0);" onClick="Effect.toggle('divShowVoting','slide');" title='key'><img src="images/tougle_button.png"  title="Show Vote Pane" BORDER="0"> </a>
				    </DIV>

				    </TD>

				    </td>
                                    <td width="5" background="images/nv_2_r.jpg">
				    				    <img src="images/nv_2_r.jpg" width="5" height="24" alt="">
				    </td>
                                  </tr>
                              </table>
			      
			      </td>
                            </tr>

                            <tr>

                              <td>
<DIV ID="divShowVoting" style='display:none'>	
		{if $poll_qty ne ""}
 
		            
			     <TABLE ID=tblVote BORDER=0 WIDTH=100% >
				<TR>
					<TD> 
					<B><font size=2 color=#3366FF  >{$poll_qty}</font> </B>
				<!-- 		{$poll_id}{$answers} -->
					</TD>
				</TR>
				<TR>
					<TD>
						
						{section name=i loop=$list}
								<INPUT TYPE="radio" name="xx"   onClick="directMyvalueto('{$list[i]}','opAns')">
								<font size=2 color=#3366FF  >	{$list[i]}</font> <BR>
							
						{/section} 
						<br>
						<INPUT TYPE="hidden" id="opAns">
						<INPUT TYPE="submit" CLASS="input_btn" ID='btnVoteSubmit' Value='Cast This' onClick="fxVote({$poll_id})">
					</TD>
				</TR>

			     </TABLE>
			     <TABLE  id="tblPResult">
			<TR>
				<TD>
				</TD>
			</TR>
			</TABLE>	
		{/if}
<!--  			# END VOTING SECTION -->
		
		<div ID=divviewvresult>
			<TABLE border=0 >
			<TR>
				<TABLE ID=tblViewVote width=100%>
				<TR>
				<TD CLASS=text_yellow>
					<A HREF="javascript:void(0)" STYLE="TEXT-DECORATION:none" onClick="viewVote({$poll_id})">
						View current status
					</A>
				</TD>
				</TR>
				<TR>
					<TD>
						<TABLE ID="tblViewVoteResult" BORDER=0 WIDTH=100% CELLPADDING=0 CELLSPACING=0 CLASS="text_blue"></TABLE>
					</TD>
				</TR>
				</TBALE>

			</TR>
			</TABLE>
		</div>

</DIV>
{/if}
</TD>	
</TR>
<TD>
<TABLE ID="tblVoteResult" BORDER=0 WIDTH=100% BGCOLOR="#E4E4E4" CELLPADDING=0 CELLSPACING=0>
</TABLE>
<TABLE ID="tblVoteResult2" BORDER=0 WIDTH=100%M COLOR=#FF6600>

</TABLE>

				      
</TD>
</tr>
</table>
			</td>
                      </tr>
                      <tr>
                        <td height="7"><img src="images/spacer.gif" width="1" height="1"></td>
                      </tr>
                    </table></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>


