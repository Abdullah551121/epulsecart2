<?php require_once('header.php'); ?>

<?php
if(isset($_POST['form1'])) {
	$valid = 1;

	if(empty($_POST['news_title'])) {
		$valid = 0;
		$error_message .= 'News title can not be empty<br>';
	} else {
		// Duplicate Checking
    	$statement = $pdo->prepare("SELECT * FROM tbl_news WHERE news_title=?");
    	$statement->execute(array($_POST['news_title']));
    	$total = $statement->rowCount();
    	if($total) {
    		$valid = 0;
        	$error_message .= "News title already exists<br>";
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


	$path = $_FILES['photo']['name'];
    $path_tmp = $_FILES['photo']['tmp_name'];


    if($path!='') {
        $ext = pathinfo( $path, PATHINFO_EXTENSION );
        $file_name = basename( $path, '.' . $ext );
        if( $ext!='jpg' && $ext!='png' && $ext!='jpeg' && $ext!='gif' ) {
            $valid = 0;
            $error_message .= 'You must have to upload jpg, jpeg, gif or png file<br>';
        }
    }

	foreach($_POST['category_ids'] as $key=>$value) {
		if($value!='') {
			$arr[] = $value;	
		}
	}
	if(empty($arr)) {
		$valid = 0;
        $error_message .= 'You must have to select at least one category<br>';
	}
	

	if($valid == 1) {

		// getting auto increment id for photo renaming
		$statement = $pdo->prepare("SHOW TABLE STATUS LIKE 'tbl_news'");
		$statement->execute();
		$result = $statement->fetchAll();
		foreach($result as $row) {
			$ai_id=$row[10];
		}

		if($_POST['news_slug'] == '') {
    		// generate slug
    		$temp_string = strtolower($_POST['news_title']);
    		$news_slug = preg_replace('/[^A-Za-z0-9-]+/', '-', $temp_string);
    	} else {
    		$temp_string = strtolower($_POST['news_slug']);
    		$news_slug = preg_replace('/[^A-Za-z0-9-]+/', '-', $temp_string);
    	}

    	// if slug already exists, then rename it
		$statement = $pdo->prepare("SELECT * FROM tbl_news WHERE news_slug=?");
		$statement->execute(array($news_slug));
		$total = $statement->rowCount();
		if($total) {
			$news_slug = $news_slug.'-1';
		}

		if($path=='') {
			// When no photo will be selected
			$statement = $pdo->prepare("INSERT INTO tbl_news (news_title,news_slug,news_content,news_date,publisher,photo,status,source,is_featured,total_view,meta_title,meta_keyword,meta_description) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)");
			$statement->execute(array($_POST['news_title'],$news_slug,$_POST['news_content'],$_POST['news_date'],$publisher,'',$_POST['status'],$_POST['source'],$_POST['is_featured'],0,$_POST['meta_title'],$_POST['meta_keyword'],$_POST['meta_description']));
		} else {
    		// uploading the photo into the main location and giving it a final name
    		$final_name = 'news-'.$ai_id.'.'.$ext;
            move_uploaded_file( $path_tmp, '../assets/uploads/'.$final_name );

            $statement = $pdo->prepare("INSERT INTO tbl_news (news_title,news_slug,news_content,news_date,publisher,photo,status,source,is_featured,total_view,meta_title,meta_keyword,meta_description) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)");
			$statement->execute(array($_POST['news_title'],$news_slug,$_POST['news_content'],$_POST['news_date'],$publisher,$final_name,$_POST['status'],$_POST['source'],$_POST['is_featured'],0,$_POST['meta_title'],$_POST['meta_keyword'],$_POST['meta_description']));
		}

		// Getting all the categories from tbl_category and putting all those into a new table tbl_news_category for this newly added news
		$statement = $pdo->prepare("SELECT * FROM tbl_category ORDER BY category_id ASC");
		$statement->execute();
		$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
		foreach ($result as $row) {
			if(in_array($row['category_id'], $arr)) {
				$access = 1;
			} else {
				$access = 0;
			}
			$statement1 = $pdo->prepare("INSERT INTO tbl_news_category (news_id,category_id,access) VALUES (?,?,?)");
			$statement1->execute(array($ai_id,$row['category_id'],$access));
		}

		// Entry data into a new table tbl_news_scheduled if news date is set as future date.
		$today = date('d-m-Y');
		if($_POST['news_date'] != $today) {
			$statement = $pdo->prepare("INSERT INTO tbl_news_scheduled (news_id,news_date) VALUES (?,?)");
			$statement->execute(array($ai_id,$_POST['news_date']));	
		}

		// Sending an email notification to all the active subscribers
		$statement = $pdo->prepare("SELECT * FROM tbl_subscriber WHERE subs_active=1");
		$statement->execute();
		$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
		foreach ($result as $row) {
			$url = BASE_URL . 'news/' . $news_slug;
			$message = '
			Dear Sir,<br><br>
			A News has been published: 
			'.$_POST['news_title'].'<br><br>
			To see the details about this news, please click on the following url:<br>
			<a href="'.$url.'">'.$url.'</a>';

			$to = $row['subs_email'];
			$subject = "A News has been published";
			$message = $message;
			$headers = 'From: '. $receive_email . "\r\n" .
					   'Reply-To: '. $receive_email . "\r\n" .
					   'X-Mailer: PHP/' . phpversion() . "\r\n" . 
					   "MIME-Version: 1.0\r\n" . 
					   "Content-Type: text/html; charset=ISO-8859-1\r\n";
			mail($to, $subject, $message, $headers);
		}		
		$success_message = 'News is added successfully!';
	}
}
?>

<section class="content-header">
	<div class="content-header-left">
		<h1>Add News</h1>
	</div>
	<div class="content-header-right">
		<a href="news.php" class="btn btn-primary btn-sm">View All</a>
	</div>
</section>


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
								<input type="text" class="form-control" name="news_title" placeholder="Example: News Headline">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">News Slug </label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="news_slug" placeholder="Example: news-headline">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">News Content <span>*</span></label>
							<div class="col-sm-9">
								<textarea class="form-control" name="news_content" id="editor1"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">News Publish Date <span>*</span></label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="news_date" id="datepicker" value="<?php echo date('d-m-Y'); ?>">(Format: dd-mm-yy)<br>
								You can setup a future date if you want.
							</div>
						</div>
						<div class="form-group">
				            <label for="" class="col-sm-2 control-label">Featured Photo</label>
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
				            		?>
									<div class="checkbox-content">
						            	<label class="checkbox-inline">
											<input type="hidden" name="category_ids[<?php echo $i; ?>]" value="">
		                                    <input type="checkbox" name="category_ids[<?php echo $i; ?>]" value="<?php echo $row['category_id']; ?>"> <?php echo $row['category_name']; ?>
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
				                    <input type="radio" name="status" value="Published" checked>Yes
				                </label>
				                <label class="radio-inline">
				                    <input type="radio" name="status" value="Unpublished">No
				                </label>
				            </div>
				        </div>
				        <div class="form-group">
							<label for="" class="col-sm-2 control-label">News Source </label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="source">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Publisher </label>
							<div class="col-sm-6">
								<input type="text" class="form-control" name="publisher"> (If you keep this blank, logged user will be treated as the publisher)
							</div>
						</div>
						<div class="form-group">
				            <label for="" class="col-sm-2 control-label">Is Featured? <span>*</span></label>
				            <div class="col-sm-6">
				                <label class="radio-inline">
				                    <input type="radio" name="is_featured" value="1" checked>Yes
				                </label>
				                <label class="radio-inline">
				                    <input type="radio" name="is_featured" value="0">No
				                </label>
				            </div>
				        </div>
						<h3 class="seo-info">SEO Information</h3>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Meta Title </label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="meta_title">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Meta Keywords </label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="meta_keyword">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Meta Description </label>
							<div class="col-sm-9">
								<textarea class="form-control" name="meta_description" style="height:200px;"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label"></label>
							<div class="col-sm-6">
								<button type="submit" class="btn btn-success pull-left" name="form1">Submit</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

</section>

<?php require_once('footer.php'); ?>