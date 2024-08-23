<?php
 include $_SERVER['DOCUMENT_ROOT'].'/BackEnd/DB_Connection/con_db.php';

if (isset($_POST['enviar'])) {
    if (strlen($_POST['nombre']) >= 1 && strlen($_POST['apellido_p']) >= 1 && strlen($_POST['apellido_m']) >= 1 && strlen($_POST['direccion']) >= 1 
    && strlen($_POST['telefono']) >= 1 && strlen($_POST['contrasena']) >= 1 && strlen($_POST['email']) >= 1) {
       
        $nombre = trim($_POST['nombre']);
        $apellido_p = trim($_POST['apellido_p']);
        $apellido_m = trim($_POST['apellido_m']);
        $direccion = trim($_POST['direccion']);
        $telefono = trim($_POST['telefono']);
        $email = trim($_POST['email']);
        $contrasena = trim($_POST['contrasena']);
        $fechareg = date("d/m/y");
        $rol = 'Usuario'; 

        // Verificar si el correo ya está registrado
        $consultaVerificar = "SELECT * FROM usuario WHERE Email='$email'";
        $resultadoVerificar = mysqli_query($conex, $consultaVerificar);
        
        if (mysqli_num_rows($resultadoVerificar) > 0) {
            // El correo ya está registrado
            header('Location: ../puppies_waiting_FrontEnd/puppies_waiting/registrarse.php?error=email');
            exit();
        } else {
            // Insertar nuevo usuario
            $consulta = "INSERT INTO usuario(Nombre, Apellido_Paterno, Apellido_Materno, Dirección, Teléfono, Email, contrasena, Rol, Fecha_Registro) 
                         VALUES ('$nombre', '$apellido_p', '$apellido_m', '$direccion', '$telefono', '$email', '$contrasena',  '$rol' ,'$fechareg')";
            
            $resultado = mysqli_query($conex, $consulta);
            
            if ($resultado) {
                // Redirigir a la página de confirmación
                header('Location: ../puppies_waiting_FrontEnd/puppies_waiting/registro_exitoso.html');	    
                exit();
            } else {
                echo '<h3 class="bad">¡Ups ha ocurrido un error!</h3>';
            }
        }
    } else {
        echo '<h3 class="bad">¡Por favor complete los campos!</h3>';
    }
}

mysqli_close($conex);
?>
