-- ============================ 
-- PROCEDIMIENTO InsertarRefugio 
-- ============================ 
DELIMITER // 
CREATE PROCEDURE InsertarRefugio( 
    IN p_nombre VARCHAR(100), 
    IN p_direccion VARCHAR(255), 
    IN p_telefono VARCHAR(20), 
    IN p_email VARCHAR(100), 
    IN p_capacidad INT, 
    IN p_horario_atencion VARCHAR(100), 
    IN p_id_administrador INT 
) 
BEGIN 
    INSERT INTO Refugio (Nombre, Direcci¢n, Tel‚fono, Email, Capacidad, Horario_Atenci¢n, ID_Administrador) 
    VALUES (p_nombre, p_direccion, p_telefono, p_email, p_capacidad, p_horario_atencion, p_id_administrador); 
END // 
DELIMITER ; 
