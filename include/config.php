<?
error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING);
session_start();
$config = array();
$config['BASE_DIR']        =  'c:\\MyWeb';
$config['BASE_URL']        =  'http://localhost';
$config['CONF_FILE']        =  $config['BASE_DIR'].'/include/conf.ini';
$config['IMG_DIR']        =  $config['BASE_DIR'].'/images';
$config['IMG_URL']        =  $config['BASE_URL'].'/images';
$config['VDO_DIR']      =  $config['BASE_DIR'].'/video';
$config['VDO_URL']      =  $config['BASE_URL'].'/video';
$config['ADO_DIR']      =  $config['BASE_DIR'].'/audio';
$config['ADO_URL']      =  $config['BASE_URL'].'/audio';
$config['FLVDO_DIR']      = $config['BASE_DIR'].'/flvideo';
$config['FLVDO_URL']      = $config['BASE_URL'].'/flvideo';
$config['TMB_DIR']      =  $config['BASE_DIR'].'/thumb';
$config['TMB_URL']      =  $config['BASE_URL'].'/thumb';
$config['baseurl']        =  $config['BASE_URL'];
$config['basedir']        =  $config['BASE_DIR'];
$config['VDO_DIR']      =  $config['BASE_DIR'].'/video';
$config['VDO_URL']      =  $config['BASE_URL'].'/video';
$config['ADO_DIR']      =  $config['BASE_DIR'].'/audio';
$config['ADO_URL']      =  $config['BASE_URL'].'/audio';
$config['FLVDO_DIR']      =  $config['BASE_DIR'].'/flvideo';
$config['FLVDO_URL']      =  $config['BASE_URL'].'/flvideo';
$config['TMB_DIR']      =  $config['BASE_DIR'].'/thumb';
$config['TMB_URL']      =  $config['BASE_URL'].'/thumb';
$config['baseurl']      =  $config['BASE_URL'];
$config['basedir']      =  $config['BASE_DIR'];
$config['vdodir']       =  $config['VDO_DIR'];
$config['vdourl']       =  $config['VDO_URL'];
$config['audiodir']       =  $config['ADO_DIR'];
$config['audiourl']       =  $config['ADO_URL'];
$config['flvdodir']       =  $config['FLVDO_DIR'];
$config['flvdourl']       =  $config['FLVDO_URL'];
$config['imgurl']         =  $config['IMG_URL'];
$config['imgpath']        =  $config['IMG_DIR'];
$config['ffmpeg']       =   '/usr/bin/ffmpeg';
$config['guest_limite'] = 200;
$msg='';
$err='';
$config['rows_per_page']='';
$config['cols_per_page']='';
require_once($config['BASE_DIR'].'/smarty/libs/Smarty.class.php');
require_once($config['BASE_DIR'].'/classes/mysmarty.class.php');
require_once($config['BASE_DIR'].'/classes/SConfig.php');
require_once($config['BASE_DIR'].'/classes/SError.php');
require_once($config['BASE_DIR'].'/include/adodb/adodb.inc.php');
require_once($config['BASE_DIR'].'/include/phpmailer/class.phpmailer.php');
require_once($config['BASE_DIR'].'/classes/SEmail.php');

$DBTYPE = 'mysql';
$DBHOST = SConfig::get("Database", "host");
$DBUSER = SConfig::get("Database", "user_name");
$DBPASSWORD = SConfig::get("Database", "password");
$DBNAME = SConfig::get("Database", "db_name");

$conn = &ADONewConnection($DBTYPE);
$conn->PConnect($DBHOST, $DBUSER, $DBPASSWORD, $DBNAME);

$sql = "SELECT * from sconfig";
$rsc = $conn->Execute($sql);

if($rsc){while(!$rsc->EOF)
{
$field = $rsc->fields['soption'];
$config[$field] = $rsc->fields['svalue'];
STemplate::assign($field, $config[$field]);
@$rsc->MoveNext();
}}

STemplate::assign('bgcolor','#E8E8E8');
STemplate::assign('BASE_URL',       $config['BASE_URL']);
STemplate::assign('BASE_DIR',       $config['BASE_DIR']);
STemplate::assign('IMG_URL',        $config['IMG_URL']);
STemplate::assign('baseurl',       $config['BASE_URL']);
STemplate::assign('basedir',       $config['BASE_DIR']);
STemplate::assign('imgurl',        $config['IMG_URL']);
STemplate::assign('vdourl',        $config['VDO_URL']);
STemplate::assign('adourl',        $config['ADO_URL']);
STemplate::assign('flvdourl',       $config['FLVDO_URL']);
STemplate::assign('tmburl',        $config['TMB_URL']);
STemplate::setCompileDir($config['basedir']."/templates_c");
STemplate::setTplDir($config['basedir']."/templates");
?>
