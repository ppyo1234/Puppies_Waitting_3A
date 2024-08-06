-- ============================ 
-- PROCEDIMIENTO EliminarAdministrador 
-- ============================ 
DELIMITER // 
CREATE PROCEDURE EliminarAdministrador( 
    IN p_id_administrador INT 
) 
BEGIN 
    DELETE FROM Administrador 
    WHERE ID_Administrador = p_id_administrador; 
END // 
DELIMITER ; 
