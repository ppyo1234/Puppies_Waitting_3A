<?php 
include $_SERVER['DOCUMENT_ROOT'].'/BackEnd/DB_Connection/con_db.php';

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Procesar la búsqueda de usuarios
$searchQuery = "";
if (isset($_POST['search'])) {
    $searchTerm = $conex->real_escape_string($_POST['search_term']);
    $searchQuery = " WHERE ID_Usuario LIKE '%$searchTerm%' 
                        OR Nombre LIKE '%$searchTerm%' 
                        OR Apellido_Paterno LIKE '%$searchTerm%' 
                        OR Apellido_Materno LIKE '%$searchTerm%' 
                        OR Dirección LIKE '%$searchTerm%' 
                        OR Teléfono LIKE '%$searchTerm%' 
                        OR Email LIKE '%$searchTerm%' 
                        OR Rol LIKE '%$searchTerm%' 
                        OR Fecha_Registro LIKE '%$searchTerm%'";
}

// Consulta para obtener usuarios
$sql = "SELECT ID_Usuario, Nombre, Apellido_Paterno, Apellido_Materno, Dirección, Teléfono, Email, Rol, Fecha_Registro FROM usuario" . $searchQuery;
$result = $conex->query($sql);

// Procesar el formulario de actualización
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['update'])) {
    foreach ($_POST['roles'] as $id => $rol) {
        $id = intval($id); // Sanitizar el ID
        $rol = $conex->real_escape_string($rol); // Sanitizar el rol
        $updateSql = "UPDATE usuario SET Rol='$rol' WHERE ID_Usuario=$id";
        $conex->query($updateSql);
    }
    // Redireccionar para evitar reenvío de formulario
    header("Location: " . $_SERVER['PHP_SELF']);
    exit();
}

// Procesar la eliminación de un usuario
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['delete'])) {
    $id = intval($_POST['delete']);
    
    // Consultar si el usuario tiene citas asociadas
    $checkCitasSql = "SELECT ID_Cita FROM cita WHERE ID_Usuario_Adoptante=$id";
    $citasResult = $conex->query($checkCitasSql);
    
    if ($citasResult->num_rows > 0) {
        // Mostrar advertencia si el usuario tiene citas
        echo "<script>alert('Este usuario tiene citas asociadas. Elimine primero las citas para poder eliminar al usuario.');</script>";
    } else {
        // Eliminar usuario si no tiene citas asociadas
        $deleteSql = "DELETE FROM usuario WHERE ID_Usuario=$id";
        $conex->query($deleteSql);
        
        // Redireccionar para evitar reenvío de formulario
        header("Location: " . $_SERVER['PHP_SELF']);
        exit();
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Usuarios Registrados</title>
    <link rel="stylesheet" href="blogger.css">
    <style>
        .back-button {
            display: inline-block;
            width: 120px;
            background-color: #2196F3;
            color: white;
            text-align: center;
            line-height: 30px;
            cursor: pointer;
            border: none;
            font-size: 18px;
            font-family: Arial, sans-serif;
            box-shadow: 0 10px px rgba(0, 0, 0, 0.2);
        }

        .back-button:hover {
            background-color: #1976D2;
        }

        h1 {
            color: #007acc;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-size: 2.5em;
            font-weight: bold;
            text-align: center;
            background: linear-gradient(to right, #eaf4fc, #d0e6f5);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 20px 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-family: Arial, sans-serif;
        }

        table, th, td {
            border: 1px solid #d3e0ea;
        }

        th, td {
            padding: 12px;
            text-align: left;
            word-break: break-word; /* Evita el desbordamiento de contenido */
        }

        th {
            background-color: #eaf4fc;
            color: #007acc;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #d0e6f5;
        }

        select {
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #d3e0ea;
            background-color: #ffffff;
            color: #007acc;
            font-size: 1em;
            font-family: Arial, sans-serif;
            transition: border-color 0.3s;
        }

        select:focus {
            border-color: #007acc;
            outline: none;
        }

        .save-cancel {
            text-align: center;
            margin-top: 20px;
        }

        button {
            background-color: #007acc;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            font-size: 1em;
            font-family: Arial, sans-serif;
            cursor: pointer;
            transition: background-color 0.3s, box-shadow 0.3s;
            margin: 0 10px;
            display: inline-block; /* Asegura que el botón se ajuste dentro de la celda */
        }

        button:hover {
            background-color: #005f8a;
        }

        button:active {
            background-color: #004c6d;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        button:focus {
            outline: none;
        }

        .save-cancel button:first-of-type {
            background-color: #28a745;
        }

        .save-cancel button:first-of-type:hover {
            background-color: #218838;
        }

        .save-cancel button:first-of-type:active {
            background-color: #1e7e34;
        }

        .save-cancel button:last-of-type {
            background-color: #dc3545;
        }

        .save-cancel button:last-of-type:hover {
            background-color: #c82333;
        }

        .save-cancel button:last-of-type:active {
            background-color: #bd2130;
        }

        .actions-column {
            max-width: 120px;   
            text-align: center; 
        }

        footer {
            background: #72a4b8;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            width: 100%;
            bottom: 0;
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

        /* Estilos para la barra de búsqueda */
        .search-container {
            margin-bottom: 20px;
            text-align: center;
        }

        .search-container input[type="text"] {
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #d3e0ea;
            font-size: 1em;
            width: 80%;
            max-width: 500px;
        }

        .search-container button {
            padding: 8px 16px;
            border: none;
            background-color: #007acc;
            color: white;
            cursor: pointer;
            border-radius: 4px;
            font-size: 1em;
            margin-left: 10px;
        }

        .search-container button:hover {
            background-color: #005f8a;
        }
    </style>
</head>
<body>

    <h1 class="usuarios">Usuarios</h1>

    <a href="/BackEnd/puppies_waiting_FrontEnd/puppies_waiting/admin.php" class="btn">←</a>
    <br><br>

    <!-- Barra de búsqueda -->
    <div class="search-container">
        <form method="post" action="">
            <input type="text" name="search_term" placeholder="Buscar por nombre, apellidos, dirección, teléfono, email, rol o fecha de registro">
            <button type="submit" name="search">Buscar</button>
        </form>
    </div>

    <form method="post" action="">
        <?php
        if ($result->num_rows > 0) {
            echo "<table>";
            echo "<tr><th>ID_Usuario</th><th>Nombre</th> <th>Apellido_Paterno</th> <th>Apellido_Materno</th> <th>Dirección</th> 
            <th>Teléfono</th><th>Email</th><th>Rol</th> <th>Fecha_Registro</th> <th class='actions-column'>Acciones</th></tr>";

            // Mostrar cada fila de la consulta
            while ($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row["ID_Usuario"] . "</td>";
                echo "<td>" . $row["Nombre"] . "</td>";
                echo "<td>" . $row["Apellido_Paterno"] . "</td>";
                echo "<td>" . $row["Apellido_Materno"] . "</td>";
                echo "<td>" . $row["Dirección"] . "</td>";
                echo "<td>" . $row["Teléfono"] . "</td>";
                echo "<td>" . $row["Email"] . "</td>";
                echo "<td>";
                echo "<select name='roles[" . $row["ID_Usuario"] . "]'>";
                echo "<option value='Administrador'" . ($row["Rol"] == 'Administrador' ? ' selected' : '') . ">Administrador</option>";
                echo "<option value='Blogger'" . ($row["Rol"] == 'Blogger' ? ' selected' : '') . ">Blogger</option>";
                echo "<option value='Usuario'" . ($row["Rol"] == 'Usuario' ? ' selected' : '') . ">Usuario</option>";
                echo "</select>";
                echo "</td>";
                echo "<td>" . $row["Fecha_Registro"] . "</td>";
                echo "<td class='actions-column'>";
                echo "<form method='post' action='' style='display:inline;'>";
                echo "<input type='hidden' name='delete' value='" . $row["ID_Usuario"] . "'>";
                echo "<button type='submit' onclick='return confirm(\"¿Estás seguro de que deseas eliminar este usuario?\");'>Eliminar</button>";
                echo "</form>";
                echo "</td>";
                echo "</tr>";
            }
            echo "</table>";
        } else {
            echo "No se encontraron usuarios registrados.";
        }
        ?>

        <div class="save-cancel">
            <button type="submit" name="update">Guardar Cambios</button>
            <button type="button" onclick="window.location.reload();">Cancelar</button>
        </div>
    </form>

    <script>
        function goBack() {
            window.history.back();
        }
    </script>

</body>
</html>

<?php
$conex->close();
?>
