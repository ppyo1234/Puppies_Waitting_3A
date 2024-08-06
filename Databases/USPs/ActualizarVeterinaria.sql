-- ============================ 
-- PROCEDIMIENTO ActualizarVeterinaria 
-- ============================ 
DELIMITER // 
CREATE PROCEDURE ActualizarVeterinaria( 
    IN p_id_veterinaria INT, 
    IN p_nombre VARCHAR(100), 
    IN p_direccion VARCHAR(255), 
    IN p_telefono VARCHAR(20), 
    IN p_email VARCHAR(100), 
    IN p_especialidad ENUM('Cirug¡a', 'Medicina General', 'Dermatolog¡a'), 
    IN p_horario_atencion VARCHAR(100), 
    IN p_id_administrador INT 
) 
BEGIN 
    UPDATE Veterinaria 
    SET Nombre = p_nombre, Direcci¢n = p_direccion, Tel‚fono = p_telefono, Email = p_email, Especialidad = p_especialidad, Horario_Atenci¢n = p_horario_atencion, ID_Administrador = p_id_administrador 
    WHERE ID_Veterinaria = p_id_veterinaria; 
END // 
DELIMITER ; 
