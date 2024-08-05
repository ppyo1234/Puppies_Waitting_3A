-- ============================ 
-- PROCEDIMIENTO EliminarContenido 
-- ============================ 
DELIMITER // 
CREATE PROCEDURE EliminarContenido( 
    IN p_id_contenido INT 
) 
BEGIN 
    DELETE FROM Contenido 
    WHERE ID_Contenido = p_id_contenido; 
END // 
DELIMITER ; 
