<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Contenido</title>
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

        .btn-delete {
            background-color: #ff5722;
            color: white;
        }

        .btn-delete:hover {
            background-color: #e64a19;
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

</head>
<body>

<h1>Gestión de Contenido</h1>

<a  href="/BackEnd/puppies_waiting_FrontEnd/puppies_waiting/admin.php" class="btn">←</a>


<br><br>

<?php
 include $_SERVER['DOCUMENT_ROOT'].'/BackEnd/DB_Connection/con_db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['eliminar'])) {
        $idContenido = $_POST['eliminar'];
        $sql = "DELETE FROM contenido WHERE ID_Contenido = ?";
        $stmt = $conex->prepare($sql);
        $stmt->bind_param("i", $idContenido);
        $stmt->execute();
        $stmt->close();
    }
}

$sql = "SELECT 
            c.ID_Contenido, 
            c.Titulo, 
            c.Texto, 
            b.nombre AS nombre_blogger
        FROM contenido c
        JOIN usuario b ON c.ID_Blogger = b.ID_Usuario";

$result = $conex->query($sql);

if ($result->num_rows > 0) {
    echo "<form method='post'>";
    echo "<table>
            <tr>
                <th>Título</th>
                <th>Texto</th>
                <th>Blogger</th>
                <th>Acciones</th>
            </tr>";

    while ($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>" . $row["Titulo"] . "</td>
                <td>" . $row["Texto"] . "</td>
                <td>" . $row["nombre_blogger"] . "</td>
                <td>
                    <button type='submit' class='btn btn-delete' name='eliminar' value='" . $row["ID_Contenido"] . "'>Eliminar</button>
                </td>
              </tr>";
    }
    echo "</table>";
    echo "</form>";
} else {
    echo "No hay contenido disponible.";
}

$conex->close();
?>

</body>
</html>

