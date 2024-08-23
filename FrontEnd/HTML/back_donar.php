<?php
 include $_SERVER['DOCUMENT_ROOT'].'/BackEnd/DB_Connection/con_db.php';
if (isset($_GET['delete_id'])) {
    $delete_id = $_GET['delete_id'];
    $deleteQuery = "DELETE FROM donar WHERE id_donar = ?";
    $stmt = mysqli_prepare($conex, $deleteQuery);
    mysqli_stmt_bind_param($stmt, 'i', $delete_id);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_close($stmt);
    header("Location: back_donar.php");
    exit();
}

$query = "SELECT * FROM donar";
$result = mysqli_query($conex, $query);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Donaciones</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            color: #333;
            padding: 20px;
        }
        h1 {
            color: #007acc;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #e6f7ff;
        }
        table, th, td {
            border: 1px solid #a3d7f4;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #007acc;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #e0f3fc;
        }
        .delete-btn {
            background-color: #ff4d4d;
            color: white;
            padding: 5px 10px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 14px;
        }
        .delete-btn:hover {
            background-color: #ff1a1a;
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
        function goBack() {
            window.history.back();
        }
    </script>
</head>
<body>
    <h1>Lista de Donaciones</h1>
        <br><br>
        <a  href="/BackEnd/puppies_waiting_FrontEnd/puppies_waiting/admin.php" class="btn">←</a>

    <table>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Imagen</th>
            <th>Fecha de Donación</th>
            <th>Acciones</th>
        </tr>
        <?php while ($row = mysqli_fetch_assoc($result)): ?>
            <tr>
                <td><?php echo htmlspecialchars($row['id_donar']); ?></td>
                <td><?php echo htmlspecialchars($row['nombre']); ?></td>
                <td>
                    <?php if ($row['imagen']): ?>
                        <img src="data:image/jpeg;base64,<?php echo base64_encode($row['imagen']); ?>" width="100" />
                    <?php else: ?>
                        Sin Imagen
                    <?php endif; ?>
                </td>
                <td><?php echo htmlspecialchars($row['fecha_de_donacion']); ?></td>
                <td>
                <a class="delete-btn" href="/../BackEnd/PHP/back_donar.php?delete_id=<?php echo $row['id_donar']; ?>" onclick="return confirm('¿Estás seguro de que deseas eliminar este registro?');">Eliminar</a>                </td>
            </tr>
        <?php endwhile; ?>
    </table>
</body>
</html>

<?php
mysqli_close($conex);
?>
