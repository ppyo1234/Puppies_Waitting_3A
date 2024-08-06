-- ============================ 
-- PROCEDIMIENTO EliminarBlogger 
-- ============================ 
DELIMITER // 
CREATE PROCEDURE EliminarBlogger( 
    IN p_id_blogger INT 
) 
BEGIN 
    DELETE FROM Blogger 
    WHERE ID_Blogger = p_id_blogger; 
END // 
DELIMITER ; 
