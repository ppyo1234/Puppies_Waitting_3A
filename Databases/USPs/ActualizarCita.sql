-- ============================ 
-- PROCEDIMIENTO ActualizarCita 
-- ============================ 
DELIMITER // 
CREATE PROCEDURE ActualizarCita( 
    IN p_id_cita INT, 
    IN p_fecha_hora DATETIME, 
    IN p_id_perro INT, 
    IN p_id_veterinaria INT, 
    IN p_id_usuario_adoptante INT, 
    IN p_estado ENUM('Pendiente', 'Confirmada', 'Cancelada'), 
    IN p_id_administrador INT 
) 
BEGIN 
    UPDATE Cita 
    SET Fecha_Hora = p_fecha_hora, ID_Perro = p_id_perro, ID_Veterinaria = p_id_veterinaria, ID_Usuario_Adoptante = p_id_usuario_adoptante, Estado = p_estado, ID_Administrador = p_id_administrador 
    WHERE ID_Cita = p_id_cita; 
END // 
DELIMITER ; 
