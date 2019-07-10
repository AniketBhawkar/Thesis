<?php

require 'vendor/autoload.php';
$log_directory = 'images/challenge2018/';

$client = new Aws\Rekognition\RekognitionClient([
	'version' => 'latest',
	'region' => 'eu-west-1',
	'credentials' => [
		'key' => 'AKIAIHP6MVPDL66MM7MA',
		'secret' => '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',
	]
]);

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

$sql = "SELECT imageName FROM images where userID=10"; 
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
		$imgname = $row["imageName"];
		$results = $client->detectLabels([
			'Image' => [
				'Bytes' => file_get_contents($log_directory.$row["imageName"]),
			],
			'MaxLabels' => 10,
			'MinConfidence' => 70,
		]);
		foreach($results["Labels"] as $l){
			$labelname = $l["Name"];
			$confidence = $l["Confidence"];
			$sql = "INSERT INTO labels (imageName, labelName, confidence) VALUES ('$imgname', '$labelname', '$confidence')";
			if ($conn->query($sql) === TRUE) {
				//echo "New record created successfully";
			}else{
				echo "Error: " . $sql . "<br>" . $conn->error;
			}			
			
		}
    }
} else {
    echo "0 results";
}
$conn->close();

