<?php
        include("../include/config.php");
        include("../include/function.php");
        
        if($_REQUEST['submit'])
        {
                $sql = "update signup set
                                email = '$_REQUEST[email]',
                                fname = '$_REQUEST[fname]',
                                lname = '$_REQUEST[lname]',
                                city = '$_REQUEST[city]',
                                country = '$_REQUEST[country]',
                                website = '$_REQUEST[website]',
                                occupation = '$_REQUEST[occupation]',
                                company = '$_REQUEST[company]',
                                school = '$_REQUEST[school]',
                                interest_hobby = '$_REQUEST[interest_hobby]',
                                fav_movie_show = '$_REQUEST[fav_movie_show]',
                                fav_book = '$_REQUEST[fav_book]',
                                fav_music = '$_REQUEST[fav_music]',
                                aboutme = '$_REQUEST[aboutme]',
                                emailverified = '$_REQUEST[emailverified]',
                                account_status = '$_REQUEST[account_status]'
                        where UID=$_REQUEST[uid]";
                $conn->execute($sql);
                header("Location: useredit.php?action=edit&uid=$_REQUEST[uid]&page=$_REQUEST[page]&msg=User+information+updated+successfully");
        }

        $rs = $conn->execute("select * from signup where UID=$_REQUEST[uid]");
        $user = $rs->getrows();
        STemplate::assign('country_box',country_box($user[0]['country']));
        
        if($user[0]['emailverified']=="yes")
                $yessel = "selected";
        else
                $nosel = "selected";
        $email_ver_box = "<option value='yes' $yessel>Yes</option>
                          <option value='no' $nosel>No</option>";
        STemplate::assign('email_ver_box', $email_ver_box);
        
        if($user[0]['account_status']=="Active")
                $activesel = "selected";
        else
                $inactivesel = "selected";
        $account_status_box = "<option value='Active' $activesel>Active</option>
                          <option value='Inactive' $inactivesel>Inactive</option>";
        STemplate::assign('account_status_box', $account_status_box);


        if($_REQUEST[msg]!="") $msg=$_REQUEST[msg];
        Stemplate::assign('user', $user[0]);
        Stemplate::assign('err',$err);
        Stemplate::assign('msg',$msg);
        STemplate::display("siteadmin/useredit.tpl");
?>
