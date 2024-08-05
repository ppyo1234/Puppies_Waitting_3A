-- ============================ 
-- PROCEDIMIENTO ActualizarPerro 
-- ============================ 
DELIMITER // 
CREATE PROCEDURE ActualizarPerro( 
    IN p_id_perro INT, 
    IN p_nombre VARCHAR(100), 
    IN p_edad INT, 
    IN p_tamano ENUM('Peque¤o', 'Mediano', 'Grande'), 
    IN p_raza ENUM('Pastor Alem n', 'Pitbull', 'Gran Dan‚s', 'D lmata'), 
    IN p_estado_salud ENUM('Bueno', 'Regular', 'Malo'), 
    IN p_fecha_ingreso DATE, 
    IN p_id_refugio INT 
) 
BEGIN 
    UPDATE Perro 
    SET Nombre = p_nombre, Edad = p_edad, Tama¤o = p_tamano, Raza = p_raza, Estado_Salud = p_estado_salud, Fecha_Ingreso = p_fecha_ingreso, ID_Refugio = p_id_refugio 
    WHERE ID_Perro = p_id_perro; 
END // 
DELIMITER ; 
