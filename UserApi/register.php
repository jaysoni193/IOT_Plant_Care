<?php

	require 'connection.php';
	$username=$_POST['username'];
	$email=$_POST['email'];
	$password=md5($_POST['password']);


	$checkUser="SELECT * from user WHERE email='$email'";
	$checkQuery=mysqli_query($con,$checkUser);

	if(mysqli_num_rows($checkQuery)>0){
		$response['error']="002";
		$response['message']="user exist";
	}
	else
	{
		$insertQuery="INSERT INTO user(username,email,password) VALUES('$username','$email','$password')";
	$result=mysqli_query($con,$insertQuery);

	if($result){

		$response['error']="000";
		$response['message']="Register successfull";
	}
	else{
		
		$response['error']="001";
		$response['message']="Registration failed!";
	}
	}

	echo json_encode($response);


	
?>