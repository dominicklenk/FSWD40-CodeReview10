<?php
ob_start();
session_start();
require_once 'dbconnect.php';

// it will never let you open index(login) page if session is set
if ( isset($_SESSION['user'])!="" ) {
  header("Location: home.php");
  exit;
}

$error = false;

if( isset($_POST['btn-login']) ) {

  // prevent sql injections/ clear user invalid inputs

 $email = trim($_POST['email']);
 $email = strip_tags($email);
 $email = htmlspecialchars($email);

 $pass = trim($_POST['pass']);
 $pass = strip_tags($pass);
 $pass = htmlspecialchars($pass);
  // prevent sql injections / clear user invalid inputs



if(empty($email)){
  $error = true;
  $emailError = "Please enter your email address.";
    } else if ( !filter_var($email,FILTER_VALIDATE_EMAIL) ) {
        $error = true;
        $emailError = "Please enter valid email address.";
}

if(empty($pass)){
  $error = true;
  $passError = "Please enter your password.";
}



    // if there's no error, continue to login

if (!$error) {
  $password = hash('sha256', $pass); // password hashing
  $res=mysqli_query($conn, "SELECT user_id, user_name, password FROM user WHERE email='$email'");
  $row=mysqli_fetch_array($res, MYSQLI_ASSOC);
  $count = mysqli_num_rows($res); // if uname/pass correct it returns must be 1 row
  
if( $count == 1 && $row['password']==$password ) {
   $_SESSION['user'] = $row['user_id'];
   header("Location: home.php");
      } else {
          $errMSG = "Incorrect Credentials, Try again...";
      }
    }
  }
?>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Login & Registration System</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body class="text-center entrance">
<div class="container">
<form class="form-signin" method="post" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" autocomplete="off">
<h1 class="mb-4 font-weight-bold welcome">Welcome to the BigLibrary! </h1>          
           <?php
  if ( isset($errMSG) ) {
echo $errMSG; ?>
      
               <?php
  }
  ?>

<input type="email" name="email" id="inputEmail" class="form-control" placeholder="Your Email" value="<?php echo $email; ?>" maxlength="40" required autofocus/>
<span class="text-danger"><?php echo $emailError; ?></span>
<input type="password" name="pass" id="inputPassword" class="form-control" placeholder="Your Password" maxlength="15" required/> 
<span class="text-danger"><?php echo $passError; ?></span>
<button type="submit" class="btn btn-lg btn-primary btn-block" name="btn-login">Log In</button>
<h3 class="mt-3">OR</h3>
            <a class="sign font-weight-bold" href="register.php">Sign Up Here...</a>
</form>

</div>
</body>
</html>
<?php ob_end_flush(); ?>