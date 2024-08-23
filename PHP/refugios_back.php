<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Refugios</title>
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
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .btn-add-symbol {
            font-size: 20px;
            margin-right: 5px;
        }

        .btn-delete {
            background-color: #ff5722;
            color: white;
        }

        .btn-add:hover {
            background-color: #1976D2;
        }

        .btn-delete:hover {
            background-color: #e64a19;
        }

        #addForm {
            display: none;
            margin-top: 20px;
        }

        input, select {
            padding: 5px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 100%;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            padding: 10px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
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
            text-align : center;

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
    <script>
        function toggleAddForm() {
            var form = document.getElementById('addForm');
            form.style.display = (form.style.display === 'none' || form.style.display === '') ? 'block' : 'none';
        }


    </script>
</head>
<body>

<h1>Gestión de Refugios</h1>

<a  href="/BackEnd/puppies_waiting_FrontEnd/puppies_waiting/admin.php" class="btn">←</a>

<br><br><br>

<button class="btn btn-add" onclick="toggleAddForm()">
    <span class="btn-add-symbol">+</span> Agregar Refugio
</button>

<div id="addForm">
    <form action="refugios.php" method="post">
        <label for="nombre">Nombre del Refugio:</label>
        <input type="text" id="nombre" name="nombre" required>

        <label for="direccion">Dirección:</label>
        <input type="text" id="direccion" name="direccion" required>

        <label for="telefono">Teléfono:</label>
        <input type="text" id="telefono" name="telefono" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="capacidad">Capacidad:</label>
        <input type="number" id="capacidad" name="capacidad" required>

        <label for="horario_atencion">Horario de Atención:</label>
        <input type="text" id="horario_atencion" name="horario_atencion" required>

        <label for="id_administrador">Administrador:</label>
        <select id="id_administrador" name="id_administrador" required>
            <?php
 include $_SERVER['DOCUMENT_ROOT'].'/BackEnd/DB_Connection/con_db.php';
            // Seleccionar solo usuarios con el rol de Administrador
            $admin_sql = "SELECT ID_Usuario, nombre FROM usuario WHERE rol = 'Administrador'";
            $admin_result = $conex->query($admin_sql);
            while ($admin_row = $admin_result->fetch_assoc()) {
                echo "<option value='" . $admin_row['ID_Usuario'] . "'>" . $admin_row['nombre'] . "</option>";
            }
            ?>
        </select>

        <input type="submit" name="agregar" value="Agregar Refugio">
    </form>
</div>

<?php
 include $_SERVER['DOCUMENT_ROOT'].'/BackEnd/DB_Connection/con_db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['agregar'])) {
    $nombre = $_POST['nombre'];
    $direccion = $_POST['direccion'];
    $telefono = $_POST['telefono'];
    $email = $_POST['email'];
    $capacidad = $_POST['capacidad'];
    $horario_atencion = $_POST['horario_atencion'];
    $id_administrador = $_POST['id_administrador'];

    $sql_insert = "INSERT INTO refugio (Nombre, Dirección, Teléfono, Email, Capacidad, Horario_Atención, ID_Administrador) 
                   VALUES (?, ?, ?, ?, ?, ?, ?)";
    $stmt = $conex->prepare($sql_insert);
    $stmt->bind_param("ssssisi", $nombre, $direccion, $telefono, $email, $capacidad, $horario_atencion, $id_administrador);
    $stmt->execute();
    $stmt->close();
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['eliminar'])) {
    $id_refugio = $_POST['eliminar'];

    $sql_delete = "DELETE FROM refugio WHERE ID_Refugio = ?";
    $stmt = $conex->prepare($sql_delete);
    $stmt->bind_param("i", $id_refugio);
    $stmt->execute();
    $stmt->close();
}

$sql = "SELECT 
            r.ID_Refugio, 
            r.Nombre, 
            r.Dirección, 
            r.Teléfono, 
            r.Email, 
            r.Capacidad, 
            r.Horario_Atención, 
            u.nombre AS nombre_administrador
        FROM refugio r
        JOIN usuario u ON r.ID_Administrador = u.ID_Usuario";

$result = $conex->query($sql);

if ($result->num_rows > 0) {
    echo "<table>
            <tr>
                <th>ID Refugio</th>
                <th>Nombre</th>
                <th>Dirección</th>
                <th>Teléfono</th>
                <th>Email</th>
                <th>Capacidad</th>
                <th>Horario de Atención</th>
                <th>Administrador</th>
                <th>Acciones</th>
            </tr>";

    while($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>" . $row["ID_Refugio"] . "</td>
                <td>" . $row["Nombre"] . "</td>
                <td>" . $row["Dirección"] . "</td>
                <td>" . $row["Teléfono"] . "</td>
                <td>" . $row["Email"] . "</td>
                <td>" . $row["Capacidad"] . "</td>
                <td>" . $row["Horario_Atención"] . "</td>
                <td>" . $row["nombre_administrador"] . "</td>
                <td>
                    <form action='refugios.php' method='post' style='display:inline;'>
                        <button type='submit' class='btn btn-delete' name='eliminar' value='" . $row["ID_Refugio"] . "'>Eliminar</button>
                    </form>
                </td>
              </tr>";
    }
    echo "</table>";
} else {
    echo "No hay refugios registrados.";
}

$conex->close();
?>

</body>
</html>
