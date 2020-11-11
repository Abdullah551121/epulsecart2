<?php
require_once('header.php');

// Preventing the direct access of this page.
if(!isset($_POST['search_string']))
{
	header('location: index.php');
	exit;
}

$search_string = strip_tags($_POST['search_string']);
?>

<div class="news">
	<div class="container">

		<div class="row">
			<div class="col-md-8">

				<div class="heading">
					<h2 style="padding:10px;">Search by: <?php echo $search_string; ?></h2>
				</div>

				<?php
				// Search query
				
				$search_string = "%" . $search_string . "%";
				$statement = $pdo->prepare("SELECT * FROM tbl_news WHERE status=? AND (news_title like ? OR news_content like ?)");
				$statement->execute(array('Published',$search_string,$search_string));
				$total = $statement->rowCount();
				?>
				
				<?php if( !$total || empty($search_string) ): ?>
				<div class="row">
					<div class="col-md-12">
						<p class="not-found">
							Sorry! No news is found by your search term.
						</p>
					</div>
				</div>
				<?php else: ?>
				<div class="row parent">
					<?php
					$i=0;
					$result = $statement->fetchAll(PDO::FETCH_ASSOC);						
					foreach ($result as $row) 
					{
						$i++;
						?>
						<div class="col-sm-6 col-md-6 child">
							<div class="thumbnail">
								<div class="photo" style="background-image: url(assets/uploads/<?php if($row['photo'] == ''){echo 'no-photo1.jpg';}else{echo $row['photo'];} ?>);"></div>
								<div class="caption">
									<h3><a href="news.php?slug=<?php echo $row['news_slug']; ?>"><?php echo $row['news_title']; ?></a></h3>
									<h4>
										<?php echo $row['publisher']; ?> - 
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
									</h4>
									<p>
										<?php echo substr($row['news_content'],0,200).' ...'; ?>
									</p>
								</div>
							</div>
						</div>
						<?php
					}
					?>

					<div class="clear"></div>

					<!-- Load More button -->
					<?php if($i>6): ?>
					<div class="load-more">
						<a class="load">Load More</a>
					</div>
					<?php endif; ?>

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

<?php require_once('footer.php'); ?>