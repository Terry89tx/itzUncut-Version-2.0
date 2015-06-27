<HTML>
<HEAD>
<TITLE>{$site_name}</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="{$baseurl}/css/admin.css" type=text/css rel=stylesheet>

</HEAD>
<body>

<table cellspacing="1" cellpadding="3"  width="100%" border=0>
<tr><td><h3>{$smarty.request.a} Users</h3></td></tr>
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
                <td><b>ID</b>
                        <a href='users.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=UID+asc'><img src='{$IMG_URL}/up.gif' border='0'></a>
                        <a href='users.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=UID+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td><b>Name</b>
                        <a href='users.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=username+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='users.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=username+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td><b>Country</b>
                        <a href='users.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=country+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='users.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=country+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td><b>Last Login</b>
                        <a href='users.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=logintime+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='users.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=logintime+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td><b>Video</b>
                </td>
                {if $enable_package eq "yes"}
                <td><b>Package</b></td>
                {/if}
                <td><b>Status</b>
                        <a href='users.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=account_status+asc'><img src='{$imgurl}/up.gif' border='0'></a>
                        <a href='users.php?a={$smarty.request.a}&status={$smarty.request.status}&sort=account_status+desc'><img src='{$imgurl}/down.gif' border='0'></a>
                </td>
                <td align="center"><b>Action</b></td>
                </tr>

                {section name=aa loop=$users}
                <tr bgcolor="{cycle values="#F8F8F8,#F2F2F2"}">
                <td >{$users[aa].UID}</td>
                <td ><a href="users.php?a=Search&userid={$users[aa].UID}&page={$smarty.request.page}">{$users[aa].username}</a></td>
                <td>{$users[aa].country}</td>
                <td>{$users[aa].logintime|date_format}</td>
                <td align="right">{insert name=video_count assign=vdo uid=$users[aa].UID}
                                {if $vdo ne "0"}<a href="uservideos.php?uid={$users[aa].UID}">{$vdo}</a>{else}{$vdo}{/if}</td>
                {if $enable_package eq "yes"}
                <td>{insert name=subscriber_info assign=pack uid=$users[aa].UID}
                        {$pack.pack_name}
                </td>
                {/if}
                <td align="center">{$users[aa].account_status}</td>
                <td align='center'><a href='useredit.php?action=edit&uid={$users[aa].UID}&page={$smarty.request.page}&sort={$smarty.request.sort}'>Edit</a>
                |<a href='users.php?a={$smarty.request.a}&action=del&uid={$users[aa].UID}&page={$smarty.request.page}&sort={$smarty.request.sort}' onClick='Javascript:return confirm("Are you sure you want to delete?");'>Del</a>
                |<a href='muser.php?email={$users[aa].email}&uname={$users[aa].username}'>Mail</a>
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

                <table align="center">
                <tr><td>
                <form action="users.php" method="GET">
                        <input type="hidden" name="a" value="Search">
                        User ID:
                        <input type="text" name="userid" size="10">
                        <input type="submit" name="search" value="Search"> &nbsp;&nbsp;
                        User Name:
                        <input type="text" name="username">
                        <input type="submit" name="search" value="Search">
                </form>
                </td></tr>
                </table>
                
                {if $err ne "" or $msg ne ""}
                        <div class=subdiv align="center">
                        <br><br>
                        <div id="error">
                        </div>
                        <br><br>
                        {include file="err_msg.tpl"}
                {/if}
                
                {if $user.UID ne ""}
                        <br>
                        <table width="70%" align="center" cellpadding="3" cellspacing="3">
                        <tr><td colspan=2><hr></td></tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>User ID</b></td>
                                <td>{$user.UID}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>User Name</b></td>
                                <td><b>{$user.username}</b></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Email Address</b></td>
                                <td>{$user.email}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Full Name</b></td>
                                <td>{$user.fname} {$user.lname}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Gender</b></td>
                                <td>{$user.gender}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Birthdate</b></td>
                                <td>{$user.bdate|date_format}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>City</b></td>
                                <td>{$user.city}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Country</b></td>
                                <td>{$user.country}</td>
                        </tr>

                        {if $enable_package eq "yes"}
                        <tr><td colspan=2><hr></td></tr>
                        {insert name=subscriber_info assign=pack uid=$user.UID}
                        <tr class="tablerow1">
                                <td width="40%"><b>Subscribed Package</b></td>
                                <td><a href="{$baseurl}/siteadmin/packages.php?a=Search&pack_id={$pack.pack_id}&page=">{$pack.pack_name}</a></td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Used Space</b></td>
                                <td>{insert name=format_size size=$pack.used_space}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Used Bandwidth</b></td>
                                <td>{insert name=format_size size=$pack.used_bw}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Total Uploaded Video</b></td>
                                <td>{$pack.total_video}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Expired Date</b></td>
                                <td>{$pack.expired_time|date_format}</td>
                        </tr>
                        {/if}
                        
                        <tr><td colspan=2><hr></td></tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Website</b></td>
                                <td>{$user.website}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Occupation</b></td>
                                <td>{$user.occupation}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Company Name</b></td>
                                <td>{$user.company}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>School</b></td>
                                <td>{$user.school}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Interest/Hobby</b></td>
                                <td>{$user.interest_hobby}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Favourate Movie</b></td>
                                <td>{$user.fav_movie_show}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Favourate Book</b></td>
                                <td>{$user.fav_book}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Favourate Music</b></td>
                                <td>{$user.fav_music}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>About Me</b></td>
                                <td>{$user.aboutme}</td>
                        </tr>
                        <tr><td colspan=2><hr></td></tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Video Viewed</b></td>
                                <td>{$user.video_viewed}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Profile Viewed</b></td>
                                <td>{$user.profile_viewed}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Watched Video</b></td>
                                <td>{$user.watched_video}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Join Date</b></td>
                                <td>{$user.addtime|date_format}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Last Login</b></td>
                                <td>{$user.logintime|date_format}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Email Verified</b></td>
                                <td>{$user.emailverified}</td>
                        </tr>
                        <tr class="tablerow1">
                                <td width="40%"><b>Account Status</b></td>
                                <td>{$user.account_status}</td>
                        </tr>
                        <tr class="tabletitle">
                                <td colspan="2" align="right"><a href='useredit.php?action=edit&uid={$user.UID}&page={$smarty.request.page}'>Edit User</a></td>
                        </tr>
                        </table>
                        <br><br>
                {/if}
                
        {elseif $smarty.request.a eq "email"}

        {/if}

</BODY>
</HEAD>
</HTML>
