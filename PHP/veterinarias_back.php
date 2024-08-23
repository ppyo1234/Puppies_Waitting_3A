<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Veterinarias</title>
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

        .btn-add {
            background-color: #2196F3;
            color: white;
            display: inline-block;
            margin-bottom: 10px;
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

        .btn-add:hover {
            background-color: #1e88e5;
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

        select, input[type="text"], input[type="email"], input[type="tel"] {
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 100%;
            margin-bottom: 10px;
        }

        .back-button {
            display: inline-block;
            width: 130px;
            background-color: #2196F3;
            color: white;
            text-align: center;
            line-height: 30px;
            cursor: pointer;
            border: none;
            font-size: 18px;
            font-family: Arial, sans-serif;
            box-shadow: 0 10px px rgba(0, 0, 0, 0.2);
            border-radius: 5px;
            text-align: center;
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

        /* Estilos para el Modal */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
            padding-top: 60px;
        }

        .modal-content {
            background-color: #fff;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            border-radius: 4px;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>

<h1>Gestión de Veterinarias</h1>

<a href="/BackEnd/puppies_waiting_FrontEnd/puppies_waiting/admin.php" class="btn">←</a>
<br><br>

<?php
include $_SERVER['DOCUMENT_ROOT'].'/BackEnd/DB_Connection/con_db.php';

// Eliminar veterinaria
if (isset($_POST['eliminar'])) {
    $id_veterinaria = $_POST['eliminar'];

    // Primero eliminar las referencias en la tabla cita
    $sql_cita = "DELETE FROM cita WHERE ID_Veterinaria = ?";
    $stmt_cita = $conex->prepare($sql_cita);
    $stmt_cita->bind_param("i", $id_veterinaria);
    $stmt_cita->execute();
    $stmt_cita->close();

    // Luego eliminar las referencias en la tabla contenido
    $sql_contenido = "DELETE FROM contenido WHERE ID_Veterinaria = ?";
    $stmt_contenido = $conex->prepare($sql_contenido);
    $stmt_contenido->bind_param("i", $id_veterinaria);
    $stmt_contenido->execute();
    $stmt_contenido->close();

    // Finalmente eliminar la veterinaria
    $sql_veterinaria = "DELETE FROM veterinaria WHERE ID_Veterinaria = ?";
    $stmt_veterinaria = $conex->prepare($sql_veterinaria);
    $stmt_veterinaria->bind_param("i", $id_veterinaria);
    $stmt_veterinaria->execute();
    $stmt_veterinaria->close();
}

// Agregar veterinaria
if (isset($_POST['guardar'])) {
    $nombre = $_POST['nombre'];
    $direccion = $_POST['direccion'];
    $telefono = $_POST['telefono'];
    $email = $_POST['email'];
    $especialidad = $_POST['especialidad'];
    $horario_atencion = $_POST['horario_atencion'];
    $id_administrador = $_POST['id_administrador'];

    $sql = "INSERT INTO veterinaria (Nombre, Dirección, Teléfono, Email, Especialidad, Horario_Atención, ID_Administrador) 
            VALUES (?, ?, ?, ?, ?, ?, ?)";
    $stmt = $conex->prepare($sql);
    $stmt->bind_param("ssssssi", $nombre, $direccion, $telefono, $email, $especialidad, $horario_atencion, $id_administrador);
    $stmt->execute();
    $stmt->close();
}

$sql = "SELECT 
            v.ID_Veterinaria, 
            v.Nombre, 
            v.Dirección, 
            v.Teléfono, 
            v.Email, 
            v.Especialidad, 
            v.Horario_Atención, 
            u.nombre AS nombre_administrador
        FROM veterinaria v
        JOIN usuario u ON v.ID_Administrador = u.ID_Usuario";

$result = $conex->query($sql);

if ($result->num_rows > 0) {
    echo "<button class='btn btn-add' onclick='mostrarFormulario()'>+ Añadir Veterinaria</button>";
    echo "<table>
            <tr>
                <th>ID Veterinaria</th>
                <th>Nombre</th>
                <th>Dirección</th>
                <th>Teléfono</th>
                <th>Email</th>
                <th>Especialidad</th>
                <th>Horario de Atención</th>
                <th>Administrador</th>
                <th>Acciones</th>
            </tr>";

    while($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>" . $row["ID_Veterinaria"] . "</td>
                <td>" . $row["Nombre"] . "</td>
                <td>" . $row["Dirección"] . "</td>
                <td>" . $row["Teléfono"] . "</td>
                <td>" . $row["Email"] . "</td>
                <td>" . $row["Especialidad"] . "</td>
                <td>" . $row["Horario_Atención"] . "</td>
                <td>" . $row["nombre_administrador"] . "</td>
                <td>
                    <form method='post' style='display:inline;'>
                        <button type='submit' class='btn btn-delete' name='eliminar' value='" . $row["ID_Veterinaria"] . "'>Eliminar</button>
                    </form>
                </td>
              </tr>";
    }
    echo "</table>";
} else {
    echo "No hay veterinarias registradas.";
}

// Obtener administradores para el select
$sql_administradores = "SELECT ID_Usuario, nombre FROM usuario WHERE Rol = 'Administrador'";
$result_administradores = $conex->query($sql_administradores);

$conex->close();
?>

<!-- Botón para abrir el modal -->
<div id="formulario-agregar" class="modal">
    <div class="modal-content">
        <span class="close" onclick="cerrarFormulario()">&times;</span>
        <h2>Añadir Nueva Veterinaria</h2>
        <form method="post">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required>
            <label for="direccion">Dirección:</label>
            <input type="text" id="direccion" name="direccion" required>
            <label for="telefono">Teléfono:</label>
            <input type="tel" id="telefono" name="telefono" required>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <label for="especialidad">Especialidad:</label>
            <input type="text" id="especialidad" name="especialidad" required>
            <label for="horario_atencion">Horario de Atención:</label>
            <input type="text" id="horario_atencion" name="horario_atencion" required>
            <label for="id_administrador">Administrador:</label>
            <select id="id_administrador" name="id_administrador" required>
                <?php
                while ($row_adm = $result_administradores->fetch_assoc()) {
                    echo "<option value='" . $row_adm['ID_Usuario'] . "'>" . $row_adm['nombre'] . "</option>";
                }
                ?>
            </select>
            <button type="submit" class="btn btn-save" name="guardar">Guardar</button>
            <button type="button" class="btn btn-cancel" onclick="cerrarFormulario()">Cancelar</button>
        </form>
    </div>
</div>

<script>
    function mostrarFormulario() {
        document.getElementById('formulario-agregar').style.display = 'block';
    }

    function cerrarFormulario() {
        document.getElementById('formulario-agregar').style.display = 'none';
    }

    // Cerrar el modal si el usuario hace clic fuera del modal
    window.onclick = function(event) {
        if (event.target == document.getElementById('formulario-agregar')) {
            cerrarFormulario();
        }
    }
</script>

</body>
</html>
