<?php
session_start();
include("include/config.php");
include("include/function.php");

if($config['enable_package']=="yes")
{
        if($_POST['submit'])
        {
                if($_POST['pack_id']=="")
                        $err = "To renew your account select one of the available packages";
                else
                        header("Location: pack_ops.php?pack=$_POST[pack_id]&uid=$_GET[uid]");
        }

        $sql = "select * from package where status = 'Active' and is_trial<>'yes' order by price desc";
        $rs = $conn->execute($sql);

        STemplate::assign('package', $rs->getrows());
}

STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('head_bottom',"homelinks.tpl");
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('renew_account.tpl');
STemplate::display('footer.tpl');
?>
