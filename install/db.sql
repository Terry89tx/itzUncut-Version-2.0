-- phpMyAdmin SQL Dump
-- version 2.6.4-pl1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 21, 2006 at 12:20 PM
-- Server version: 4.1.14
-- PHP Version: 5.0.5
--
-- Database: `youtube`
--

-- --------------------------------------------------------

--
-- Table structure for table `audio`
--

DROP TABLE IF EXISTS `audio`;
CREATE TABLE `audio` (
  `VID` bigint(20) NOT NULL auto_increment,
  `UID` bigint(20) NOT NULL default '0',
  `title` varchar(120) NOT NULL default '',
  `description` text NOT NULL,
  `featuredesc` text NOT NULL,
  `keyword` text NOT NULL,
  `channel` varchar(255) NOT NULL default '0|',
  `vdoname` varchar(40) NOT NULL default '',
  `flvdoname` varchar(40) default NULL,
  `duration` float NOT NULL default '0',
  `type` varchar(7) NOT NULL default '',
  `addtime` varchar(20) default NULL,
  `adddate` date NOT NULL default '0000-00-00',
  `record_date` date NOT NULL default '0000-00-00',
  `location` text NOT NULL,
  `country` varchar(120) NOT NULL default '',
  `vkey` varchar(20) NOT NULL default '',
  `viewnumber` bigint(10) NOT NULL default '0',
  `viewtime` datetime NOT NULL default '0000-00-00 00:00:00',
  `com_num` int(8) NOT NULL default '0',
  `fav_num` int(8) NOT NULL default '0',
  `featured` char(3) NOT NULL default 'no',
  `ratedby` bigint(10) NOT NULL default '0',
  `rate` float NOT NULL default '0',
  `filehome` varchar(120) NOT NULL default '',
  `be_comment` char(3) NOT NULL default 'yes',
  `be_rated` char(3) NOT NULL default 'yes',
  `embed` varchar(8) NOT NULL default 'enabled',
  PRIMARY KEY  (`VID`),
  UNIQUE KEY `vkey` (`vkey`)
) TYPE=MyISAM;

CREATE TABLE `adv` (
  `adv_id` bigint(20) NOT NULL auto_increment,
  `adv_name` varchar(255) NOT NULL default '',
  `adv_text` text NOT NULL,
  `adv_status` enum('Active','Inactive') NOT NULL default 'Active',
  PRIMARY KEY  (`adv_id`)
) TYPE=MyISAM AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Table structure for table `buddy_list`
--

DROP TABLE IF EXISTS `buddy_list`;
CREATE TABLE `buddy_list` (
  `username` varchar(80) default NULL,
  `buddy_name` varchar(80) default NULL,
  UNIQUE KEY `username` (`username`,`buddy_name`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
CREATE TABLE `channel` (
  `CHID` bigint(20) NOT NULL auto_increment,
  `name` varchar(120) NOT NULL default '',
  `descrip` text NOT NULL,
  PRIMARY KEY  (`CHID`),
  UNIQUE KEY `name` (`name`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `COMID` bigint(20) NOT NULL auto_increment,
  `VID` bigint(20) NOT NULL default '0',
  `UID` bigint(20) NOT NULL default '0',
  `commen` text NOT NULL,
  `addtime` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`COMID`),
  UNIQUE KEY `VID` (`VID`,`UID`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `comments_audio`
--

DROP TABLE IF EXISTS `comments_audio`;
CREATE TABLE `comments_audio` (
  `COMID` bigint(20) NOT NULL auto_increment,
  `VID` bigint(20) NOT NULL default '0',
  `UID` bigint(20) NOT NULL default '0',
  `commen` text NOT NULL,
  `addtime` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`COMID`),
  UNIQUE KEY `VID` (`VID`,`UID`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `fname` varchar(50) NOT NULL default '',
  `lname` varchar(50) NOT NULL default '',
  `email` varchar(50) NOT NULL default '',
  `submit_date` varchar(15) NOT NULL default '',
  `user_ip` varchar(20) NOT NULL default '',
  `message` varchar(200) NOT NULL default '',
  `subject` varchar(100) NOT NULL default '',
  `flag` varchar(20) NOT NULL default ''
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `emailinfo`
--

DROP TABLE IF EXISTS `emailinfo`;
CREATE TABLE `emailinfo` (
  `email_id` varchar(50) NOT NULL default '',
  `email_subject` varchar(255) NOT NULL default '',
  `email_path` varchar(255) NOT NULL default '',
  `comment` varchar(255) default NULL,
  PRIMARY KEY  (`email_id`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `favourite`
--

DROP TABLE IF EXISTS `favourite`;
CREATE TABLE `favourite` (
  `UID` bigint(20) NOT NULL default '0',
  `VID` bigint(20) NOT NULL default '0',
  UNIQUE KEY `UID` (`UID`,`VID`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `favourite_audio`
--

DROP TABLE IF EXISTS `favourite_audio`;
CREATE TABLE `favourite_audio` (
  `UID` bigint(20) NOT NULL default '0',
  `VID` bigint(20) NOT NULL default '0',
  UNIQUE KEY `UID` (`UID`,`VID`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `feature_req`
--

DROP TABLE IF EXISTS `feature_req`;
CREATE TABLE `feature_req` (
  `VID` bigint(20) NOT NULL default '0',
  `req` bigint(20) NOT NULL default '0',
  `date` varchar(10) default NULL,
  PRIMARY KEY  (`VID`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `feature_req_audio`
--

DROP TABLE IF EXISTS `feature_req_audio`;
CREATE TABLE `feature_req_audio` (
  `VID` bigint(20) NOT NULL default '0',
  `req` bigint(20) NOT NULL default '0',
  `date` varchar(10) default NULL,
  PRIMARY KEY  (`VID`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends` (
  `id` bigint(20) NOT NULL auto_increment,
  `UID` bigint(20) NOT NULL default '0',
  `FID` bigint(20) default NULL,
  `friends_name` varchar(100) NOT NULL default '',
  `friends_type` varchar(255) NOT NULL default 'All',
  `invite_date` date NOT NULL default '0000-00-00',
  `friends_status` enum('Pending','Confirmed','DENIED') NOT NULL default 'Pending',
  PRIMARY KEY  (`id`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `group_mem`
--

DROP TABLE IF EXISTS `group_mem`;
CREATE TABLE `group_mem` (
  `AID` bigint(20) NOT NULL auto_increment,
  `GID` bigint(20) NOT NULL default '0',
  `MID` bigint(20) NOT NULL default '0',
  `member_since` date NOT NULL default '0000-00-00',
  `approved` char(3) NOT NULL default 'yes',
  PRIMARY KEY  (`AID`),
  UNIQUE KEY `GID` (`GID`,`MID`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `group_own`
--

DROP TABLE IF EXISTS `group_own`;
CREATE TABLE `group_own` (
  `GID` bigint(20) NOT NULL auto_increment,
  `gname` varchar(120) NOT NULL default '',
  `keyword` text NOT NULL,
  `gdescn` text NOT NULL,
  `gurl` varchar(80) NOT NULL default '',
  `channel` varchar(120) NOT NULL default '',
  `type` varchar(40) NOT NULL default '',
  `gupload` varchar(40) NOT NULL default '',
  `gposting` varchar(40) NOT NULL default '',
  `gimage` varchar(30) NOT NULL default '',
  `gimage_vdo` bigint(20) default NULL,
  `gcrtime` varchar(30) NOT NULL default '',
  `featured` char(3) NOT NULL default 'no',
  `OID` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`GID`),
  UNIQUE KEY `GID` (`GID`,`OID`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `group_tps`
--

DROP TABLE IF EXISTS `group_tps`;
CREATE TABLE `group_tps` (
  `TID` bigint(20) NOT NULL auto_increment,
  `GID` bigint(20) NOT NULL default '0',
  `UID` bigint(20) NOT NULL default '0',
  `addtime` datetime NOT NULL default '0000-00-00 00:00:00',
  `title` text NOT NULL,
  `VID` bigint(20) NOT NULL default '0',
  `approved` char(3) NOT NULL default 'yes',
  PRIMARY KEY  (`TID`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `group_tps_post`
--

DROP TABLE IF EXISTS `group_tps_post`;
CREATE TABLE `group_tps_post` (
  `PID` bigint(20) NOT NULL auto_increment,
  `TID` bigint(20) NOT NULL default '0',
  `UID` bigint(20) NOT NULL default '0',
  `VID` bigint(20) default NULL,
  `post` text NOT NULL,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`PID`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `group_vdo`
--

DROP TABLE IF EXISTS `group_vdo`;
CREATE TABLE `group_vdo` (
  `AID` bigint(20) NOT NULL auto_increment,
  `GID` bigint(20) NOT NULL default '0',
  `VID` bigint(20) NOT NULL default '0',
  `MID` bigint(20) NOT NULL default '0',
  `approved` char(3) NOT NULL default 'yes',
  PRIMARY KEY  (`AID`),
  UNIQUE KEY `GID` (`GID`,`VID`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `guest_info`
--

DROP TABLE IF EXISTS `guest_info`;
CREATE TABLE `guest_info` (
  `sl` int(4) NOT NULL auto_increment,
  `guest_ip` varchar(16) NOT NULL default '',
  `log_date` date NOT NULL default '0000-00-00',
  `use_bw` bigint(20) NOT NULL default '0',
  UNIQUE KEY `sl` (`sl`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `inappro_req`
--

DROP TABLE IF EXISTS `inappro_req`;
CREATE TABLE `inappro_req` (
  `VID` bigint(20) NOT NULL default '0',
  `req` bigint(20) NOT NULL default '0',
  `date` varchar(10) default NULL
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `inappro_req_audio`
--

DROP TABLE IF EXISTS `inappro_req_audio`;
CREATE TABLE `inappro_req_audio` (
  `VID` bigint(20) NOT NULL default '0',
  `req` bigint(20) NOT NULL default '0',
  `date` varchar(10) default NULL
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `last_5users`
--

DROP TABLE IF EXISTS `last_5users`;
CREATE TABLE `last_5users` (
  `LOGID` bigint(30) NOT NULL auto_increment,
  `UID` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`LOGID`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
CREATE TABLE `package` (
  `pack_id` int(11) NOT NULL auto_increment,
  `pack_name` varchar(255) NOT NULL default '',
  `pack_desc` text NOT NULL,
  `space` bigint(20) NOT NULL default '0',
  `bandwidth` bigint(20) NOT NULL default '0',
  `price` int(11) NOT NULL default '0',
  `video_limit` int(11) default NULL,
  `period` enum('Day','Month','Year') NOT NULL default 'Month',
  `status` enum('Active','Inactive') NOT NULL default 'Active',
  `is_trial` char(3) NOT NULL default 'no',
  `trial_period` int(11) default NULL,
  PRIMARY KEY  (`pack_id`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
CREATE TABLE `playlist` (
  `UID` bigint(20) default NULL,
  `VID` bigint(20) default NULL,
  UNIQUE KEY `UID` (`UID`,`VID`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `playlist_audio`
--

DROP TABLE IF EXISTS `playlist_audio`;
CREATE TABLE `playlist_audio` (
  `UID` bigint(20) default NULL,
  `VID` bigint(20) default NULL,
  UNIQUE KEY `UID` (`UID`,`VID`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `pm`
--

DROP TABLE IF EXISTS `pm`;
CREATE TABLE `pm` (
  `pm_id` bigint(20) NOT NULL auto_increment,
  `subject` varchar(200) NOT NULL default '',
  `body` text NOT NULL,
  `sender` varchar(40) NOT NULL default '',
  `receiver` varchar(40) NOT NULL default '',
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `seen` tinyint(1) NOT NULL default '0',
  `inbox_track` int(11) NOT NULL default '2',
  `outbox_track` int(11) NOT NULL default '2',
  PRIMARY KEY  (`pm_id`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `poll_question`
--

DROP TABLE IF EXISTS `poll_question`;
CREATE TABLE `poll_question` (
  `poll_id` int(4) NOT NULL auto_increment,
  `poll_qty` varchar(250) NOT NULL default '',
  `poll_answer` text NOT NULL,
  `start_date` date NOT NULL default '0000-00-00',
  `end_date` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`poll_id`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `relation`
--

DROP TABLE IF EXISTS `relation`;
CREATE TABLE `relation` (
  `AID` bigint(20) NOT NULL auto_increment,
  `FAID` bigint(20) NOT NULL default '0',
  `FBID` bigint(20) NOT NULL default '0',
  `status` varchar(8) NOT NULL default 'pending',
  `type` varchar(8) NOT NULL default '',
  `e_mail` varchar(80) NOT NULL default '',
  PRIMARY KEY  (`AID`),
  UNIQUE KEY `FAID` (`FAID`,`e_mail`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `sconfig`
--

DROP TABLE IF EXISTS `sconfig`;
CREATE TABLE `sconfig` (
  `soption` varchar(60) NOT NULL default '',
  `svalue` varchar(200) NOT NULL default ''
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

DROP TABLE IF EXISTS `signup`;
CREATE TABLE `signup` (
  `UID` bigint(20) NOT NULL auto_increment,
  `email` varchar(80) NOT NULL default '',
  `username` varchar(80) NOT NULL default '',
  `pwd` varchar(50) NOT NULL default '',
  `fname` varchar(40) NOT NULL default '',
  `lname` varchar(40) NOT NULL default '',
  `bdate` date NOT NULL default '0000-00-00',
  `gender` varchar(6) NOT NULL default '',
  `relation` varchar(8) NOT NULL default '',
  `aboutme` text NOT NULL,
  `website` varchar(120) NOT NULL default '',
  `town` varchar(80) NOT NULL default '',
  `city` varchar(80) NOT NULL default '',
  `zip` varchar(30) NOT NULL default '',
  `country` varchar(80) NOT NULL default '',
  `occupation` text NOT NULL,
  `company` text NOT NULL,
  `school` text NOT NULL,
  `interest_hobby` text NOT NULL,
  `fav_movie_show` text NOT NULL,
  `fav_music` text NOT NULL,
  `fav_book` text NOT NULL,
  `friends_type` varchar(255) NOT NULL default 'All|Family|Friends',
  `video_viewed` int(10) NOT NULL default '0',
  `profile_viewed` int(10) NOT NULL default '0',
  `watched_video` int(10) NOT NULL default '0',
  `addtime` varchar(20) NOT NULL default '',
  `logintime` varchar(20) NOT NULL default '',
  `emailverified` char(3) NOT NULL default 'no',
  `account_status` enum('Active','Inactive') NOT NULL default 'Active',
  `vote` varchar(5) NOT NULL default '',
  `ratedby` varchar(5) NOT NULL default '0',
  `rate` varchar(5) NOT NULL default '0',
  `parents_name` varchar(50) NOT NULL default '',
  `parents_email` varchar(50) NOT NULL default '',
  `friends_name` varchar(50) NOT NULL default '',
  `friends_email` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`UID`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `subscriber`
--

DROP TABLE IF EXISTS `subscriber`;
CREATE TABLE `subscriber` (
  `UID` bigint(20) NOT NULL default '0',
  `pack_id` int(11) NOT NULL default '0',
  `used_space` bigint(20) NOT NULL default '0',
  `used_bw` bigint(20) NOT NULL default '0',
  `total_video` bigint(20) NOT NULL default '0',
  `subscribe_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `expired_time` datetime NOT NULL default '0000-00-00 00:00:00',
  UNIQUE KEY `UID` (`UID`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `uservote`
--

DROP TABLE IF EXISTS `uservote`;
CREATE TABLE `uservote` (
  `candate_id` varchar(15) NOT NULL default '',
  `voter_id` varchar(15) NOT NULL default '',
  `vote` char(2) NOT NULL default '0',
  `voted_date` varchar(12) NOT NULL default ''
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `verify`
--

DROP TABLE IF EXISTS `verify`;
CREATE TABLE `verify` (
  `UID` bigint(20) NOT NULL default '0',
  `vcode` varchar(30) NOT NULL default '',
  PRIMARY KEY  (`UID`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `VID` bigint(20) NOT NULL auto_increment,
  `UID` bigint(20) NOT NULL default '0',
  `title` varchar(120) NOT NULL default '',
  `description` text NOT NULL,
  `featuredesc` text NOT NULL,
  `keyword` text NOT NULL,
  `channel` varchar(255) NOT NULL default '0|',
  `vdoname` varchar(40) NOT NULL default '',
  `flvdoname` varchar(40) default NULL,
  `duration` float NOT NULL default '0',
  `space` bigint(20) NOT NULL default '0',
  `type` varchar(7) NOT NULL default '',
  `addtime` varchar(20) default NULL,
  `adddate` date NOT NULL default '0000-00-00',
  `record_date` date NOT NULL default '0000-00-00',
  `location` text NOT NULL,
  `country` varchar(120) NOT NULL default '',
  `vkey` varchar(20) NOT NULL default '',
  `viewnumber` bigint(10) NOT NULL default '0',
  `viewtime` datetime NOT NULL default '0000-00-00 00:00:00',
  `com_num` int(8) NOT NULL default '0',
  `fav_num` int(8) NOT NULL default '0',
  `featured` char(3) NOT NULL default 'no',
  `ratedby` bigint(10) NOT NULL default '0',
  `rate` float NOT NULL default '0',
  `filehome` varchar(120) NOT NULL default '',
  `be_comment` char(3) NOT NULL default 'yes',
  `be_rated` char(3) NOT NULL default 'yes',
  `embed` varchar(8) NOT NULL default 'enabled',
  `voter_id` varchar(200) NOT NULL default '',
  PRIMARY KEY  (`VID`),
  UNIQUE KEY `vkey` (`vkey`)
) TYPE=MyISAM;

-- --------------------------------------------------------

--
-- Table structure for table `vote_result`
--

DROP TABLE IF EXISTS `vote_result`;
CREATE TABLE `vote_result` (
  `vote_id` varchar(10) NOT NULL default '',
  `voter_id` varchar(20) NOT NULL default '',
  `answer` varchar(250) NOT NULL default '',
  `client_ip` varchar(25) NOT NULL default '',
  `voted_date` date NOT NULL default '0000-00-00'
) TYPE=MyISAM;



INSERT INTO `adv` (`adv_id`, `adv_name`, `adv_text`, `adv_status`) VALUES (1, 'home_top_banner', '<script type="text/javascript"><!--\r\ngoogle_ad_client = "pub-9009981578070829";\r\ngoogle_ad_width = 468;\r\ngoogle_ad_height = 60;\r\ngoogle_ad_format = "468x60_as";\r\ngoogle_ad_type = "text";\r\ngoogle_ad_channel ="6918285018";\r\ngoogle_color_border = "FFFFFF";\r\ngoogle_color_bg = "FFFFFF";\r\ngoogle_color_link = "000000";\r\ngoogle_color_url = "999999";\r\ngoogle_color_text = "666666";\r\n//--></script>\r\n<script type="text/javascript"\r\n  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">\r\n</script>', 'Inactive');
INSERT INTO `adv` (`adv_id`, `adv_name`, `adv_text`, `adv_status`) VALUES (2, 'foot_top_banner', '<TABLE BGCOLOR=#000000 WIDTH=100% ALIGN=center border=0>\r\n<TR>\r\n  <TD align=center >\r\n   <font color=#ff0000>\r\n     Foot top Advertise\r\n   </font>\r\n  </TD>\r\n</TR>\r\n</TABLE>', 'Inactive');
INSERT INTO `adv` (`adv_id`, `adv_name`, `adv_text`, `adv_status`) VALUES (6, 'foot_bottom_banner', '<i>This is footer bottom banner</i>', 'Inactive');
INSERT INTO `adv` (`adv_id`, `adv_name`, `adv_text`, `adv_status`) VALUES (3, 'home_right_box', '<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=100% BGCOLOR=#FFFFFF>\r\n                <TR>\r\n                        <TD >\r\n                                Hellow!!!\r\n                        </TD>\r\n                </TR>\r\n                </TABLE>', 'Inactive');
INSERT INTO `adv` (`adv_id`, `adv_name`, `adv_text`, `adv_status`) VALUES (4, 'video_right_single', 'Hello ', 'Inactive');
INSERT INTO `adv` (`adv_id`, `adv_name`, `adv_text`, `adv_status`) VALUES (5, 'home_top_single', 'hysakdjfhasd fkjh', 'Inactive');
INSERT INTO `adv` (`adv_id`, `adv_name`, `adv_text`, `adv_status`) VALUES (7, 'resulation_based_left_add', 'This is my left side resulation based advertise.', 'Active');
INSERT INTO `adv` (`adv_id`, `adv_name`, `adv_text`, `adv_status`) VALUES (8, 'resulation_based_right_add', 'THIS IS MY RIGHT SIDE RESULATIN BASED ADVERTISE.', 'Active');

--
-- Dumping data for table `emailinfo`
--

INSERT INTO `emailinfo` (`email_id`, `email_subject`, `email_path`, `comment`) VALUES ('verify_email', 'About email verification', 'emails/verify_email.tpl', 'Email Verification');
INSERT INTO `emailinfo` (`email_id`, `email_subject`, `email_path`, `comment`) VALUES ('invite_email', 'Friendship invitation from  $sender_name', 'emails/invite_email.tpl', 'To invite a friend');
INSERT INTO `emailinfo` (`email_id`, `email_subject`, `email_path`, `comment`) VALUES ('invite_group_email', '$sender_name has invited you to join YouTube group $gname', 'emails/invite_group_email.tpl', 'Send invitation to join a group');
INSERT INTO `emailinfo` (`email_id`, `email_subject`, `email_path`, `comment`) VALUES ('recover_password', 'Your site login password', 'emails/recover_password.tpl', 'Recovering user login password');
INSERT INTO `emailinfo` (`email_id`, `email_subject`, `email_path`, `comment`) VALUES ('parents_varification_email', 'About email varification', 'emails/parents_varification_email.tpl', 'mail to parents after registration');
INSERT INTO `emailinfo` (`email_id`, `email_subject`, `email_path`, `comment`) VALUES ('friends_email', 'Your friend has registered in $site_name', 'emails/friends_email.tpl', 'mail to friends after registration');
INSERT INTO `emailinfo` (`email_id`, `email_subject`, `email_path`, `comment`) VALUES ('registration_greeting_mail', 'Tank you form registration here.', 'emails/registration_greeting_mail.tpl', 'registration greeting mail');

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`pack_id`, `pack_name`, `pack_desc`, `space`, `bandwidth`, `price`, `video_limit`, `period`, `status`, `is_trial`, `trial_period`) VALUES (1, 'Gold', 'For ultimate service', 20100, 6000, 100, 501, 'Year', 'Active', 'no', NULL);
INSERT INTO `package` (`pack_id`, `pack_name`, `pack_desc`, `space`, `bandwidth`, `price`, `video_limit`, `period`, `status`, `is_trial`, `trial_period`) VALUES (3, 'Silver', 'This is for medium user', 512, 4000, 50, 0, 'Month', 'Active', 'no', NULL);
INSERT INTO `package` (`pack_id`, `pack_name`, `pack_desc`, `space`, `bandwidth`, `price`, `video_limit`, `period`, `status`, `is_trial`, `trial_period`) VALUES (4, 'Free Trial', 'Join now to test the system.', 200, 400, 0, 100, 'Month', 'Active', 'yes', 600);
INSERT INTO `package` (`pack_id`, `pack_name`, `pack_desc`, `space`, `bandwidth`, `price`, `video_limit`, `period`, `status`, `is_trial`, `trial_period`) VALUES (5, 'Copur', 'Copur', 2000, 5000, 75, 100, 'Month', 'Active', 'no', NULL);
INSERT INTO `package` (`pack_id`, `pack_name`, `pack_desc`, `space`, `bandwidth`, `price`, `video_limit`, `period`, `status`, `is_trial`, `trial_period`) VALUES (6, 'Steal', 'Steal', 1000, 4500, 25, 20, 'Month', 'Active', 'no', NULL);

--
-- Dumping data for table `sconfig`
--

INSERT INTO `sconfig` (`soption`, `svalue`) VALUES ('admin_email', 'admin@localhost');
INSERT INTO `sconfig` (`soption`, `svalue`) VALUES ('admin_name', 'admin');
INSERT INTO `sconfig` (`soption`, `svalue`) VALUES ('site_name', 'Youtube Clone');
INSERT INTO `sconfig` (`soption`, `svalue`) VALUES ('admin_pass', 'admin');
INSERT INTO `sconfig` (`soption`, `svalue`) VALUES ('total_per_ini', '400');
INSERT INTO `sconfig` (`soption`, `svalue`) VALUES ('emailsender', 'Admin');
INSERT INTO `sconfig` (`soption`, `svalue`) VALUES ('max_img_size', '200');
INSERT INTO `sconfig` (`soption`, `svalue`) VALUES ('img_max_width', '120');
INSERT INTO `sconfig` (`soption`, `svalue`) VALUES ('img_max_height', '90');
INSERT INTO `sconfig` (`soption`, `svalue`) VALUES ('max_display_size', '400');
INSERT INTO `sconfig` (`soption`, `svalue`) VALUES ('items_per_page', '4');
INSERT INTO `sconfig` (`soption`, `svalue`) VALUES ('max_video_size', '100000000');
INSERT INTO `sconfig` (`soption`, `svalue`) VALUES ('rel_video_per_page', '2');
INSERT INTO `sconfig` (`soption`, `svalue`) VALUES ('recently_viewed_video', '4');
INSERT INTO `sconfig` (`soption`, `svalue`) VALUES ('flashplayer', 'yes');
INSERT INTO `sconfig` (`soption`, `svalue`) VALUES ('activexinstall', 'no');
INSERT INTO `sconfig` (`soption`, `svalue`) VALUES ('enable_package', 'no');
INSERT INTO `sconfig` (`soption`, `svalue`) VALUES ('paypal_receiver_email', '');
INSERT INTO `sconfig` (`soption`, `svalue`) VALUES ('payment_method', 'Paypal|Authorize.net');
INSERT INTO `sconfig` (`soption`, `svalue`) VALUES ('enable_test_payment', 'no');
INSERT INTO `sconfig` (`soption`, `svalue`) VALUES ('authorizelogin', '');
INSERT INTO `sconfig` (`soption`, `svalue`) VALUES ('authorizekey', '');
INSERT INTO `sconfig` (`soption`, `svalue`) VALUES ('lfubannar', 'Enable');
INSERT INTO `sconfig` (`soption`, `svalue`) VALUES ('pollinganel', 'Enable');
INSERT INTO `sconfig` (`soption`, `svalue`) VALUES ('user_poll', 'Once');
INSERT INTO `sconfig` (`soption`, `svalue`) VALUES ('video_rating', 'Once');

