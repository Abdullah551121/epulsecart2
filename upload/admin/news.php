<?php require_once('header.php'); ?>

<section class="content-header">
	<div class="content-header-left">
		<h1>View News</h1>
	</div>
	<div class="content-header-right">
		<a href="news-add.php" class="btn btn-primary btn-sm">Add New</a>
	</div>
</section>


<section class="content">

	<div class="row">
		<div class="col-md-12">


			<div class="box box-info">

				<div class="box-body table-responsive">
					<table id="example1" class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>SL</th>
								<th width="180">Title</th>
								<th width="280">Details</th>
								<th>Category</th>
								<th>Status</th>
								<th>Is Featured?</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<?php
							$i=0;
							$statement = $pdo->prepare("SELECT

														news_id,
														news_title,
														news_content,
														status,
														is_featured

							                           	FROM tbl_news
							                           	");
							$statement->execute();
							$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
							foreach ($result as $row) {
								$i++;
								?>
								<tr>
									<td><?php echo $i; ?></td>
									<td><?php if(strlen($row['news_title']) > 40){echo substr($row['news_title'],0,40).' ...';} else {echo $row['news_title'];} ?></td>
									<td><?php if(strlen($row['news_content']) > 180){echo substr($row['news_content'],0,180).' ...';} else {echo $row['news_content'];} ?></td>
									<td>
										<?php
										$statement1 = $pdo->prepare("SELECT 
																	
																	t1.news_id,
																	t1.category_id,

																	t2.category_id,
																	t2.category_name

										                           	FROM tbl_news_category t1
										                           	JOIN tbl_category t2
										                           	ON t1.category_id = t2.category_id

										                           	WHERE t1.news_id=? AND t1.access=1
										                           	ORDER BY t2.category_name ASC");
										$statement1->execute(array($row['news_id']));
										$total = $statement->rowCount();
										$result1 = $statement1->fetchAll(PDO::FETCH_ASSOC);							
										foreach ($result1 as $row1) {
											echo $row1['category_name'].'<br>';
										}
										?>
									</td>
									<td><?php echo $row['status']; ?></td>
									<td>
										<?php 
											if($row['is_featured'] == 1) {
												echo 'Yes';
											} else {
												echo 'No';
											}
										?>
									</td>
									<td>										
										<a href="news-edit.php?id=<?php echo $row['news_id']; ?>" class="btn btn-primary btn-xs">Edit</a>
										<a href="#" class="btn btn-danger btn-xs" data-href="news-delete.php?id=<?php echo $row['news_id']; ?>" data-toggle="modal" data-target="#confirm-delete">Delete</a>  
									</td>
								</tr>
								<?php
							}
							?>							
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>


</section>


<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Delete Confirmation</h4>
            </div>
            <div class="modal-body">
                <p>Are you sure want to delete this item?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <a class="btn btn-danger btn-ok">Delete</a>
            </div>
        </div>
    </div>
</div>


<?php require_once('footer.php'); ?>