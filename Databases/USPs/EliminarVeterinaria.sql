-- ============================ 
-- PROCEDIMIENTO EliminarVeterinaria 
-- ============================ 
DELIMITER // 
CREATE PROCEDURE EliminarVeterinaria( 
    IN p_id_veterinaria INT 
) 
BEGIN 
    DELETE FROM Veterinaria 
    WHERE ID_Veterinaria = p_id_veterinaria; 
END // 
DELIMITER ; 
