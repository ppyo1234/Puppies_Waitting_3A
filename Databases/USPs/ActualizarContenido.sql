-- ============================ 
-- PROCEDIMIENTO ActualizarContenido 
-- ============================ 
DELIMITER // 
CREATE PROCEDURE ActualizarContenido( 
    IN p_id_contenido INT, 
    IN p_titulo VARCHAR(255), 
    IN p_texto TEXT, 
    IN p_fecha_publicacion DATE, 
    IN p_id_blogger INT, 
    IN p_id_veterinaria INT, 
    IN p_id_refugio INT 
) 
BEGIN 
    UPDATE Contenido 
    SET T¡tulo = p_titulo, Texto = p_texto, Fecha_Publicaci¢n = p_fecha_publicacion, ID_Blogger = p_id_blogger, ID_Veterinaria = p_id_veterinaria, ID_Refugio = p_id_refugio 
    WHERE ID_Contenido = p_id_contenido; 
END // 
DELIMITER ; 
