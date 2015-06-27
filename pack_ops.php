<?php
session_start();
include("include/config.php");
include("include/function.php");

        $sql = "select * from package where pack_id=$_GET[pack]";
        $rs = $conn->execute($sql);
        $package = $rs->getrows();
        
        STemplate::assign('package', $package[0]);
        
        $period_ops = "";
        if($package[0]['period']=="Year")
        {
                for($i=1; $i<=5; $i++)
                        $period_ops .= "<option value='$i'>$i</option>";
        }
        elseif($package[0]['period']=="Month")
        {
                for($i=1; $i<=12; $i++)
                        $period_ops .= "<option value='$i'>$i</option>";
        }
        STemplate::assign('period_ops', $period_ops);
        
        if($config['payment_method'] !="")
        {
                $method = explode("|", $config['payment_method']);
                $payment_method_ops = "";
                while(list($k, $v) = each($method))
                {
                        $payment_method_ops .= "<option value='$v'>$v</option>";
                }
                STemplate::assign('payment_method_ops', $payment_method_ops);
        }

        STemplate::assign('err',$err);
        STemplate::assign('head_bottom',"blank.tpl");
        STemplate::display('head1.tpl');
        STemplate::display('err_msg.tpl');
        STemplate::display('pack_ops.tpl');
        STemplate::display('footer.tpl');
?>
