<?php
        include("../include/config.php");
        include("../include/function.php");

        if($_REQUEST['submit'])
        {
                $sql = "update sconfig set svalue='$_REQUEST[site_name]' where soption='site_name'";
                $conn->execute($sql);
                $sql = "update sconfig set svalue='$_REQUEST[admin_name]' where soption='admin_name'";
                $conn->execute($sql);
                $sql = "update sconfig set svalue='$_REQUEST[admin_email]' where soption='admin_email'";
                $conn->execute($sql);
                $sql = "update sconfig set svalue='$_REQUEST[admin_pass]' where soption='admin_pass'";
                $conn->execute($sql);
                $sql = "update sconfig set svalue='$_REQUEST[items_per_page]' where soption='items_per_page'";
                $conn->execute($sql);
                $sql = "update sconfig set svalue='$_REQUEST[enable_package]' where soption='enable_package'";
                $conn->execute($sql);
                                $sql = "update sconfig set svalue='$_REQUEST[selLFUBannar]' where soption='lfubannar'";
                $conn->execute($sql);
                                $sql = "update sconfig set svalue='$_REQUEST[selPPanel]' where soption='pollinganel'";
                $conn->execute($sql);
                                
                if($config['enable_package']=="yes")
                {
                        if($_REQUEST[method] == "")
                                $err = "Select one or more payment methods";
                        else
                        {
                                $payment_method = implode("|", $_REQUEST[method]);
                                $sql = "update sconfig set svalue='$payment_method' where soption='payment_method'";
                                $conn->execute($sql);
                        }
                        $sql = "update sconfig set svalue='$_REQUEST[paypal_receiver_email]' where soption='paypal_receiver_email'";
                        $conn->execute($sql);
                        $sql = "update sconfig set svalue='$_REQUEST[enable_test_payment]' where soption='enable_test_payment'";
                        $conn->execute($sql);
                        $sql = "update sconfig set svalue='$_REQUEST[authorizelogin]' where soption='authorizelogin'";
                        $conn->execute($sql);
                        $sql = "update sconfig set svalue='$_REQUEST[authorizekey]' where soption='authorizekey'";
                        $conn->execute($sql);
                }

                if($err == "")
                        header("location: settings.php?msg=System settings updated successfully");
        }
        
        if($config['enable_package']=='yes')
                $yessel = "selected";
        else
                $nosel = "selected";
                
        $ops = "<option value='yes' $yessel>Enable Package</option>
                <option value='no' $nosel>Free Service</option>";
        STemplate::assign("service_ops", $ops);
        
        if($config['payment_method']!="")
        {
                $method = explode("|", $config['payment_method']);
                while(list($k, $v) = each($method))
                {
                        if($v == "Paypal")
                                $pay_checked = "Checked";
                        elseif($v == "Authorize.net")
                                $aut_checked = "Checked";
                }
        }

        $payment_method_ops = "<input type=checkbox name='method[]' value='Paypal' $pay_checked> Paypal<br>
                                <input type=checkbox name='method[]' value='Authorize.net' $aut_checked> Authorize.net";


        STemplate::assign('payment_method_ops', $payment_method_ops);

        if($_REQUEST[msg]!="") $msg=$_REQUEST[msg];
        Stemplate::assign('err',$err);
        Stemplate::assign('msg',$msg);
        STemplate::display("siteadmin/settings.tpl");
?>
