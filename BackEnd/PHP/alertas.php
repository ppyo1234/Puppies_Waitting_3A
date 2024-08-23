<?php

 include $_SERVER['DOCUMENT_ROOT'].'/BackEnd/DB_Connection/con_db.php';

session_start();

$user_id = $_SESSION['user_id'];

$sql = "SELECT * FROM alertas WHERE ID_Usuario = ? AND visto = '0'";
$stmt = $conex->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

while ($row = $result->fetch_assoc()) {
    echo '<div class="alert alert-info alert-dismissible fade show" role="alert">';
    echo htmlspecialchars($row['mensaje']); // Sanitizar el mensaje
    echo '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>';
    echo '</div>';

    $sql_update = "UPDATE alertas SET visto = '1' WHERE ID_Alerta = ?";
    $stmt_update = $conex->prepare($sql_update);
    $stmt_update->bind_param("i", $row['ID_Alerta']);
    $stmt_update->execute();
    $stmt_update->close();
}

$stmt->close();
$conex->close();
?>
