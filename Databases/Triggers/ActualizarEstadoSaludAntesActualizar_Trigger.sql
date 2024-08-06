CREATE DEFINER=`root`@`localhost` TRIGGER `ActualizarEstadoSaludAntesActualizar` BEFORE UPDATE ON `perro` FOR EACH ROW BEGIN
    IF NEW.Estado_Salud != OLD.Estado_Salud THEN
        INSERT INTO Contenido (Título, Texto, Fecha_Publicación, ID_Blogger)
        VALUES (CONCAT('Actualización de salud del perro: ', OLD.Nombre), CONCAT('El estado de salud del perro ', OLD.Nombre, ' ha sido actualizado de ', OLD.Estado_Salud, ' a ', NEW.Estado_Salud), CURDATE(), NULL);
    END IF;
END