<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Contenido</title>
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

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
        }

        input[type="text"],
        textarea,
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        input[type="file"] {
            margin-bottom: 20px;
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

        .btn-cancel {
            background-color: #f44336;
        }

        .btn-cancel:hover {
            background-color: #d32f2f;
        }



    </style>


</head>
<body>

<h1>Agregar Contenido</h1>

<a  href="/BackEnd/puppies_waiting_FrontEnd/puppies_waiting/iniciar_sesion.php" class="btn">←</a>

<br><br>


<form action="" method="post" enctype="multipart/form-data">
    <label for="Titulo">Título:</label>
    <input type="text" name="Titulo" id="Titulo" required>

    <label for="Texto">Texto:</label>
    <textarea name="Texto" id="Texto" rows="5" required></textarea>

    <label for="ID_Blogger">Blogger:</label>
    <select name="ID_Blogger" id="ID_Blogger" required>
        <option value="">Seleccione un blogger</option>
       
       
        <?php
 include $_SERVER['DOCUMENT_ROOT'].'/BackEnd/DB_Connection/con_db.php';

        if ($conex->connect_error) {
            die("Conexión fallida: " . $conex->connect_error);
        }

        $sql_blogger = "SELECT ID_Usuario, nombre FROM usuario WHERE rol = 'Blogger'";
        $result_blogger = $conex->query($sql_blogger);

        if ($result_blogger->num_rows > 0) {
            while ($blogger = $result_blogger->fetch_assoc()) {
                echo "<option value='" . $blogger['ID_Usuario'] . "'>" . $blogger['nombre'] . "</option>";
            }
        }
        ?>

    </select>

    <label for="Imagen">Imagen:</label>
    <input type="file" name="Imagen" id="Imagen" accept="image/*" required>

    <button type="submit" class="btn">Guardar</button>
    <button type="button" class="btn btn-cancel" onclick="window.location.href='/BackEnd/puppies_waiting_FrontEnd/puppies_waiting/blogger.php'">Cancelar</button>
</form>
    <a  href="/BackEnd/puppies_waiting_FrontEnd/puppies_waiting/contenido_blogger.php" class="btn">Ver Mi Contenido</a>


<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $titulo = isset($_POST['Titulo']) ? $_POST['Titulo'] : '';
    $texto = isset($_POST['Texto']) ? $_POST['Texto'] : '';
    $idBlogger = isset($_POST['ID_Blogger']) ? $_POST['ID_Blogger'] : '';
    $fechaPublicacion = date('Y-m-d');

    if (isset($_FILES['Imagen']) && $_FILES['Imagen']['error'] === UPLOAD_ERR_OK) {
        $target_dir = "uploads/";
        if (!file_exists($target_dir)) {
            mkdir($target_dir, 0777, true);
        }
        $target_file = $target_dir . basename($_FILES["Imagen"]["name"]);
        $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

        $allowed_types = ['jpg', 'jpeg', 'png', 'gif'];
        $check = getimagesize($_FILES["Imagen"]["tmp_name"]);
        if ($check !== false && in_array($imageFileType, $allowed_types) && $_FILES["Imagen"]["size"] < 5000000) {
            if (move_uploaded_file($_FILES["Imagen"]["tmp_name"], $target_file)) {
                $sql = "INSERT INTO contenido (Titulo, Texto, Imagen, Fecha_Publicación, ID_Blogger) VALUES (?, ?, ?, ?, ?)";
                $stmt = $conex->prepare($sql);
                if ($stmt) {
                    $stmt->bind_param("ssssi", $titulo, $texto, $target_file, $fechaPublicacion, $idBlogger);
                    if ($stmt->execute()) {
                        echo "El contenido se ha guardado exitosamente.";
                    } else {
                        echo "Error al guardar el contenido: " . $stmt->error;
                    }
                    $stmt->close();
                } else {
                    echo "Error en la preparación de la consulta: " . $conex->error;
                }
            } else {
                echo "Error al subir la imagen.";
            }
        } else {
            echo "El archivo seleccionado no es una imagen válida o es demasiado grande.";
        }
    } else {
        echo "No se ha seleccionado ninguna imagen.";
    }


    $conex->close();
}
?>

</body>
</html>

