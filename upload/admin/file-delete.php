<?php require_once('header.php'); ?>

<?php
if(!isset($_REQUEST['id'])) {
	header('location: logout.php');
	exit;
} else {
	// Check the id is valid or not
	$statement = $pdo->prepare("SELECT * FROM tbl_file WHERE file_id=?");
	$statement->execute(array($_REQUEST['id']));
	$total = $statement->rowCount();
	if( $total == 0 ) {
		header('location: logout.php');
		exit;
	}
}
?>

<?php
	
	// Getting photo ID to unlink from folder
	$statement = $pdo->prepare("SELECT * FROM tbl_file WHERE file_id=?");
	$statement->execute(array($_REQUEST['id']));
	$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
	foreach ($result as $row)  {
		$file_name = $row['file_name'];
	}

	// Unlink the photo
	if($file_name!='') {
		unlink('../assets/uploads/'.$file_name);	
	}

	// Delete from tbl_photo
	$statement = $pdo->prepare("DELETE FROM tbl_file WHERE file_id=?");
	$statement->execute(array($_REQUEST['id']));

	header('location: file.php');
?>