<?php

require 'vendor/autoload.php';

$client = new Aws\Rekognition\RekognitionClient([
	'version' => 'latest',
	'region' => 'eu-west-1',
	'credentials' => [
		'key' => 'AKIAIHP6MVPDL66MM7MA',
		'secret' => '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',
	]
]);

$result = $client->detectLabels([
	'Image' => [
		'Bytes' => file_get_contents("input.jpg"),
	],
	'MaxLabels' => 30,
	'MinConfidence' => 20,
]);

print_r($result);

$fp = fopen('results.json', 'w');
fwrite($fp, $result);
fclose($fp);
