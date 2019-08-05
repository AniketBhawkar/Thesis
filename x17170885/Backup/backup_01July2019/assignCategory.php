<?php

	$csvFile = file('dataset.csv');
    	$data = [];
    	foreach ($csvFile as $line) {
        	$data[] = str_getcsv($line);
    	}

	$result = array();
	foreach ($data as $element) {
    		$result[$element[1]][] = $element;
	}

	$cat = array();
	foreach($result as $element){
		foreach($element as $e){
			if($e[9] != ""){
				$cat[$e[1]][] = $e[9];
			}
		}
	}

	$c = array();
	foreach($cat as $key => $ce){
		foreach($ce as $ca){
			if(!isset($c[$key][$ca])){
				$c[$key][$ca] = 1;
			}else{
				$c[$key][$ca] = $c[$key][$ca] + 1;
			}
		}
	}

	$s = array();

	foreach($c as $key => $x){
		$a = max($x);
		foreach($x as $key1 => $xe){
			if($a == $xe){
				$b = $key1;
			}
		}
		$s[$key][] = $key1;
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

foreach($s as $key => $a){
	$sql = "INSERT INTO imagesCategory (imageName, category) VALUES ('$key', $a)";

	if ($conn->query($sql) === TRUE) {
		//echo "New record created successfully";
	}else{
		echo "Error: " . $sql . "<br>" . $conn->error;
	}
}

$conn->close();
?>
