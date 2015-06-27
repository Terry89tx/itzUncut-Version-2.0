<HTML>
	<HEAD>
		<TITLE>
			{$site_name}
		</TITLE>
		<META http-equiv=Content-Type content="text/html; charset=utf-8">
		
		<!--#	 My style -->
		<LINK href="{$baseurl}/css/admin.css" type=text/css rel=stylesheet>
		<script language=JavaScript src={$baseurl}/js/myjavascriptadmin.js></script>

		
		
	</HEAD>
<BODY>
	
	<TABLE CELLSPACING=0 cellpadding="3"  WIDTH=100% BORDER=0>
		<TR>
			<TD>
				{$smarty.request.a} <H3>Poll Setting</H3>
				<BR>
				<HR WIDTH=100% COLOR=#000000>
			</TD>

		</TR>
	</TABLE>
		
	
<!-- 	# Table for Polling form -->
	<FORM METHOD=get ACTION="poll.php" onSubmit='return fxvalidation();'>

		<TABLE WIDTH=600 BORDER=0 ALIGN=CENTER ID='tblVoteMain' cellpadding=5>
			<TR>
				<TD SOWSPAN=2>
					<font color=#FF0033><B>{$err}</B></font>
				</TD>
			</TR>
			<TR>
				<TD ALIGN="center">
				   <b>Add new poll</b>
				</TD ALIGN=LEFT>
				<TD>&nbsp;</TD>
			</TR>
			<TR>
				<TD ALIGN=RIGHT>
				
					Starting date :				
				</TD>
				<TD ALIGN=LEFT>
				<SELECT NAME="selStartDay">
					{$dayes}
				<OPTION VALUE="{$smarty.request.selStartDay}">{$smarty.request.selStartDay}</OPTION> 
				</SELECT>
				<SELECT NAME="selStartMonth">
						{$month}
				<OPTION VALUE="{$smarty.request.selStartMonth}">{$smarty.request.selStartMonth}</OPTION> 
				</SELECT>
				<SELECT NAME="selStartYear">
					{$year}
				<OPTION VALUE="{$smarty.request.selStartYear}">{$smarty.request.selStartYear}</OPTION> 
				</SELECT>
				
					
				</TD>
			</TR>
			<TR>
				<TD ALIGN=RIGHT>
				
					End date :

				</TD>
				<TD ALIGN=LEFT>
				<SELECT NAME="selEndDay">
					{$dayes}
				<OPTION VALUE="{$smarty.request.selEndDay}">{$smarty.request.selEndDay}</OPTION> 
				</SELECT>
				<SELECT NAME="selEndMonth">
						{$month}
				<OPTION VALUE="{$smarty.request.selEndMonth}">{$smarty.request.selEndMonth}</OPTION> 
				</SELECT>
				<SELECT NAME="selEndYear">
					{$year}
					<OPTION VALUE="{$smarty.request.selEndYear}">{$smarty.request.selEndYear}</OPTION> 
				</SELECT>
				</TD>
			</TR>
			<TR>
				<TD ALIGN=RIGHT>
					Question :
				</TD>
				<TD>
					<TEXTAREA NAME="txtQtn" ID='txtQtn' ROWS="2" COLS="50" onBlur="txtBoxValidation('txtQtn','#EAEAEA','#FFB3B3')">{$smarty.request.txtQtn}</TEXTAREA>
					
				</TD>
			</TR>
			<TR>
				
				<TD ALIGN=RIGHT>
					Number of answers :
				</TD>
				<TD>
					<INPUT TYPE="text" NAME="txtAnsQty" SIZE=3 ID='txtPollAnsQty' onBlur="pollAnsBox('txtPollAnsQty')" onFocus="delteRow()" value="{$smarty.request.txtAnsQty}">
					
				</TD>
			</TR><TR>
				<TD></TD>
				<TD ALIGN=left>
					<DIV>
						<TABLE ID='tblViweAnsBox'>
							
						</TABLE>
				       <DIV>
				</TD>
			</TR>
			</TR><TR>
				<TD></TD>
				<TD ALIGN=left>
				       <DIV>
						 <INPUT TYPE="submit" Name="btnSubmit" VALUE='SAVE' >

				       <DIV>
				</TD>
			</TR>
		</TABLE>
	</FORM>
	
</BODY>
</HTML>