-- ============================ 
-- PROCEDIMIENTO ActualizarRefugio 
-- ============================ 
DELIMITER // 
CREATE PROCEDURE ActualizarRefugio( 
    IN p_id_refugio INT, 
    IN p_nombre VARCHAR(100), 
    IN p_direccion VARCHAR(255), 
    IN p_telefono VARCHAR(20), 
    IN p_email VARCHAR(100), 
    IN p_capacidad INT, 
    IN p_horario_atencion VARCHAR(100), 
    IN p_id_administrador INT 
) 
BEGIN 
    UPDATE Refugio 
    SET Nombre = p_nombre, Direcci¢n = p_direccion, Tel‚fono = p_telefono, Email = p_email, Capacidad = p_capacidad, Horario_Atenci¢n = p_horario_atencion, ID_Administrador = p_id_administrador 
    WHERE ID_Refugio = p_id_refugio; 
END // 
DELIMITER ; 
