-- ============================ 
-- PROCEDIMIENTO InsertarCita 
-- ============================ 
DELIMITER // 
CREATE PROCEDURE InsertarCita( 
    IN p_fecha_hora DATETIME, 
    IN p_id_perro INT, 
    IN p_id_veterinaria INT, 
    IN p_id_usuario_adoptante INT, 
    IN p_estado ENUM('Pendiente', 'Confirmada', 'Cancelada'), 
    IN p_id_administrador INT 
) 
BEGIN 
    INSERT INTO Cita (Fecha_Hora, ID_Perro, ID_Veterinaria, ID_Usuario_Adoptante, Estado, ID_Administrador) 
    VALUES (p_fecha_hora, p_id_perro, p_id_veterinaria, p_id_usuario_adoptante, p_estado, p_id_administrador); 
END // 
DELIMITER ; 
