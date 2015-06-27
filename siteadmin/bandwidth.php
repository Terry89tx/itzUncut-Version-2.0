<?php
                # My setting
        include("../include/config.php");
        include("../include/function.php");


        # RESTE BANDWIDTH process
                if(isset($_REQUEST['btnRestBandwidth'])){
                                
                                $sql="UPDATE  subscriber set used_bw='0'";
                                $restult=$conn->Execute($sql);
                                $count=$conn->Affected_Rows();
                        
                                # Check SQL error
                                if(isset($count)){
                                        $msg="<B>All subscriber or user's bandwidth has rest to 0.</B>";
                                }
                                else{
                                        $msg="<B>Sorry server</B>";
                                }
                }
                
        


                
                # My templates
        Stemplate::assign('msg',$msg);
        STemplate::display("siteadmin/bandwidth.tpl");
?>
