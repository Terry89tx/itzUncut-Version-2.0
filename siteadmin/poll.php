<?php
                ## MY INI
        include("../include/config.php");
        include("../include/function.php");
        
        if($_REQUEST['btnSubmit']!=""){


                                # FORMATING START DATE 
                                $end_day=$_REQUEST['selEndYear'];
                                $end_day.="-";
                                $end_day.=$_REQUEST['selEndMonth'];
                                $end_day.="-";
                                $end_day.=$_REQUEST['selEndDay'];



                                # FORMATING END DATE 
                                $start_day=$_REQUEST['selStartYear'];
                                $start_day.="-";
                                $start_day.=$_REQUEST['selStartMonth'];
                                $start_day.="-";
                                $start_day.=$_REQUEST['selStartDay'];

                                

                                


                                # DATE CHECKING...
                                if ($_REQUEST['selStartYear']>$_REQUEST['selEndYear']){
                                                $err="Invalid date range or can not overlap.";
                                }
                                        else if ($_REQUEST['selStartMonth']>$_REQUEST['selEndMonth']){
                                                        $err="Invalid date range or can not overlap.";                        
                                        }
                                                else if ($_REQUEST['selStartDay']>$_REQUEST['selEndDay']){
                                                                $err="Invalid date range or can not overlap.";                        
                                                }
                                        
                                # INSERTING NEW POL QUESTION
                                                $sql= "SELECT * FROM poll_question WHERE start_date<='$start_day' and end_date>='$start_day' or start_date<='$end_day' and end_date>='$end_day'"; 
                                                //echo $sql;
                                                $rs=$conn-> Execute($sql);
                                                $resutl=$rs->RecordCount( );
                                                

                                                if ($resutl>0){
                                                        $err="Date has overlap with previour one.";
                                                }


                                if($err==""){
                                
                                                # FORMATIN ANSWERS...
                                                $ansBank="";
                                                for($i=0;$i<$_REQUEST[txtAnsQty];$i++){
                                                                $xx="voteAnsBox".$i;
                                                                ## TO ADD LESS THEN ONE PIPE 
                                                                if($ansBank!=""){$ansBank.="|";}

                                                                $ansBank.=$_REQUEST[$xx];
                                                                

                                                }
                                                                        



                                                # INSERTING NEW POL QUESTION
                                                $sql= " INSERT INTO poll_question set 
                                                                                poll_qty='$_REQUEST[txtQtn]',
                                                                                poll_answer='$ansBank',
                                                                                start_date='$start_day',
                                                                                end_date='$end_day'";
                                                 $rs=$conn-> Execute($sql);

                                                 if($rs){
                                                                $err="Submit successfull";
                                                 }

                                }
        }
                                        

                ## COLLECT DATE AND MONTH FOR SELECT INPUT 
                $month=months();
                $dayes=days();
                $year=cc_year();

                Stemplate::assign('err',$err);
                Stemplate::assign('msg',$msg);
                Stemplate::assign('dayes',$dayes);
                Stemplate::assign('month',$month);
                Stemplate::assign('year',$year);
                STemplate::display("siteadmin/poll.tpl");
?>
