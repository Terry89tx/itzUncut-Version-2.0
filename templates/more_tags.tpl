<tr><td height=250>

<DIV class=tableSubTitle>Tags</DIV>
<DIV style="FONT-WEIGHT: bold; FONT-SIZE: 14px; MARGIN-BOTTOM: 10px; COLOR: #666666">Latest Tags //</DIV>
<DIV style="MARGIN-BOTTOM: 20px">
{section name=i loop=$rtags}
<A style="FONT-SIZE: 12px" href="{$baseurl}/search_result.php?search_id={$rtags[i]}">{$rtags[i]}</A>&nbsp;:
{/section}
</DIV>
<DIV style="FONT-WEIGHT: bold; FONT-SIZE: 16px; MARGIN-BOTTOM: 10px; COLOR: #666666">Most Popular Tags //</DIV>
{section name=j loop=$ptags}
<A style="FONT-SIZE: 12px" href="{$baseurl}/search_result.php?search_id={$ptags[j]}">{$ptags[j]}</A>&nbsp;:
{/section}
<DIV><BR><BR>
</DIV>

</td></tr>
