-- ============================ 
-- PROCEDIMIENTO EliminarPerro 
-- ============================ 
DELIMITER // 
CREATE PROCEDURE EliminarPerro( 
    IN p_id_perro INT 
) 
BEGIN 
    DELETE FROM Perro 
    WHERE ID_Perro = p_id_perro; 
END // 
DELIMITER ; 
