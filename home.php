<?php
ob_start();
session_start();
require_once 'dbconnect.php';

	// if session is not set this will redirect to login page
if( !isset($_SESSION['user']) ) {
		header("Location: index.php");
		exit;
}

	// select logged-in user detail
$res=mysqli_query($conn, "SELECT * FROM user WHERE user_id=".$_SESSION['user']);
$userRow=mysqli_fetch_array($res, MYSQLI_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Welcome - <?php echo $userRow['email']; ?></title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="style2.css">
</head>
<body class="content">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="collapse navbar-collapse">
    <a class="navbar-brand" href="#home.php">BigLibrary</a>
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item active">
        <a class="nav-link" href="#books">Books</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#cds">CD's</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#dvds">DVD's</a>
      </li>
    </ul>
    <ul class="form-inline my-2 my-lg-0">
      <span class="mr-5">Hello <?php echo $userRow['user_name']; ?></span>
      <a class="btn btn-outline-success my-2 my-sm-0" href="logout.php?logout"><i class="fas fa-sign-out-alt">&nbsp;</i>Log Out</a>
    </ul>
  </div>
</nav>

          <!--           ANOTHER WAY:  ONE SELECT   AND ADD     3 CONDITIONS (if 3 times)           -->
<?php
$q_books = "SELECT ISBN_code, media_title, media_img, media_type, media_genre, publish_date, description, status FROM media WHERE media_type = 'book'";

$r_books = $conn->query($q_books);
if (!$r_books) {
	echo "query failed!";
	} 

$output = "";
$rows_books = $r_books->fetch_all(MYSQLI_ASSOC);
$output .= "
<div class='container'>
	<h1 class = \"mt-5\"><a name=\"books\">Book Info</h1>
	<table class='table table-striped table-responsive'>
		<thead>
			<tr>
				<th>ISBN / genre</th>
				<th>title</th>
				<th>image</th>
				<th>pub- date</th>
				<th>description</th>
				<th>status</th>
			</tr>
		</thead>
	<tbody>";
            
           foreach($rows_books as $row){
        		$output .= "<tr>";
        		$output .= "<td>".$row['ISBN_code']."<br>".$row['media_genre']."</td>";
                $output .= "<td class=\"no-wrap\">".$row['media_title']."</td>";
                $output .= "<td><img src='".$row['media_img']."' width='60'></td>";         
                $output .= "<td>".date('d.m.Y',strtotime($row['publish_date']))."</td>";		# dateformat with the function date!
                $output .= "<td style=\"min-width: 180px;\">".$row['description']."</td>";
                $output .= "<td>".$row['status']."</td>";
                $output .= "</tr>";      
            }
            $output .= "</tbody></table></div>";

echo $output;
echo "<hr>";
?>




<?php

$q_cds = "SELECT ISBN_code, media_title, media_img, media_type, media_genre, publish_date, description, status FROM media WHERE media_type = 'cd'";

$r_cds = $conn->query($q_cds);
if (!$r_cds) {
	echo "query failed!";
	} 

$output = "";
$rows_cds = $r_cds->fetch_all(MYSQLI_ASSOC);
$output .= "
<div class='container'>
	<h1 class = \"mt-5\"><a name=\"cds\">CD Info</h1>
	<table class='table table-striped table-responsive'>
		<thead>
			<tr>
				<th>ISBN / genre</th>
				<th>title</th>
				<th>image</th>
				<th>pub- date</th>
				<th>description</th>
				<th>status</th>
			</tr>
		</thead>
	<tbody>";
            
           foreach($rows_cds as $row){
        		$output .= "<tr>";
        		$output .= "<td>".$row['ISBN_code']."<br>".$row['media_genre']."</td>";
                $output .= "<td class=\"no-wrap\">".$row['media_title']."</td>";
                $output .= "<td><img src='".$row['media_img']."' width='60'></td>";         
                $output .= "<td>".date('d.m.Y',strtotime($row['publish_date']))."</td>";		# dateformat with the function date!
                $output .= "<td style=\"min-width: 180px;\">".$row['description']."</td>";
                $output .= "<td>".$row['status']."</td>";
                $output .= "</tr>";      
            }
            $output .= "</tbody></table></div>";

echo $output;
echo "<hr>";
?>



<?php

$q_dvds = "SELECT ISBN_code, media_title, media_img, media_type, media_genre, publish_date, description, status FROM media WHERE media_type = 'dvd'";

$r_dvds = $conn->query($q_dvds);
if (!$r_dvds) {
	echo "query failed!";
	} 

$output = "";
$rows_dvds = $r_dvds->fetch_all(MYSQLI_ASSOC);
$output .= "
<div class='container'>
	<h1 class = \"mt-5\"><a name=\"dvds\">DVD Info</h1>
	<table class='table table-striped table-responsive'>
		<thead>
			<tr>
				<th>ISBN / genre</th>
				<th>title</th>
				<th>image</th>
				<th>pub- date</th>
				<th>description</th>
				<th>status</th>
			</tr>
		</thead>
	<tbody>";
            
           foreach($rows_dvds as $row){
        		$output .= "<tr>";
        		$output .= "<td>".$row['ISBN_code']."<br>".$row['media_genre']."</td>";
                $output .= "<td class=\"no-wrap\">".$row['media_title']."</td>";
                $output .= "<td><img src='".$row['media_img']."' width='60'></td>";         
                $output .= "<td>".date('d.m.Y',strtotime($row['publish_date']))."</td>";		# dateformat with the function date!
                $output .= "<td style=\"min-width: 180px;\">".$row['description']."</td>";
                $output .= "<td>".$row['status']."</td>";
                $output .= "</tr>";      
            }
            $output .= "</tbody></table></div>";

echo $output;
echo "<hr>";
?>






</body>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</html>
<?php ob_end_flush(); ?>