<?php

 include $_SERVER['DOCUMENT_ROOT'].'/BackEnd/DB_Connection/con_db.php';

error_reporting(E_ALL);
ini_set('display_errors', 1);

$response = array('success' => false, 'message' => '');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['donor_name']) && !empty($_POST['donor_name'])) {
        $nombre = $_POST['donor_name'];
    } else {
        $response['message'] = 'El nombre del donante es requerido.';
        echo json_encode($response);
        exit;
    }

    $fecha_de_donacion = date('Y-m-d H:i:s'); // Fecha y hora actual

    // Procesar archivo de imagen
    if (isset($_FILES['donation_capture']) && $_FILES['donation_capture']['error'] == 0) {
        $tmp_name = $_FILES['donation_capture']['tmp_name'];
        $imagen = file_get_contents($tmp_name); // Obtener el contenido binario del archivo

        // Preparar la consulta SQL
        $stmt = $conex->prepare("INSERT INTO donar (nombre, imagen, fecha_de_donacion) VALUES (?, ?, ?)");
        if ($stmt === false) {
            $response['message'] = 'Error al preparar la consulta: ' . htmlspecialchars($conex->error);
        } else {
            $stmt->bind_param("sss", $nombre, $imagen, $fecha_de_donacion);
            if ($stmt->execute()) {
                $response['success'] = true;
                $response['message'] = "¡Gracias por tu donación, $nombre! Contigo somos más los que queremos un cambio.";
            } else {
                $response['message'] = 'Error al registrar la donación: ' . htmlspecialchars($stmt->error);
            }
            $stmt->close();
        }
    } else {
        $response['message'] = "No se ha seleccionado ningún archivo o hubo un error al subirlo.";
    }
} else {
    $response['message'] = 'Solicitud no válida.';
}

$conex->close();

header('Content-Type: application/json');
echo json_encode($response);
?>
