<?php 

include("con_db.php");
//aqui va a ir toda la captura de datos para el backEnd
if (isset($_POST['valores'])) {
    if (strlen($_POST['valores']) >= 1 && strlen($_POST['valores']) >= 1) {

	    $resultado = mysqli_query($conex,$consulta);
	    if ($resultado) {
	    	?> 
	    	<h3 class="ok">¡Te has inscrito correctamente!</h3>
           <?php
	    } else {
	    	?> 
	    	<h3 class="bad">¡Ups ha ocurrido un error!</h3>
           <?php
	    }
    }   else {
	    	?> 
	    	<h3 class="bad">¡Por favor complete los campos!</h3>
           <?php
    }
}

?>