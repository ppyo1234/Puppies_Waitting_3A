-- ============================ 
-- PROCEDIMIENTO InsertarContenido 
-- ============================ 
DELIMITER // 
CREATE PROCEDURE InsertarContenido( 
    IN p_titulo VARCHAR(255), 
    IN p_texto TEXT, 
    IN p_fecha_publicacion DATE, 
    IN p_id_blogger INT, 
    IN p_id_veterinaria INT, 
    IN p_id_refugio INT 
) 
BEGIN 
    INSERT INTO Contenido (T¡tulo, Texto, Fecha_Publicaci¢n, ID_Blogger, ID_Veterinaria, ID_Refugio) 
    VALUES (p_titulo, p_texto, p_fecha_publicacion, p_id_blogger, p_id_veterinaria, p_id_refugio); 
END // 
DELIMITER ; 
