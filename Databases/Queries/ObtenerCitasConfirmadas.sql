-- ============================ 
-- QUERY Obtener todas las citas confirmadas para un perro espec¡fico 
-- ============================ 
SELECT 
c.Fecha_Hora, 
v.Nombre AS Veterinaria, 
u.Nombre AS Adoptante 
FROM Cita c 
JOIN Veterinaria v ON c.ID_Veterinaria = v.ID_Veterinaria 
JOIN Usuario_Adoptante u ON c.ID_Usuario_Adoptante = u.ID_Usuario_Adoptante 
WHERE c.ID_Perro = ? AND c.Estado = 'Confirmada'; 
