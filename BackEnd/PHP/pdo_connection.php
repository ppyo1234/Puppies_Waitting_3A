<?php
$servername = "localhost";  // Dirección del servidor MySQL
$username = "usuario_gestor_bd";   // Usuario de la base de datos MySQL
$password = "contraseña_gestor_bd"; // Contraseña del usuario de la base de datos MySQL
$dbname = "puppies_waiting"; // Nombre de la base de datos MySQL
$port = 3310;  

try {
    $conn = new PDO("mysql:host=$servername;port=$port;dbname=$dbname", $username, $password);
    // Establecer el modo de error de PDO para que lance excepciones
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Conexión exitosa";
}
catch(PDOException $e) {
    echo "Conexión fallida: " . $e->getMessage();
}
?>
