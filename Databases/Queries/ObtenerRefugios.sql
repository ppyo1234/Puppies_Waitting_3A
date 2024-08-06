-- ============================ 
-- QUERY Obtener todos los refugios con su capacidad actual y n£mero de perros 
-- ============================ 
SELECT 
r.Nombre AS Refugio, 
r.Capacidad, 
COUNT(p.ID_Perro) AS Numero_De_Perros 
FROM Refugio r 
LEFT JOIN Perro p ON r.ID_Refugio = p.ID_Refugio 
GROUP BY r.ID_Refugio; 
