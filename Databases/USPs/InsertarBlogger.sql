-- ============================ 
-- PROCEDIMIENTO InsertarBlogger 
-- ============================ 
DELIMITER // 
CREATE PROCEDURE InsertarBlogger( 
    IN p_nombre VARCHAR(100), 
    IN p_apellido_paterno VARCHAR(100), 
    IN p_apellido_materno VARCHAR(100), 
    IN p_usuario VARCHAR(50), 
    IN p_contrase¤a VARCHAR(255), 
    IN p_email VARCHAR(100), 
    IN p_fecha_registro DATE 
) 
BEGIN 
    INSERT INTO Blogger (Nombre, Apellido_Paterno, Apellido_Materno, Usuario, Contrase¤a, Email, Fecha_Registro) 
    VALUES (p_nombre, p_apellido_paterno, p_apellido_materno, p_usuario, p_contrase¤a, p_email, p_fecha_registro); 
END // 
DELIMITER ; 
