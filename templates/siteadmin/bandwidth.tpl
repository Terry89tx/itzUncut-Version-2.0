<HTML>
	<HEAD>
		<TITLE>
			{$site_name}
		</TITLE>
		<META http-equiv=Content-Type content="text/html; charset=utf-8">

		<!--#	 My style -->
		<LINK href="{$baseurl}/css/admin.css" type=text/css rel=stylesheet>
	</HEAD>
<BODY>
	
	<TABLE CELLSPACING=0 cellpadding="3"  WIDTH=100% BORDER=0>
		<TR>
			<TD>
				{$smarty.request.a} <H3>Reset all user's bandwidh</H3>
				<BR>
				<HR WIDTH=100% COLOR=#000000>
			</TD>

		</TR>
	</TABLE>

	<TABLE>
	<TR>
		
		<TD>
			&nbsp;{$msg}
		</TD>
	<TR></TR>
		<TD>
			<!-- # My form -->
			<FORM ACTION=bandwidth.php METHOD=POST>
				<INPUT TYPE="submit" NAME="btnRestBandwidth" VALUE="Reset All user's Bandwidth">
			</FORM>
		</TD>
	</TR>
	</TABLE>



	

</BODY>
</HTML>
