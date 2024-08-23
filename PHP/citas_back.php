<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Citas</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        h1 {
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #ccc;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #e3f2fd;
            color: #333;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .btn {
            padding: 8px 16px;
            border: none;
            cursor: pointer;
            margin-right: 5px;
        }

        .btn-save {
            background-color: #4CAF50;
            color: white;
        }

        .btn-cancel {
            background-color: #f44336;
            color: white;
        }

        .btn-delete {
            background-color: #ff5722;
            color: white;
        }

        .btn-save:hover {
            background-color: #45a049;
        }

        .btn-cancel:hover {
            background-color: #e53935;
        }

        .btn-delete:hover {
            background-color: #e64a19;
        }

        select {
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .back-button {
            border: none;
            cursor: pointer;
            margin-right: 5px;

            display: inline-block;
            
            width: 120px;
            background-color: #2196F3;
            color: white;
            text-align: center;
            line-height: 30px;
            font-size: 18px;
            font-family: Arial, sans-serif;
            box-shadow: 0 10px px rgba(0, 0, 0, 0.2);
            border-radius: 5px;

        }

        .back-button:hover {
            background-color: #1976D2;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            background-color: #2196F3;
            color: white;
            cursor: pointer;
            border-radius: 3px;
            
        }

        .btn:hover {
            background-color: #1976D2;
        }   
    </style>
</head>
<body>



<h1>Gestión de Citas</h1>
<a  href="/BackEnd/puppies_waiting_FrontEnd/puppies_waiting/admin.php" class="btn">←</a>

<br><br>



<?php
 include $_SERVER['DOCUMENT_ROOT'].'/BackEnd/DB_Connection/con_db.php';

session_start();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['eliminar'])) {
        $idCita = $_POST['eliminar'];
        $sql = "DELETE FROM cita WHERE ID_Cita = ?";
        $stmt = $conex->prepare($sql);
        $stmt->bind_param("i", $idCita);
        $stmt->execute();
        $stmt->close();
    } elseif (isset($_POST['guardar'])) {
        $idCita = $_POST['guardar'];
        $nuevoEstado = $_POST['estado'];

        // Actualizar el estado de la cita
        $sql = "UPDATE cita SET Estado = ?, ID_Administrador = ? WHERE ID_Cita = ?";
        $stmt = $conex->prepare($sql);
        $stmt->bind_param("sii", $nuevoEstado, $_SESSION['user_id'], $idCita);
        $stmt->execute();

        // Obtener el ID del usuario que hizo la cita
        $sql_usuario = "SELECT ID_Usuario_Adoptante FROM cita WHERE ID_Cita = ?";
        $stmt_usuario = $conex->prepare($sql_usuario);
        $stmt_usuario->bind_param("i", $idCita);
        $stmt_usuario->execute();
        $result_usuario = $stmt_usuario->get_result();
        $row_usuario = $result_usuario->fetch_assoc();
        $id_adoptante = $row_usuario['ID_Usuario_Adoptante'];
        $stmt_usuario->close();

        // Registrar la alerta
        $alerta_mensaje = "";
        if ($nuevoEstado == "Confirmada") {
            $alerta_mensaje = "Tu cita para la adopción de tu nuevo amigo ha sido confirmada, te esperamos 😊.";
        } elseif ($nuevoEstado == "Cancelada") {
            $alerta_mensaje = "Tu cita para adopción ha sido cancelada, lo sentimos demasiado 😔.";
        }

        if ($alerta_mensaje != "") {
            $sql_alerta = "INSERT INTO alertas (ID_Usuario, mensaje, visto) VALUES (?, ?, '0')";
            $stmt_alerta = $conex->prepare($sql_alerta);
            $stmt_alerta->bind_param("is", $id_adoptante, $alerta_mensaje);
            $stmt_alerta->execute();
            $stmt_alerta->close();
        }

        $stmt->close();
    }
}

$sql = "SELECT 
            c.ID_Cita, 
            c.Fecha_Hora, 
            p.nombre AS nombre_perro, 
            v.nombre AS nombre_veterinaria, 
            u.nombre AS nombre_adoptante, 
            c.Estado, 
            u2.nombre AS nombre_administrador
        FROM cita c
        JOIN perro p ON c.ID_Perro = p.ID_Perro
        JOIN veterinaria v ON c.ID_Veterinaria = v.ID_Veterinaria
        JOIN usuario u ON c.ID_Usuario_Adoptante = u.ID_Usuario
        LEFT JOIN usuario u2 ON c.ID_Administrador = u2.ID_Usuario";

$result = $conex->query($sql);

if ($result->num_rows > 0) {

    echo "<form method='post'>";
    echo "<table>
            <tr>
                <th>ID Cita</th>
                <th>Fecha y Hora</th>
                <th>Nombre del Perro</th>
                <th>Nombre de la Veterinaria</th>
                <th>Nombre del Adoptante</th>
                <th>Estado</th>
                <th>Administrador</th>
                <th>Acciones</th>
            </tr>";

    while ($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>" . $row["ID_Cita"] . "</td>
                <td>" . $row["Fecha_Hora"] . "</td>
                <td>" . $row["nombre_perro"] . "</td>
                <td>" . $row["nombre_veterinaria"] . "</td>
                <td>" . $row["nombre_adoptante"] . "</td>
                <td>
                    <select name='estado'>
                        <option value='Pendiente'" . ($row["Estado"] == "Pendiente" ? " selected" : "") . ">Pendiente</option>
                        <option value='Confirmada'" . ($row["Estado"] == "Confirmada" ? " selected" : "") . ">Confirmada</option>
                        <option value='Cancelada'" . ($row["Estado"] == "Cancelada" ? " selected" : "") . ">Cancelada</option>
                    </select>
                </td>
                <td>" . $row["nombre_administrador"] . "</td>
                <td>
                    <button type='submit' class='btn btn-save' name='guardar' value='" . $row["ID_Cita"] . "'>Guardar Cambios</button>
                    <button type='submit' class='btn btn-delete' name='eliminar' value='" . $row["ID_Cita"] . "'>Eliminar</button>
                </td>
              </tr>";
    }
    echo "</table>";
    echo "<button type='reset' class='btn btn-cancel'>Cancelar</button>";

    echo "</form>";
} else {
    echo "No hay citas programadas.";
}

$conex->close();
?>
