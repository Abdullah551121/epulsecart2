<?php require_once('header.php'); ?>

<?php
if(isset($_POST['form1'])) {
	$valid = 1;

	if(empty($_POST['news_title'])) {
		$valid = 0;
		$error_message .= 'News title can not be empty<br>';
	} else {
		// Duplicate Category checking
    	// current news title that is in the database
    	$statement = $pdo->prepare("SELECT * FROM tbl_news WHERE news_id=?");
		$statement->execute(array($_REQUEST['id']));
		$result = $statement->fetchAll(PDO::FETCH_ASSOC);
		foreach($result as $row) {
			$current_news_title = $row['news_title'];
		}

		$statement = $pdo->prepare("SELECT * FROM tbl_news WHERE news_title=? and news_title!=?");
    	$statement->execute(array($_POST['news_title'],$current_news_title));
    	$total = $statement->rowCount();							
    	if($total) {
    		$valid = 0;
        	$error_message .= 'News title already exists<br>';
    	}
	}

	if(empty($_POST['news_content'])) {
		$valid = 0;
		$error_message .= 'News content can not be empty<br>';
	}

	if(empty($_POST['news_date'])) {
		$valid = 0;
		$error_message .= 'News publish date can not be empty<br>';
	}

	if($_POST['publisher'] == '') {
		$publisher = $_SESSION['user']['full_name'];
	} else {
		$publisher = $_POST['publisher'];	
	}


	// IMAGE MAGIC HERE
	$path = $_FILES['photo']['name'];
    $path_tmp = $_FILES['photo']['tmp_name'];


    // getting previous photo status
    $previous_photo = $_POST['previous_photo'];


	// CATEGORY MAGIC HERE
	foreach($_POST['category_ids'] as $key=>$value) {
		if($value!='') {
			$arr1[] = $value;
		}
	}
	
	if(empty($arr1)) {
		$valid = 0;
        $error_message .= 'You must have to select at least one category<br>';
	}
	

	if($path!='') {
        $ext = pathinfo( $path, PATHINFO_EXTENSION );
        $file_name = basename( $path, '.' . $ext );
        if( $ext!='jpg' && $ext!='png' && $ext!='jpeg' && $ext!='gif' ) {
            $valid = 0;
            $error_message .= 'You must have to upload jpg, jpeg, gif or png file<br>';
        }
    }

	if($valid == 1) {

		if($_POST['news_slug'] == '') {
    		// generate slug
    		$temp_string = strtolower($_POST['news_title']);
    		$news_slug = preg_replace('/[^A-Za-z0-9-]+/', '-', $temp_string);;
    	} else {
    		$temp_string = strtolower($_POST['news_slug']);
    		$news_slug = preg_replace('/[^A-Za-z0-9-]+/', '-', $temp_string);
    	}

    	// if slug already exists, then rename it
		$statement = $pdo->prepare("SELECT * FROM tbl_news WHERE news_slug=? AND news_title!=?");
		$statement->execute(array($news_slug,$current_news_title));
		$total = $statement->rowCount();
		if($total) {
			$news_slug = $news_slug.'-1';
		}

		// Update tbl_news_category making access value to 0 for particular news
		$statement = $pdo->prepare("UPDATE tbl_news_category SET access=0 WHERE news_id=?");
		$statement->execute(array($_REQUEST['id']));

		// Update tbl_news_category putting updated access value for particular news
		for($i=0;$i<count($arr1);$i++) {
			$statement = $pdo->prepare("UPDATE tbl_news_category SET access=1 WHERE news_id=? AND category_id=?");
			$statement->execute(array($_REQUEST['id'],$arr1[$i]));
		}

		// Check tbl_news_scheduled

		// If previous image not found and user do not want to change the photo
	    if($previous_photo == '' && $path == '') {
	    	$statement = $pdo->prepare("UPDATE tbl_news SET news_title=?, news_slug=?, news_content=?, news_date=?, publisher=?,  status=?, source=?, is_featured=?, meta_title=?, meta_keyword=?, meta_description=? WHERE news_id=?");
	    	$statement->execute(array($_POST['news_title'],$news_slug,$_POST['news_content'],$_POST['news_date'],$publisher,$_POST['status'],$_POST['source'],$_POST['is_featured'],$_POST['meta_title'],$_POST['meta_keyword'],$_POST['meta_description'],$_REQUEST['id']));
	    }

		// If previous image found and user do not want to change the photo
	    if($previous_photo != '' && $path == '') {
	    	$statement = $pdo->prepare("UPDATE tbl_news SET news_title=?, news_slug=?, news_content=?, news_date=?, publisher=?,  status=?, source=?, is_featured=?, meta_title=?, meta_keyword=?, meta_description=? WHERE news_id=?");
	    	$statement->execute(array($_POST['news_title'],$news_slug,$_POST['news_content'],$_POST['news_date'],$publisher,$_POST['status'],$_POST['source'],$_POST['is_featured'],$_POST['meta_title'],$_POST['meta_keyword'],$_POST['meta_description'],$_REQUEST['id']));
	    }


	    // If previous image not found and user want to change the photo
	    if($previous_photo == '' && $path != '') {

	    	$final_name = 'news-'.$_REQUEST['id'].'.'.$ext;
            move_uploaded_file( $path_tmp, '../assets/uploads/'.$final_name );

	    	$statement = $pdo->prepare("UPDATE tbl_news SET news_title=?, news_slug=?, news_content=?, news_date=?, publisher=?, photo=?, status=?, source=?, is_featured=?, meta_title=?, meta_keyword=?, meta_description=? WHERE news_id=?");
	    	$statement->execute(array($_POST['news_title'],$news_slug,$_POST['news_content'],$_POST['news_date'],$publisher,$final_name,$_POST['status'],$_POST['source'],$_POST['is_featured'],$_POST['meta_title'],$_POST['meta_keyword'],$_POST['meta_description'],$_REQUEST['id']));
	    }

	    
	    // If previous image found and user want to change the photo
		if($previous_photo != '' && $path != '') {

	    	unlink('../assets/uploads/'.$previous_photo);

	    	$final_name = 'news-'.$_REQUEST['id'].'.'.$ext;
            move_uploaded_file( $path_tmp, '../assets/uploads/'.$final_name );

	    	$statement = $pdo->prepare("UPDATE tbl_news SET news_title=?, news_slug=?, news_content=?, news_date=?, publisher=?, photo=?, status=?, source=?, is_featured=?, meta_title=?, meta_keyword=?, meta_description=? WHERE news_id=?");
	    	$statement->execute(array($_POST['news_title'],$news_slug,$_POST['news_content'],$_POST['news_date'],$publisher,$final_name,$_POST['status'],$_POST['source'],$_POST['is_featured'],$_POST['meta_title'],$_POST['meta_keyword'],$_POST['meta_description'],$_REQUEST['id']));
	    }

	    $success_message = 'News is updated successfully!';
	}
}
?>

<?php
if(!isset($_REQUEST['id'])) {
	header('location: logout.php');
	exit;
} else {
	// Check the id is valid or not
	$statement = $pdo->prepare("SELECT * FROM tbl_news WHERE news_id=?");
	$statement->execute(array($_REQUEST['id']));
	$total = $statement->rowCount();
	$result = $statement->fetchAll(PDO::FETCH_ASSOC);
	if( $total == 0 ) {
		header('location: logout.php');
		exit;
	}
}
?>

<section class="content-header">
	<div class="content-header-left">
		<h1>Edit News</h1>
	</div>
	<div class="content-header-right">
		<a href="news.php" class="btn btn-primary btn-sm">View All</a>
	</div>
</section>

<?php
$statement = $pdo->prepare("SELECT * FROM tbl_news WHERE news_id=?");
$statement->execute(array($_REQUEST['id']));
$result = $statement->fetchAll(PDO::FETCH_ASSOC);
foreach ($result as $row) {
	$news_title       = $row['news_title'];
	$news_slug        = $row['news_slug'];
	$news_content     = $row['news_content'];
	$news_date        = $row['news_date'];
	$publisher        = $row['publisher'];
	$photo            = $row['photo'];
	$status           = $row['status'];
	$is_featured      = $row['is_featured'];
	$source           = $row['source'];
	$meta_title       = $row['meta_title'];
	$meta_keyword     = $row['meta_keyword'];
	$meta_description = $row['meta_description'];
}

$statement = $pdo->prepare("SELECT * FROM tbl_news_category WHERE news_id=?");
$statement->execute(array($_REQUEST['id']));
$result = $statement->fetchAll(PDO::FETCH_ASSOC);
foreach ($result as $row) {
	if($row['access'] == 1) {
		$arr[] = $row['category_id'];	
	}
}

?>

<section class="content">

	<div class="row">
		<div class="col-md-12">

			<?php if($error_message): ?>
			<div class="callout callout-danger">
			<h4>Please correct the following errors:</h4>
			<p>
			<?php echo $error_message; ?>
			</p>
			</div>
			<?php endif; ?>

			<?php if($success_message): ?>
			<div class="callout callout-success">
			<h4>Success:</h4>
			<p><?php echo $success_message; ?></p>
			</div>
			<?php endif; ?>

			<form class="form-horizontal" action="" method="post" enctype="multipart/form-data">
				<div class="box box-info">
					<div class="box-body">
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">News Title <span>*</span></label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="news_title" value="<?php echo $news_title; ?>">
							</div>
						</div>
						<div class="form-group">
		                    <label for="" class="col-sm-2 control-label">News Slug</label>
		                    <div class="col-sm-6">
		                        <input type="text" class="form-control" name="news_slug" value="<?php echo $news_slug; ?>">
		                    </div>
		                </div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">News Content <span>*</span></label>
							<div class="col-sm-9">
								<textarea class="form-control" name="news_content" id="editor1"><?php echo $news_content; ?></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">News Publish Date <span>*</span></label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="news_date" id="datepicker" value="<?php echo $news_date; ?>">(Format: dd-mm-yy)<br>
								You can setup a future date if you want.
							</div>
						</div>
						<div class="form-group">
				            <label for="" class="col-sm-2 control-label">Existing Featured Photo</label>
				            <div class="col-sm-6" style="padding-top:6px;">
				            	<?php
				            	if($photo == '') {
				            		echo 'No photo found';
				            	} else {
				            		echo '<img src="../assets/uploads/'.$photo.'" class="existing-photo" style="width:200px;">';	
				            	}
				            	?>
				                <input type="hidden" name="previous_photo" value="<?php echo $photo; ?>">
				            </div>
				        </div>
						<div class="form-group">
				            <label for="" class="col-sm-2 control-label">Change Featured Photo</label>
				            <div class="col-sm-6" style="padding-top:6px;">
				                <input type="file" name="photo">
				            </div>
				        </div>
						<div class="form-group">
				            <label for="" class="col-sm-2 control-label">Categories <span>*</span></label>
				            <div class="col-sm-9">
								
								<?php
				            	$i=0;
				            	$statement = $pdo->prepare("SELECT * FROM tbl_category WHERE status=? ORDER BY category_name ASC");
				            	$statement->execute(array('Active'));
				            	$result = $statement->fetchAll(PDO::FETCH_ASSOC);
				            	foreach ($result as $row) {
									$i++;
									if(in_array($row['category_id'], $arr)) {
										$access = 1;
									} else {
										$access = 0;
									}
									?>
									<div class="checkbox-content">
						            	<label class="checkbox-inline">
						            		<input type="hidden" name="category_ids[<?php echo $i; ?>]" value="">
		                                    <input type="checkbox" name="category_ids[<?php echo $i; ?>]" value="<?php echo $row['category_id']; ?>" <?php if($access==1){echo 'checked';} ?>> <?php echo $row['category_name']; ?>
		                                </label>
	                                </div>
	                                <?php
								}
								?>
				            </div>
				        </div>
				        <div class="form-group">
				            <label for="" class="col-sm-2 control-label">Published <span>*</span></label>
				            <div class="col-sm-6">
				                <label class="radio-inline">
				                    <input type="radio" name="status" value="Published" <?php if($status == 'Published') { echo 'checked'; } ?>>Yes
				                </label>
				                <label class="radio-inline">
				                    <input type="radio" name="status" value="Unpublished" <?php if($status == 'Unpublished') { echo 'checked'; } ?>>No
				                </label>
				            </div>
				        </div>
				        <div class="form-group">
							<label for="" class="col-sm-2 control-label">News Source </label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="source" value="<?php echo $source; ?>">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Publisher </label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="publisher" value="<?php echo $publisher; ?>"> (If you keep this blank, logged user will be treated as the publisher)
							</div>
						</div>
						<div class="form-group">
				            <label for="" class="col-sm-2 control-label">Is Featured? <span>*</span></label>
				            <div class="col-sm-6">
				                <label class="radio-inline">
				                    <input type="radio" name="is_featured" value="1" <?php if($is_featured == 1) { echo 'checked'; } ?>>Yes
				                </label>
				                <label class="radio-inline">
				                    <input type="radio" name="is_featured" value="0" <?php if($is_featured == 0) { echo 'checked'; } ?>>No
				                </label>
				            </div>
				        </div>
						<h3 class="seo-info">SEO Information</h3>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Meta Title </label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="meta_title" value="<?php echo $meta_title; ?>">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Meta Keywords </label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="meta_keyword" value="<?php echo $meta_keyword; ?>">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Meta Description </label>
							<div class="col-sm-9">
								<textarea class="form-control" name="meta_description" style="height:200px;"><?php echo $meta_description; ?></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label"></label>
							<div class="col-sm-6">
								<button type="submit" class="btn btn-success pull-left" name="form1">Update</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

</section>

<?php require_once('footer.php'); ?>