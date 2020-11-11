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
	// Check the category slug is valid or not.
	$statement = $pdo->prepare("SELECT * FROM tbl_category WHERE category_slug=? AND status=?");
	$statement->execute(array($_REQUEST['slug'],'Active'));
	$total = $statement->rowCount();
	if( $total == 0 )
	{
		header('location: index.php');
		exit;
	}
}

// Getting the category name from the category slug
$statement = $pdo->prepare("SELECT * FROM tbl_category WHERE category_slug=?");
$statement->execute(array($_REQUEST['slug']));
$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
foreach ($result as $row) 
{
	$category_name = $row['category_name'];
	$category_id = $row['category_id'];
}

// Getting all the news ids under this category and saving the ids into an array
$statement = $pdo->prepare("SELECT * FROM tbl_news_category WHERE category_id=? AND access=1");
$statement->execute(array($category_id));
$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
foreach ($result as $row) 
{
	$news_id_arr[] = $row['news_id'];
}
?>

<!-- Blog Start -->
<div class="news">
	<div class="container">

		<div class="row">
			<div class="col-md-8">

				<div class="row">
					<div class="col-md-12">
						<div class="heading">
							<h2 style="padding:10px;"><?php echo $category_name; ?></h2>
						</div>
					</div>
				</div>
				
				<?php if(!empty($news_id_arr)): ?>
				<div class="row parent">
					<?php
					$i=0;
					$statement = $pdo->prepare("SELECT * FROM tbl_news WHERE status=? ORDER BY news_id DESC");
					$statement->execute(array('Published'));
					$result = $statement->fetchAll();							
					foreach ($result as $row) 
					{
						if(in_array($row['news_id'], $news_id_arr))
						{
							$i++;
							?>
							<div class="col-sm-6 col-md-6 child">
								<div class="thumbnail">
									<div class="photo" style="background-image: url(<?php echo BASE_URL; ?>assets/uploads/<?php if($row['photo'] == ''){echo 'no-photo1.jpg';}else{echo $row['photo'];} ?>);"></div>
									<div class="caption">
										<h3><a href="<?php echo BASE_URL.URL_NEWS.$row['news_slug']; ?>"><?php echo $row['news_title']; ?></a></h3>
										<h4>
											<span><i class="fa fa-user"></i> <?php echo $row['publisher']; ?> </span>
											<span><i class="fa fa-calendar"></i> 
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
												echo $month_detail.' '.$day.', '.$year;
											?>													
											</span>
										</h4>
										<p>
											<?php echo substr($row['news_content'],0,200).' ...'; ?>
										</p>
									</div>
								</div>
							</div>
							<?php
						}
					}
					?>
				</div>

				<!-- Load More button -->
				<?php if($i>6): ?>
				<div class="load-more">
					<a class="load">Load More</a>
				</div>
				<?php endif; ?>

				<?php else: ?>
				<div class="row">
					<div class="col-md-12">
						<p class="not-found">
							Sorry! No news is found under this category.
						</p>
					</div>
				</div>
				<?php endif; ?>
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