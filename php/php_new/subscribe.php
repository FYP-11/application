<?php

require("../phpMQTT.php");

	
$mqtt = new phpMQTT("192.248.10.70", 1883, "phpMQTT Sub Example"); //Change client name to something unique18

if(!$mqtt->connect()){
	echo "before exit";
	exit(1);
}

$topics['Department/#'] = array("qos"=>0, "function"=>"procmsg");
$mqtt->subscribe($topics,0);


while($mqtt->proc()){
	/*echo "john";*/
	/*break;*/
}


$mqtt->close();

function procmsg($topic,$msg){
	echo "Msg Recieved: ".date("r")."\nTopic:{$topic}\n$msg\n";

	$servername = "localhost";
	/*$servername = "192.248.10.70";*/
	/*$port = 3306;*/
	$username = "root";
	$password ="root";
	$dbname = "fyp11_new";

// Create connection
	$conn =mysqli_connect($servername, $username, $password,$dbname);


// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}
	echo "Connected successfully";

	$data=explode(" ",$msg);
	$timezone = "Asia/Colombo";
 	date_default_timezone_set($timezone);
	$timeStamp=date("Y-m-d H:i:s");
	$sql = "INSERT INTO data(timestamp,gw_id,location_id,temperature,humidity,light,motionDigi,motionAna,noise)
			VALUES ('$timeStamp','1','$data[0]','$data[1]','$data[2]','$data[3]','$data[4]','$data[5]','$data[6]')";

	if ($conn->query($sql) === TRUE) {
		echo "New record created successfully";
	} else {
		echo "Error: " . $sql . "<br>" . $conn->error;
	}

}

?>
