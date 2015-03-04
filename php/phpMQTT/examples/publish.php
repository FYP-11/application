<?php

require("../phpMQTT.php");

	
$mqtt = new phpMQTT("192.248.10.70", 1883, "phpMQTT Pub Example"); //Change client name to something unique

if ($mqtt->connect()) {
	$mqtt->publish("test2","Hello World! at ".date("r"),0);
	$mqtt->close();
}

?>
