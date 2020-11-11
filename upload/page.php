<?php
require_once('header.php');

// Preventing the direct access of this page.
if(!isset($_REQUEST['slug']))
{
	header('location: index.php');
	exit;
}
else
{
	// Check the page slug is valid or not.
	$statement = $pdo->prepare("SELECT * FROM tbl_page WHERE page_slug=? AND status=?");
	$statement->execute(array($_REQUEST['slug'],'Active'));
	$total = $statement->rowCount();
	if( $total == 0 )
	{
		header('location: index.php');
		exit;
	}
}

// Getting the detailed data of a page from page slug
$statement = $pdo->prepare("SELECT * FROM tbl_page WHERE page_slug=?");
$statement->execute(array($_REQUEST['slug']));
$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
foreach ($result as $row) 
{
	$page_name    = $row['page_name'];
	$page_slug    = $row['page_slug'];
	$page_content = $row['page_content'];
	$page_layout  = $row['page_layout'];
	$status       = $row['status'];
}

// If a page is not active, redirect the user while direct URL press
if($status == 'Inactive')
{
	header('location: index.php');
	exit;
}
?>

<!-- Blog Start -->
<div class="news">
	<div class="container">

		<?php if($page_layout == 'Full Width'): ?>
		<div class="row">
			<div class="col-md-12">
				
				<div class="row">
					<div class="col-md-12">
						<div class="heading">
							<h2 class="sidebar-heading"><?php echo $page_name; ?></h2>
						</div>
						<div class="single-page-content">
						<?php
							echo $page_content;
						?>
						</div>
					</div>
				</div>

			</div>
		</div>
		<?php endif; ?>

		<?php if($page_layout == 'Page with Sidebar'): ?>
		<div class="row">
			<div class="col-md-8">
				
				<div class="row">
					<div class="col-md-12">
						<div class="heading">
							<h2 class="sidebar-heading"><?php echo $page_name; ?></h2>
						</div>
						<div class="single-page-content">
						<?php
							echo $page_content;
						?>
						</div>
					</div>
				</div>

			</div>
			<div class="col-md-4">
				<?php include('sidebar.php'); ?>
			</div>
		</div>
		<?php endif; ?>


		<?php if($page_layout == 'Contact Us'): ?>
		<?php
		$statement = $pdo->prepare("SELECT * FROM tbl_settings WHERE id=1");
		$statement->execute();
		$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
		foreach ($result as $row) 
		{
			$contact_map_iframe = $row['contact_map_iframe'];
		}
		?>	
		<div class="row">
			<div class="col-md-12">
				<div class="heading">
					<h2 class="sidebar-heading"><?php echo $page_name; ?></h2>
				</div>
			</div>
			<div class="col-md-7">
<?php
// After form submit checking everything for email sending
if(isset($_POST['form_contact']))
{
	$error_message = '';
	$success_message = '';
	$statement = $pdo->prepare("SELECT * FROM tbl_settings WHERE id=1");
	$statement->execute();
	$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
	foreach ($result as $row) 
	{
		$receive_email = $row['receive_email'];
		$receive_email_subject = $row['receive_email_subject'];
		$receive_email_thank_you_message = $row['receive_email_thank_you_message'];
	}

    $valid = 1;

    

    if(empty($_POST['visitor_name']))
    {
        $valid = 0;
        $error_message .= 'Please enter your name.\n';
    }

    if(empty($_POST['visitor_phone']))
    {
        $valid = 0;
        $error_message .= 'Please enter your phone number.\n';
    }


    if(empty($_POST['visitor_email']))
    {
        $valid = 0;
        $error_message .= 'Please enter your email address.\n';
    }
    else
    {
    	// Email validation check
        if(!filter_var($_POST['visitor_email'], FILTER_VALIDATE_EMAIL))
        {
            $valid = 0;
            $error_message .= 'Please enter a valid email address.\n';
        }
    }

    if(empty($_POST['visitor_comment']))
    {
        $valid = 0;
        $error_message .= 'Please enter your comment.\n';
    }

    if($valid == 1)
    {

    	$visitor_name = strip_tags($_POST['visitor_name']);
	    $visitor_phone = strip_tags($_POST['visitor_phone']);
	    $visitor_email = strip_tags($_POST['visitor_email']);
	    $visitor_comment = strip_tags($_POST['visitor_comment']);

        // sending email
        $to_admin = $receive_email;
        $subject = $receive_email_subject;
		$message = '
<html><body>
<table>
<tr>
<td><b>Name: </b></td>
<td>'.$visitor_name.'</td>
</tr>
<tr>
<td><b>Email: </b></td>
<td>'.$visitor_email.'</td>
</tr>
<tr>
<td><b>Phone: </b></td>
<td>'.$visitor_phone.'</td>
</tr>
<tr>
<td><b>Comment: </b></td>
<td>'.$visitor_comment.'</td>
</tr>
</table>
</body></html>
';
		$headers = 'From: ' . $visitor_email . "\r\n" .
				   'Reply-To: ' . $visitor_email . "\r\n" .
				   'X-Mailer: PHP/' . phpversion() . "\r\n" . 
				   "MIME-Version: 1.0\r\n" . 
				   "Content-Type: text/html; charset=ISO-8859-1\r\n";

		// Sending email to admin				   
        mail($to_admin, $subject, $message, $headers); 
		
        $success_message = $receive_email_thank_you_message;

    }
}
?>
				
				<?php
				if($error_message != '') {
					echo "<script>alert('".$error_message."')</script>";
				}
				if($success_message != '') {
					echo "<script>alert('".$success_message."')</script>";
				}
				?>

				<form action="" class="form-horizontal cform-1" method="post">
					<div class="form-group">
                        <div class="col-sm-12">
                            <input name="visitor_name" type="text" class="form-control" placeholder="Name">
                        </div>
                    </div>
					<div class="form-group">
                        <div class="col-sm-12">
                            <input name="visitor_email" type="email" class="form-control" placeholder="Email Address">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12">
                            <input name="visitor_phone" type="text" class="form-control" placeholder="Phone Number">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12">
                            <textarea name="visitor_comment" class="form-control" cols="30" rows="10" placeholder="Message"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
	                    <div class="col-sm-12">
	                        <input type="submit" value="Send Message" class="btn btn-success" name="form_contact">
	                    </div>
	                </div>
				</form>

			</div>
			<div class="col-md-5">
				<div class="google-map">
					<?php echo $contact_map_iframe; ?>
				</div>				
			</div>
		</div>
		<?php endif; ?>


		<?php if($page_layout == 'Gallery Page'): ?>
		<div class="row">
			<div class="col-md-12">				
				<div class="heading">
					<h2 class="sidebar-heading"><?php echo $page_name; ?></h2>
				</div>
				<section class="gallery">													
					<div class="item">
						<?php
						$statement = $pdo->prepare("SELECT * FROM tbl_category_photo WHERE status=? ORDER BY p_category_id DESC");
						$statement->execute(array('Active'));
						$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
						foreach ($result as $row) 
						{
							?><div class="clear"></div><h3><?php echo $row['p_category_name']; ?></h3><?php

							$statement1 = $pdo->prepare("SELECT * FROM tbl_photo WHERE p_category_id=? ORDER BY photo_id DESC");
							$statement1->execute(array($row['p_category_id']));
							$result1 = $statement1->fetchAll();
							foreach ($result1 as $row1) 
							{
								?>
								<div class="col-md-4">
									<div class="inner">
										<div class="photo" style="background-image: url(<?php echo BASE_URL; ?>assets/uploads/<?php echo $row1['photo_name']; ?>);">
										</div>
										<div class="desc">
											<h4>
												<a class="gallery-photo" href="<?php echo BASE_URL; ?>assets/uploads/<?php echo $row1['photo_name']; ?>" title="<?php echo $row1['photo_caption']; ?>"><i class="fa fa-search-plus"></i></a>
											</h4>
										</div>
									</div>
								</div>
								<?php
							}
						}
						?>
					</div>					
				</section>					
			</div>
		</div>
		<?php endif; ?>


		<?php if($page_layout == 'Video Page'): ?>
		<div class="row">
			<div class="col-md-12">				
				<div class="heading">
					<h2 class="sidebar-heading"><?php echo $page_name; ?></h2>
				</div>
				<section class="gallery">													
					<div class="item">
						<?php
						$statement = $pdo->prepare("SELECT * FROM tbl_category_video WHERE status=? ORDER BY v_category_id DESC");
						$statement->execute(array('Active'));
						$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
						foreach ($result as $row) 
						{
							?><div class="clear"></div><h3><?php echo $row['v_category_name']; ?></h3><?php

							$statement1 = $pdo->prepare("SELECT * FROM tbl_video WHERE v_category_id=? ORDER BY video_id DESC");
							$statement1->execute(array($row['v_category_id']));
							$result1 = $statement1->fetchAll();
							foreach ($result1 as $row1) 
							{
								?>
								<div class="col-md-4">
									<div class="inner">
										<div class="video-iframe">
											<?php
												echo $row1['video_iframe'];
											?>
										</div>
									</div>
								</div>
								<?php
							}
						}
						?>
					</div>					
				</section>					
			</div>
		</div>
		<?php endif; ?>
	</div>
</div>
<!-- Blog End -->

<?php require_once('footer.php'); ?>