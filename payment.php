<?php
session_start();
include("include/config.php");
include("include/function.php");
include("include/ccinfo.php");
include("include/authorizelib.php");
include("include/country.class.php");

        $UID = base64_decode($_GET['uid']);

        /* Get User Information */
        $sql = "select * from signup where UID=$UID";
        $rs = $conn->execute($sql);
        $email = $rs->fields['email'];
        
        STemplate::assign('fname', $rs->fields['fname']);
        STemplate::assign('lname', $rs->fields['lname']);
        STemplate::assign('city', $rs->fields['city']);
        STemplate::assign('country',country_box($rs->fields['country']));
        
        /* Get Package Information*/
        $sql = "select * from package where pack_id=$_GET[pack]";
        $rs = $conn->execute($sql);
        $package = $rs->getrows();
        $totalprice = $_POST['period']*$package[0]['price'];

        STemplate::assign('package', $package[0]);
        STemplate::assign('totalprice',$totalprice);

        if($_POST['submit'])
        {
                if($_POST['method'] == "Paypal")
                {
                        if($_POST['fname']==null)
                                $err = "Enter your first name.";
                        elseif($_POST['lname']==null)
                                $err = "Enter your last name.";
                        elseif($_POST['city']==null)
                                $err = "Enter your city";
                        elseif($_POST['country']==null)
                                $err = "Enter your country.";
                        else
                        {
                                $conn->execute("update signup set
                                                fname = '$_POST[fname]',
                                                lname = '$_POST[lname]',
                                                city = '$_POST[city]',
                                                country = '$_POST[country]'
                                        where UID = $UID
                                        ");


                                $s_period = $_POST[period]." ".$package[0][period];
                                $theprice = $totalprice;
                                $invoice = $UID."|".$_GET['pack']."|".$s_period."|".$totalprice;

                                /* Paypal Payment */
                                $theamount=$theprice;
                                $uniqueid=$invoice;
                                $business =urlencode($config[paypal_receiver_email]);
                                $item_name = urlencode("For Package : ".$package[0]['pack_name']);
                                $return = "$config[BASE_URL]/pmt_success.php?pack=$_GET[pack]&is_success=1&period=$s_period";
                                $cancel = "$config[BASE_URL]/pmt_success.php?pack=$_GET[pack]&is_success=0";
                                $notify = "$config[BASE_URL]/payment/notify_paypal.php";

                                $return = urlencode($return);
                                $cancel = urlencode($cancel);
                                $notify = urlencode($notify);
                                $first_name = urlencode($_POST['fname']);
                                $last_name = urlencode($_POST['lname']);
                                $city = urlencode($_POST['city']);
                                
                                if($config['enable_test_payment']=="yes")
                                        $url = "www.sandbox.paypal.com";
                                else
                                        $url = "www.paypal.com";

                                $paypal_link="https://$url/cgi-bin/webscr/?cmd=_xclick"
                                                        ."&business=$business"
                                                         ."&item_number=1&item_name=$item_name"
                                                         ."&amount=$theprice&on0=0&custom=$uniqueid"
                                                         ."&currency_code=USD"
                                                         ."&return=$return"
                                                         ."&cancel_return=$cancel"
                                                         ."&notify_url=$notify"
                                                         ."&first_name=$first_name"
                                                         ."&last_name=$last_name"
                                                         ."&city=$city";
                                redirect($paypal_link);
                        }
                                //$success = true;

                }
                elseif($_POST['method'] == "Authorize.net")
                {
                        $msg = validate_billing($_POST);
                        if($msg=="")
                        {
                                $msg = check_authorize($_POST);
                                if($msg=="success")
                                {

                                        $s_period = $_POST[period]." ".$package[0][period];

                                        $userid = $UID;
                                        $pack_id = $_GET['pack'];
                                        $period = $s_period;
                                        $theprice = $totalprice;


                                        $expired_time = date("Y-m-d H:i:s", strtotime("+$period"));

                                        $sql = "update subscriber set
                                                pack_id=$pack_id,
                                                expired_time='$expired_time'
                                                where UID = $userid";
                                        $conn->execute($sql);

                                        $sql = "update signup set
                                                account_status = 'Active'
                                                where UID=$userid";
                                        $conn->execute($sql);

                                        $sql = "select * from signup where UID=$userid";
                                        $rs_u = $conn->execute($sql);


                                        $to = $rs_u->fields['email'];
                                        $name = $config['site_name'];
                                        $from = $config['admin_email'];
                                        $subj = "Payment is received  successfully";

                                        STemplate::assign("userid",$rs_u->fields['UID']);
                                        STemplate::assign("username",$rs_u->fields['username']);
                                        STemplate::assign("pack_id",$pack_id);
                                        STemplate::assign("pack_name",$rs_p->fields['pack_name']);
                                        STemplate::assign("amount", $theprice);
                                        STemplate::assign("period", $period);
                                        STemplate::assign("expired_time", $expired_time);
                                        $body = STemplate::fetch("mail/notify_payment.tpl");
                                        @mailing($to,$name,$from,$subj,$body);
                                        
                                        header("Location: $config[BASE_URL]/pmt_success.php?pack=$_GET[pack]&is_success=1&period=$s_period";);
                                }
                        }

                }
        }
        
        
        if($_POST['method'] == "Authorize.net")
        {
                $country = new I18N_ISO_3166();
                
                STemplate::assign('cc_month',cc_month($_POST['cc_exp_box1']));
                STemplate::assign('cc_year',cc_year($_POST['cc_exp_box2']));
                STemplate::assign('state',state_drop($_POST['cc_states_box']));
                STemplate::assign('country_box',$country->twocountry);
                STemplate::assign('pmt_desc',"For Package: ".$package[0]['pack_name']);
                STemplate::assign('authorizecost',$totalprice);
        }
        
        

        STemplate::assign('err',$err);
        STemplate::assign('head_bottom',"blank.tpl");
        STemplate::display('head1.tpl');
        STemplate::display('err_msg.tpl');
        STemplate::display('payment.tpl');
        STemplate::display('footer.tpl');
?>
