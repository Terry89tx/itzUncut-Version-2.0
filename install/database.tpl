<form name="myform2" method="POST" action="index.php">
<input type="hidden" name="step" value="2">
<input type="hidden" name="location" value="<?=$location?>">
<table width="96%" border="0" cellspacing="2" cellpadding="2" align="center">
    <tr>
      <td width="100%" colspan="2"><br>
      <b>Database & URL settings:</b></td>
    </tr>
    <tr>
      <td width="30%">Site URL</td>
      <td width="70%"><input type="text" name="site_url" size="33" value="<?echo $site_url;?>"> (i.e. <i>http://yoursite.com/installationfolder</i>)</td>
    </tr>
    <tr>
      <td width="30%">Site Path</td>
      <td width="70%"><input type="text" name="site_path" size="33" value="<?echo $site_path;?>"> (i.e. <i>/home/yoursite/public_html</i>)</td>
    </tr>
    <tr>
      <td width="30%">FFMpeg binary</td>
      <td width="70%"><input type="text" name="ffmpeg_path" size="33" value="<?echo $ffmpeg_path;?>"> (i.e. <i>/usr/bin/ffmpeg</i>)</td>
    </tr>
    <tr>
      <td width="30%">MySQL database server</td>
      <td width="70%"><input type="text" name="db_server" size="33" value="<?echo $db_server;?>"> usually<i>
      localhost</i></td>
    </tr>
    <tr>
      <td width="30%">Database name</td>
      <td width="70%"><input type="text" name="db_name" size="33" value="<?echo $db_name;?>"></td>
    </tr>
    <tr>
      <td width="30%">Database user name</td>
      <td width="70%"><input type="text" name="db_user" size="33" value="<?echo $db_user;?>"></td>
    </tr>
    <tr>
      <td width="30%">Database password</td>
      <td width="70%"><input type="password" name="db_pass" size="33"></td>
    </tr>
    <tr>
      <td width="30%">&nbsp;</td>
      <td width="70%">
        <i>(NB : Don't use any ending slash in you path)</i>
      <br><input type="submit" class="button_red" name="mysqlset" value="Continue Installation"><br><br></td>
    </tr>
<tr> 
        <td colspan="2" bgcolor="#666666"></td>
</tr>
</table>
</form>
