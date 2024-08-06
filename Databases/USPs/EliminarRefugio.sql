-- ============================ 
-- PROCEDIMIENTO EliminarRefugio 
-- ============================ 
DELIMITER // 
CREATE PROCEDURE EliminarRefugio( 
    IN p_id_refugio INT 
) 
BEGIN 
    DELETE FROM Refugio 
    WHERE ID_Refugio = p_id_refugio; 
END // 
DELIMITER ; 
