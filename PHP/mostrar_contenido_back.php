<?php
 include $_SERVER['DOCUMENT_ROOT'].'/BackEnd/DB_Connection/con_db.php';

echo '<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
    background-color: #f4f4f4;
}

header {
    background: #7190a5;
    color: #fff;
    padding: 10px 0;
    text-align: center;
}

header h1 {
    margin-bottom: 10px;
}

nav ul {
    list-style: none;
}

nav ul li {
    display: inline;
    margin: 0 10px;
}

nav ul li a {
    color: #fff;
    text-decoration: none;
}

nav ul li a:hover {
    text-decoration: underline;
}

main {
    padding: 20px;
}

section {
    margin-bottom: 20px;
}

section h2 {
    margin-bottom: 10px;
}

.card-container {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
}

.card {
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    overflow: hidden;
    width: calc(33.333% - 20px);
    margin: 0px;
    text-align: center;
}

.card img {
    width: 100%;
    height: auto;
}

.card h3 {
    margin: 10px 0;
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

.sesion:hover {
    background-color: rgb(197, 238, 238);
}

.sesion {
    border-radius: 5px;
    background-color: rgb(187, 164, 206);
    height: 25px;
    width: 100px;
}

.container {
    display: flex;
    justify-content: right;
}

.redirect-button {
    background-color: #95abb6;
    color: white;
    padding: 8px 8px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    border-radius: 4px;
    transition: background-color 0.3s;
}

.redirect-button:hover {
    background-color: #7ea5c9;
}
</style>';

$sql = "SELECT Titulo, Texto, Imagen FROM contenido";
$result = $conex->query($sql);

if ($result->num_rows > 0) {
    echo '<div class="card-container">';
    while ($row = $result->fetch_assoc()) {
        $titulo = htmlspecialchars($row['Titulo']);
        $texto = htmlspecialchars($row['Texto']);
        $imagen = $row['Imagen']; 

        if ($imagen) {
            $imageType = 'jpg ,png ,web'; 
            $imagen_base64 = base64_encode($imagen);
            $imagen_src = 'data:image/' . $imageType . ';base64,' . $imagen_base64;

            echo "<div class='card'>
                    <img src='$imagen_src' alt='$titulo'>
                    <h3>$titulo</h3>
                    <p>$texto</p>
                  </div>";
        } else {
            echo "<div class='card'>
                    <img src='path/to/default-image.jpg' alt='Imagen no disponible'>
                    <h3>$titulo</h3>
                    <p>$texto</p>
                  </div>";
        }
    }
    echo '</div>';
} else {
    echo "<p>No hay contenido disponible.</p>";
}

$conex->close();
?>
