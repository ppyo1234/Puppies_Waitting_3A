-- ============================ 
-- PROCEDIMIENTO EliminarCita 
-- ============================ 
DELIMITER // 
CREATE PROCEDURE EliminarCita( 
    IN p_id_cita INT 
) 
BEGIN 
    DELETE FROM Cita 
    WHERE ID_Cita = p_id_cita; 
END // 
DELIMITER ; 
