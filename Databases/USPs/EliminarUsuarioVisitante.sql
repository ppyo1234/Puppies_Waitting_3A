-- ============================ 
-- PROCEDIMIENTO EliminarUsuarioVisitante 
-- ============================ 
DELIMITER // 
CREATE PROCEDURE EliminarUsuarioVisitante( 
    IN p_id_usuario_visitante INT 
) 
BEGIN 
    DELETE FROM Usuario_Visitante 
    WHERE ID_Usuario_Visitante = p_id_usuario_visitante; 
END // 
DELIMITER ; 
