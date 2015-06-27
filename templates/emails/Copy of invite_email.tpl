Hello {$firstname},


<A href="{$baseurl}">YouTube</A> is a new site for sharing and hosting personal videos. I have been using YouTube to share videos with my friends and family. I would like to add you to the list of people I may share videos with.

Personal message from {$smarty.session.USERNAME}:
{$message}


To accept my friend request, click here:
<A href="{$baseurl}/friend_accept.php?id={$id}">{$baseurl}/friend_accept.php?id={$id}</A>

To respond to {$smarty.session.USERNAME}, click <A href="{$baseurl}">here</A>.

Thanks,
{$smarty.session.USERNAME}

