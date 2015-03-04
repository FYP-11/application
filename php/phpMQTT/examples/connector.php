<?php
$servername = "localhost";
/*$port = 3306;*/
$username = "root";
$password = "root";
$dbname = "test";

// Create connection
$conn =mysqli_connect($servername, $username, $password,$dbname);


// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";

$sql = "INSERT INTO table1 (firstname)
VALUES ('John')";

if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

?>

