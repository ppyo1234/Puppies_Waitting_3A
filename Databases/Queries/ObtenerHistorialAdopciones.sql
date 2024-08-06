-- ============================ 
-- QUERY Obtener el historial de adopciones de un usuario 
-- ============================ 
SELECT 
p.Nombre AS Perro, 
c.Fecha_Hora AS Fecha_De_Adopcion, 
r.Nombre AS Refugio 
FROM Cita c 
JOIN Perro p ON c.ID_Perro = p.ID_Perro 
JOIN Refugio r ON p.ID_Refugio = r.ID_Refugio 
WHERE c.ID_Usuario_Adoptante = ? AND c.Estado = 'Confirmada'; 
