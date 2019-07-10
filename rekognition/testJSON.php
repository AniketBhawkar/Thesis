<?php
$json_string = 'results.json';

$jsondata = file_get_contents($json_string);
$obj = json_decode($jsondata);
foreach($obj->Labels as $l){
	$name = $l->Name;
	$confidence = $l->Confidence;
}

?>
