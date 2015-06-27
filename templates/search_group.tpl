{if $total ne "0"}
<TABLE cellSpacing=0 cellPadding=5 width=760 border=0>
<TBODY>
<TR><!--Begin Group List Table-->
<TD vAlign=top align=left width=580><!--Begin Gray Table-->

<TABLE cellSpacing=0 cellPadding=0 align=center bgColor=#cccccc width="100%" border=0>
<TBODY>
<TR>
<TD>

                <DIV class=watchTitleBar>
                <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                <TR vAlign=top><TD>
                <DIV class=moduleTitle>Search Groups</DIV></TD>
                <DIV style="FONT-WEIGHT: bold; FONT-SIZE: 12px; FLOAT: right; VERTICAL-ALIGN: bottom; COLOR: #444;
                MARGIN-RIGHT: 5px">Results {$start_num}-{$end_num} of {$total} </DIV>
                </TR>
                </TBODY>
                </TABLE>
                </DIV>

                {section name=i loop=$answers}
                {insert name=group_img assign=groupimg gid=$answers[i].GID tbl=group_vdo}
                <DIV class=moduleEntry>
                <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0><TBODY>
                <TR vAlign=top>
                <TD>
                <A href="{$baseurl}/groups_home.php?urlkey={$answers[i].gurl}">
                {if $groupimg eq ""}<IMG class=moduleEntryThumb height=90 src="{$imgurl}/no_videos_groups.gif" width=120>
                {else}<IMG class=moduleEntryThumb height=90 src="{$imgurl}/1_{$groupimg}.jpg" width=120>
                {/if}</A>
                </TD>
                
                <TD width="100%">
                <DIV class=moduleEntryTitle>
                <A href="{$baseurl}/groups_home.php?urlkey={$answers[i].gurl}">{$answers[i].gname}</A>
                </DIV>
                <DIV class=moduleEntryDescription>{$answers[i].gdescn}</DIV>
                <DIV class=moduleEntryTags>
                Tags // {$answers[i].keyword}
                </DIV>
                </TD>
                </TR>
                </TBODY>
                </TABLE>
                </DIV>
                {/section}


                <DIV>
                <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
                <TBODY>
                <TR vAlign=top>
                <TD>
                <DIV class=moduleTitle>Pages: {$page_link}</DIV></TD>
                </TR>
                </TBODY>
                </TABLE>
                </DIV>
</TD>
</TR>
</TBODY>
</TABLE><!--End Gray Table-->
</TD><!--End Group List Table-->
<TD vAlign=top width=180>
        <TABLE class=roundedTable cellSpacing=0 cellPadding=0 width=180 align=center bgColor=#ffeebb border=0>
        <TBODY>
        <TR>
        <TD><IMG height=1 src="YouTube - Search Groups_files/pixel.gif" width=5></TD>
        <TD width=170>
        <DIV style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; FONT-WEIGHT: bold; FONT-SIZE: 16px; PADDING-BOTTOM: 10px;
        PADDING-TOP: 5px; TEXT-ALIGN: center">
        <A href="{$baseurl}/groups.php">Browse All Groups</A>
        </DIV>
        </TD>
        </TR>
        </TBODY>
        </TABLE>

        <TABLE cellSpacing=0 cellPadding=0 align=top border=0>
        <TBODY>
        <TR vAlign=top>
        <TD width=180>
        <DIV class=tag_list>Related Tags: </DIV>
        <DIV class=tag_list>
        {section name=i loop=$tags}
        <P>» <A style="FONT-SIZE: 12px" href="{$baseurl}/search_result.php?search_id={$tags[i]}">{$tags[i]}</A></P>
        {/section}
        </DIV>
        </TD>
        </TR>
        </TBODY>
        </TABLE>

</TD></TR></TBODY></TABLE>
</TD></TR></TBODY></TABLE>
{/if}
