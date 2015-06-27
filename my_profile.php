<?php
session_start();
include("include/config.php");
include("include/function.php");
chk_member_login();


if($_REQUEST[update_profile]!="")
{
        $bdate=$_REQUEST[year]."-".$_REQUEST[month]."-".$_REQUEST[day];
        if($_REQUEST[email]=="") $err="Signup: Email should not be null.";
//        elseif(!check_email($_REQUEST[email]) && $_REQUEST[prevemail]!="$_REQUEST[email]") $err="Signup: Invalid Email format!";
        elseif(check_field_exists($_REQUEST[email],"email","signup")==1 && $_REQUEST[prevemail]!="$_REQUEST[email]")$err="Signup: This email already exist!";
        elseif($_REQUEST[password1]=="") $err="Signup: Password should not be null.";
        elseif($_REQUEST[password1]!=$_REQUEST[password2]) $err="Signup: Retype does not match.";
        elseif($bdate!="yyyy-mm-dd"){if(!checkdate($_REQUEST[month],$_REQUEST[day],$_REQUEST[year])) $err="Invalid date format";}
        if($err=="")
        {
        $addition="";
        $addition.="fname='$_REQUEST[fname]',";
        $addition.="lname='$_REQUEST[lname]',";
        if($bdate!="yyy-mm-dd")$addition.="bdate='$bdate',";
        if($_REQUEST[gender]!="---")$addition.="gender='$_REQUEST[gender]',";
        if($_REQUEST[relation]!="---")$addition.="relation='$_REQUEST[relation]',";
        $addition.="aboutme='$_REQUEST[aboutme]',";
        $addition.="website='$_REQUEST[url]',";
        $addition.="town='$_REQUEST[hometown]',";
        $addition.="city='$_REQUEST[city]',";
        $addition.="zip='$_REQUEST[zip]',";
        if($_REQUEST[country]!="Select Country")$addition.="country='$_REQUEST[country]',";
        $addition.="occupation='$_REQUEST[occupation]',";
        $addition.="company='$_REQUEST[companies]',";
        $addition.="school='$_REQUEST[schools]',";
        $addition.="interest_hobby='$_REQUEST[hobbies]',";
        $addition.="fav_movie_show='$_REQUEST[movies]',";
        $addition.="fav_music='$_REQUEST[music]',";
        $addition.="fav_book='$_REQUEST[books]',";
        $sql="update signup set
                email='$_REQUEST[email]',
                $addition
                pwd='$_REQUEST[password1]' WHERE UID=$_SESSION[UID]";
        $conn->execute($sql);

        if(mysql_affected_rows()==1)
        {
        if($_REQUEST[prevemail]!="$_REQUEST[email]")
                {
                $ran=time().rand(1,99999999);
                $sql="update verify as v, signup as s set
                        v.vcode='$ran',
                        s.emailverified='no' WHERE v.UID=s.UID and v.UID=$_SESSION[UID]";
                $conn->execute($sql);
                STemplate::assign('vcode',$ran);
                
                $to=$_REQUEST[email];
                $_SESSION[EMAIL]=$_REQUEST[email];
                $name=$config['site_name'];
                $from=$config['admin_email'];

                $rs = $conn->execute("select * from emailinfo where email_id='verify_email'");
                $subj = $rs->fields['email_subject'];
                $email_path = $rs->fields['email_path'];
                $mailbody=STemplate::fetch($email_path);
                mailing($to,$name,$from,$subj,$mailbody,$bcc="");
                session_to_db();
                }
        }
        }
}

$sql="select * from signup WHERE UID=$_SESSION[UID]";
$rs=$conn->execute($sql);
$date=explode("-",$rs->fields[bdate]);
STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('days',days($date[2]));
STemplate::assign('months',months($date[1]));
STemplate::assign('years',years($date[0]));
STemplate::assign('country',country_box($_REQUEST[country]));
STemplate::assign('answers',$rs->getarray());
STemplate::assign('head_bottom',"homelinks.tpl");
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('my_profile.tpl');
STemplate::display('footer.tpl');
?>
