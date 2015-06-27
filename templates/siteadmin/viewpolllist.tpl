<HTML>
<HEAD>
<TITLE>{$site_name}</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="{$baseurl}/css/admin.css" type=text/css rel=stylesheet>


</HEAD>
<body>
	<TABLE CELLSPACING=0 cellpadding="3"  WIDTH=100% BORDER=0>
		<TR>
			<TD>
				{$smarty.request.a} <H3>View poll</H3>
				<BR>
				<HR WIDTH=100% COLOR=#000000>
			</TD>

		</TR>
	</TABLE>



	<TABLE WIDTH=90% ALIGN=CENTER>
	{section name=i loop=$pollArray}
		<TR>
			<TD>
				<B>POLL:</B>[<I>Start Date:{$pollArray[i].start_date} End Date:{$pollArray[i].end_date }</I> ]
			</TD>
		</TR>
		<TR>
			<TD>
				&nbsp;&nbsp;&nbsp;&nbsp;Qty:&nbsp;<B>{$pollArray[i].poll_qty} </B>
			</TD>
		</TR>
		<TR>
			<TD>
			{insert name=pollanswer assign=ansarray anspot=$pollArray[i].poll_answer}
			{insert name=pollresult assign=resarray pollid=$pollArray[i].poll_id}
			<TABLE BORDER=0 WIDTH=300>
			{section name=aa loop=$ansarray}
			<TR>
				<TD>
					{$ansarray[aa]}
				</TD><TD>
					{$resarray[aa]}%
				</TD>
			{/section}
			</TABLE>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 	
			<BR>
			[ <a href=viewpolllist.php?action=delete&poll_id={$pollArray[i].poll_id} >Delete</a> ]
			<BR>
			<HR SIZE=1 COLOR=#330000>
			</TD>
			<td>
			
			
			
			</td>
		</TR>
	
	{/section}
	
<!-- 
<TABLE width=300 BGCOLOR=#FFFFF1 ALIGN=CENTER>
<tr>
	<td>
		Current poll status
	</td>
</tr>



				
</TABLE> -->

</body>
</HTML>
