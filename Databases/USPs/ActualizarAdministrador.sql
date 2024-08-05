-- ============================ 
-- PROCEDIMIENTO ActualizarAdministrador 
-- ============================ 
DELIMITER // 
CREATE PROCEDURE ActualizarAdministrador( 
    IN p_id_administrador INT, 
    IN p_nombre VARCHAR(100), 
    IN p_apellido_paterno VARCHAR(100), 
    IN p_apellido_materno VARCHAR(100), 
    IN p_usuario VARCHAR(50), 
    IN p_contrase¤a VARCHAR(255), 
    IN p_email VARCHAR(100) 
) 
BEGIN 
    UPDATE Administrador 
    SET Nombre = p_nombre, Apellido_Paterno = p_apellido_paterno, Apellido_Materno = p_apellido_materno, Usuario = p_usuario, Contrase¤a = p_contrase¤a, Email = p_email 
    WHERE ID_Administrador = p_id_administrador; 
END // 
DELIMITER ; 
