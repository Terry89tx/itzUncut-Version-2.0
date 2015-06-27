<?php
     //  print_r($_REQUEST);
       
       $siteTitle="Youtube.com";
       $siteHeader="The pioneer  IT Solution By RSS...";
           # Mod process
           $writable_folders=array("chimg"=>"DIR","flvideo"=>"DIR","include"=>"DIR","thumb"=>"DIR","video"=>"DIR","templates_c"=>"DIR","include/conf.ini"=>"FILE","include/config.php"=>"FILE");
        ob_start();
        include("install_header.tpl");
?>
<link rel=stylesheet href='mystyle.css'>
<?php
$error="";
        if(!isset($_REQUEST['step'])){
?>
<table width="96%" border="0" cellspacing="2" cellpadding="2" align="center">
<tr>
        <td width=100%>
        <u><b>Installation Instruction</b></u><br><br>
        <?php
        while(list($k,$v)=each($writable_folders))
        {
                if($v=="DIR")
                echo "<li>Make a directory name \"$k\" in your server. Chmod it to 777";
                else if($v=="FILE")
                echo "<li>Set the property of file \"$k\" to writable, So Chmod it to 777";
        }
        ?>
        <br><br>
        <form name='myform1' method='POST' action='index.php' onSubmit="return yesgo();">
        Put Directory Location :&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="text" name="location" size="40" class="normal"><br>
        <b>(i.e. /var/www/html/path or /home/mysoftwo/public_html  don't put the ending slash)</b>
        <br><br>
        <input type='submit' class='button_red' name='submit' value='Start Installation'>        
        <input type='hidden' name='step' value='1'>
        </form>
        <br><br>
        </td>
</tr>
<tr> 
        <td colspan="2" bgcolor="#666666"></td>
</tr>
</table>

<?php
}
elseif($_REQUEST['step']==1){
        //CHECK CHMOD DIRECTORIES
        $error="false";
        reset($writable_folders);
        while(list($k,$v)=each($writable_folders))
        {
                $a=$_REQUEST['location'];
               
               
                $dir = $_REQUEST['location']."/".$k;
                                 
                if(!is_writable($dir))
                {
                        $$k="<font color='red'>Error</font> $dir ";
                        $error = "true";
                        break;
                }
                else
                {
                        $$k="<font color='blue'>Success</font>";
                }
        }

?>
<table width="96%" border="0" cellspacing="2" cellpadding="2" align="center">
<tr>
        <td width=100%>
        <u><b>Checking Default Directories</b></u><br><br>
        <?php
        reset($writable_folders);
        while(list($k,$v)=each($writable_folders))
        {                
                $s = $$k;
                echo"<li>Chmod the \"$k\" $v to 777&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$s<br>";
        }
        ?>
        <br><br>
        <?php
                $loc = $_REQUEST['location'];
                if($error=="true")
                {
                        echo "<form name='yesgo' method='POST' action='index.php'>
                        <input type='submit' class='button_red' name='submit' value='check Again'>
                        <input type='hidden' name='location' value='$loc'>
                        <input type='hidden' name='step' value='1'>
                        </form>";
                }
                else
                {
                        echo "<form name='yesgo' method='POST' action='index.php'>
                        <input type='submit' class='button_red' name='submit' value='Continue Installation'>        
                        <input type='hidden' name='location' value='$loc'>
                        <input type='hidden' name='step' value='2'>
                        </form>";
                }
        ?>        
        <br><br>
        </td>        
</tr>
<tr> 
        <td colspan="2" bgcolor="#666666"></td>
</tr>
</table>
<?php
        }
        elseif($_REQUEST['step']==2){
				$site_url='';
				$site_path='';
				$ffmpeg_path='';
				$db_server='';
				$db_name='';
				$db_user='';
                if(isset($_REQUEST['mysqlset']))
                {
                        $link = @mysql_connect($_REQUEST['db_server'], $_REQUEST['db_user'], $_REQUEST['db_pass']);
                        if (!$link) 
                        {
                                $err="Failed to connect to database server. Please check the data and try again.<br>";
                                $err.="Error reported: " . mysql_error() ."<br>";
                        }
                        else 
                        {              
                                 $suc = mysql_select_db($_REQUEST['db_name'], $link);
                                 if (!$suc)
                                 {
                                          $err="Succesfuly connected to database server, but failed to open the database ($db_name). Please check the data and try again.<br>";
                                          $err.="Error reported: " . mysql_error() ."<br>";
                                 }
                        }
                        if($err!="")
                        {
                                echo "<br><table width='96%' border='0' cellspacing='2' cellpadding='2' align='center'>
                                        <tr>
                                        <td width=100%>
                                        <font color='red'><b>$err</b></font>
                                        </td>
                                        </tr>
                                        </table>";
                        }
                        else
                        {
                           $fp = fopen ('../include/conf.ini','w');
                                fputs ($fp,"[Database]\ndb_type = mysql\ndb_name = $_REQUEST[db_name]\nhost = $_REQUEST[db_server]\nuser_name = $_REQUEST[db_user]\npassword = $_REQUEST[db_pass]");
                                fclose ($fp);

                           $fp = fopen ('../include/config.php','w');
                                   fputs ($fp,"<?\n");
                                    fputs ($fp,"error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING);\n");
                                   fputs ($fp,"session_start();\n\$config = array();\n");
                                   //fputs ($fp,"\$config = array();\n");
                              

                                $sp = "\$config['BASE_DIR']        =  '$_REQUEST[site_path]';\n"
                                     ."\$config['BASE_URL']        =  '$_REQUEST[site_url]';\n"
                                     ."\$config['CONF_FILE']        =  \$config['BASE_DIR'].'/include/conf.ini';\n"
                                                                         ."\$config['IMG_DIR']        =  \$config['BASE_DIR'].'/images';\n"
                                     ."\$config['IMG_URL']        =  \$config['BASE_URL'].'/images';\n"
                                                                         ."\$config['VDO_DIR']      =  \$config['BASE_DIR'].'/video';\n"
                                                                         ."\$config['VDO_URL']      =  \$config['BASE_URL'].'/video';\n"
                                                                         ."\$config['ADO_DIR']      =  \$config['BASE_DIR'].'/audio';\n"
                                                                         ."\$config['ADO_URL']      =  \$config['BASE_URL'].'/audio';\n"
                                                                         ."\$config['FLVDO_DIR']      =  \$config['BASE_DIR'].'/flvideo';\n"
                                                                         ."\$config['FLVDO_URL']      =  \$config['BASE_URL'].'/flvideo';\n"
                                                                         ."\$config['TMB_DIR']      =  \$config['BASE_DIR'].'/thumb';\n"
                                                                         ."\$config['TMB_URL']      =  \$config['BASE_URL'].'/thumb';\n"
                                                                         ."\$config['baseurl']      =  \$config['BASE_URL'];\n"
                                                                         ."\$config['basedir']      =  \$config['BASE_DIR'];\n"
                                                                         ."\$config['vdodir']       =  \$config['VDO_DIR'];\n"
                                                                         ."\$config['vdourl']       =  \$config['VDO_URL'];\n"
                                                                         ."\$config['audiodir']       =  \$config['ADO_DIR'];\n"
                                                                         ."\$config['audiourl']       =  \$config['ADO_URL'];\n"
                                                                         ."\$config['flvdodir']       =  \$config['FLVDO_DIR'];\n"
                                                                         ."\$config['flvdourl']       =  \$config['FLVDO_URL'];\n"
                                     ."\$config['imgurl']         =  \$config['IMG_URL'];\n"
                                     ."\$config['imgpath']        =  \$config['IMG_DIR'];\n"
                                                                         ."\$config['ffmpeg']       =   '$_REQUEST[ffmpeg_path]';\n"
                                                                         ."\$config['guest_limite'] = 200;\n"
                                     ."require_once(\$config['BASE_DIR'].'/smarty/libs/Smarty.class.php');\n"
                                     ."require_once(\$config['BASE_DIR'].'/classes/mysmarty.class.php');\n"
                                     ."require_once(\$config['BASE_DIR'].'/classes/SConfig.php');\n"
                                     ."require_once(\$config['BASE_DIR'].'/classes/SError.php');\n"
                                     ."require_once(\$config['BASE_DIR'].'/include/adodb/adodb.inc.php');\n"
                                     ."require_once(\$config['BASE_DIR'].'/include/phpmailer/class.phpmailer.php');\n"
                                     ."require_once(\$config['BASE_DIR'].'/classes/SEmail.php');\n\n"
                                     ."\$DBTYPE = 'mysql';\n"
                                     ."\$DBHOST = SConfig::get(\"Database\", \"host\");\n"
                                     ."\$DBUSER = SConfig::get(\"Database\", \"user_name\");\n"
                                     ."\$DBPASSWORD = SConfig::get(\"Database\", \"password\");\n"
                                     ."\$DBNAME = SConfig::get(\"Database\", \"db_name\");\n\n"
                                     ."\$conn = &ADONewConnection(\$DBTYPE);\n"
                                     ."\$conn->PConnect(\$DBHOST, \$DBUSER, \$DBPASSWORD, \$DBNAME);\n\n"
                                     
                                     ."\$sql = \"SELECT * from sconfig\";\n"
                                     ."\$rsc = \$conn->Execute(\$sql);\n\n"
                                     ."if(\$rsc){"
                                     ."while(!\$rsc->EOF)\n"
                                     ."{\n"
                                     ."\$field = \$rsc->fields['soption'];\n"
                                     ."\$config[\$field] = \$rsc->fields['svalue'];\n"
                                     ."STemplate::assign(\$field, \$config[\$field]);\n"
                                     ."@\$rsc->MoveNext();\n"
                                     ."}}\n\n"
                                                                        
                                                                        ."STemplate::assign('bgcolor','#E8E8E8');\n"
                                                                        ."STemplate::assign('BASE_URL',       \$config['BASE_URL']);\n"
                                                                        ."STemplate::assign('BASE_DIR',       \$config['BASE_DIR']);\n"
                                                                        ."STemplate::assign('IMG_URL',        \$config['IMG_URL']);\n"
                                                                        ."STemplate::assign('baseurl',       \$config['BASE_URL']);\n"
                                                                        ."STemplate::assign('basedir',       \$config['BASE_DIR']);\n"
                                                                        ."STemplate::assign('imgurl',        \$config['IMG_URL']);\n"
                                                                        ."STemplate::assign('vdourl',        \$config['VDO_URL']);\n"
                                                                        ."STemplate::assign('adourl',        \$config['ADO_URL']);\n"
                                                                        ."STemplate::assign('flvdourl',       \$config['FLVDO_URL']);\n"
                                                                        ."STemplate::assign('tmburl',        \$config['TMB_URL']);\n"
                                                                        ."STemplate::setCompileDir(\$config['basedir'].\"/templates_c\");\n"
                                    ."STemplate::setTplDir(\$config['basedir'].\"/templates\");\n";
                                   fputs ($fp,$sp);
                                   fputs ($fp,"?>\n");
                                   fclose ($fp);
                                   header("Location: index.php?step=3");
                        }
                }
                include("database.tpl");
        }

        elseif($_REQUEST['step']==3){
        
        
                include("../include/config.php");
                include("../classes/SFile.php");
                echo "<table width='96%' border='0' cellspacing='2' cellpadding='2' align='center'>
                <tr>
                <td width=100%>
                <u><b>Configuring Database</b></u><br><br>";
                include("run_sql.php");
                if($error=="true")
                {
                        echo "Sorry, error occured during installing database defination.<br>
                                Please check database settings in conn.php file again.
                                <br><br>
                                <font color='red'><b>
                                It may occur also if the tables already present in the database.</b></font>
                                <br>";
                
                        echo "<br><br><form name='yesgo' method='POST' action='index.php'>
                        <input type='submit' class='button_red' name='submit' value='Retry Installing'>        
                        <input type='hidden' name='step' value='2'>
                        </form>";
                }
                else
                {
                        echo "Database has been set up successfully.<br><br>
                                Your admin username and password is :<br><br>Username : <b>admin</b><br>Password : <b>admin</b>
                        <br><br>You can login to the admin area <a href='$config[baseurl]/siteadmin'>$config[baseurl]/siteadmin</a>.";
                }

                echo "<br><br></td></tr>";
                echo "<tr> 
                        <td colspan='2' bgcolor='#666666'></td>
                </tr></table>";
        }
?>
<?php
        include("install_footer.tpl");
        ob_end_flush();
?>
