<?php
require_once('header.php');

// Preventing the direct access of this page.
if(!isset($_REQUEST['slug']))
{
	header('location: index.php');
	exit;
}

// Getting the news detailed data from the news id
$statement = $pdo->prepare("SELECT * FROM tbl_news WHERE news_slug=?");
$statement->execute(array($_REQUEST['slug']));
$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
foreach ($result as $row) {
	$news_title = $row['news_title'];
	$news_content = $row['news_content'];
	$news_date = $row['news_date'];
	$publisher = $row['publisher'];
	$photo = $row['photo'];
}

// Update data for view count for this news page
// Getting current view count
$statement = $pdo->prepare("SELECT * FROM tbl_news WHERE news_slug=?");
$statement->execute(array($_REQUEST['slug']));
$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
foreach ($result as $row) 
{
	$current_total_view = $row['total_view'];
}
$updated_total_view = $current_total_view+1;

// Updating database for view count
$statement = $pdo->prepare("UPDATE tbl_news SET total_view=? WHERE news_slug=?");
$statement->execute(array($updated_total_view,$_REQUEST['slug']));
?>

<!-- Blog Start -->
<div class="news">
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<div class="row">
					<div class="col-sm-12 col-md-12">
						<div class="thumbnail">
													
							<div class="photo" style="background-image: url(<?php echo BASE_URL; ?>assets/uploads/<?php echo $photo; ?>);width:300px;height:300px;"></div>
							
							<div class="caption">
								<h3><?php echo $news_title; ?></h3>
								<?php
									$day = substr($row['news_date'],0,2);
									$month = substr($row['news_date'],3,2);
									$year = substr($row['news_date'],6,4);
									if($month=='01') {$month_detail='January';}
									if($month=='02') {$month_detail='February';}
									if($month=='03') {$month_detail='March';}
									if($month=='04') {$month_detail='April';}
									if($month=='05') {$month_detail='May';}
									if($month=='06') {$month_detail='June';}
									if($month=='07') {$month_detail='July';}
									if($month=='08') {$month_detail='August';}
									if($month=='09') {$month_detail='September';}
									if($month=='10') {$month_detail='October';}
									if($month=='11') {$month_detail='November';}
									if($month=='12') {$month_detail='December';}
									?>
								<h4>
									<span><i class="fa fa-user"></i> <?php echo $publisher; ?> </span>
									<span><i class="fa fa-calendar"></i> 
									<?php echo $month_detail.' '.$day.', '.$year; ?>
									</span>
								</h4>
								<p>
									<?php echo $news_content; ?> 
								</p>
								<h2>Share This</h2>
								<div class="sharethis-inline-share-buttons"></div>
							</div>
						</div>
					</div>					
				</div>
				<div class="row">
					<div class="col-md-12">					
						<?php
						// Getting the full url of the current page
						$final_url = BASE_URL . URL_NEWS . $_REQUEST['slug'];
						?>
						<!-- Facebook Comment Main Code (got from facebook website) -->
						<div class="fb-comments" data-href="<?php echo $final_url; ?>" data-numposts="5"></div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<!-- Calling the sidebar -->
				<?php include "sidebar.php"; ?>
			</div>
		</div>		
	</div>
</div>
<!-- Blog End -->

<?php require_once('footer.php'); ?>