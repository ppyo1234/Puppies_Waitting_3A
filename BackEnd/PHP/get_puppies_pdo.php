<?php
include 'pdo_connection.php';

//Este es un ejemplo de como seria una consulta en php  

try {
    $stmt = $conn->prepare("SELECT * FROM puppies");
    $stmt->execute();

    // Establecer el modo de fetch a un array asociativo
    $result = $stmt->setFetchMode(PDO::FETCH_ASSOC);

    foreach ($stmt->fetchAll() as $row) {
        echo "id: " . $row["id"]. " - Name: " . $row["name"]. " - Age: " . $row["age"]. "<br>";
    }
}
catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$conn = null;
?>

