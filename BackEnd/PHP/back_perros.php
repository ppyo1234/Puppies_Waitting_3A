<?php
include $_SERVER['DOCUMENT_ROOT'].'/BackEnd/DB_Connection/con_db.php';

// Procesar la imagen subida
if (isset($_POST['actualizar'])) {
    $idPerro = $_POST['ID_Perro'];

    // Procesar la imagen si se sube una nueva
    if ($_FILES['Imagen']['name']) {
        $imagen = addslashes(file_get_contents($_FILES['Imagen']['tmp_name']));
        $sql = "UPDATE perro SET Imagen='$imagen' WHERE ID_Perro='$idPerro'";
        if (mysqli_query($conex, $sql)) {
            echo "Imagen actualizada correctamente.";
        } else {
            echo "Error al actualizar la imagen: " . mysqli_error($conex);
        }
    } else {
        echo "No se ha seleccionado una nueva imagen.";
    }
}

// Eliminar un perro
if (isset($_POST['eliminar'])) {
    $idPerro = $_POST['ID_Perro'];

    // Verificar si el perro está registrado en la tabla cita
    $checkCitas = "SELECT * FROM cita WHERE ID_Perro='$idPerro'";
    $result = mysqli_query($conex, $checkCitas);
    
    if (mysqli_num_rows($result) > 0) {
        echo "No se puede eliminar el perro porque está registrado en una cita. Primero elimine las citas asociadas.";
    } else {
        // Eliminar el perro si no hay citas asociadas
        $sql = "DELETE FROM perro WHERE ID_Perro='$idPerro'";
        if (mysqli_query($conex, $sql)) {
            echo "Perro eliminado correctamente.";
        } else {
            echo "Error al eliminar el perro: " . mysqli_error($conex);
        }
    }
}

// Agregar un nuevo perro
if (isset($_POST['agregar'])) {
    $nombre = $_POST['Nombre'];
    $edad = $_POST['Edad'];
    $tamano = $_POST['Tamaño'];
    $raza = $_POST['Raza'];
    $estadoSalud = $_POST['Estado_Salud'];
    $idRefugio = $_POST['ID_Refugio'];
    $fechaIngreso = date('Y-m-d H:i:s'); // Fecha y hora actual en formato de MySQL

    // Procesar la imagen
    if ($_FILES['Imagen']['name']) {
        $imagen = addslashes(file_get_contents($_FILES['Imagen']['tmp_name']));
    } else {
        echo "No se ha seleccionado una imagen.";
        $imagen = NULL;
    }

    $sql = "INSERT INTO perro (Nombre, Edad, Tamaño, Raza, Estado_Salud, ID_Refugio, Imagen, Fecha_Ingreso) 
    VALUES ('$nombre', '$edad', '$tamano', '$raza', '$estadoSalud', '$idRefugio', '$imagen', '$fechaIngreso')";

    if (mysqli_query($conex, $sql)) {
        echo "Perro agregado correctamente.";
    } else {
        echo "Error al agregar el perro: " . mysqli_error($conex);
    }
}

// Obtener la lista de refugios
$refugiosQuery = "SELECT ID_Refugio, Nombre FROM refugio";
$refugiosResult = mysqli_query($conex, $refugiosQuery);
$refugios = [];
while ($row = mysqli_fetch_assoc($refugiosResult)) {
    $refugios[$row['ID_Refugio']] = $row['Nombre'];
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Perros</title>
    <style>
          body {
            font-family: Arial, sans-serif;
            background-color: #e0f7fa;
            color: #006064;
            padding: 20px;
        }
        h1 {
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #006064;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #4dd0e1;
        }
        tr:nth-child(even) {
            background-color: #e0f7fa;
        }
        form {
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="number"], select {
            width: 100%;
            padding: 8px;
            border: 1px solid #006064;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .button-group {
            text-align: center;
            margin-top: 20px;
        }
        input[type="submit"], button {
            background-color: #4dd0e1;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover, button:hover {
            background-color: #006064;
        }
        .cancel {
            background-color: #ffab91;
        }

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
            background-color: rgb(0,0,0); 
            background-color: rgba(0,0,0,0.4); 
            padding-top: 60px; 
        }
        .modal-content {
            background-color: #fefefe;
            margin: 5% auto; 
            padding: 20px;
            border: 1px solid #888;
            width: 80%; 
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

        .back-button {
            display: inline-block;
            width: 110px;
            height : 50px;
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
            background-color: #4dd0e1;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            
        }

        .btn:hover {
            background-color: #1976D2;
        }   
    </style>
</head>
<body>

<h1>Gestión de Perros</h1>

<a href="/BackEnd/puppies_waiting_FrontEnd/puppies_waiting/admin.php" class="btn">←</a>

<br><br>

<!-- Botón para abrir el modal -->
<button id="openModal">Agregar Nuevo Perro</button>

<!-- El Modal -->
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>Agregar Nuevo Perro</h2>
        <form action="" method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label for="Nombre">Nombre:</label>
                <input type="text" name="Nombre" required>
            </div>
            <div class="form-group">
                <label for="Edad">Edad:</label>
                <input type="number" name="Edad" required>
            </div>
            <div class="form-group">
                <label for="Tamaño">Tamaño:</label>
                <select name="Tamaño" required>
                    <option value="Pequeño">Pequeño</option>
                    <option value="Mediano">Mediano</option>
                    <option value="Grande">Grande</option>
                </select>
            </div>
            <div class="form-group">
                <label for="Raza">Raza:</label>
                <input type="text" name="Raza" required>
            </div>
            <div class="form-group">
                <label for="Estado_Salud">Estado de Salud:</label>
                <select name="Estado_Salud" required>
                    <option value="Bueno">Bueno</option>
                    <option value="Regular">Regular</option>
                    <option value="Malo">Malo</option>
                </select>
            </div>
            <div class="form-group">
                <label for="ID_Refugio">Refugio:</label>
                <select name="ID_Refugio" required>
                    <?php
                    foreach ($refugios as $id => $nombre) {
                        echo "<option value='$id'>$nombre</option>";
                    }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label for="Imagen">Imagen:</label>
                <input type="file" name="Imagen" accept="image/*" required>
            </div>
            <div class="button-group">
                <input type="submit" name="agregar" value="Guardar cambios">
                <button type="button" class="cancel close">Cancelar</button>
            </div>
        </form>
    </div>
</div>

<h2>Perros Registrados</h2>

<!-- Formulario de búsqueda -->
<form action="" method="GET">
    <div class="form-group">
        <label for="search">Buscar por Nombre del Perro o Nombre del Refugio:</label>
        <input type="text" name="search" id="search" value="<?php echo isset($_GET['search']) ? htmlspecialchars($_GET['search']) : ''; ?>">
        <input type="submit" value="Buscar">
    </div>
</form>

<?php
$search = isset($_GET['search']) ? mysqli_real_escape_string($conex, $_GET['search']) : '';

$sql = "SELECT perro.*, refugio.Nombre AS RefugioNombre 
        FROM perro 
        LEFT JOIN refugio ON perro.ID_Refugio = refugio.ID_Refugio
        WHERE perro.Nombre LIKE '%$search%' OR refugio.Nombre LIKE '%$search%'";

$result = mysqli_query($conex, $sql);

if (mysqli_num_rows($result) > 0) {
    echo "<table>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Edad</th>
                <th>Tamaño</th>
                <th>Raza</th>
                <th>Estado de Salud</th>
                <th>Refugio</th>
                <th>Imagen</th>
                <th>Fecha de Ingreso</th>
                <th>Acciones</th>
            </tr>";

    while ($row = mysqli_fetch_assoc($result)) {
        echo "<tr>
                <td>" . $row['ID_Perro'] . "</td>
                <td>" . $row['Nombre'] . "</td>
                <td>" . $row['Edad'] . "</td>
                <td>" . $row['Tamaño'] . "</td>
                <td>" . $row['Raza'] . "</td>
                <td>" . $row['Estado_Salud'] . "</td>
                <td>" . $row['RefugioNombre'] . "</td>
                <td><img src='data:image/jpeg;base64," . base64_encode($row['Imagen']) . "' alt='Imagen del Perro' style='width:100px; height:auto;'></td>
                <td>" . $row['Fecha_Ingreso'] . "</td>
                <td>
                    <form action='' method='POST' style='display:inline-block;'>
                        <input type='hidden' name='ID_Perro' value='" . $row['ID_Perro'] . "'>
                        <input type='submit' name='eliminar' value='Eliminar'>
                    </form>
                    <button onclick='openModal(" . $row['ID_Perro'] . ")'>Actualizar Imagen</button>
                </td>
            </tr>";
    }

    echo "</table>";
} else {
    echo "No se encontraron resultados.";
}
?>

<script>
// Obtener el modal
var modal = document.getElementById("myModal");
var btn = document.getElementById("openModal");
var span = document.getElementsByClassName("close")[0];

// Cuando el usuario haga clic en el botón, abre el modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// Cuando el usuario haga clic en <span> (x), cierra el modal
span.onclick = function() {
    modal.style.display = "none";
}

// Cuando el usuario haga clic en cualquier parte fuera del modal, cierra el modal
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

function openModal(idPerro) {
    // Código para abrir el modal de actualización de imagen
    document.getElementById("myModal").style.display = "block";
    document.querySelector("form input[name='ID_Perro']").value = idPerro;
}
</script>

</body>
</html>
