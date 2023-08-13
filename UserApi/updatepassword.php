<?
	require 'connection.php';
	$current=md5($_POST['current']);
	$new=md5($_POST['new']);
	$email=$_POST['email'];

	$checkUser="SELECT * FROM user WHERE email='$email' and password='$current'";
	$result=mysqli_query($con,$checkUser);

	if(mysqli_num_rows($result)>0){

		$updatePass=mysqli_query($con,"UPDATE user SET password='$new' WHERE email='$email'");

		if($updatePass>0){

			$response['error']="200";
			$response['message']="password update success";

		}
		else{

			$response['error']="400";
			$response['message']="password not update";

		}
	}
	else{


			$response['error']="400";
			$response['message']="user does not exist";
	}

	echo json_encode($response);
?>