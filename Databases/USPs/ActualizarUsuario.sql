-- ============================ 
-- PROCEDIMIENTO ActualizarUsuarioAdoptante 
-- ============================ 
DELIMITER // 
CREATE PROCEDURE ActualizarUsuarioAdoptante( 
    IN p_id_usuario_adoptante INT, 
    IN p_nombre VARCHAR(100), 
    IN p_apellido_paterno VARCHAR(100), 
    IN p_apellido_materno VARCHAR(100), 
    IN p_direccion VARCHAR(255), 
    IN p_telefono VARCHAR(20), 
    IN p_email VARCHAR(100), 
    IN p_fecha_registro DATE 
) 
BEGIN 
    UPDATE Usuario_Adoptante 
    SET Nombre = p_nombre, Apellido_Paterno = p_apellido_paterno, Apellido_Materno = p_apellido_materno, Direcci¢n = p_direccion, Tel‚fono = p_telefono, Email = p_email, Fecha_Registro = p_fecha_registro 
    WHERE ID_Usuario_Adoptante = p_id_usuario_adoptante; 
END // 
DELIMITER ; 
