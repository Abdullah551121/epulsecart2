<?php
ob_start();
session_start();
include("config.php");
include("../includes/functions.php");
$error_message = '';
$success_message = '';
$error_message1 = '';
$success_message1 = '';

// Check if the user is logged in or not
if(!isset($_SESSION['user'])) {
	header('location: login.php');
	exit;
}

// Getting data from the website settings table
$statement = $pdo->prepare("SELECT * FROM tbl_settings WHERE id=1");
$statement->execute();
$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
foreach ($result as $row) {
	$receive_email = $row['receive_email'];
}

// Current Page Access Level check for all pages
$cur_page = substr($_SERVER["SCRIPT_NAME"],strrpos($_SERVER["SCRIPT_NAME"],"/")+1);

if($_SESSION['user']['role']=='Admin') {
	if( $cur_page == 'user.php' || $cur_page == 'user-add.php' || $cur_page == 'user-edit.php' || $cur_page == 'user-delete.php' ) {
		header('location: index.php');
		exit;
	}
}

if($_SESSION['user']['role']=='Publisher') {
	if( $cur_page != 'index.php' 
	    && $cur_page != 'profile-edit.php' 
	    && $cur_page != 'subscriber.php' 
	    && $cur_page != 'news.php'
	    && $cur_page != 'news-add.php' 
	    && $cur_page != 'news-edit.php' 
	    && $cur_page != 'news-delete.php' 
	    && $cur_page != 'file.php'
		&& $cur_page != 'file-add.php' 
	    && $cur_page != 'file-edit.php' 
	    && $cur_page != 'file-delete.php' 
	    && $cur_page != 'photo.php'
		&& $cur_page != 'photo-add.php' 
	    && $cur_page != 'photo-edit.php' 
	    && $cur_page != 'photo-delete.php'
	    && $cur_page != 'video.php'
		&& $cur_page != 'video-add.php' 
	    && $cur_page != 'video-edit.php' 
	    && $cur_page != 'video-delete.php'
	) {
		header('location: index.php');
		exit;
	}
}



// Check if today is news published date. If yes, then publish it.
$today = date('d-m-Y');
$statement = $pdo->prepare("SELECT * FROM tbl_news_scheduled WHERE news_date=?");
$statement->execute(array($today));
$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
foreach ($result as $row) {
	$temp_arr[] = $row['news_id'];
}

if(isset($temp_arr)) {
	for($i=0;$i<count($temp_arr);$i++) {
		$statement = $pdo->prepare("UPDATE tbl_news SET status=? WHERE news_id=?");
		$statement->execute(array('Published',$temp_arr[$i]));

		$statement = $pdo->prepare("DELETE FROM tbl_news_scheduled WHERE news_id=?");
		$statement->execute(array($temp_arr[$i]));
	}
}
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>NewsTree - Admin Panel</title>

	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/ionicons.min.css">
	<link rel="stylesheet" href="css/datepicker3.css">
	<link rel="stylesheet" href="css/all.css">
	<link rel="stylesheet" href="css/select2.min.css">
	<link rel="stylesheet" href="css/dataTables.bootstrap.css">
	<link rel="stylesheet" href="css/jquery.fancybox.css">
	<link rel="stylesheet" href="css/AdminLTE.min.css">
	<link rel="stylesheet" href="css/_all-skins.min.css">
	<link rel="stylesheet" href="style.css">
</head>

<body class="hold-transition fixed skin-blue sidebar-mini">

	<div class="wrapper">

		<header class="main-header">

			<a href="index.php" class="logo">
				<span class="logo-lg">NewsTree</span>
			</a>

			<nav class="navbar navbar-static-top">
				
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
					<span class="sr-only">Toggle navigation</span>
				</a>

				<span style="float:left;line-height:50px;color:#fff;padding-left:15px;font-size:18px;">Admin Panel</span>

				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<li class="dropdown user user-menu">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<img src="../assets/uploads/<?php echo $_SESSION['user']['photo']; ?>" class="user-image" alt="User Image">
								<span class="hidden-xs"><?php echo $_SESSION['user']['full_name']; ?></span>
							</a>
							<ul class="dropdown-menu">
								<li class="user-footer">
									<div>
										<a href="profile-edit.php" class="btn btn-default btn-flat">Edit Profile</a>
									</div>
									<div>
										<a href="logout.php" class="btn btn-default btn-flat">Log out</a>
									</div>
								</li>
							</ul>
						</li>
					</ul>
				</div>

			</nav>
		</header>

  		<?php $cur_page = substr($_SERVER["SCRIPT_NAME"],strrpos($_SERVER["SCRIPT_NAME"],"/")+1); ?>

  		<aside class="main-sidebar">
    		<section class="sidebar">
      
      			<ul class="sidebar-menu">

			        <li class="treeview <?php if($cur_page == 'index.php') {echo 'active';} ?>">
			          <a href="index.php">
			            <i class="fa fa-laptop"></i> <span>Dashboard</span>
			          </a>
			        </li>


					<?php if($_SESSION['user']['role'] == 'Super Admin'): ?>
			        <li class="treeview <?php if( ($cur_page == 'user-add.php')||($cur_page == 'user.php')||($cur_page == 'user-edit.php') ) {echo 'active';} ?>">
			          <a href="user.php">
			            <i class="fa fa-user-plus"></i> <span>User</span>
			          </a>
			        </li>
			    	<?php endif; ?>

					

					<?php 
						if($_SESSION['user']['role'] == 'Super Admin' 
					      || $_SESSION['user']['role'] == 'Admin'):
					?>
			        <li class="treeview <?php if( ($cur_page == 'settings.php') ) {echo 'active';} ?>">
			          <a href="settings.php">
			            <i class="fa fa-cog"></i> <span>Settings</span>
			          </a>
			        </li>
			        <?php endif; ?>
			        

					<?php 
						if($_SESSION['user']['role'] == 'Super Admin' 
					      || $_SESSION['user']['role'] == 'Admin'):
					?>
			        <li class="treeview <?php if( ($cur_page == 'home-page-category.php') ) {echo 'active';} ?>">
			          <a href="home-page-category.php">
			            <i class="fa fa-home"></i> <span>Home Page</span>
			          </a>
			        </li>
			        <?php endif; ?>

					
					<?php 
						if($_SESSION['user']['role'] == 'Super Admin' 
					      || $_SESSION['user']['role'] == 'Admin'):
					?>
			        <li class="treeview <?php if( ($cur_page == 'category-add.php')||($cur_page == 'category.php')||($cur_page == 'category-edit.php') ) {echo 'active';} ?>">
			          <a href="category.php">
			            <i class="fa fa-sliders"></i> <span>Category</span>
			          </a>
			        </li>
			        <?php endif; ?>



					<?php 
						if($_SESSION['user']['role'] == 'Super Admin' 
					      || $_SESSION['user']['role'] == 'Admin'):
					?>
			        <li class="treeview <?php if( ($cur_page == 'page-add.php')||($cur_page == 'page.php')||($cur_page == 'page-edit.php') ) {echo 'active';} ?>">
			          <a href="page.php">
			            <i class="fa fa-file-text"></i> <span>Page</span>
			          </a>
			        </li>
			        <?php endif; ?>


					<?php 
						if($_SESSION['user']['role'] == 'Super Admin' 
					      || $_SESSION['user']['role'] == 'Admin'):
					?>
			        <li class="treeview <?php if( ($cur_page == 'menu-add.php')||($cur_page == 'menu.php')||($cur_page == 'menu-edit.php') ) {echo 'active';} ?>">
			          <a href="menu.php">
			            <i class="fa fa-bars"></i> <span>Menu</span>
			          </a>
			        </li>
			        <?php endif; ?>

					

			        <li class="treeview <?php if( ($cur_page == 'news-add.php')||($cur_page == 'news.php')||($cur_page == 'news-edit.php') ) {echo 'active';} ?>">
			          <a href="news.php">
			            <i class="fa fa-newspaper-o"></i> <span>News</span>
			          </a>
			        </li>

					

					<?php 
						if($_SESSION['user']['role'] == 'Super Admin' 
					      || $_SESSION['user']['role'] == 'Admin'):
					?>
			        <li class="treeview <?php if( ($cur_page == 'comment.php') ) {echo 'active';} ?>">
			          <a href="comment.php">
			            <i class="fa fa-comment"></i> <span>Comment</span>
			          </a>
			        </li>
			        <?php endif; ?>




			        <li class="treeview <?php if( ($cur_page == 'file-add.php')||($cur_page == 'file.php')||($cur_page == 'file-edit.php') ) {echo 'active';} ?>">
			          <a href="file.php">
			            <i class="fa fa-file"></i> <span>File Upload (Media)</span>
			          </a>
			        </li>


					<?php 
						if($_SESSION['user']['role'] == 'Super Admin' 
					      || $_SESSION['user']['role'] == 'Admin'):
					?>
					<li class="treeview <?php if( ($cur_page == 'photo-category-add.php')||($cur_page == 'photo-category.php')||($cur_page == 'photo-category-edit.php') ) {echo 'active';} ?>">
			          <a href="photo-category.php">
			            <i class="fa fa-picture-o"></i> <span>Photo Category</span>
			          </a>
			        </li>
			        <?php endif; ?>


			        <li class="treeview <?php if( ($cur_page == 'photo-add.php')||($cur_page == 'photo.php')||($cur_page == 'photo-edit.php') ) {echo 'active';} ?>">
			          <a href="photo.php">
			            <i class="fa fa-picture-o"></i> <span>Photo Gallery</span>
			          </a>
			        </li>
					

					<?php 
						if($_SESSION['user']['role'] == 'Super Admin' 
					      || $_SESSION['user']['role'] == 'Admin'):
					?>
					<li class="treeview <?php if( ($cur_page == 'video-category-add.php')||($cur_page == 'video-category.php')||($cur_page == 'video-category-edit.php') ) {echo 'active';} ?>">
			          <a href="video-category.php">
			            <i class="fa fa-camera"></i> <span>Video Category</span>
			          </a>
			        </li>
			        <?php endif; ?>

			        

			        <li class="treeview <?php if( ($cur_page == 'video-add.php')||($cur_page == 'video.php')||($cur_page == 'video-edit.php') ) {echo 'active';} ?>">
			          <a href="video.php">
			            <i class="fa fa-camera"></i> <span>Video Gallery</span>
			          </a>
			        </li>

					
					<?php 
						if($_SESSION['user']['role'] == 'Super Admin' 
					      || $_SESSION['user']['role'] == 'Admin'):
					?>
			        <li class="treeview <?php if( ($cur_page == 'social-media.php') ) {echo 'active';} ?>">
			          <a href="social-media.php">
			            <i class="fa fa-address-book"></i> <span>Social Media</span>
			          </a>
			        </li>
			        <?php endif; ?>

					
					<?php 
						if($_SESSION['user']['role'] == 'Super Admin' 
					      || $_SESSION['user']['role'] == 'Admin'):
					?>
			        <li class="treeview <?php if( ($cur_page == 'advertisement-add.php')||($cur_page == 'advertisement.php')||($cur_page == 'advertisement-edit.php') ) {echo 'active';} ?>">
			          <a href="advertisement.php">
			            <i class="fa fa-podcast"></i> <span>Advertisement</span>
			          </a>
			        </li>
			        <?php endif; ?>

			        <li class="treeview <?php if( ($cur_page == 'subscriber.php')||($cur_page == 'subscriber.php') ) {echo 'active';} ?>">
			          <a href="subscriber.php">
			            <i class="fa fa-users"></i> <span>Subscriber</span>
			          </a>
			        </li>
        
      			</ul>
    		</section>
  		</aside>

  		<div class="content-wrapper">