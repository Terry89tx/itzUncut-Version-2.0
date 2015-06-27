<?php
        include("include/config.php");
        include("include/function.php");

        if($_GET['is_success']==1)
        {
                $success = "true";
                STemplate::assign('exp_date', date('Y-m-d', strtotime("+$_GET[period]")));
        }
        elseif($_GET['is_success']==0)
        {
                $success = "false";
        }

        STemplate::assign('success', $success);
        
        STemplate::assign('err',$err);
        STemplate::assign('head_bottom',"blank.tpl");
        STemplate::display('head1.tpl');
        STemplate::display('err_msg.tpl');
        STemplate::display('pmt_success.tpl');
        STemplate::display('footer.tpl');
?>
