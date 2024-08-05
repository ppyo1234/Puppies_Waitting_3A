CREATE DEFINER=`root`@`localhost` TRIGGER `ActualizarFechaPublicacionAntesInsert` BEFORE INSERT ON `contenido` FOR EACH ROW BEGIN
    SET NEW.Fecha_Publicación = IFNULL(NEW.Fecha_Publicación, CURDATE());
END