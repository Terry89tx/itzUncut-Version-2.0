
	 <TABLE cellSpacing=0 cellPadding=0 width=760 align=center  border=0><TBODY><TR>
	<TD width=0>        <TABLE cellSpacing=0 cellPadding=0 border=0>
				   <tr>
				      <td  valign=top>
						<table width="100%"  border="0" cellspacing="0" cellpadding="0">
						  <tr>
						    <td width="5" height="24" background="images/nv_2_l.jpg" valign=top><img src="images/nv_2_l.jpg" width="5" height="24" alt=""></td>
						    <td background="images/nv_2_bg.jpg" width=740><span class="white_bold" valign=top>All Channels</span></td>
						    <td width="5" background="images/nv_2_r.jpg"><img src="images/nv_2_r.jpg" width="5" height="24" alt=""></td>
						  </tr>
						 </table>
				      </td>
				      </tr>
				    </TABLE>



		<TABLE cellSpacing=0 cellPadding=8 width=740 border=0 bgcolor="#F1F5F8">
			<TBODY>
			<TR vAlign=top>
			
			{section name=i loop=$answers}
			{insert name=channel_count assign=infoch cid=$answers[i].CHID}
			{if $smarty.section.i.index mod 3 eq "0" and $smarty.section.i.index gt "0"}</tr><tr>{/if}
			<TD width="33%" align=center>
			
				<TABLE>
				<TBODY>
				<TR><TD align="center">
				<A href="{$baseurl}/channel_detail.php?chid={$answers[i].CHID}">
				<IMG style="BORDER-RIGHT: #ffffff 5px solid; BORDER-TOP: #ffffff 5px solid; BORDER-LEFT:
				#ffffff 5px solid; BORDER-BOTTOM: #ffffff 5px solid" height=60
				src="{$baseurl}/chimg/{$answers[i].CHID}.jpg" width=80>
				</A>
				</TD></TR>
				<TR><TD vAlign=top align="center">
				<A href="{$baseurl}/channel_detail.php?chid={$answers[i].CHID}">
				<DIV style="FONT-WEIGHT: bold; FONT-SIZE: 12px">{$answers[i].name}</DIV>
				</A>
				<DIV style="FONT-SIZE: 11px; COLOR: #666666; PADDING-TOP: 2px; FONT-FAMILY: Arial, Helvetica, sans-serif">
				<IMG src="{$imgurl}/star.gif" width=12 align=absMiddle>
				&nbsp;Today: {$infoch[0]} | Total: {$infoch[1]} </DIV>
				<DIV style="FONT-SIZE: 11px; COLOR: #666666; PADDING-TOP: 2px; FONT-FAMILY: Arial, Helvetica, sans-serif">
				&nbsp;Groups: {$infoch[2]} </DIV>
				<DIV style="PADDING-TOP: 5px">{$answers[i].descrip}</DIV>
				</TD></TR>
				</TBODY>
				</TABLE>

			</TD>
			{/section}

			</TR>
		</TBODY>
		</TABLE>

	</TD>
	</TR>
	</TBODY>
	</TABLE>
	
