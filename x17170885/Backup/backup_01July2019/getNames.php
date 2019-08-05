<?php

$log_directory = 'images/challenge2018';

$results_array = array();

if (is_dir($log_directory))
{
        if ($handle = opendir($log_directory))
        {
                //Notice the parentheses I added:
                while(($file = readdir($handle)) !== FALSE)
                {
                        $results_array[] = $file;
                }
                closedir($handle);
        }
}


$servername = "localhost";
$username = "root";
$password = "password";
$dbname = "thesis";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
}

foreach($results_array as $value){
	$x = rand(10,1000);
	$sql = "INSERT INTO images (imageName, userID) VALUES ('$value', $x)";

	if ($conn->query($sql) === TRUE) {
		//echo "New record created successfully";
	}else{
		echo "Error: " . $sql . "<br>" . $conn->error;
	}
}

$conn->close();

?>
