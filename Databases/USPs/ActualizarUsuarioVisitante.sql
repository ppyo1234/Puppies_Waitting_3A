-- ============================ 
-- PROCEDIMIENTO ActualizarUsuarioVisitante 
-- ============================ 
DELIMITER // 
CREATE PROCEDURE ActualizarUsuarioVisitante( 
    IN p_id_usuario_visitante INT, 
    IN p_nombre VARCHAR(100) 
) 
BEGIN 
    UPDATE Usuario_Visitante 
    SET Nombre = p_nombre 
    WHERE ID_Usuario_Visitante = p_id_usuario_visitante; 
END // 
DELIMITER ; 
