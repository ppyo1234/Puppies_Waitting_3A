-- ============================ 
-- PROCEDIMIENTO ActualizarBlogger 
-- ============================ 
DELIMITER // 
CREATE PROCEDURE ActualizarBlogger( 
    IN p_id_blogger INT, 
    IN p_nombre VARCHAR(100), 
    IN p_apellido_paterno VARCHAR(100), 
    IN p_apellido_materno VARCHAR(100), 
    IN p_usuario VARCHAR(50), 
    IN p_contrase¤a VARCHAR(255), 
    IN p_email VARCHAR(100), 
    IN p_fecha_registro DATE 
) 
BEGIN 
    UPDATE Blogger 
    SET Nombre = p_nombre, Apellido_Paterno = p_apellido_paterno, Apellido_Materno = p_apellido_materno, Usuario = p_usuario, Contrase¤a = p_contrase¤a, Email = p_email, Fecha_Registro = p_fecha_registro 
    WHERE ID_Blogger = p_id_blogger; 
END // 
DELIMITER ; 
