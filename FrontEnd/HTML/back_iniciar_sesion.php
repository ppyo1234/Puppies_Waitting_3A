<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include("../DB_Connection/con_db.php"); 
session_start(); // Inicia la sesión

$error = ''; // Inicializa la variable para almacenar mensajes de error

if (isset($_POST['enviar'])) {
    if (strlen($_POST['email']) >= 1 && strlen($_POST['contrasena']) >= 1) {
        $email = trim($_POST['email']);
        $contrasena = trim($_POST['contrasena']);
        
        // Preparar la consulta
        $query = "SELECT ID_Usuario, Rol, contrasena FROM usuario WHERE Email = ?";
        $stmt = mysqli_prepare($conex, $query);
        
        // Enlazar parámetros
        mysqli_stmt_bind_param($stmt, 's', $email);
        
        // Ejecutar la consulta
        mysqli_stmt_execute($stmt);
        
        // Obtener el resultado
        $result = mysqli_stmt_get_result($stmt);
        
        // Verificar si se encontró el usuario
        if (mysqli_num_rows($result) > 0) {
            $row = mysqli_fetch_assoc($result);
            
            // Verificar la contraseña
            if ($contrasena == $row['contrasena']) {
                $role = $row['Rol'];
                $user_id = $row['ID_Usuario'];
                
                // Establecer el ID del usuario en la sesión
                $_SESSION['user_id'] = $user_id;
                $_SESSION['role'] = $role;

                // Redirigir según el rol
                if ($role == 'Administrador') {
                    header('Location: ../puppies_waiting_FrontEnd/puppies_waiting/admin.php');	    
                } elseif ($role == 'Usuario') {
                    header('Location: ../puppies_waiting_FrontEnd/puppies_waiting/contenido_usuario.php');	    
                } elseif ($role == 'Blogger') {
                    header('Location: ../puppies_waiting_FrontEnd/puppies_waiting/blogger.php');	    
                }
                
                exit(); // Asegúrate de detener la ejecución después de redirigir
            } else {
                $error = 'Email o contraseña incorrectos';
            }
        } else {
            $error = 'Email o contraseña incorrectos';
        }

        // Redirigir con mensaje de error si hay alguno
        if ($error) {
            header("Location: /BackEnd/puppies_waiting_FrontEnd/puppies_waiting/iniciar_sesion.php?error=" . urlencode($error));
            exit();
        }

        // Cerrar la declaración
        mysqli_stmt_close($stmt);
    } else {
        $error = 'Por favor, complete todos los campos';
        header("Location: /BackEnd/puppies_waiting_FrontEnd/puppies_waiting/iniciar_sesion.php?error=" . urlencode($error));
        exit();
    }
}

// Cerrar la conexión
mysqli_close($conex);
?>
