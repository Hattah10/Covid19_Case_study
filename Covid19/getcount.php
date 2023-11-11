<?php
   include 'connection.php';

   $result = mysqli_query($connection,"call count_statistics()");

   $email_array = array();

   while($row = mysqli_fetch_assoc($result))
	{
		$email_array[] = $row;
	}

	//close the database
	mysqli_close($connection);

	header('Content-type: application/json');
    echo json_encode($email_array);

?>

