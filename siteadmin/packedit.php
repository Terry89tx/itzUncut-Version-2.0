<?php
        include("../include/config.php");
        include("../include/function.php");
        
        if($_REQUEST['edit_package'])
        {
                $sql = "update package set
                                pack_name = '$_REQUEST[pack_name]',
                                pack_desc = '$_REQUEST[pack_desc]',
                                space = '$_REQUEST[space]',
                                bandwidth = '$_REQUEST[bandwidth]',
                                price = '$_REQUEST[price]',
                                video_limit = '$_REQUEST[video_limit]',
                                period = '$_REQUEST[period]',
                                status = '$_REQUEST[status]'
                        where pack_id=$_REQUEST[pack_id]";
                $conn->execute($sql);
                
                if($err == "")
                        header("Location: packedit.php?action=edit&pack_id=$_REQUEST[pack_id]&page=$_REQUEST[page]&msg=Package+information+updated+successfully");
                                
        }
        
        if($_REQUEST['add_package'])
        {
                if($_REQUEST[pack_name]=="")
                        $err = "Enter package name";
                elseif($_REQUEST[pack_desc]=="")
                        $err = "Provide package description";
                elseif($_REQUEST[space]=="")
                        $err = "Enter space size for each user";
                elseif($_REQUEST[bandwidth]=="")
                        $err = "Enter bandwidth size for each user";
                elseif($_REQUEST[price]=="")
                        $err = "Enter price for this package";

                if($err=="")
                {
                        $sql = "insert package set
                                pack_name = '$_REQUEST[pack_name]',
                                pack_desc = '$_REQUEST[pack_desc]',
                                space = '$_REQUEST[space]',
                                bandwidth = '$_REQUEST[bandwidth]',
                                price = '$_REQUEST[price]',
                                video_limit = '$_REQUEST[video_limit]',
                                period = '$_REQUEST[period]',
                                status = '$_REQUEST[status]'";
                        $conn->execute($sql);
                }
                if($err == "")
                        header("Location: packedit.php?action=add&msg=Package+added+successfully");
        }

        if($_REQUEST['pack_id']!="")
        {
                $rs = $conn->execute("select * from package where pack_id=$_REQUEST[pack_id]");
                $package = $rs->getrows();
                Stemplate::assign('package', $package[0]);
                
                if($package[0]['period'] == "Day")
                        $daysel = "selected";
                elseif($package[0]['period'] == "Month")
                        $monthsel = "selected";
                elseif($package[0]['period'] == "Year")
                        $yearsel = "selected";

                if($package[0]['status'] == "Active")
                        $actsel = "selected";
                elseif($package[0]['status'] == "Inactive")
                        $inactsel = "selected";

        }
        
        $period_ops = "<option value='Month' $monthsel>Month</option>
                        <option value='Year' $yearsel>Year</option>";
        STemplate::assign('period_ops', $period_ops);
        
        $status_ops = "<option value='Active' $actsel>Active</option>
                        <option value='Inactive' $inactsel>Inactive</option>";
        STemplate::assign('status_ops', $status_ops);

        if($_REQUEST[msg]!="") $msg=$_REQUEST[msg];
        Stemplate::assign('err',$err);
        Stemplate::assign('msg',$msg);
        STemplate::display("siteadmin/packedit.tpl");
?>
