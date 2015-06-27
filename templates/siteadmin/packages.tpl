<HTML>
<HEAD>
<TITLE>{$site_name}</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="{$baseurl}/css/admin.css" type=text/css rel=stylesheet>

</HEAD>
<body>

<table cellspacing="1" cellpadding="3"  width="100%" border=0>
<tr><td><h3>Packages {if $enable_package eq "no"}(Disabled){/if}</h3></td></tr>
<tr><td><hr></td></tr>
{if $smarty.request.a ne "Search"}
<tr><td>
        Total: {$grandtotal}
</td></tr>
{/if}
<table>


        {if $smarty.request.a ne "Search"}
                <table cellspacing="1" cellpadding="3"  width="100%" border=0>
                <tr class="tabletitle">
                <td align="center"><b>ID</b></td>
                <td align="center"><b>Name</b></td>
                <td align="center"><b>Space</b></td>
                <td align="center"><b>Bandwidth</b></td>
                <td align="center"><b>Price</b></td>
                <td align="center"><b>Video Limit</b></td>
                <td align="center"><b>Period</b></td>
                <td align="center"><b>Status</b></td>
                <td align="center"><b>Action</b></td>
                </tr>

                {section name=aa loop=$packs}
                <tr {if $packs[aa].is_trial eq "yes"}bgcolor="#FFE0E0"{else}bgcolor="{cycle values="#F8F8F8,#F2F2F2"}"{/if}>
                <td align="center">{$packs[aa].pack_id}</td>
                <td ><a href="packages.php?a=Search&pack_id={$packs[aa].pack_id}&page={$smarty.request.page}">{$packs[aa].pack_name}</a></td>
                <td align="right">{insert name=format_size size=$packs[aa].space}</td>
                <td align="right">{insert name=format_size size=$packs[aa].bandwidth}</td>
                <td align="right">{if $packs[aa].is_trial eq "yes"}No{else}${$packs[aa].price}{/if}</td>
                <td align="center">{if $packs[aa].video_limit eq "0" or $packs[aa].video_limit eq ""}No{else}{$packs[aa].video_limit}{/if}</td>
                <td align="center">{if $packs[aa].is_trial eq "yes"}{$packs[aa].trial_period} days{else}{$packs[aa].period}{/if}</td>
                <td align="center">{$packs[aa].status}</td>
                <td align='center'><a href='packedit.php?action=edit&pack_id={$packs[aa].pack_id}&page={$smarty.request.page}&sort={$smarty.request.sort}'>Edit</a>
                {if $packs[aa].is_trial ne "yes"}|<a href='packages.php?a={$smarty.request.a}&action=del&pack_id={$packs[aa].pack_id}&page={$smarty.request.page}&sort={$smarty.request.sort}' onClick='Javascript:return confirm("Are you sure you want to delete?");'>Del</a>{/if}
                </td>
                </tr>
                {/section}
                <tr class="tablerow"><td colspan=8 ><br>{$link}</td></tr>
                </table>

                </div>
                </td>
                </tr>
                </table>
                <br><br>
                
        {elseif $smarty.request.a eq "Search"}

                {if $pack.pack_id ne ""}
                        <table width="70%" align="center" cellpadding="3" cellspacing="3">
                        <tr class="tablerow1">
                                <td width="40%"><b>Package Name</b></td>
                                <td><b>{$pack.pack_name}</b></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Description</b></td>
                                <td>{$pack.pack_desc}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Space</b></td>
                                <td>{insert name=format_size size=$pack.space}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Bandwidth</b></td>
                                <td>{insert name=format_size size=$pack.bandwidth}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Price</b></td>
                                <td>${$pack.price}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Video Limit</b> (Optional)</td>
                                <td>{if $pack.video_limit eq "0" or $pack.video_limit eq ""}(None){else}{$pack.video_limit}{/if}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Subscription Period</b></td>
                                <td>{if $pack.is_trial eq "yes"}{$pack.trial_period} days{else}{$pack.period}{/if}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Status</b></td>
                                <td>{$pack.status}</td>
                        </tr>
                        <tr class="tabletitle">
                                <td colspan="2" align="right"><a href='packedit.php?action=edit&pack_id={$pack.pack_id}&page={$smarty.request.page}'>Edit Package</a></td>
                        </tr>
                        </table>
                        <br><br>
                {/if}
        {/if}

</BODY>
</HEAD>
</HTML>
