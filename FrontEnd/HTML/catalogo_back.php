<?php

 include $_SERVER['DOCUMENT_ROOT'].'/BackEnd/DB_Connection/con_db.php';
session_start();

error_reporting(E_ALL);
ini_set('display_errors', 1);

// Consultar la base de datos
$sql = "SELECT p.ID_Perro, p.Nombre, p.Edad, p.Tamaño, p.Raza, p.Imagen, p.Estado_Salud, p.Fecha_Ingreso, r.Nombre AS Refugio
        FROM perro p
        JOIN refugio r ON p.ID_Refugio = r.ID_Refugio";

$result = $conex->query($sql);

if ($result === false) {
    die("Error en la consulta: " . htmlspecialchars($conex->error));
}

// Si se envía el formulario, procesar los datos
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $fecha_hora = $_POST['fecha_hora'];
    $id_perro = $_POST['id_perro'];
    $id_veterinaria = $_POST['id_veterinaria'];
    $id_usuario_adoptante = $_SESSION['user_id'];
    $estado = 'Pendiente'; // Estado por defecto

    $insert_sql = "INSERT INTO cita (Fecha_Hora, ID_Perro, ID_Veterinaria, ID_Usuario_Adoptante, Estado, ID_Administrador)
               VALUES (?, ?, ?, ?, ?, NULL)";

    $stmt = $conex->prepare($insert_sql);
    if ($stmt === false) {
        die("Error en la preparación de la consulta: " . htmlspecialchars($conex->error));
    }

    $stmt->bind_param('siiii', $fecha_hora, $id_perro, $id_veterinaria, $id_usuario_adoptante, $estado);

    if ($stmt->execute()) {
        echo "<script>alert('Cita guardada con éxito.');</script>";
    } else {
        echo "<script>alert('Error al guardar la cita: " . htmlspecialchars($stmt->error) . "');</script>";
    }

    $stmt->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perros en Adopción</title>
    <link rel="stylesheet" href="catalogo.css">
    <style>
        /* Estilos para el modal */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0.4);
            padding-top: 60px;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 500px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
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

        /* Estilos para el formulario */
        .modal-content form {
            display: flex;
            flex-direction: column;
        }

        .modal-content label {
            margin: 10px 0 5px;
            font-weight: bold;
        }

        .modal-content input,
        .modal-content select {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .modal-content button {
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .modal-content button:hover {
            background-color: #45a049;
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
    <header>
        <h1>¡Adopta y ayuda a salvar vidas!</h1>
    </header>
    <br>

    <a  href="/BackEnd/puppies_waiting_FrontEnd/puppies_waiting/contenido_usuario.php" class="btn">←</a>


    <main>
        <?php while ($row = $result->fetch_assoc()) { ?>
            <div class="card">
                <img src="data:image/jpeg;base64,<?php echo base64_encode($row['Imagen']); ?>" alt="<?php echo htmlspecialchars($row['Nombre']); ?>">
                <div class="card-content">
                    <h2><?php echo htmlspecialchars($row['Nombre']); ?></h2>
                    <p><strong>Edad:</strong> <?php echo htmlspecialchars($row['Edad']); ?> años</p>
                    <p><strong>Tamaño:</strong> <?php echo htmlspecialchars($row['Tamaño']); ?></p>
                    <p><strong>Raza:</strong> <?php echo htmlspecialchars($row['Raza']); ?></p>
                    <p><strong>Estado de Salud:</strong> <?php echo htmlspecialchars($row['Estado_Salud']); ?></p>
                    <p><strong>Fecha de Ingreso:</strong> <?php echo htmlspecialchars($row['Fecha_Ingreso']); ?></p>
                    <p><strong>Refugio:</strong> <?php echo htmlspecialchars($row['Refugio']); ?></p>
                    
                    <!-- Botón para abrir el modal -->
                    <button onclick="openModal('<?php echo $row['ID_Perro']; ?>')">Agendar Cita</button>
                </div>
            </div>

            <!-- Modal para agendar cita -->
            <div id="modal-<?php echo $row['ID_Perro']; ?>" class="modal">
                <div class="modal-content">
                    <span class="close" onclick="closeModal('<?php echo $row['ID_Perro']; ?>')">&times;</span>
                    <h2>Agendar Cita para <?php echo htmlspecialchars($row['Nombre']); ?></h2>
                    <form method="POST">
                        <input type="hidden" name="id_perro" value="<?php echo $row['ID_Perro']; ?>">
                        <label for="fecha_hora">Fecha y Hora:</label>
                        <input type="datetime-local" name="fecha_hora" required>
                        <label for="id_veterinaria">Veterinaria:</label>
                        <select name="id_veterinaria" required>
                            <?php
                            $veterinaria_sql = "SELECT ID_Veterinaria, Nombre FROM veterinaria";
                            $veterinaria_result = $conex->query($veterinaria_sql);
                            while ($veterinaria_row = $veterinaria_result->fetch_assoc()) {
                                echo '<option value="' . $veterinaria_row['ID_Veterinaria'] . '">' . htmlspecialchars($veterinaria_row['Nombre']) . '</option>';
                            }
                            ?>
                        </select>
                        <input type="hidden" name="id_usuario_adoptante" value="<?php echo $_SESSION['user_id']; ?>"> <!-- Obtener el ID del usuario adoptante de la sesión -->
                        <button type="submit">Confirmar Cita</button>
                    </form>
                </div>
            </div>
        <?php } ?>
    </main>

    <br><br><br><br><br><br>
    <footer>
        <p>&copy; Síguenos en nuestras redes sociales de Puppies Waiting.</p>
    </footer>

    <script>
        function openModal(id) {
            document.getElementById('modal-' + id).style.display = 'block';
        }

        function closeModal(id) {
            document.getElementById('modal-' + id).style.display = 'none';
        }

        // Cerrar el modal si se hace clic fuera de él
        window.onclick = function(event) {
            const modals = document.querySelectorAll('.modal');
            modals.forEach(function(modal) {
                if (event.target == modal) {
                    modal.style.display = 'none';
                }
            });
        }
    </script>
</body>
</html>

<?php
$conex->close();
?>
