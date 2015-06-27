<tr>
        <FORM name=searchForm action="{$baseurl}/search_result.php" method="get">
                <td align="center">
                        <table width="764"  border="0" cellspacing="0" cellpadding="0">
                        <tr>
                                <td>
                                        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                                <td width="100">&nbsp;</td>
                                                <td height="34">
							<INPUT class=input_back_orange tabIndex=1 maxLength=128 name="search_id" value="{$smarty.request.search_id}">
						</td>
                                                <td><SELECT name=search_type class=select_back_orange>
                                                        {if $smarty.request.search_type eq "search_videos"}<OPTION value=search_videos selected>Search Videos</OPTION>{else}<OPTION value=search_videos>Search Videos</OPTION>{/if}
                                                        {if $smarty.request.search_type eq "search_users"}<OPTION value=search_users selected>Search Users</OPTION>{else}<OPTION value=search_users>Search Users</OPTION>{/if}
                                                        {if $smarty.request.search_type eq "search_groups"}<OPTION value=search_groups selected>Search Groups</OPTION>{else}<OPTION value=search_groups>Search Groups</OPTION>{/if}
                                                    </SELECT>
                                                </td>
                                        <td><input type=image src="images/search_b.jpg" width="90" height="20"></td>
                                        <td width="100">&nbsp;</td>
                                        </tr>
                                        </table>
                                </td>
                        </tr>
                        </table>

                    </td>
        </FORM>
</tr>





