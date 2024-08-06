-- ============================ 
-- PROCEDIMIENTO EliminarUsuarioAdoptante 
-- ============================ 
DELIMITER // 
CREATE PROCEDURE EliminarUsuarioAdoptante( 
    IN p_id_usuario_adoptante INT 
) 
BEGIN 
    DELETE FROM Usuario_Adoptante 
    WHERE ID_Usuario_Adoptante = p_id_usuario_adoptante; 
END // 
DELIMITER ; 
