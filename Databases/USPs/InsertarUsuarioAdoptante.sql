-- ============================ 
-- PROCEDIMIENTO InsertarUsuarioAdoptante 
-- ============================ 
DELIMITER // 
CREATE PROCEDURE InsertarUsuarioAdoptante( 
    IN p_nombre VARCHAR(100), 
    IN p_apellido_paterno VARCHAR(100), 
    IN p_apellido_materno VARCHAR(100), 
    IN p_direccion VARCHAR(255), 
    IN p_telefono VARCHAR(20), 
    IN p_email VARCHAR(100), 
    IN p_fecha_registro DATE 
) 
BEGIN 
    INSERT INTO Usuario_Adoptante (Nombre, Apellido_Paterno, Apellido_Materno, Direcci¢n, Tel‚fono, Email, Fecha_Registro) 
    VALUES (p_nombre, p_apellido_paterno, p_apellido_materno, p_direccion, p_telefono, p_email, p_fecha_registro); 
END // 
DELIMITER ; 
