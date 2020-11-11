-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2017 at 03:33 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xicia_newstree`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_advertisement`
--

CREATE TABLE `tbl_advertisement` (
  `adv_id` int(11) NOT NULL,
  `adv_location` varchar(255) NOT NULL,
  `adv_photo` varchar(255) NOT NULL,
  `adv_url` varchar(255) NOT NULL,
  `adv_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_advertisement`
--

INSERT INTO `tbl_advertisement` (`adv_id`, `adv_location`, `adv_photo`, `adv_url`, `adv_status`) VALUES
(1, 'Under Featured News', 'advertisement-1.png', '', 'Show'),
(2, 'Sidebar Top', 'advertisement-2.png', '', 'Show'),
(3, 'Sidebar Bottom', 'advertisement-3.png', '#', 'Show');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_slug` varchar(255) NOT NULL,
  `status` varchar(30) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keyword` text NOT NULL,
  `meta_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `category_name`, `category_slug`, `status`, `meta_title`, `meta_keyword`, `meta_description`) VALUES
(16, 'Business', 'business', 'Active', 'Business - Meta Title', 'Business - Meta Keyword', 'Business - Meta Description'),
(17, 'Science', 'science', 'Active', 'Science - Meta Title', 'Science - Meta Keyword', 'Science - Meta Description'),
(18, 'Health', 'health', 'Active', 'Health - Meta Title', 'Health - Meta Keyword', 'Health - Meta Description'),
(19, 'Sport', 'sport-news', 'Active', 'Sport - Meta Title', 'Sport - Meta Keyword', 'Sport - Meta Description'),
(20, 'Travel', 'travel', 'Active', 'Travel - Meta Title', 'Travel - Meta Keyword', 'Travel - Meta Description'),
(21, 'Entertainment', 'entertainment', 'Active', 'Entertainment - Meta Title', 'Entertainment - Meta Keyword', 'Entertainment - Meta Description'),
(22, 'Food', 'food', 'Active', 'Food - Meta Title', 'Food - Meta Keyword', 'Food - Meta Description'),
(23, 'Nature', 'nature', 'Active', 'Nature - Meta Title', 'Nature - Meta Keyword', 'Nature - Meta Description');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category_photo`
--

CREATE TABLE `tbl_category_photo` (
  `p_category_id` int(11) NOT NULL,
  `p_category_name` varchar(255) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_category_photo`
--

INSERT INTO `tbl_category_photo` (`p_category_id`, `p_category_name`, `status`) VALUES
(1, 'Gallery 1', 'Active'),
(2, 'Gallery 2', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category_video`
--

CREATE TABLE `tbl_category_video` (
  `v_category_id` int(11) NOT NULL,
  `v_category_name` varchar(255) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_category_video`
--

INSERT INTO `tbl_category_video` (`v_category_id`, `v_category_name`, `status`) VALUES
(1, 'Video Category 1', 'Active'),
(2, 'Video Category 2', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comment`
--

CREATE TABLE `tbl_comment` (
  `id` int(11) NOT NULL,
  `code_body` text NOT NULL,
  `code_main` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_comment`
--

INSERT INTO `tbl_comment` (`id`, `code_body`, `code_main`) VALUES
(1, '<div id="fb-root"></div>\r\n<script>(function(d, s, id) {\r\n  var js, fjs = d.getElementsByTagName(s)[0];\r\n  if (d.getElementById(id)) return;\r\n  js = d.createElement(s); js.id = id;\r\n  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.10&appId=323620764400430";\r\n  fjs.parentNode.insertBefore(js, fjs);\r\n}(document, ''script'', ''facebook-jssdk''));</script>', '<div class="fb-comments" data-href="https://developers.facebook.com/docs/plugins/comments#configurator" data-numposts="5"></div>');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_file`
--

CREATE TABLE `tbl_file` (
  `file_id` int(11) NOT NULL,
  `file_title` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_home_category`
--

CREATE TABLE `tbl_home_category` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `category_order` varchar(10) NOT NULL,
  `category_layout` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_home_category`
--

INSERT INTO `tbl_home_category` (`id`, `category_id`, `category_order`, `category_layout`) VALUES
(14, 16, '2', '2 Columns'),
(15, 17, '', ''),
(16, 18, '', ''),
(17, 19, '1', '2 Columns'),
(18, 20, '4', '1 Column'),
(19, 21, '3', '1 Column'),
(20, 22, '', ''),
(21, 23, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `menu_id` int(11) NOT NULL,
  `menu_type` varchar(255) NOT NULL,
  `menu_name` varchar(255) NOT NULL,
  `category_or_page_slug` varchar(255) NOT NULL,
  `menu_order` int(11) NOT NULL,
  `menu_parent` int(11) NOT NULL,
  `menu_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_menu`
--

INSERT INTO `tbl_menu` (`menu_id`, `menu_type`, `menu_name`, `category_or_page_slug`, `menu_order`, `menu_parent`, `menu_url`) VALUES
(2, 'Other', 'Home', '', 1, 0, 'http://demosly.com/xicia/cc/newstree/'),
(3, 'Category', 'Sport', 'sport-news', 4, 0, ''),
(4, 'Category', 'Business', 'business', 5, 0, ''),
(5, 'Category', 'Travel', 'travel', 6, 0, ''),
(6, 'Category', 'Entertainment', 'entertainment', 7, 0, ''),
(7, 'Other', 'Gallery', '', 8, 0, '#'),
(8, 'Page', 'Photo Gallery', 'photo-gallery', 1, 7, ''),
(9, 'Page', 'Video Gallery', 'video-gallery', 1, 7, ''),
(10, 'Page', 'About Us', 'about-us', 2, 0, ''),
(11, 'Page', 'Contact Us', 'contact-us', 10, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_news`
--

CREATE TABLE `tbl_news` (
  `news_id` int(11) NOT NULL,
  `news_title` varchar(255) NOT NULL,
  `news_slug` varchar(255) NOT NULL,
  `news_content` text NOT NULL,
  `news_date` varchar(255) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `status` varchar(30) NOT NULL,
  `source` varchar(255) NOT NULL,
  `is_featured` int(11) NOT NULL,
  `total_view` int(11) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keyword` text NOT NULL,
  `meta_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_news`
--

INSERT INTO `tbl_news` (`news_id`, `news_title`, `news_slug`, `news_content`, `news_date`, `publisher`, `photo`, `status`, `source`, `is_featured`, `total_view`, `meta_title`, `meta_keyword`, `meta_description`) VALUES
(25, 'Rockwell Automation rebuffs Emerson''s latest $29 billion bid', 'rockwell-automation-rebuffs-emerson', '<p>Lorem ipsum dolor sit amet, omnis signiferumque in mei, mei ex enim concludaturque. Senserit salutandi euripidis no per, modus maiestatis scribentur est an. Cum ei doctus oporteat contentiones, vix graeci vocibus alienum no. Quando homero aeterno cu pro, mel ne novum ridens aliquando, harum facete per an. Ea suas pertinax has, solet officiis pericula cu pro, possit inermis qui ad. An mea tale perfecto sententiae, eos inani epicuri concludaturque ex.</p>\r\n\r\n<p>Usu an adhuc nihil. Et usu molestiae persequeris, option facilisis intellegebat vim eu, modus ullum dictas ex usu. Apeirian quaerendum pro in, no vix utinam dolore sadipscing. An cum case wisi, in case labitur expetendis per, eu sea populo adolescens dissentiet. No vivendo assueverit usu, ceteros repudiare ad vim. Ius facer integre vituperatoribus ei, duo ne vidit brute delicatissimi. Eos no dicta deseruisse, dicta sapientem expetendis mel et.</p>\r\n\r\n<p>Mei esse denique fabellas no, eu has solum definitionem. Cu laoreet intellegam inciderint eos. Per ea meliore mandamus voluptatibus, at sumo propriae suscipiantur nam. His molestiae comprehensam ut, cum simul temporibus eu. Nam aliquip maiestatis scribentur in.</p>\r\n\r\n<p>Ad est cetero reprimique. Alienum oporteat forensibus at his, ne vero epicurei sit, duo ad ceteros oporteat. No utroque torquatos vix, ullum reformidans et est, ea accumsan copiosae sit. Eam consul volumus ut, vim et posse viderer fierent, te est sumo mundi tation. Cum atomorum tractatos forensibus in.</p>\r\n\r\n<p>At ornatus nostrum vix. Mel elaboraret definitiones ea. No ancillae facilisi nam, te latine aperiam alterum sed. Est fastidii singulis gubergren ex, melius definitiones his in, his id minim animal prompta. Causae audiam molestie has et. In vero dicunt mel, mazim munere maluisset ei sit, sea persius imperdiet ea.</p>\r\n\r\n<p>At aperiam lucilius vel, etiam munere scaevola pro no. Ei quo mucius meliore, sed ne equidem dignissim. At congue ponderum sit, purto electram ius ad. Te has euismod admodum appellantur, per ea populo adipisci consequat. Ius meis dolorem scriptorem eu, augue legere an sit. Clita everti concludaturque no has.</p>\r\n', '10-08-2017', 'John Doe', 'news-25.jpg', 'Published', '', 1, 2, 'Rockwell Automation rebuffs Emerson''s latest $29 billion bid', '', ''),
(26, 'London buses to be powered by coffee', 'london-buses-to-be-powered-by-coffee', '<p>Lorem ipsum dolor sit amet, omnis signiferumque in mei, mei ex enim concludaturque. Senserit salutandi euripidis no per, modus maiestatis scribentur est an. Cum ei doctus oporteat contentiones, vix graeci vocibus alienum no. Quando homero aeterno cu pro, mel ne novum ridens aliquando, harum facete per an. Ea suas pertinax has, solet officiis pericula cu pro, possit inermis qui ad. An mea tale perfecto sententiae, eos inani epicuri concludaturque ex.</p>\r\n\r\n<p>Usu an adhuc nihil. Et usu molestiae persequeris, option facilisis intellegebat vim eu, modus ullum dictas ex usu. Apeirian quaerendum pro in, no vix utinam dolore sadipscing. An cum case wisi, in case labitur expetendis per, eu sea populo adolescens dissentiet. No vivendo assueverit usu, ceteros repudiare ad vim. Ius facer integre vituperatoribus ei, duo ne vidit brute delicatissimi. Eos no dicta deseruisse, dicta sapientem expetendis mel et.</p>\r\n\r\n<p>Mei esse denique fabellas no, eu has solum definitionem. Cu laoreet intellegam inciderint eos. Per ea meliore mandamus voluptatibus, at sumo propriae suscipiantur nam. His molestiae comprehensam ut, cum simul temporibus eu. Nam aliquip maiestatis scribentur in.</p>\r\n\r\n<p>Ad est cetero reprimique. Alienum oporteat forensibus at his, ne vero epicurei sit, duo ad ceteros oporteat. No utroque torquatos vix, ullum reformidans et est, ea accumsan copiosae sit. Eam consul volumus ut, vim et posse viderer fierent, te est sumo mundi tation. Cum atomorum tractatos forensibus in.</p>\r\n\r\n<p>At ornatus nostrum vix. Mel elaboraret definitiones ea. No ancillae facilisi nam, te latine aperiam alterum sed. Est fastidii singulis gubergren ex, melius definitiones his in, his id minim animal prompta. Causae audiam molestie has et. In vero dicunt mel, mazim munere maluisset ei sit, sea persius imperdiet ea.</p>\r\n\r\n<p>At aperiam lucilius vel, etiam munere scaevola pro no. Ei quo mucius meliore, sed ne equidem dignissim. At congue ponderum sit, purto electram ius ad. Te has euismod admodum appellantur, per ea populo adipisci consequat. Ius meis dolorem scriptorem eu, augue legere an sit. Clita everti concludaturque no has.</p>\r\n', '10-08-2017', 'John Doe', 'news-26.jpg', 'Published', '', 0, 1, 'London buses to be powered by coffee', '', ''),
(27, 'Skype removed from China Apple and Android app stores', 'skype-removed-from-china-apple-and-android-app-stores', '<p>Lorem ipsum dolor sit amet, omnis signiferumque in mei, mei ex enim concludaturque. Senserit salutandi euripidis no per, modus maiestatis scribentur est an. Cum ei doctus oporteat contentiones, vix graeci vocibus alienum no. Quando homero aeterno cu pro, mel ne novum ridens aliquando, harum facete per an. Ea suas pertinax has, solet officiis pericula cu pro, possit inermis qui ad. An mea tale perfecto sententiae, eos inani epicuri concludaturque ex.</p>\r\n\r\n<p>Usu an adhuc nihil. Et usu molestiae persequeris, option facilisis intellegebat vim eu, modus ullum dictas ex usu. Apeirian quaerendum pro in, no vix utinam dolore sadipscing. An cum case wisi, in case labitur expetendis per, eu sea populo adolescens dissentiet. No vivendo assueverit usu, ceteros repudiare ad vim. Ius facer integre vituperatoribus ei, duo ne vidit brute delicatissimi. Eos no dicta deseruisse, dicta sapientem expetendis mel et.</p>\r\n\r\n<p>Mei esse denique fabellas no, eu has solum definitionem. Cu laoreet intellegam inciderint eos. Per ea meliore mandamus voluptatibus, at sumo propriae suscipiantur nam. His molestiae comprehensam ut, cum simul temporibus eu. Nam aliquip maiestatis scribentur in.</p>\r\n\r\n<p>Ad est cetero reprimique. Alienum oporteat forensibus at his, ne vero epicurei sit, duo ad ceteros oporteat. No utroque torquatos vix, ullum reformidans et est, ea accumsan copiosae sit. Eam consul volumus ut, vim et posse viderer fierent, te est sumo mundi tation. Cum atomorum tractatos forensibus in.</p>\r\n\r\n<p>At ornatus nostrum vix. Mel elaboraret definitiones ea. No ancillae facilisi nam, te latine aperiam alterum sed. Est fastidii singulis gubergren ex, melius definitiones his in, his id minim animal prompta. Causae audiam molestie has et. In vero dicunt mel, mazim munere maluisset ei sit, sea persius imperdiet ea.</p>\r\n\r\n<p>At aperiam lucilius vel, etiam munere scaevola pro no. Ei quo mucius meliore, sed ne equidem dignissim. At congue ponderum sit, purto electram ius ad. Te has euismod admodum appellantur, per ea populo adipisci consequat. Ius meis dolorem scriptorem eu, augue legere an sit. Clita everti concludaturque no has.</p>\r\n', '10-08-2017', 'John Doe', 'news-27.jpg', 'Published', '', 1, 2, 'Skype removed from China Apple and Android app stores', '', ''),
(28, 'John Lasseter: Pixar founder on leave over ''unwanted hugs', 'pixar-founder-on-leave-over-unwanted-hugs', '<p>Lorem ipsum dolor sit amet, omnis signiferumque in mei, mei ex enim concludaturque. Senserit salutandi euripidis no per, modus maiestatis scribentur est an. Cum ei doctus oporteat contentiones, vix graeci vocibus alienum no. Quando homero aeterno cu pro, mel ne novum ridens aliquando, harum facete per an. Ea suas pertinax has, solet officiis pericula cu pro, possit inermis qui ad. An mea tale perfecto sententiae, eos inani epicuri concludaturque ex.</p>\r\n\r\n<p>Usu an adhuc nihil. Et usu molestiae persequeris, option facilisis intellegebat vim eu, modus ullum dictas ex usu. Apeirian quaerendum pro in, no vix utinam dolore sadipscing. An cum case wisi, in case labitur expetendis per, eu sea populo adolescens dissentiet. No vivendo assueverit usu, ceteros repudiare ad vim. Ius facer integre vituperatoribus ei, duo ne vidit brute delicatissimi. Eos no dicta deseruisse, dicta sapientem expetendis mel et.</p>\r\n\r\n<p>Mei esse denique fabellas no, eu has solum definitionem. Cu laoreet intellegam inciderint eos. Per ea meliore mandamus voluptatibus, at sumo propriae suscipiantur nam. His molestiae comprehensam ut, cum simul temporibus eu. Nam aliquip maiestatis scribentur in.</p>\r\n\r\n<p>Ad est cetero reprimique. Alienum oporteat forensibus at his, ne vero epicurei sit, duo ad ceteros oporteat. No utroque torquatos vix, ullum reformidans et est, ea accumsan copiosae sit. Eam consul volumus ut, vim et posse viderer fierent, te est sumo mundi tation. Cum atomorum tractatos forensibus in.</p>\r\n\r\n<p>At ornatus nostrum vix. Mel elaboraret definitiones ea. No ancillae facilisi nam, te latine aperiam alterum sed. Est fastidii singulis gubergren ex, melius definitiones his in, his id minim animal prompta. Causae audiam molestie has et. In vero dicunt mel, mazim munere maluisset ei sit, sea persius imperdiet ea.</p>\r\n\r\n<p>At aperiam lucilius vel, etiam munere scaevola pro no. Ei quo mucius meliore, sed ne equidem dignissim. At congue ponderum sit, purto electram ius ad. Te has euismod admodum appellantur, per ea populo adipisci consequat. Ius meis dolorem scriptorem eu, augue legere an sit. Clita everti concludaturque no has.</p>\r\n', '10-08-2017', 'John Doe', 'news-28.jpg', 'Published', '', 1, 9, 'John Lasseter: Pixar founder on leave over ''unwanted hugs', '', ''),
(29, 'Pierre-Emerick Aubameyang: How Afoty nominee helped put Gabon on the map', 'how-afoty-nominee-helped-put-gabon-on-the-map', '<p>Lorem ipsum dolor sit amet, omnis signiferumque in mei, mei ex enim concludaturque. Senserit salutandi euripidis no per, modus maiestatis scribentur est an. Cum ei doctus oporteat contentiones, vix graeci vocibus alienum no. Quando homero aeterno cu pro, mel ne novum ridens aliquando, harum facete per an. Ea suas pertinax has, solet officiis pericula cu pro, possit inermis qui ad. An mea tale perfecto sententiae, eos inani epicuri concludaturque ex.</p>\r\n\r\n<p>Usu an adhuc nihil. Et usu molestiae persequeris, option facilisis intellegebat vim eu, modus ullum dictas ex usu. Apeirian quaerendum pro in, no vix utinam dolore sadipscing. An cum case wisi, in case labitur expetendis per, eu sea populo adolescens dissentiet. No vivendo assueverit usu, ceteros repudiare ad vim. Ius facer integre vituperatoribus ei, duo ne vidit brute delicatissimi. Eos no dicta deseruisse, dicta sapientem expetendis mel et.</p>\r\n\r\n<p>Mei esse denique fabellas no, eu has solum definitionem. Cu laoreet intellegam inciderint eos. Per ea meliore mandamus voluptatibus, at sumo propriae suscipiantur nam. His molestiae comprehensam ut, cum simul temporibus eu. Nam aliquip maiestatis scribentur in.</p>\r\n\r\n<p>Ad est cetero reprimique. Alienum oporteat forensibus at his, ne vero epicurei sit, duo ad ceteros oporteat. No utroque torquatos vix, ullum reformidans et est, ea accumsan copiosae sit. Eam consul volumus ut, vim et posse viderer fierent, te est sumo mundi tation. Cum atomorum tractatos forensibus in.</p>\r\n\r\n<p>At ornatus nostrum vix. Mel elaboraret definitiones ea. No ancillae facilisi nam, te latine aperiam alterum sed. Est fastidii singulis gubergren ex, melius definitiones his in, his id minim animal prompta. Causae audiam molestie has et. In vero dicunt mel, mazim munere maluisset ei sit, sea persius imperdiet ea.</p>\r\n\r\n<p>At aperiam lucilius vel, etiam munere scaevola pro no. Ei quo mucius meliore, sed ne equidem dignissim. At congue ponderum sit, purto electram ius ad. Te has euismod admodum appellantur, per ea populo adipisci consequat. Ius meis dolorem scriptorem eu, augue legere an sit. Clita everti concludaturque no has.</p>\r\n', '10-08-2017', 'John Doe', 'news-29.jpg', 'Published', '', 0, 0, 'Pierre-Emerick Aubameyang: How Afoty nominee helped put Gabon on the map', '', ''),
(30, 'Lionel Messi started on the bench as Barcelona qualified for the last 16', 'lionel-messi-started-on-the-bench-as-barcelona-qualified', '<p>Lorem ipsum dolor sit amet, omnis signiferumque in mei, mei ex enim concludaturque. Senserit salutandi euripidis no per, modus maiestatis scribentur est an. Cum ei doctus oporteat contentiones, vix graeci vocibus alienum no. Quando homero aeterno cu pro, mel ne novum ridens aliquando, harum facete per an. Ea suas pertinax has, solet officiis pericula cu pro, possit inermis qui ad. An mea tale perfecto sententiae, eos inani epicuri concludaturque ex.</p>\r\n\r\n<p>Usu an adhuc nihil. Et usu molestiae persequeris, option facilisis intellegebat vim eu, modus ullum dictas ex usu. Apeirian quaerendum pro in, no vix utinam dolore sadipscing. An cum case wisi, in case labitur expetendis per, eu sea populo adolescens dissentiet. No vivendo assueverit usu, ceteros repudiare ad vim. Ius facer integre vituperatoribus ei, duo ne vidit brute delicatissimi. Eos no dicta deseruisse, dicta sapientem expetendis mel et.</p>\r\n\r\n<p>Mei esse denique fabellas no, eu has solum definitionem. Cu laoreet intellegam inciderint eos. Per ea meliore mandamus voluptatibus, at sumo propriae suscipiantur nam. His molestiae comprehensam ut, cum simul temporibus eu. Nam aliquip maiestatis scribentur in.</p>\r\n\r\n<p>Ad est cetero reprimique. Alienum oporteat forensibus at his, ne vero epicurei sit, duo ad ceteros oporteat. No utroque torquatos vix, ullum reformidans et est, ea accumsan copiosae sit. Eam consul volumus ut, vim et posse viderer fierent, te est sumo mundi tation. Cum atomorum tractatos forensibus in.</p>\r\n\r\n<p>At ornatus nostrum vix. Mel elaboraret definitiones ea. No ancillae facilisi nam, te latine aperiam alterum sed. Est fastidii singulis gubergren ex, melius definitiones his in, his id minim animal prompta. Causae audiam molestie has et. In vero dicunt mel, mazim munere maluisset ei sit, sea persius imperdiet ea.</p>\r\n\r\n<p>At aperiam lucilius vel, etiam munere scaevola pro no. Ei quo mucius meliore, sed ne equidem dignissim. At congue ponderum sit, purto electram ius ad. Te has euismod admodum appellantur, per ea populo adipisci consequat. Ius meis dolorem scriptorem eu, augue legere an sit. Clita everti concludaturque no has.</p>\r\n', '10-08-2017', 'John Doe', 'news-30.jpg', 'Published', '', 0, 0, 'Lionel Messi started on the bench as Barcelona qualified for the last 16', '', ''),
(31, 'Ashes: England''s James Vince makes 83', 'ashes-england-s-james-vince-makes-83', '<p>Lorem ipsum dolor sit amet, omnis signiferumque in mei, mei ex enim concludaturque. Senserit salutandi euripidis no per, modus maiestatis scribentur est an. Cum ei doctus oporteat contentiones, vix graeci vocibus alienum no. Quando homero aeterno cu pro, mel ne novum ridens aliquando, harum facete per an. Ea suas pertinax has, solet officiis pericula cu pro, possit inermis qui ad. An mea tale perfecto sententiae, eos inani epicuri concludaturque ex.</p>\r\n\r\n<p>Usu an adhuc nihil. Et usu molestiae persequeris, option facilisis intellegebat vim eu, modus ullum dictas ex usu. Apeirian quaerendum pro in, no vix utinam dolore sadipscing. An cum case wisi, in case labitur expetendis per, eu sea populo adolescens dissentiet. No vivendo assueverit usu, ceteros repudiare ad vim. Ius facer integre vituperatoribus ei, duo ne vidit brute delicatissimi. Eos no dicta deseruisse, dicta sapientem expetendis mel et.</p>\r\n\r\n<p>Mei esse denique fabellas no, eu has solum definitionem. Cu laoreet intellegam inciderint eos. Per ea meliore mandamus voluptatibus, at sumo propriae suscipiantur nam. His molestiae comprehensam ut, cum simul temporibus eu. Nam aliquip maiestatis scribentur in.</p>\r\n\r\n<p>Ad est cetero reprimique. Alienum oporteat forensibus at his, ne vero epicurei sit, duo ad ceteros oporteat. No utroque torquatos vix, ullum reformidans et est, ea accumsan copiosae sit. Eam consul volumus ut, vim et posse viderer fierent, te est sumo mundi tation. Cum atomorum tractatos forensibus in.</p>\r\n\r\n<p>At ornatus nostrum vix. Mel elaboraret definitiones ea. No ancillae facilisi nam, te latine aperiam alterum sed. Est fastidii singulis gubergren ex, melius definitiones his in, his id minim animal prompta. Causae audiam molestie has et. In vero dicunt mel, mazim munere maluisset ei sit, sea persius imperdiet ea.</p>\r\n\r\n<p>At aperiam lucilius vel, etiam munere scaevola pro no. Ei quo mucius meliore, sed ne equidem dignissim. At congue ponderum sit, purto electram ius ad. Te has euismod admodum appellantur, per ea populo adipisci consequat. Ius meis dolorem scriptorem eu, augue legere an sit. Clita everti concludaturque no has.</p>\r\n', '10-08-2017', 'John Doe', 'news-31.jpg', 'Published', '', 0, 0, 'Ashes: England''s James Vince makes 83', '', ''),
(32, 'Australian Open 2018 to use 25-second shot clock', 'australian-open-2018-to-use-25-second-shot-clock', '<p>Lorem ipsum dolor sit amet, omnis signiferumque in mei, mei ex enim concludaturque. Senserit salutandi euripidis no per, modus maiestatis scribentur est an. Cum ei doctus oporteat contentiones, vix graeci vocibus alienum no. Quando homero aeterno cu pro, mel ne novum ridens aliquando, harum facete per an. Ea suas pertinax has, solet officiis pericula cu pro, possit inermis qui ad. An mea tale perfecto sententiae, eos inani epicuri concludaturque ex.</p>\r\n\r\n<p>Usu an adhuc nihil. Et usu molestiae persequeris, option facilisis intellegebat vim eu, modus ullum dictas ex usu. Apeirian quaerendum pro in, no vix utinam dolore sadipscing. An cum case wisi, in case labitur expetendis per, eu sea populo adolescens dissentiet. No vivendo assueverit usu, ceteros repudiare ad vim. Ius facer integre vituperatoribus ei, duo ne vidit brute delicatissimi. Eos no dicta deseruisse, dicta sapientem expetendis mel et.</p>\r\n\r\n<p>Mei esse denique fabellas no, eu has solum definitionem. Cu laoreet intellegam inciderint eos. Per ea meliore mandamus voluptatibus, at sumo propriae suscipiantur nam. His molestiae comprehensam ut, cum simul temporibus eu. Nam aliquip maiestatis scribentur in.</p>\r\n\r\n<p>Ad est cetero reprimique. Alienum oporteat forensibus at his, ne vero epicurei sit, duo ad ceteros oporteat. No utroque torquatos vix, ullum reformidans et est, ea accumsan copiosae sit. Eam consul volumus ut, vim et posse viderer fierent, te est sumo mundi tation. Cum atomorum tractatos forensibus in.</p>\r\n\r\n<p>At ornatus nostrum vix. Mel elaboraret definitiones ea. No ancillae facilisi nam, te latine aperiam alterum sed. Est fastidii singulis gubergren ex, melius definitiones his in, his id minim animal prompta. Causae audiam molestie has et. In vero dicunt mel, mazim munere maluisset ei sit, sea persius imperdiet ea.</p>\r\n\r\n<p>At aperiam lucilius vel, etiam munere scaevola pro no. Ei quo mucius meliore, sed ne equidem dignissim. At congue ponderum sit, purto electram ius ad. Te has euismod admodum appellantur, per ea populo adipisci consequat. Ius meis dolorem scriptorem eu, augue legere an sit. Clita everti concludaturque no has.</p>\r\n', '10-08-2017', 'John Doe', 'news-32.jpg', 'Published', '', 0, 1, 'Australian Open 2018 to use 25-second shot clock', '', ''),
(33, 'Wheelchair tennis: Stephane Houdet wants Paralympic sport to become Olympic event', 'stephane-houdet-wants-paralympic-sport-to-become-olympic-event', '<p>Lorem ipsum dolor sit amet, omnis signiferumque in mei, mei ex enim concludaturque. Senserit salutandi euripidis no per, modus maiestatis scribentur est an. Cum ei doctus oporteat contentiones, vix graeci vocibus alienum no. Quando homero aeterno cu pro, mel ne novum ridens aliquando, harum facete per an. Ea suas pertinax has, solet officiis pericula cu pro, possit inermis qui ad. An mea tale perfecto sententiae, eos inani epicuri concludaturque ex.</p>\r\n\r\n<p>Usu an adhuc nihil. Et usu molestiae persequeris, option facilisis intellegebat vim eu, modus ullum dictas ex usu. Apeirian quaerendum pro in, no vix utinam dolore sadipscing. An cum case wisi, in case labitur expetendis per, eu sea populo adolescens dissentiet. No vivendo assueverit usu, ceteros repudiare ad vim. Ius facer integre vituperatoribus ei, duo ne vidit brute delicatissimi. Eos no dicta deseruisse, dicta sapientem expetendis mel et.</p>\r\n\r\n<p>Mei esse denique fabellas no, eu has solum definitionem. Cu laoreet intellegam inciderint eos. Per ea meliore mandamus voluptatibus, at sumo propriae suscipiantur nam. His molestiae comprehensam ut, cum simul temporibus eu. Nam aliquip maiestatis scribentur in.</p>\r\n\r\n<p>Ad est cetero reprimique. Alienum oporteat forensibus at his, ne vero epicurei sit, duo ad ceteros oporteat. No utroque torquatos vix, ullum reformidans et est, ea accumsan copiosae sit. Eam consul volumus ut, vim et posse viderer fierent, te est sumo mundi tation. Cum atomorum tractatos forensibus in.</p>\r\n\r\n<p>At ornatus nostrum vix. Mel elaboraret definitiones ea. No ancillae facilisi nam, te latine aperiam alterum sed. Est fastidii singulis gubergren ex, melius definitiones his in, his id minim animal prompta. Causae audiam molestie has et. In vero dicunt mel, mazim munere maluisset ei sit, sea persius imperdiet ea.</p>\r\n\r\n<p>At aperiam lucilius vel, etiam munere scaevola pro no. Ei quo mucius meliore, sed ne equidem dignissim. At congue ponderum sit, purto electram ius ad. Te has euismod admodum appellantur, per ea populo adipisci consequat. Ius meis dolorem scriptorem eu, augue legere an sit. Clita everti concludaturque no has.</p>\r\n', '10-08-2017', 'John Doe', 'news-33.jpg', 'Published', '', 0, 0, 'Wheelchair tennis: Stephane Houdet wants Paralympic sport to become Olympic event', '', ''),
(34, 'Paul Casey: Is he the key to help Europe regain the Ryder Cup?', 'paul-casey-is-he-the-key-to-help-europe-regain-the-ryder-cup-', '<p>Lorem ipsum dolor sit amet, omnis signiferumque in mei, mei ex enim concludaturque. Senserit salutandi euripidis no per, modus maiestatis scribentur est an. Cum ei doctus oporteat contentiones, vix graeci vocibus alienum no. Quando homero aeterno cu pro, mel ne novum ridens aliquando, harum facete per an. Ea suas pertinax has, solet officiis pericula cu pro, possit inermis qui ad. An mea tale perfecto sententiae, eos inani epicuri concludaturque ex.</p>\r\n\r\n<p>Usu an adhuc nihil. Et usu molestiae persequeris, option facilisis intellegebat vim eu, modus ullum dictas ex usu. Apeirian quaerendum pro in, no vix utinam dolore sadipscing. An cum case wisi, in case labitur expetendis per, eu sea populo adolescens dissentiet. No vivendo assueverit usu, ceteros repudiare ad vim. Ius facer integre vituperatoribus ei, duo ne vidit brute delicatissimi. Eos no dicta deseruisse, dicta sapientem expetendis mel et.</p>\r\n\r\n<p>Mei esse denique fabellas no, eu has solum definitionem. Cu laoreet intellegam inciderint eos. Per ea meliore mandamus voluptatibus, at sumo propriae suscipiantur nam. His molestiae comprehensam ut, cum simul temporibus eu. Nam aliquip maiestatis scribentur in.</p>\r\n\r\n<p>Ad est cetero reprimique. Alienum oporteat forensibus at his, ne vero epicurei sit, duo ad ceteros oporteat. No utroque torquatos vix, ullum reformidans et est, ea accumsan copiosae sit. Eam consul volumus ut, vim et posse viderer fierent, te est sumo mundi tation. Cum atomorum tractatos forensibus in.</p>\r\n\r\n<p>At ornatus nostrum vix. Mel elaboraret definitiones ea. No ancillae facilisi nam, te latine aperiam alterum sed. Est fastidii singulis gubergren ex, melius definitiones his in, his id minim animal prompta. Causae audiam molestie has et. In vero dicunt mel, mazim munere maluisset ei sit, sea persius imperdiet ea.</p>\r\n\r\n<p>At aperiam lucilius vel, etiam munere scaevola pro no. Ei quo mucius meliore, sed ne equidem dignissim. At congue ponderum sit, purto electram ius ad. Te has euismod admodum appellantur, per ea populo adipisci consequat. Ius meis dolorem scriptorem eu, augue legere an sit. Clita everti concludaturque no has.</p>\r\n', '10-08-2017', 'John Doe', 'news-34.jpg', 'Published', '', 0, 0, 'Paul Casey: Is he the key to help Europe regain the Ryder Cup?', '', ''),
(35, 'Apollo astronauts visited to learn about rocks they could find in space', 'apollo-astronauts-visited-to-learn-about-rocks', '<p>Lorem ipsum dolor sit amet, omnis signiferumque in mei, mei ex enim concludaturque. Senserit salutandi euripidis no per, modus maiestatis scribentur est an. Cum ei doctus oporteat contentiones, vix graeci vocibus alienum no. Quando homero aeterno cu pro, mel ne novum ridens aliquando, harum facete per an. Ea suas pertinax has, solet officiis pericula cu pro, possit inermis qui ad. An mea tale perfecto sententiae, eos inani epicuri concludaturque ex.</p>\r\n\r\n<p>Usu an adhuc nihil. Et usu molestiae persequeris, option facilisis intellegebat vim eu, modus ullum dictas ex usu. Apeirian quaerendum pro in, no vix utinam dolore sadipscing. An cum case wisi, in case labitur expetendis per, eu sea populo adolescens dissentiet. No vivendo assueverit usu, ceteros repudiare ad vim. Ius facer integre vituperatoribus ei, duo ne vidit brute delicatissimi. Eos no dicta deseruisse, dicta sapientem expetendis mel et.</p>\r\n\r\n<p>Mei esse denique fabellas no, eu has solum definitionem. Cu laoreet intellegam inciderint eos. Per ea meliore mandamus voluptatibus, at sumo propriae suscipiantur nam. His molestiae comprehensam ut, cum simul temporibus eu. Nam aliquip maiestatis scribentur in.</p>\r\n\r\n<p>Ad est cetero reprimique. Alienum oporteat forensibus at his, ne vero epicurei sit, duo ad ceteros oporteat. No utroque torquatos vix, ullum reformidans et est, ea accumsan copiosae sit. Eam consul volumus ut, vim et posse viderer fierent, te est sumo mundi tation. Cum atomorum tractatos forensibus in.</p>\r\n\r\n<p>At ornatus nostrum vix. Mel elaboraret definitiones ea. No ancillae facilisi nam, te latine aperiam alterum sed. Est fastidii singulis gubergren ex, melius definitiones his in, his id minim animal prompta. Causae audiam molestie has et. In vero dicunt mel, mazim munere maluisset ei sit, sea persius imperdiet ea.</p>\r\n\r\n<p>At aperiam lucilius vel, etiam munere scaevola pro no. Ei quo mucius meliore, sed ne equidem dignissim. At congue ponderum sit, purto electram ius ad. Te has euismod admodum appellantur, per ea populo adipisci consequat. Ius meis dolorem scriptorem eu, augue legere an sit. Clita everti concludaturque no has.</p>\r\n', '10-08-2017', 'John Doe', 'news-35.jpg', 'Published', '', 0, 2, 'Apollo astronauts visited to learn about rocks they could find in space', '', ''),
(36, 'One third of Ikaria, Greece''s residents live to be more than 90 years old', 'greece-residents-live-to-be-more-than-90-years-old', '<p>Lorem ipsum dolor sit amet, omnis signiferumque in mei, mei ex enim concludaturque. Senserit salutandi euripidis no per, modus maiestatis scribentur est an. Cum ei doctus oporteat contentiones, vix graeci vocibus alienum no. Quando homero aeterno cu pro, mel ne novum ridens aliquando, harum facete per an. Ea suas pertinax has, solet officiis pericula cu pro, possit inermis qui ad. An mea tale perfecto sententiae, eos inani epicuri concludaturque ex.</p>\r\n\r\n<p>Usu an adhuc nihil. Et usu molestiae persequeris, option facilisis intellegebat vim eu, modus ullum dictas ex usu. Apeirian quaerendum pro in, no vix utinam dolore sadipscing. An cum case wisi, in case labitur expetendis per, eu sea populo adolescens dissentiet. No vivendo assueverit usu, ceteros repudiare ad vim. Ius facer integre vituperatoribus ei, duo ne vidit brute delicatissimi. Eos no dicta deseruisse, dicta sapientem expetendis mel et.</p>\r\n\r\n<p>Mei esse denique fabellas no, eu has solum definitionem. Cu laoreet intellegam inciderint eos. Per ea meliore mandamus voluptatibus, at sumo propriae suscipiantur nam. His molestiae comprehensam ut, cum simul temporibus eu. Nam aliquip maiestatis scribentur in.</p>\r\n\r\n<p>Ad est cetero reprimique. Alienum oporteat forensibus at his, ne vero epicurei sit, duo ad ceteros oporteat. No utroque torquatos vix, ullum reformidans et est, ea accumsan copiosae sit. Eam consul volumus ut, vim et posse viderer fierent, te est sumo mundi tation. Cum atomorum tractatos forensibus in.</p>\r\n\r\n<p>At ornatus nostrum vix. Mel elaboraret definitiones ea. No ancillae facilisi nam, te latine aperiam alterum sed. Est fastidii singulis gubergren ex, melius definitiones his in, his id minim animal prompta. Causae audiam molestie has et. In vero dicunt mel, mazim munere maluisset ei sit, sea persius imperdiet ea.</p>\r\n\r\n<p>At aperiam lucilius vel, etiam munere scaevola pro no. Ei quo mucius meliore, sed ne equidem dignissim. At congue ponderum sit, purto electram ius ad. Te has euismod admodum appellantur, per ea populo adipisci consequat. Ius meis dolorem scriptorem eu, augue legere an sit. Clita everti concludaturque no has.</p>\r\n', '10-08-2017', 'John Doe', 'news-36.jpg', 'Published', '', 0, 0, 'One third of Ikaria, Greeceâ€™s residents live to be more than 90 years old', '', ''),
(37, 'The Australian Island Discovered By Accident', 'the-australian-island-discovered-by-accident', '<p>Lorem ipsum dolor sit amet, omnis signiferumque in mei, mei ex enim concludaturque. Senserit salutandi euripidis no per, modus maiestatis scribentur est an. Cum ei doctus oporteat contentiones, vix graeci vocibus alienum no. Quando homero aeterno cu pro, mel ne novum ridens aliquando, harum facete per an. Ea suas pertinax has, solet officiis pericula cu pro, possit inermis qui ad. An mea tale perfecto sententiae, eos inani epicuri concludaturque ex.</p>\r\n\r\n<p>Usu an adhuc nihil. Et usu molestiae persequeris, option facilisis intellegebat vim eu, modus ullum dictas ex usu. Apeirian quaerendum pro in, no vix utinam dolore sadipscing. An cum case wisi, in case labitur expetendis per, eu sea populo adolescens dissentiet. No vivendo assueverit usu, ceteros repudiare ad vim. Ius facer integre vituperatoribus ei, duo ne vidit brute delicatissimi. Eos no dicta deseruisse, dicta sapientem expetendis mel et.</p>\r\n\r\n<p>Mei esse denique fabellas no, eu has solum definitionem. Cu laoreet intellegam inciderint eos. Per ea meliore mandamus voluptatibus, at sumo propriae suscipiantur nam. His molestiae comprehensam ut, cum simul temporibus eu. Nam aliquip maiestatis scribentur in.</p>\r\n\r\n<p>Ad est cetero reprimique. Alienum oporteat forensibus at his, ne vero epicurei sit, duo ad ceteros oporteat. No utroque torquatos vix, ullum reformidans et est, ea accumsan copiosae sit. Eam consul volumus ut, vim et posse viderer fierent, te est sumo mundi tation. Cum atomorum tractatos forensibus in.</p>\r\n\r\n<p>At ornatus nostrum vix. Mel elaboraret definitiones ea. No ancillae facilisi nam, te latine aperiam alterum sed. Est fastidii singulis gubergren ex, melius definitiones his in, his id minim animal prompta. Causae audiam molestie has et. In vero dicunt mel, mazim munere maluisset ei sit, sea persius imperdiet ea.</p>\r\n\r\n<p>At aperiam lucilius vel, etiam munere scaevola pro no. Ei quo mucius meliore, sed ne equidem dignissim. At congue ponderum sit, purto electram ius ad. Te has euismod admodum appellantur, per ea populo adipisci consequat. Ius meis dolorem scriptorem eu, augue legere an sit. Clita everti concludaturque no has.</p>\r\n', '10-08-2017', 'John Doe', 'news-37.jpg', 'Published', '', 0, 12, 'The Australian Island Discovered By Accident', '', ''),
(38, 'Ontario''s forgotten ghost town', 'ontario-s-forgotten-ghost-town', '<p>Lorem ipsum dolor sit amet, omnis signiferumque in mei, mei ex enim concludaturque. Senserit salutandi euripidis no per, modus maiestatis scribentur est an. Cum ei doctus oporteat contentiones, vix graeci vocibus alienum no. Quando homero aeterno cu pro, mel ne novum ridens aliquando, harum facete per an. Ea suas pertinax has, solet officiis pericula cu pro, possit inermis qui ad. An mea tale perfecto sententiae, eos inani epicuri concludaturque ex.</p>\r\n\r\n<p>Usu an adhuc nihil. Et usu molestiae persequeris, option facilisis intellegebat vim eu, modus ullum dictas ex usu. Apeirian quaerendum pro in, no vix utinam dolore sadipscing. An cum case wisi, in case labitur expetendis per, eu sea populo adolescens dissentiet. No vivendo assueverit usu, ceteros repudiare ad vim. Ius facer integre vituperatoribus ei, duo ne vidit brute delicatissimi. Eos no dicta deseruisse, dicta sapientem expetendis mel et.</p>\r\n\r\n<p>Mei esse denique fabellas no, eu has solum definitionem. Cu laoreet intellegam inciderint eos. Per ea meliore mandamus voluptatibus, at sumo propriae suscipiantur nam. His molestiae comprehensam ut, cum simul temporibus eu. Nam aliquip maiestatis scribentur in.</p>\r\n\r\n<p>Ad est cetero reprimique. Alienum oporteat forensibus at his, ne vero epicurei sit, duo ad ceteros oporteat. No utroque torquatos vix, ullum reformidans et est, ea accumsan copiosae sit. Eam consul volumus ut, vim et posse viderer fierent, te est sumo mundi tation. Cum atomorum tractatos forensibus in.</p>\r\n\r\n<p>At ornatus nostrum vix. Mel elaboraret definitiones ea. No ancillae facilisi nam, te latine aperiam alterum sed. Est fastidii singulis gubergren ex, melius definitiones his in, his id minim animal prompta. Causae audiam molestie has et. In vero dicunt mel, mazim munere maluisset ei sit, sea persius imperdiet ea.</p>\r\n\r\n<p>At aperiam lucilius vel, etiam munere scaevola pro no. Ei quo mucius meliore, sed ne equidem dignissim. At congue ponderum sit, purto electram ius ad. Te has euismod admodum appellantur, per ea populo adipisci consequat. Ius meis dolorem scriptorem eu, augue legere an sit. Clita everti concludaturque no has.</p>\r\n', '10-08-2017', 'John Doe', 'news-38.jpg', 'Published', '', 1, 18, 'Ontario''s forgotten ghost town', '', ''),
(39, 'F1 gossip: Hamilton, Vettel, Alonso, Lowe', 'f1-gossip-hamilton-vettel-alonso-lowe', '<p>Lorem ipsum dolor sit amet, omnis signiferumque in mei, mei ex enim concludaturque. Senserit salutandi euripidis no per, modus maiestatis scribentur est an. Cum ei doctus oporteat contentiones, vix graeci vocibus alienum no. Quando homero aeterno cu pro, mel ne novum ridens aliquando, harum facete per an. Ea suas pertinax has, solet officiis pericula cu pro, possit inermis qui ad. An mea tale perfecto sententiae, eos inani epicuri concludaturque ex.</p>\r\n\r\n<p>Usu an adhuc nihil. Et usu molestiae persequeris, option facilisis intellegebat vim eu, modus ullum dictas ex usu. Apeirian quaerendum pro in, no vix utinam dolore sadipscing. An cum case wisi, in case labitur expetendis per, eu sea populo adolescens dissentiet. No vivendo assueverit usu, ceteros repudiare ad vim. Ius facer integre vituperatoribus ei, duo ne vidit brute delicatissimi. Eos no dicta deseruisse, dicta sapientem expetendis mel et.</p>\r\n\r\n<p>Mei esse denique fabellas no, eu has solum definitionem. Cu laoreet intellegam inciderint eos. Per ea meliore mandamus voluptatibus, at sumo propriae suscipiantur nam. His molestiae comprehensam ut, cum simul temporibus eu. Nam aliquip maiestatis scribentur in.</p>\r\n\r\n<p>Ad est cetero reprimique. Alienum oporteat forensibus at his, ne vero epicurei sit, duo ad ceteros oporteat. No utroque torquatos vix, ullum reformidans et est, ea accumsan copiosae sit. Eam consul volumus ut, vim et posse viderer fierent, te est sumo mundi tation. Cum atomorum tractatos forensibus in.</p>\r\n\r\n<p>At ornatus nostrum vix. Mel elaboraret definitiones ea. No ancillae facilisi nam, te latine aperiam alterum sed. Est fastidii singulis gubergren ex, melius definitiones his in, his id minim animal prompta. Causae audiam molestie has et. In vero dicunt mel, mazim munere maluisset ei sit, sea persius imperdiet ea.</p>\r\n\r\n<p>At aperiam lucilius vel, etiam munere scaevola pro no. Ei quo mucius meliore, sed ne equidem dignissim. At congue ponderum sit, purto electram ius ad. Te has euismod admodum appellantur, per ea populo adipisci consequat. Ius meis dolorem scriptorem eu, augue legere an sit. Clita everti concludaturque no has.</p>\r\n', '10-08-2017', 'John Doe', 'news-39.jpg', 'Published', '', 0, 6, 'F1 gossip: Hamilton, Vettel, Alonso, Lowe', '', ''),
(40, 'British Cycling: Team Sky ''gamed system'' over use of therapeutic use exemptions', 'team-sky-gamed-system-over-use-of-therapeutic-use-exemptions', '<p>Lorem ipsum dolor sit amet, omnis signiferumque in mei, mei ex enim concludaturque. Senserit salutandi euripidis no per, modus maiestatis scribentur est an. Cum ei doctus oporteat contentiones, vix graeci vocibus alienum no. Quando homero aeterno cu pro, mel ne novum ridens aliquando, harum facete per an. Ea suas pertinax has, solet officiis pericula cu pro, possit inermis qui ad. An mea tale perfecto sententiae, eos inani epicuri concludaturque ex.</p>\r\n\r\n<p>Usu an adhuc nihil. Et usu molestiae persequeris, option facilisis intellegebat vim eu, modus ullum dictas ex usu. Apeirian quaerendum pro in, no vix utinam dolore sadipscing. An cum case wisi, in case labitur expetendis per, eu sea populo adolescens dissentiet. No vivendo assueverit usu, ceteros repudiare ad vim. Ius facer integre vituperatoribus ei, duo ne vidit brute delicatissimi. Eos no dicta deseruisse, dicta sapientem expetendis mel et.</p>\r\n\r\n<p>Mei esse denique fabellas no, eu has solum definitionem. Cu laoreet intellegam inciderint eos. Per ea meliore mandamus voluptatibus, at sumo propriae suscipiantur nam. His molestiae comprehensam ut, cum simul temporibus eu. Nam aliquip maiestatis scribentur in.</p>\r\n\r\n<p>Ad est cetero reprimique. Alienum oporteat forensibus at his, ne vero epicurei sit, duo ad ceteros oporteat. No utroque torquatos vix, ullum reformidans et est, ea accumsan copiosae sit. Eam consul volumus ut, vim et posse viderer fierent, te est sumo mundi tation. Cum atomorum tractatos forensibus in.</p>\r\n\r\n<p>At ornatus nostrum vix. Mel elaboraret definitiones ea. No ancillae facilisi nam, te latine aperiam alterum sed. Est fastidii singulis gubergren ex, melius definitiones his in, his id minim animal prompta. Causae audiam molestie has et. In vero dicunt mel, mazim munere maluisset ei sit, sea persius imperdiet ea.</p>\r\n\r\n<p>At aperiam lucilius vel, etiam munere scaevola pro no. Ei quo mucius meliore, sed ne equidem dignissim. At congue ponderum sit, purto electram ius ad. Te has euismod admodum appellantur, per ea populo adipisci consequat. Ius meis dolorem scriptorem eu, augue legere an sit. Clita everti concludaturque no has.</p>\r\n', '10-08-2017', 'John Doe', 'news-40.jpg', 'Published', '', 0, 2, 'British Cycling: Team Sky ''gamed system'' over use of therapeutic use exemptions', '', ''),
(41, 'Channing Tatum Surprises Ellen DeGeneres'' Audience Members', 'channing-tatum-surprises-ellen-degeneres-audience-members', '<p>Lorem ipsum dolor sit amet, omnis signiferumque in mei, mei ex enim concludaturque. Senserit salutandi euripidis no per, modus maiestatis scribentur est an. Cum ei doctus oporteat contentiones, vix graeci vocibus alienum no. Quando homero aeterno cu pro, mel ne novum ridens aliquando, harum facete per an. Ea suas pertinax has, solet officiis pericula cu pro, possit inermis qui ad. An mea tale perfecto sententiae, eos inani epicuri concludaturque ex.</p>\r\n\r\n<p>Usu an adhuc nihil. Et usu molestiae persequeris, option facilisis intellegebat vim eu, modus ullum dictas ex usu. Apeirian quaerendum pro in, no vix utinam dolore sadipscing. An cum case wisi, in case labitur expetendis per, eu sea populo adolescens dissentiet. No vivendo assueverit usu, ceteros repudiare ad vim. Ius facer integre vituperatoribus ei, duo ne vidit brute delicatissimi. Eos no dicta deseruisse, dicta sapientem expetendis mel et.</p>\r\n\r\n<p>Mei esse denique fabellas no, eu has solum definitionem. Cu laoreet intellegam inciderint eos. Per ea meliore mandamus voluptatibus, at sumo propriae suscipiantur nam. His molestiae comprehensam ut, cum simul temporibus eu. Nam aliquip maiestatis scribentur in.</p>\r\n\r\n<p>Ad est cetero reprimique. Alienum oporteat forensibus at his, ne vero epicurei sit, duo ad ceteros oporteat. No utroque torquatos vix, ullum reformidans et est, ea accumsan copiosae sit. Eam consul volumus ut, vim et posse viderer fierent, te est sumo mundi tation. Cum atomorum tractatos forensibus in.</p>\r\n\r\n<p>At ornatus nostrum vix. Mel elaboraret definitiones ea. No ancillae facilisi nam, te latine aperiam alterum sed. Est fastidii singulis gubergren ex, melius definitiones his in, his id minim animal prompta. Causae audiam molestie has et. In vero dicunt mel, mazim munere maluisset ei sit, sea persius imperdiet ea.</p>\r\n\r\n<p>At aperiam lucilius vel, etiam munere scaevola pro no. Ei quo mucius meliore, sed ne equidem dignissim. At congue ponderum sit, purto electram ius ad. Te has euismod admodum appellantur, per ea populo adipisci consequat. Ius meis dolorem scriptorem eu, augue legere an sit. Clita everti concludaturque no has.</p>\r\n', '10-08-2017', 'John Doe', 'news-41.jpg', 'Published', '', 0, 0, 'Channing Tatum Surprises Ellen DeGeneres'' Audience Members', '', ''),
(42, 'Chinaâ€™s Youngest Female Billionaire Selling Sydney Pad for A$18 Million', 'china-s-youngest-female-billionaire-selling-sydney-pad', '<p>Lorem ipsum dolor sit amet, omnis signiferumque in mei, mei ex enim concludaturque. Senserit salutandi euripidis no per, modus maiestatis scribentur est an. Cum ei doctus oporteat contentiones, vix graeci vocibus alienum no. Quando homero aeterno cu pro, mel ne novum ridens aliquando, harum facete per an. Ea suas pertinax has, solet officiis pericula cu pro, possit inermis qui ad. An mea tale perfecto sententiae, eos inani epicuri concludaturque ex.</p>\r\n\r\n<p>Usu an adhuc nihil. Et usu molestiae persequeris, option facilisis intellegebat vim eu, modus ullum dictas ex usu. Apeirian quaerendum pro in, no vix utinam dolore sadipscing. An cum case wisi, in case labitur expetendis per, eu sea populo adolescens dissentiet. No vivendo assueverit usu, ceteros repudiare ad vim. Ius facer integre vituperatoribus ei, duo ne vidit brute delicatissimi. Eos no dicta deseruisse, dicta sapientem expetendis mel et.</p>\r\n\r\n<p>Mei esse denique fabellas no, eu has solum definitionem. Cu laoreet intellegam inciderint eos. Per ea meliore mandamus voluptatibus, at sumo propriae suscipiantur nam. His molestiae comprehensam ut, cum simul temporibus eu. Nam aliquip maiestatis scribentur in.</p>\r\n\r\n<p>Ad est cetero reprimique. Alienum oporteat forensibus at his, ne vero epicurei sit, duo ad ceteros oporteat. No utroque torquatos vix, ullum reformidans et est, ea accumsan copiosae sit. Eam consul volumus ut, vim et posse viderer fierent, te est sumo mundi tation. Cum atomorum tractatos forensibus in.</p>\r\n\r\n<p>At ornatus nostrum vix. Mel elaboraret definitiones ea. No ancillae facilisi nam, te latine aperiam alterum sed. Est fastidii singulis gubergren ex, melius definitiones his in, his id minim animal prompta. Causae audiam molestie has et. In vero dicunt mel, mazim munere maluisset ei sit, sea persius imperdiet ea.</p>\r\n\r\n<p>At aperiam lucilius vel, etiam munere scaevola pro no. Ei quo mucius meliore, sed ne equidem dignissim. At congue ponderum sit, purto electram ius ad. Te has euismod admodum appellantur, per ea populo adipisci consequat. Ius meis dolorem scriptorem eu, augue legere an sit. Clita everti concludaturque no has.</p>\r\n', '10-08-2017', 'John Doe', 'news-42.jpg', 'Published', '', 0, 1, 'Chinaâ€™s Youngest Female Billionaire Selling Sydney Pad for A$18 Million', '', ''),
(43, '10 Times Lonnie Chavis Danced Like Everyone Was Watching', '10-times-lonnie-chavis-danced-like-everyone-was-watching', '<p>Lorem ipsum dolor sit amet, omnis signiferumque in mei, mei ex enim concludaturque. Senserit salutandi euripidis no per, modus maiestatis scribentur est an. Cum ei doctus oporteat contentiones, vix graeci vocibus alienum no. Quando homero aeterno cu pro, mel ne novum ridens aliquando, harum facete per an. Ea suas pertinax has, solet officiis pericula cu pro, possit inermis qui ad. An mea tale perfecto sententiae, eos inani epicuri concludaturque ex.</p>\r\n\r\n<p>Usu an adhuc nihil. Et usu molestiae persequeris, option facilisis intellegebat vim eu, modus ullum dictas ex usu. Apeirian quaerendum pro in, no vix utinam dolore sadipscing. An cum case wisi, in case labitur expetendis per, eu sea populo adolescens dissentiet. No vivendo assueverit usu, ceteros repudiare ad vim. Ius facer integre vituperatoribus ei, duo ne vidit brute delicatissimi. Eos no dicta deseruisse, dicta sapientem expetendis mel et.</p>\r\n\r\n<p>Mei esse denique fabellas no, eu has solum definitionem. Cu laoreet intellegam inciderint eos. Per ea meliore mandamus voluptatibus, at sumo propriae suscipiantur nam. His molestiae comprehensam ut, cum simul temporibus eu. Nam aliquip maiestatis scribentur in.</p>\r\n\r\n<p>Ad est cetero reprimique. Alienum oporteat forensibus at his, ne vero epicurei sit, duo ad ceteros oporteat. No utroque torquatos vix, ullum reformidans et est, ea accumsan copiosae sit. Eam consul volumus ut, vim et posse viderer fierent, te est sumo mundi tation. Cum atomorum tractatos forensibus in.</p>\r\n\r\n<p>At ornatus nostrum vix. Mel elaboraret definitiones ea. No ancillae facilisi nam, te latine aperiam alterum sed. Est fastidii singulis gubergren ex, melius definitiones his in, his id minim animal prompta. Causae audiam molestie has et. In vero dicunt mel, mazim munere maluisset ei sit, sea persius imperdiet ea.</p>\r\n\r\n<p>At aperiam lucilius vel, etiam munere scaevola pro no. Ei quo mucius meliore, sed ne equidem dignissim. At congue ponderum sit, purto electram ius ad. Te has euismod admodum appellantur, per ea populo adipisci consequat. Ius meis dolorem scriptorem eu, augue legere an sit. Clita everti concludaturque no has.</p>\r\n', '10-08-2017', 'John Doe', 'news-43.jpg', 'Published', '', 0, 0, '10 Times Lonnie Chavis Danced Like Everyone Was Watching', '', ''),
(44, 'The Big Dancing With the Stars 2018 Twist: Only Athletes Will Compete', 'the-big-dancing-with-the-stars-2018-twist-only-athletes-will-compete', '<p>Lorem ipsum dolor sit amet, omnis signiferumque in mei, mei ex enim concludaturque. Senserit salutandi euripidis no per, modus maiestatis scribentur est an. Cum ei doctus oporteat contentiones, vix graeci vocibus alienum no. Quando homero aeterno cu pro, mel ne novum ridens aliquando, harum facete per an. Ea suas pertinax has, solet officiis pericula cu pro, possit inermis qui ad. An mea tale perfecto sententiae, eos inani epicuri concludaturque ex.</p>\r\n\r\n<p>Usu an adhuc nihil. Et usu molestiae persequeris, option facilisis intellegebat vim eu, modus ullum dictas ex usu. Apeirian quaerendum pro in, no vix utinam dolore sadipscing. An cum case wisi, in case labitur expetendis per, eu sea populo adolescens dissentiet. No vivendo assueverit usu, ceteros repudiare ad vim. Ius facer integre vituperatoribus ei, duo ne vidit brute delicatissimi. Eos no dicta deseruisse, dicta sapientem expetendis mel et.</p>\r\n\r\n<p>Mei esse denique fabellas no, eu has solum definitionem. Cu laoreet intellegam inciderint eos. Per ea meliore mandamus voluptatibus, at sumo propriae suscipiantur nam. His molestiae comprehensam ut, cum simul temporibus eu. Nam aliquip maiestatis scribentur in.</p>\r\n\r\n<p>Ad est cetero reprimique. Alienum oporteat forensibus at his, ne vero epicurei sit, duo ad ceteros oporteat. No utroque torquatos vix, ullum reformidans et est, ea accumsan copiosae sit. Eam consul volumus ut, vim et posse viderer fierent, te est sumo mundi tation. Cum atomorum tractatos forensibus in.</p>\r\n\r\n<p>At ornatus nostrum vix. Mel elaboraret definitiones ea. No ancillae facilisi nam, te latine aperiam alterum sed. Est fastidii singulis gubergren ex, melius definitiones his in, his id minim animal prompta. Causae audiam molestie has et. In vero dicunt mel, mazim munere maluisset ei sit, sea persius imperdiet ea.</p>\r\n\r\n<p>At aperiam lucilius vel, etiam munere scaevola pro no. Ei quo mucius meliore, sed ne equidem dignissim. At congue ponderum sit, purto electram ius ad. Te has euismod admodum appellantur, per ea populo adipisci consequat. Ius meis dolorem scriptorem eu, augue legere an sit. Clita everti concludaturque no has.</p>\r\n', '10-08-2017', 'John Doe', 'news-44.jpg', 'Published', '', 0, 7, 'The Big Dancing With the Stars 2018 Twist: Only Athletes Will Compete', '', '');
INSERT INTO `tbl_news` (`news_id`, `news_title`, `news_slug`, `news_content`, `news_date`, `publisher`, `photo`, `status`, `source`, `is_featured`, `total_view`, `meta_title`, `meta_keyword`, `meta_description`) VALUES
(45, 'Prepare for Psych: The Movie with a Delightful Cast Superlatives Game', 'prepare-for-psych-the-movie-with-a-delightful-cast-superlatives-game', '<p>Lorem ipsum dolor sit amet, omnis signiferumque in mei, mei ex enim concludaturque. Senserit salutandi euripidis no per, modus maiestatis scribentur est an. Cum ei doctus oporteat contentiones, vix graeci vocibus alienum no. Quando homero aeterno cu pro, mel ne novum ridens aliquando, harum facete per an. Ea suas pertinax has, solet officiis pericula cu pro, possit inermis qui ad. An mea tale perfecto sententiae, eos inani epicuri concludaturque ex.</p>\r\n\r\n<p>Usu an adhuc nihil. Et usu molestiae persequeris, option facilisis intellegebat vim eu, modus ullum dictas ex usu. Apeirian quaerendum pro in, no vix utinam dolore sadipscing. An cum case wisi, in case labitur expetendis per, eu sea populo adolescens dissentiet. No vivendo assueverit usu, ceteros repudiare ad vim. Ius facer integre vituperatoribus ei, duo ne vidit brute delicatissimi. Eos no dicta deseruisse, dicta sapientem expetendis mel et.</p>\r\n\r\n<p>Mei esse denique fabellas no, eu has solum definitionem. Cu laoreet intellegam inciderint eos. Per ea meliore mandamus voluptatibus, at sumo propriae suscipiantur nam. His molestiae comprehensam ut, cum simul temporibus eu. Nam aliquip maiestatis scribentur in.</p>\r\n\r\n<p>Ad est cetero reprimique. Alienum oporteat forensibus at his, ne vero epicurei sit, duo ad ceteros oporteat. No utroque torquatos vix, ullum reformidans et est, ea accumsan copiosae sit. Eam consul volumus ut, vim et posse viderer fierent, te est sumo mundi tation. Cum atomorum tractatos forensibus in.</p>\r\n\r\n<p>At ornatus nostrum vix. Mel elaboraret definitiones ea. No ancillae facilisi nam, te latine aperiam alterum sed. Est fastidii singulis gubergren ex, melius definitiones his in, his id minim animal prompta. Causae audiam molestie has et. In vero dicunt mel, mazim munere maluisset ei sit, sea persius imperdiet ea.</p>\r\n\r\n<p>At aperiam lucilius vel, etiam munere scaevola pro no. Ei quo mucius meliore, sed ne equidem dignissim. At congue ponderum sit, purto electram ius ad. Te has euismod admodum appellantur, per ea populo adipisci consequat. Ius meis dolorem scriptorem eu, augue legere an sit. Clita everti concludaturque no has.</p>\r\n', '10-08-2017', 'John Doe', 'news-45.jpg', 'Published', '', 0, 2, 'Prepare for Psych: The Movie with a Delightful Cast Superlatives Game', '', ''),
(46, 'Guardians of the Galaxy Vol. 2', 'guardians-of-the-galaxy-vol-2', '<p>Lorem ipsum dolor sit amet, omnis signiferumque in mei, mei ex enim concludaturque. Senserit salutandi euripidis no per, modus maiestatis scribentur est an. Cum ei doctus oporteat contentiones, vix graeci vocibus alienum no. Quando homero aeterno cu pro, mel ne novum ridens aliquando, harum facete per an. Ea suas pertinax has, solet officiis pericula cu pro, possit inermis qui ad. An mea tale perfecto sententiae, eos inani epicuri concludaturque ex.</p>\r\n\r\n<p>Usu an adhuc nihil. Et usu molestiae persequeris, option facilisis intellegebat vim eu, modus ullum dictas ex usu. Apeirian quaerendum pro in, no vix utinam dolore sadipscing. An cum case wisi, in case labitur expetendis per, eu sea populo adolescens dissentiet. No vivendo assueverit usu, ceteros repudiare ad vim. Ius facer integre vituperatoribus ei, duo ne vidit brute delicatissimi. Eos no dicta deseruisse, dicta sapientem expetendis mel et.</p>\r\n\r\n<p>Mei esse denique fabellas no, eu has solum definitionem. Cu laoreet intellegam inciderint eos. Per ea meliore mandamus voluptatibus, at sumo propriae suscipiantur nam. His molestiae comprehensam ut, cum simul temporibus eu. Nam aliquip maiestatis scribentur in.</p>\r\n\r\n<p>Ad est cetero reprimique. Alienum oporteat forensibus at his, ne vero epicurei sit, duo ad ceteros oporteat. No utroque torquatos vix, ullum reformidans et est, ea accumsan copiosae sit. Eam consul volumus ut, vim et posse viderer fierent, te est sumo mundi tation. Cum atomorum tractatos forensibus in.</p>\r\n\r\n<p>At ornatus nostrum vix. Mel elaboraret definitiones ea. No ancillae facilisi nam, te latine aperiam alterum sed. Est fastidii singulis gubergren ex, melius definitiones his in, his id minim animal prompta. Causae audiam molestie has et. In vero dicunt mel, mazim munere maluisset ei sit, sea persius imperdiet ea.</p>\r\n\r\n<p>At aperiam lucilius vel, etiam munere scaevola pro no. Ei quo mucius meliore, sed ne equidem dignissim. At congue ponderum sit, purto electram ius ad. Te has euismod admodum appellantur, per ea populo adipisci consequat. Ius meis dolorem scriptorem eu, augue legere an sit. Clita everti concludaturque no has.</p>\r\n', '10-08-2017', 'John Doe', 'news-46.jpg', 'Published', '', 0, 7, 'Guardians of the Galaxy Vol. 2', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_news_category`
--

CREATE TABLE `tbl_news_category` (
  `news_category_id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `access` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_news_category`
--

INSERT INTO `tbl_news_category` (`news_category_id`, `news_id`, `category_id`, `access`) VALUES
(252, 25, 16, 1),
(253, 25, 17, 0),
(254, 25, 18, 0),
(255, 25, 19, 0),
(256, 25, 20, 0),
(257, 25, 21, 0),
(258, 25, 22, 0),
(259, 25, 23, 0),
(261, 26, 16, 1),
(262, 26, 17, 0),
(263, 26, 18, 0),
(264, 26, 19, 0),
(265, 26, 20, 0),
(266, 26, 21, 0),
(267, 26, 22, 0),
(268, 26, 23, 0),
(270, 27, 16, 1),
(271, 27, 17, 0),
(272, 27, 18, 0),
(273, 27, 19, 0),
(274, 27, 20, 0),
(275, 27, 21, 0),
(276, 27, 22, 0),
(277, 27, 23, 0),
(279, 28, 16, 1),
(280, 28, 17, 0),
(281, 28, 18, 0),
(282, 28, 19, 0),
(283, 28, 20, 0),
(284, 28, 21, 0),
(285, 28, 22, 0),
(286, 28, 23, 0),
(288, 29, 16, 0),
(289, 29, 17, 0),
(290, 29, 18, 0),
(291, 29, 19, 1),
(292, 29, 20, 0),
(293, 29, 21, 0),
(294, 29, 22, 0),
(295, 29, 23, 0),
(297, 30, 16, 0),
(298, 30, 17, 0),
(299, 30, 18, 0),
(300, 30, 19, 1),
(301, 30, 20, 0),
(302, 30, 21, 0),
(303, 30, 22, 0),
(304, 30, 23, 0),
(306, 31, 16, 0),
(307, 31, 17, 0),
(308, 31, 18, 0),
(309, 31, 19, 1),
(310, 31, 20, 0),
(311, 31, 21, 0),
(312, 31, 22, 0),
(313, 31, 23, 0),
(315, 32, 16, 0),
(316, 32, 17, 0),
(317, 32, 18, 0),
(318, 32, 19, 1),
(319, 32, 20, 0),
(320, 32, 21, 0),
(321, 32, 22, 0),
(322, 32, 23, 0),
(324, 33, 16, 0),
(325, 33, 17, 0),
(326, 33, 18, 0),
(327, 33, 19, 1),
(328, 33, 20, 0),
(329, 33, 21, 0),
(330, 33, 22, 0),
(331, 33, 23, 0),
(333, 34, 16, 0),
(334, 34, 17, 0),
(335, 34, 18, 0),
(336, 34, 19, 1),
(337, 34, 20, 0),
(338, 34, 21, 0),
(339, 34, 22, 0),
(340, 34, 23, 0),
(342, 35, 16, 0),
(343, 35, 17, 0),
(344, 35, 18, 0),
(345, 35, 19, 0),
(346, 35, 20, 1),
(347, 35, 21, 0),
(348, 35, 22, 0),
(349, 35, 23, 0),
(351, 36, 16, 0),
(352, 36, 17, 0),
(353, 36, 18, 0),
(354, 36, 19, 0),
(355, 36, 20, 1),
(356, 36, 21, 0),
(357, 36, 22, 0),
(358, 36, 23, 0),
(360, 37, 16, 0),
(361, 37, 17, 0),
(362, 37, 18, 0),
(363, 37, 19, 0),
(364, 37, 20, 1),
(365, 37, 21, 0),
(366, 37, 22, 0),
(367, 37, 23, 0),
(369, 38, 16, 0),
(370, 38, 17, 0),
(371, 38, 18, 0),
(372, 38, 19, 0),
(373, 38, 20, 1),
(374, 38, 21, 0),
(375, 38, 22, 0),
(376, 38, 23, 0),
(378, 39, 16, 0),
(379, 39, 17, 0),
(380, 39, 18, 0),
(381, 39, 19, 1),
(382, 39, 20, 0),
(383, 39, 21, 0),
(384, 39, 22, 0),
(385, 39, 23, 0),
(387, 40, 16, 0),
(388, 40, 17, 0),
(389, 40, 18, 0),
(390, 40, 19, 1),
(391, 40, 20, 0),
(392, 40, 21, 0),
(393, 40, 22, 0),
(394, 40, 23, 0),
(396, 41, 16, 0),
(397, 41, 17, 0),
(398, 41, 18, 0),
(399, 41, 19, 0),
(400, 41, 20, 0),
(401, 41, 21, 1),
(402, 41, 22, 0),
(403, 41, 23, 0),
(405, 42, 16, 0),
(406, 42, 17, 0),
(407, 42, 18, 0),
(408, 42, 19, 0),
(409, 42, 20, 0),
(410, 42, 21, 1),
(411, 42, 22, 0),
(412, 42, 23, 0),
(414, 43, 16, 0),
(415, 43, 17, 0),
(416, 43, 18, 0),
(417, 43, 19, 0),
(418, 43, 20, 0),
(419, 43, 21, 1),
(420, 43, 22, 0),
(421, 43, 23, 0),
(423, 44, 16, 0),
(424, 44, 17, 0),
(425, 44, 18, 0),
(426, 44, 19, 0),
(427, 44, 20, 0),
(428, 44, 21, 1),
(429, 44, 22, 0),
(430, 44, 23, 0),
(432, 45, 16, 0),
(433, 45, 17, 0),
(434, 45, 18, 0),
(435, 45, 19, 0),
(436, 45, 20, 0),
(437, 45, 21, 1),
(438, 45, 22, 0),
(439, 45, 23, 0),
(441, 46, 16, 0),
(442, 46, 17, 0),
(443, 46, 18, 0),
(444, 46, 19, 0),
(445, 46, 20, 0),
(446, 46, 21, 1),
(447, 46, 22, 0),
(448, 46, 23, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_news_scheduled`
--

CREATE TABLE `tbl_news_scheduled` (
  `id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  `news_date` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_page`
--

CREATE TABLE `tbl_page` (
  `page_id` int(11) NOT NULL,
  `page_name` varchar(255) NOT NULL,
  `page_slug` varchar(255) NOT NULL,
  `page_content` text NOT NULL,
  `page_layout` varchar(255) NOT NULL,
  `status` varchar(30) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keyword` text NOT NULL,
  `meta_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_page`
--

INSERT INTO `tbl_page` (`page_id`, `page_name`, `page_slug`, `page_content`, `page_layout`, `status`, `meta_title`, `meta_keyword`, `meta_description`) VALUES
(1, 'About Us', 'about-us', '<p>Lorem ipsum dolor sit amet, at pro eleifend vulputate, vim movet regione ad. Has veritus adipisci aliquando eu, fugit eripuit dignissim per ea, sanctus omittam assueverit his ex. Nulla affert vix in, ei sea dolore dolores vivendum. Vix eros postea an, ius suas ubique habemus an, wisi nulla ex mel. Saepe postulant concludaturque at has. Exerci tincidunt interesset ne per, pro bonorum utroque appetere ad.</p>\r\n\r\n<p>Est ea corpora deserunt cotidieque, quo te vero melius assentior, pri ex velit altera iuvaret. Tibique hendrerit voluptaria ad quo. Ut appetere reprimique qui, aliquip suscipiantur ex eos. Nibh vero nusquam his eu, agam summo democritum mea ne. Ius in novum scripta, atqui appetere efficiantur an vel, ex probo modus temporibus nam.</p>\r\n\r\n<p>Ea feugiat nominavi quo, debet gubergren elaboraret at cum, mel timeam vivendo mentitum cu. Aeque civibus luptatum cu eos. Novum facilisi insolens his et, ex aliquip tibique laboramus vim. Vix brute appellantur ei.</p>\r\n\r\n<p>Nec eros viderer ne, mel ad suas offendit suavitate, te pri laoreet legendos hendrerit. Per ut paulo urbanitas mediocritatem, in sea facilisis imperdiet torquatos, ea vis soleat fierent pertinacia. Maiestatis reprimique no est, ut ius esse tation. Nam animal discere omnesque at. Evertitur adipiscing vis ei, his ut luptatum recteque, et idque mundi vim.</p>\r\n\r\n<p>Adhuc vocibus at mei, nulla altera eu vim. At sit quot ferri everti. Mea ea doming dictas possim. Te mea facete nominati constituam, no discere democritum has, ei nam eirmod vocent deserunt. Eu wisi voluptatibus mea, elit errem ad pro, vim quando denique id. Labitur accommodare eam at.</p>\r\n', 'Full Width', 'Active', '', '', ''),
(2, 'Contact Us', 'contact-us', '<p>This is a contact us page.&nbsp;This is a contact us page.&nbsp;This is a contact us page.&nbsp;This is a contact us page.&nbsp;This is a contact us page.&nbsp;This is a contact us page.&nbsp;This is a contact us page.&nbsp;This is a contact us page.&nbsp;This is a contact us page.&nbsp;This is a contact us page.&nbsp;This is a contact us page.&nbsp;This is a contact us page.&nbsp;</p>\r\n', 'Contact Us', 'Active', '', '', ''),
(5, 'Photo Gallery', 'photo-gallery', '', 'Gallery Page', 'Active', '', '', ''),
(6, 'Video Gallery', 'video-gallery', '', 'Video Page', 'Active', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_photo`
--

CREATE TABLE `tbl_photo` (
  `photo_id` int(11) NOT NULL,
  `photo_caption` varchar(255) NOT NULL,
  `photo_name` varchar(255) NOT NULL,
  `p_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_photo`
--

INSERT INTO `tbl_photo` (`photo_id`, `photo_caption`, `photo_name`, `p_category_id`) VALUES
(8, 'Photo 1', 'photo-8.jpg', 1),
(9, 'Photo 2', 'photo-9.jpg', 1),
(10, 'Photo 3', 'photo-10.jpg', 1),
(11, 'Photo 4', 'photo-11.jpg', 2),
(12, 'Photo 5', 'photo-12.jpg', 2),
(13, 'Photo 6', 'photo-13.jpg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_settings`
--

CREATE TABLE `tbl_settings` (
  `id` int(11) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `favicon` varchar(255) NOT NULL,
  `footer_about` text NOT NULL,
  `footer_copyright` text NOT NULL,
  `contact_address` text NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `contact_phone` varchar(255) NOT NULL,
  `contact_fax` varchar(255) NOT NULL,
  `contact_map_iframe` text NOT NULL,
  `receive_email` varchar(255) NOT NULL,
  `receive_email_subject` varchar(255) NOT NULL,
  `receive_email_thank_you_message` text NOT NULL,
  `total_recent_news` int(10) NOT NULL,
  `total_popular_news` int(10) NOT NULL,
  `meta_title_home` text NOT NULL,
  `meta_keyword_home` text NOT NULL,
  `meta_description_home` text NOT NULL,
  `mod_rewrite` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_settings`
--

INSERT INTO `tbl_settings` (`id`, `logo`, `favicon`, `footer_about`, `footer_copyright`, `contact_address`, `contact_email`, `contact_phone`, `contact_fax`, `contact_map_iframe`, `receive_email`, `receive_email_subject`, `receive_email_thank_you_message`, `total_recent_news`, `total_popular_news`, `meta_title_home`, `meta_keyword_home`, `meta_description_home`, `mod_rewrite`) VALUES
(1, 'logo.png', 'favicon.png', '<p>Lorem ipsum dolor sit amet, omnis signiferumque in mei, mei ex enim concludaturque. Senserit salutandi euripidis no per, modus maiestatis scribentur est an. Cum ei doctus oporteat contentiones, vix graeci vocibus alienum no. Quando homero aeterno cu pro, mel ne novum ridens aliquando, harum facete per an.</p>\r\n\r\n<p>Ea suas pertinax has, solet officiis pericula cu pro, possit inermis qui ad. An mea tale perfecto sententiae, eos inani epicuri concludaturque ex.</p>\r\n', 'Copyright Â© 2017, Xicia. All Rights Reserved.', 'ABC Steet, NewYork.', 'info@yourdomain.com', '123-456-7878', '123-456-7890', '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d387142.84040262736!2d-74.25819605476612!3d40.70583158628177!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew+York%2C+NY%2C+USA!5e0!3m2!1sen!2sbd!4v1485712851643" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>', 'jbbr.1990@gmail.com', 'Visitor Email Message - NewsTree', 'Thank you for sending email. We will contact you shortly.', 3, 3, 'NewsTree - Magazine and News Online Portal CMS', 'news, posts, sports, entertainment, politics, cricket', 'NewsTree is a nice and clean responsive Magazine and News Online Portal CMS.', 'Off');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_social`
--

CREATE TABLE `tbl_social` (
  `social_id` int(11) NOT NULL,
  `social_name` varchar(30) NOT NULL,
  `social_url` varchar(255) NOT NULL,
  `social_icon` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_social`
--

INSERT INTO `tbl_social` (`social_id`, `social_name`, `social_url`, `social_icon`) VALUES
(1, 'Facebook', '#', 'fa fa-facebook'),
(2, 'Twitter', '#', 'fa fa-twitter'),
(3, 'LinkedIn', '#', 'fa fa-linkedin'),
(4, 'Google Plus', '', 'fa fa-google-plus'),
(5, 'Pinterest', '#', 'fa fa-pinterest'),
(6, 'YouTube', '', 'fa fa-youtube'),
(7, 'Instagram', '', 'fa fa-instagram'),
(8, 'Tumblr', '', 'fa fa-tumblr'),
(9, 'Flickr', '', 'fa fa-flickr'),
(10, 'Reddit', '', 'fa fa-reddit'),
(11, 'Snapchat', '', 'fa fa-snapchat'),
(12, 'WhatsApp', '', 'fa fa-whatsapp'),
(13, 'Quora', '', 'fa fa-quora'),
(14, 'StumbleUpon', '', 'fa fa-stumbleupon'),
(15, 'Delicious', '', 'fa fa-delicious'),
(16, 'Digg', '', 'fa fa-digg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subscriber`
--

CREATE TABLE `tbl_subscriber` (
  `subs_id` int(11) NOT NULL,
  `subs_email` varchar(255) NOT NULL,
  `subs_date` varchar(100) NOT NULL,
  `subs_date_time` varchar(100) NOT NULL,
  `subs_hash` varchar(255) NOT NULL,
  `subs_active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_subscriber`
--

INSERT INTO `tbl_subscriber` (`subs_id`, `subs_email`, `subs_date`, `subs_date_time`, `subs_hash`, `subs_active`) VALUES
(4, 'jbbr.1990@gmail.com', '2017-08-10', '2017-08-10 07:44:23', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(10) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `role` varchar(30) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `full_name`, `email`, `phone`, `password`, `photo`, `role`, `status`) VALUES
(1, 'John Doe', 'sadmin@gmail.com', '0177777777', '81dc9bdb52d04dc20036dbd8313ed055', 'user-1.png', 'Super Admin', 'Active'),
(13, 'Kakon Asif', 'admin@gmail.com', '', '81dc9bdb52d04dc20036dbd8313ed055', '', 'Admin', 'Active'),
(14, 'Sabbir Ahmed', 'publisher@gmail.com', '', '81dc9bdb52d04dc20036dbd8313ed055', '', 'Publisher', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_video`
--

CREATE TABLE `tbl_video` (
  `video_id` int(11) NOT NULL,
  `video_title` varchar(255) NOT NULL,
  `video_iframe` text NOT NULL,
  `v_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_video`
--

INSERT INTO `tbl_video` (`video_id`, `video_title`, `video_iframe`, `v_category_id`) VALUES
(3, 'Video 1', '<iframe width="560" height="315" src="https://www.youtube.com/embed/RY2OEpAf5oY" frameborder="0" allowfullscreen></iframe>', 1),
(4, 'Video 2', '<iframe width="560" height="315" src="https://www.youtube.com/embed/F1CW0MjD1T0" frameborder="0" allowfullscreen></iframe>', 1),
(5, 'Video 3', '<iframe width="560" height="315" src="https://www.youtube.com/embed/LPF1MSkGgRM" frameborder="0" allowfullscreen></iframe>', 1),
(6, 'Video 4', '<iframe width="560" height="315" src="https://www.youtube.com/embed/RcmrbNRK-jY" frameborder="0" allowfullscreen></iframe>', 2),
(7, 'Video 5', '<iframe width="560" height="315" src="https://www.youtube.com/embed/ka-ZgwCXKho" frameborder="0" allowfullscreen></iframe>', 2),
(8, 'Video 6', '<iframe width="560" height="315" src="https://www.youtube.com/embed/fP582Ro62hQ" frameborder="0" allowfullscreen></iframe>', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_advertisement`
--
ALTER TABLE `tbl_advertisement`
  ADD PRIMARY KEY (`adv_id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tbl_category_photo`
--
ALTER TABLE `tbl_category_photo`
  ADD PRIMARY KEY (`p_category_id`);

--
-- Indexes for table `tbl_category_video`
--
ALTER TABLE `tbl_category_video`
  ADD PRIMARY KEY (`v_category_id`);

--
-- Indexes for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_file`
--
ALTER TABLE `tbl_file`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `tbl_home_category`
--
ALTER TABLE `tbl_home_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `tbl_news`
--
ALTER TABLE `tbl_news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `tbl_news_category`
--
ALTER TABLE `tbl_news_category`
  ADD PRIMARY KEY (`news_category_id`);

--
-- Indexes for table `tbl_news_scheduled`
--
ALTER TABLE `tbl_news_scheduled`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_page`
--
ALTER TABLE `tbl_page`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `tbl_photo`
--
ALTER TABLE `tbl_photo`
  ADD PRIMARY KEY (`photo_id`);

--
-- Indexes for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_social`
--
ALTER TABLE `tbl_social`
  ADD PRIMARY KEY (`social_id`);

--
-- Indexes for table `tbl_subscriber`
--
ALTER TABLE `tbl_subscriber`
  ADD PRIMARY KEY (`subs_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_video`
--
ALTER TABLE `tbl_video`
  ADD PRIMARY KEY (`video_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_advertisement`
--
ALTER TABLE `tbl_advertisement`
  MODIFY `adv_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `tbl_category_photo`
--
ALTER TABLE `tbl_category_photo`
  MODIFY `p_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_category_video`
--
ALTER TABLE `tbl_category_video`
  MODIFY `v_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_file`
--
ALTER TABLE `tbl_file`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_home_category`
--
ALTER TABLE `tbl_home_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tbl_news`
--
ALTER TABLE `tbl_news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `tbl_news_category`
--
ALTER TABLE `tbl_news_category`
  MODIFY `news_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=449;
--
-- AUTO_INCREMENT for table `tbl_news_scheduled`
--
ALTER TABLE `tbl_news_scheduled`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_page`
--
ALTER TABLE `tbl_page`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_photo`
--
ALTER TABLE `tbl_photo`
  MODIFY `photo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_social`
--
ALTER TABLE `tbl_social`
  MODIFY `social_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `tbl_subscriber`
--
ALTER TABLE `tbl_subscriber`
  MODIFY `subs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `tbl_video`
--
ALTER TABLE `tbl_video`
  MODIFY `video_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
