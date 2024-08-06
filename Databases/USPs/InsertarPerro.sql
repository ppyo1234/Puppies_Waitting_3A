-- ============================ 
-- PROCEDIMIENTO InsertarPerro 
-- ============================ 
DELIMITER // 
CREATE PROCEDURE InsertarPerro( 
    IN p_nombre VARCHAR(100), 
    IN p_edad INT, 
    IN p_tamano ENUM('Peque¤o', 'Mediano', 'Grande'), 
    IN p_raza ENUM('Pastor Alem n', 'Pitbull', 'Gran Dan‚s', 'D lmata'), 
    IN p_estado_salud ENUM('Bueno', 'Regular', 'Malo'), 
    IN p_fecha_ingreso DATE, 
    IN p_id_refugio INT 
) 
BEGIN 
    INSERT INTO Perro (Nombre, Edad, Tama¤o, Raza, Estado_Salud, Fecha_Ingreso, ID_Refugio) 
    VALUES (p_nombre, p_edad, p_tamano, p_raza, p_estado_salud, p_fecha_ingreso, p_id_refugio); 
END // 
DELIMITER ; 
