-- ============================ 
-- PROCEDIMIENTO InsertarUsuarioVisitante 
-- ============================ 
DELIMITER // 
CREATE PROCEDURE InsertarUsuarioVisitante( 
    IN p_nombre VARCHAR(100) 
) 
BEGIN 
    INSERT INTO Usuario_Visitante (Nombre) 
    VALUES (p_nombre); 
END // 
DELIMITER ; 
