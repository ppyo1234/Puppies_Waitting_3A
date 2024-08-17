CREATE DATABASE  IF NOT EXISTS `puppies_waiting` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `puppies_waiting`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: puppies_waiting
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cita`
--

DROP TABLE IF EXISTS `cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cita` (
  `ID_Cita` int NOT NULL AUTO_INCREMENT,
  `Fecha_Hora` datetime NOT NULL,
  `ID_Perro` int DEFAULT NULL,
  `ID_Veterinaria` int DEFAULT NULL,
  `ID_Usuario_Adoptante` int DEFAULT NULL,
  `Estado` enum('Pendiente','Confirmada','Cancelada') NOT NULL,
  `ID_Administrador` int DEFAULT NULL,
  PRIMARY KEY (`ID_Cita`),
  KEY `ID_Perro` (`ID_Perro`),
  KEY `ID_Veterinaria` (`ID_Veterinaria`),
  KEY `ID_Usuario_Adoptante` (`ID_Usuario_Adoptante`),
  KEY `cita_ibfk_4` (`ID_Administrador`),
  CONSTRAINT `cita_ibfk_1` FOREIGN KEY (`ID_Perro`) REFERENCES `perro` (`ID_Perro`),
  CONSTRAINT `cita_ibfk_2` FOREIGN KEY (`ID_Veterinaria`) REFERENCES `veterinaria` (`ID_Veterinaria`),
  CONSTRAINT `cita_ibfk_3` FOREIGN KEY (`ID_Usuario_Adoptante`) REFERENCES `usuario` (`ID_Usuario`),
  CONSTRAINT `cita_ibfk_4` FOREIGN KEY (`ID_Administrador`) REFERENCES `usuario` (`ID_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita`
--

LOCK TABLES `cita` WRITE;
/*!40000 ALTER TABLE `cita` DISABLE KEYS */;
INSERT INTO `cita` VALUES (1,'2024-08-01 10:00:00',1,1,5,'Pendiente',1),(2,'2024-08-02 11:00:00',2,2,4,'Pendiente',2),(3,'2024-08-03 09:00:00',3,3,9,'Pendiente',1),(4,'2024-08-04 15:00:00',4,4,7,'Pendiente',2),(5,'2024-08-05 13:00:00',5,5,5,'Pendiente',1),(6,'2024-08-06 14:00:00',6,6,6,'Pendiente',2),(7,'2024-08-07 16:00:00',7,7,7,'Pendiente',1),(8,'2024-08-08 12:00:00',8,8,8,'Pendiente',2),(9,'2024-08-09 17:00:00',9,9,9,'Pendiente',1),(10,'2024-08-10 18:00:00',10,10,10,'Pendiente',2);
/*!40000 ALTER TABLE `cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenido`
--

DROP TABLE IF EXISTS `contenido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contenido` (
  `ID_Contenido` int NOT NULL AUTO_INCREMENT,
  `Título` varchar(255) NOT NULL,
  `Texto` text NOT NULL,
  `Imagen` longblob NOT NULL,
  `Fecha_Publicación` date NOT NULL,
  `ID_Blogger` int DEFAULT NULL,
  `ID_Veterinaria` int DEFAULT NULL,
  `ID_Refugio` int DEFAULT NULL,
  PRIMARY KEY (`ID_Contenido`),
  KEY `ID_Veterinaria` (`ID_Veterinaria`),
  KEY `ID_Refugio` (`ID_Refugio`),
  KEY `contenido_ibfk_1_idx` (`ID_Blogger`),
  CONSTRAINT `contenido_ibfk_1` FOREIGN KEY (`ID_Blogger`) REFERENCES `usuario` (`ID_Usuario`),
  CONSTRAINT `contenido_ibfk_2` FOREIGN KEY (`ID_Veterinaria`) REFERENCES `veterinaria` (`ID_Veterinaria`),
  CONSTRAINT `contenido_ibfk_3` FOREIGN KEY (`ID_Refugio`) REFERENCES `refugio` (`ID_Refugio`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenido`
--

LOCK TABLES `contenido` WRITE;
/*!40000 ALTER TABLE `contenido` DISABLE KEYS */;
INSERT INTO `contenido` VALUES (1,'Cómo cuidar a un cachorro','Guía completa sobre el cuidado de cachorros.','','2024-07-01',3,1,1),(2,'Vacunas esenciales para perros','Lista de vacunas que son esenciales para los perros.','','2024-07-05',4,2,2),(3,'La importancia de la esterilización','Beneficios de esterilizar a tu mascota.','','2024-07-10',3,3,3),(4,'Consejos para el entrenamiento canino','Mejores prácticas para entrenar a tu perro.','','2024-07-15',4,4,4),(5,'Cómo elegir el mejor alimento para tu perro','Recomendaciones para la alimentación de tu perro.','','2024-07-20',3,5,5),(6,'Qué hacer en caso de emergencia con tu perro','Pasos a seguir en situaciones de emergencia.','','2024-07-25',4,6,6),(7,'La salud dental en perros','Cómo mantener los dientes de tu perro saludables.','','2024-08-01',3,7,7),(8,'Cómo manejar la ansiedad en perros','Técnicas para reducir la ansiedad en tu mascota.','','2024-08-05',4,8,8),(9,'Importancia de las visitas regulares al veterinario','Por qué debes llevar a tu perro al veterinario con regularidad.','','2024-08-10',3,9,9),(10,'Preparando a tu perro para la adopción','Consejos para preparar a tu perro para ser adoptado.','','2024-08-15',4,10,10);
/*!40000 ALTER TABLE `contenido` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ActualizarFechaPublicacionAntesInsert` BEFORE INSERT ON `contenido` FOR EACH ROW BEGIN
    SET NEW.Fecha_Publicaci�n = IFNULL(NEW.Fecha_Publicaci�n, CURDATE());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `perro`
--

DROP TABLE IF EXISTS `perro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perro` (
  `ID_Perro` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Edad` int NOT NULL,
  `Tamaño` enum('Pequeño','Mediano','Grande') NOT NULL,
  `Raza` enum('Sin Raza','Pastor Alemán','Pitbull','Gran Danés','Dálmata') NOT NULL,
  `Imagen` longblob NOT NULL,
  `Estado_Salud` enum('Bueno','Regular','Malo') NOT NULL,
  `Fecha_Ingreso` date NOT NULL,
  `ID_Refugio` int DEFAULT NULL,
  PRIMARY KEY (`ID_Perro`),
  KEY `ID_Refugio` (`ID_Refugio`),
  CONSTRAINT `perro_ibfk_1` FOREIGN KEY (`ID_Refugio`) REFERENCES `refugio` (`ID_Refugio`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perro`
--

LOCK TABLES `perro` WRITE;
/*!40000 ALTER TABLE `perro` DISABLE KEYS */;
INSERT INTO `perro` VALUES (1,'Rex',5,'Grande','Sin Raza','','Bueno','2024-07-01',1),(2,'Bella',3,'Mediano','Pitbull','','Regular','2024-07-05',2),(3,'Luna',2,'Pequeño','Sin Raza','','Bueno','2024-07-10',3),(4,'Max',4,'Grande','Gran Danés','','Malo','2024-07-15',4),(5,'Charlie',1,'Pequeño','Sin Raza','','Bueno','2024-07-20',5),(6,'Daisy',6,'Mediano','Pastor Alemán','','Regular','2024-07-25',6),(7,'Rocky',3,'Grande','Sin Raza','','Bueno','2024-08-01',7),(8,'Molly',4,'Pequeño','Sin Raza','','Bueno','2024-08-05',8),(9,'Buddy',2,'Mediano','Pitbull','','Regular','2024-08-10',9),(10,'Sadie',7,'Pequeño','Dálmata','','Bueno','2024-08-15',10),(11,'Oliver',5,'Grande','Sin Raza','','Bueno','2024-08-20',1),(12,'Chloe',3,'Mediano','Pitbull','','Malo','2024-08-25',2),(13,'Coco',4,'Pequeño','Pastor Alemán','','Bueno','2024-09-01',3),(14,'Buster',2,'Grande','Sin Raza','','Regular','2024-09-05',4),(15,'Penny',6,'Mediano','Pitbull','','Bueno','2024-09-10',5),(16,'Toby',1,'Pequeño','Sin Raza','','Bueno','2024-09-15',6),(17,'Sophie',5,'Mediano','Pastor Alemán','','Bueno','2024-09-20',7),(18,'Jack',3,'Grande','Sin Raza','','Malo','2024-09-25',8),(19,'Lucy',4,'Pequeño','Sin Raza','','Regular','2024-10-01',9),(20,'Henry',2,'Mediano','Gran Danés','','Bueno','2024-10-05',10);
/*!40000 ALTER TABLE `perro` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ActualizarEstadoSaludAntesActualizar` BEFORE UPDATE ON `perro` FOR EACH ROW BEGIN
    IF NEW.Estado_Salud != OLD.Estado_Salud THEN
        INSERT INTO Contenido (T�tulo, Texto, Fecha_Publicaci�n, ID_Blogger)
        VALUES (CONCAT('Actualizaci�n de salud del perro: ', OLD.Nombre), CONCAT('El estado de salud del perro ', OLD.Nombre, ' ha sido actualizado de ', OLD.Estado_Salud, ' a ', NEW.Estado_Salud), CURDATE(), NULL);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `refugio`
--

DROP TABLE IF EXISTS `refugio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refugio` (
  `ID_Refugio` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Dirección` varchar(255) NOT NULL,
  `Teléfono` varchar(20) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Capacidad` int NOT NULL,
  `Horario_Atención` varchar(100) DEFAULT NULL,
  `ID_Administrador` int DEFAULT NULL,
  PRIMARY KEY (`ID_Refugio`),
  UNIQUE KEY `Email` (`Email`),
  KEY `refugio_ibfk_1_idx` (`ID_Administrador`),
  CONSTRAINT `refugio_ibfk_1` FOREIGN KEY (`ID_Administrador`) REFERENCES `usuario` (`ID_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refugio`
--

LOCK TABLES `refugio` WRITE;
/*!40000 ALTER TABLE `refugio` DISABLE KEYS */;
INSERT INTO `refugio` VALUES (1,'Refugio Canino A','Calle 123, Ciudad','555-1234','refugioA@example.com',50,'9am - 5pm',1),(2,'Refugio Canino B','Avenida 456, Ciudad','555-5678','refugioB@example.com',30,'10am - 6pm',2),(3,'Refugio Canino C','Calle 789, Ciudad','555-8765','refugioC@example.com',40,'8am - 4pm',1),(4,'Refugio Canino D','Avenida 101, Ciudad','555-4321','refugioD@example.com',20,'11am - 7pm',2),(5,'Refugio Canino E','Calle 202, Ciudad','555-6789','refugioE@example.com',25,'9am - 5pm',1),(6,'Refugio Canino F','Avenida 303, Ciudad','555-9876','refugioF@example.com',35,'10am - 6pm',2),(7,'Refugio Canino G','Calle 404, Ciudad','555-6543','refugioG@example.com',45,'8am - 4pm',1),(8,'Refugio Canino H','Avenida 505, Ciudad','555-3210','refugioH@example.com',30,'11am - 7pm',2),(9,'Refugio Canino I','Calle 606, Ciudad','555-5432','refugioI@example.com',20,'9am - 5pm',1),(10,'Refugio Canino J','Avenida 707, Ciudad','555-2109','refugioJ@example.com',25,'10am - 6pm',2);
/*!40000 ALTER TABLE `refugio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `ID_Usuario` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Apellido_Paterno` varchar(100) NOT NULL,
  `Apellido_Materno` varchar(100) NOT NULL,
  `Dirección` varchar(255) NOT NULL,
  `Teléfono` varchar(20) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Rol` enum('Usuario','Administrador','Blogger') DEFAULT NULL,
  `Fecha_Registro` date NOT NULL,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `ID_Usuario_Adoptante_UNIQUE` (`ID_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Daniel','Garcia','Pluma','Calle Bocanegra 8','5551967835','daniel.garcia@example.com','Administrador','2024-01-01'),(2,'Dukce','Salvador','Antonio','Avenida Siempre Viva 742','555-0002','dulce.salvador@example.com','Administrador','2024-01-10'),(3,'Arturo','García','Gonzalez','Calle Real 456','555-0003','arturo.garcia@example.com','Blogger','2024-02-01'),(4,'Sayurid','Bautista','Cruz','Avenida Libertad 789','555-0004','sayurid.@ebautistaxample.com','Blogger','2024-02-15'),(5,'Luis','Rodríguez','Torres','Calle de la Paz 123','555-0005','luis.rodriguez@example.com','Usuario','2024-03-01'),(6,'Claudia','Mora','Cordero','Avenida Unión 456','555-0006','claudia.mora@example.com','Usuario','2024-03-10'),(7,'Carlos','Hernández','Ramírez','Calle de los Sueños 789','555-0007','carlos.hernandez@example.com','Usuario','2024-04-01'),(8,'Sofía','Sánchez','Ríos','Avenida Esperanza 123','555-0008','sofia.sanchez@example.com','Usuario','2024-04-15'),(9,'Jorge','González','Ramos','Calle del Mar 456','555-0009','jorge.gonzalez@example.com','Usuario','2024-05-01'),(10,'Laura','Paredes','Salinas','Avenida de los Pinos 789','555-0010','laura.paredes@example.com','Usuario','2024-05-15');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veterinaria`
--

DROP TABLE IF EXISTS `veterinaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veterinaria` (
  `ID_Veterinaria` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Dirección` varchar(255) NOT NULL,
  `Teléfono` varchar(20) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Especialidad` enum('Cirugía','Medicina General','Dermatología') NOT NULL,
  `Horario_Atención` varchar(100) DEFAULT NULL,
  `ID_Administrador` int DEFAULT NULL,
  PRIMARY KEY (`ID_Veterinaria`),
  UNIQUE KEY `Email` (`Email`),
  KEY `veterinaria_ibfk_1_idx` (`ID_Administrador`),
  CONSTRAINT `veterinaria_ibfk_1` FOREIGN KEY (`ID_Administrador`) REFERENCES `usuario` (`ID_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veterinaria`
--

LOCK TABLES `veterinaria` WRITE;
/*!40000 ALTER TABLE `veterinaria` DISABLE KEYS */;
INSERT INTO `veterinaria` VALUES (1,'Veterinaria A','Calle 10, Ciudad','555-1111','vetA@example.com','Cirugía','9am - 5pm',1),(2,'Veterinaria B','Avenida 20, Ciudad','555-2222','vetB@example.com','Medicina General','10am - 6pm',2),(3,'Veterinaria C','Calle 30, Ciudad','555-3333','vetC@example.com','Dermatología','8am - 4pm',1),(4,'Veterinaria D','Avenida 40, Ciudad','555-4444','vetD@example.com','Cirugía','11am - 7pm',2),(5,'Veterinaria E','Calle 50, Ciudad','555-5555','vetE@example.com','Medicina General','9am - 5pm',1),(6,'Veterinaria F','Avenida 60, Ciudad','555-6666','vetF@example.com','Dermatología','10am - 6pm',2),(7,'Veterinaria G','Calle 70, Ciudad','555-7777','vetG@example.com','Cirugía','8am - 4pm',1),(8,'Veterinaria H','Avenida 80, Ciudad','555-8888','vetH@example.com','Medicina General','11am - 7pm',2),(9,'Veterinaria I','Calle 90, Ciudad','555-9999','vetI@example.com','Dermatología','9am - 5pm',1),(10,'Veterinaria J','Avenida 100, Ciudad','555-0000','vetJ@example.com','Cirugía','10am - 6pm',2);
/*!40000 ALTER TABLE `veterinaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'puppies_waiting'
--

--
-- Dumping routines for database 'puppies_waiting'
--
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarAdministrador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarAdministrador`(
    IN p_id_administrador INT,
    IN p_nombre VARCHAR(100),
    IN p_apellido_paterno VARCHAR(100),
    IN p_apellido_materno VARCHAR(100),
    IN p_usuario VARCHAR(50),
    IN p_contrase�a VARCHAR(255),
    IN p_email VARCHAR(100)
)
BEGIN
    UPDATE Administrador
    SET Nombre = p_nombre, Apellido_Paterno = p_apellido_paterno, Apellido_Materno = p_apellido_materno, Usuario = p_usuario, Contrase�a = p_contrase�a, Email = p_email
    WHERE ID_Administrador = p_id_administrador;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarBlogger` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarBlogger`(
    IN p_id_blogger INT,
    IN p_nombre VARCHAR(100),
    IN p_apellido_paterno VARCHAR(100),
    IN p_apellido_materno VARCHAR(100),
    IN p_usuario VARCHAR(50),
    IN p_contrase�a VARCHAR(255),
    IN p_email VARCHAR(100),
    IN p_fecha_registro DATE
)
BEGIN
    UPDATE Blogger
    SET Nombre = p_nombre, Apellido_Paterno = p_apellido_paterno, Apellido_Materno = p_apellido_materno, Usuario = p_usuario, Contrase�a = p_contrase�a, Email = p_email, Fecha_Registro = p_fecha_registro
    WHERE ID_Blogger = p_id_blogger;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarCita` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarCita`(
    IN p_id_cita INT,
    IN p_fecha_hora DATETIME,
    IN p_id_perro INT,
    IN p_id_veterinaria INT,
    IN p_id_usuario_adoptante INT,
    IN p_estado ENUM('Pendiente', 'Confirmada', 'Cancelada'),
    IN p_id_administrador INT
)
BEGIN
    UPDATE Cita
    SET Fecha_Hora = p_fecha_hora, ID_Perro = p_id_perro, ID_Veterinaria = p_id_veterinaria, ID_Usuario_Adoptante = p_id_usuario_adoptante, Estado = p_estado, ID_Administrador = p_id_administrador
    WHERE ID_Cita = p_id_cita;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarContenido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarContenido`(
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
    SET T�tulo = p_titulo, Texto = p_texto, Fecha_Publicaci�n = p_fecha_publicacion, ID_Blogger = p_id_blogger, ID_Veterinaria = p_id_veterinaria, ID_Refugio = p_id_refugio
    WHERE ID_Contenido = p_id_contenido;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarPerro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarPerro`(
    IN p_id_perro INT,
    IN p_nombre VARCHAR(100),
    IN p_edad INT,
    IN p_tamano ENUM('Peque�o', 'Mediano', 'Grande'),
    IN p_raza ENUM('Pastor Alem�n', 'Pitbull', 'Gran Dan�s', 'D�lmata'),
    IN p_estado_salud ENUM('Bueno', 'Regular', 'Malo'),
    IN p_fecha_ingreso DATE,
    IN p_id_refugio INT
)
BEGIN
    UPDATE Perro
    SET Nombre = p_nombre, Edad = p_edad, Tama�o = p_tamano, Raza = p_raza, Estado_Salud = p_estado_salud, Fecha_Ingreso = p_fecha_ingreso, ID_Refugio = p_id_refugio
    WHERE ID_Perro = p_id_perro;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarRefugio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarRefugio`(
    IN p_id_refugio INT,
    IN p_nombre VARCHAR(100),
    IN p_direccion VARCHAR(255),
    IN p_telefono VARCHAR(20),
    IN p_email VARCHAR(100),
    IN p_capacidad INT,
    IN p_horario_atencion VARCHAR(100),
    IN p_id_administrador INT
)
BEGIN
    UPDATE Refugio
    SET Nombre = p_nombre, Direcci�n = p_direccion, Tel�fono = p_telefono, Email = p_email, Capacidad = p_capacidad, Horario_Atenci�n = p_horario_atencion, ID_Administrador = p_id_administrador
    WHERE ID_Refugio = p_id_refugio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarUsuarioAdoptante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarUsuarioAdoptante`(
    IN p_id_usuario_adoptante INT,
    IN p_nombre VARCHAR(100),
    IN p_apellido_paterno VARCHAR(100),
    IN p_apellido_materno VARCHAR(100),
    IN p_direccion VARCHAR(255),
    IN p_telefono VARCHAR(20),
    IN p_email VARCHAR(100),
    IN p_fecha_registro DATE
)
BEGIN
    UPDATE Usuario_Adoptante
    SET Nombre = p_nombre, Apellido_Paterno = p_apellido_paterno, Apellido_Materno = p_apellido_materno, Direcci�n = p_direccion, Tel�fono = p_telefono, Email = p_email, Fecha_Registro = p_fecha_registro
    WHERE ID_Usuario_Adoptante = p_id_usuario_adoptante;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarUsuarioVisitante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarUsuarioVisitante`(
    IN p_id_usuario_visitante INT,
    IN p_nombre VARCHAR(100)
)
BEGIN
    UPDATE Usuario_Visitante
    SET Nombre = p_nombre
    WHERE ID_Usuario_Visitante = p_id_usuario_visitante;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarVeterinaria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarVeterinaria`(
    IN p_id_veterinaria INT,
    IN p_nombre VARCHAR(100),
    IN p_direccion VARCHAR(255),
    IN p_telefono VARCHAR(20),
    IN p_email VARCHAR(100),
    IN p_especialidad ENUM('Cirug�a', 'Medicina General', 'Dermatolog�a'),
    IN p_horario_atencion VARCHAR(100),
    IN p_id_administrador INT
)
BEGIN
    UPDATE Veterinaria
    SET Nombre = p_nombre, Direcci�n = p_direccion, Tel�fono = p_telefono, Email = p_email, Especialidad = p_especialidad, Horario_Atenci�n = p_horario_atencion, ID_Administrador = p_id_administrador
    WHERE ID_Veterinaria = p_id_veterinaria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarAdministrador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarAdministrador`(
    IN p_nombre VARCHAR(100),
    IN p_apellido_paterno VARCHAR(100),
    IN p_apellido_materno VARCHAR(100),
    IN p_usuario VARCHAR(50),
    IN p_contrase�a VARCHAR(255),
    IN p_email VARCHAR(100)
)
BEGIN
    INSERT INTO Administrador (Nombre, Apellido_Paterno, Apellido_Materno, Usuario, Contrase�a, Email)
    VALUES (p_nombre, p_apellido_paterno, p_apellido_materno, p_usuario, p_contrase�a, p_email);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarBlogger` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarBlogger`(
    IN p_nombre VARCHAR(100),
    IN p_apellido_paterno VARCHAR(100),
    IN p_apellido_materno VARCHAR(100),
    IN p_usuario VARCHAR(50),
    IN p_contrase�a VARCHAR(255),
    IN p_email VARCHAR(100),
    IN p_fecha_registro DATE
)
BEGIN
    INSERT INTO Blogger (Nombre, Apellido_Paterno, Apellido_Materno, Usuario, Contrase�a, Email, Fecha_Registro)
    VALUES (p_nombre, p_apellido_paterno, p_apellido_materno, p_usuario, p_contrase�a, p_email, p_fecha_registro);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarCita` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarCita`(
    IN p_fecha_hora DATETIME,
    IN p_id_perro INT,
    IN p_id_veterinaria INT,
    IN p_id_usuario_adoptante INT,
    IN p_estado ENUM('Pendiente', 'Confirmada', 'Cancelada'),
    IN p_id_administrador INT
)
BEGIN
    INSERT INTO Cita (Fecha_Hora, ID_Perro, ID_Veterinaria, ID_Usuario_Adoptante, Estado, ID_Administrador)
    VALUES (p_fecha_hora, p_id_perro, p_id_veterinaria, p_id_usuario_adoptante, p_estado, p_id_administrador);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarContenido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarContenido`(
    IN p_titulo VARCHAR(255),
    IN p_texto TEXT,
    IN p_fecha_publicacion DATE,
    IN p_id_blogger INT,
    IN p_id_veterinaria INT,
    IN p_id_refugio INT
)
BEGIN
    INSERT INTO Contenido (T�tulo, Texto, Fecha_Publicaci�n, ID_Blogger, ID_Veterinaria, ID_Refugio)
    VALUES (p_titulo, p_texto, p_fecha_publicacion, p_id_blogger, p_id_veterinaria, p_id_refugio);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarPerro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarPerro`(
    IN p_nombre VARCHAR(100),
    IN p_edad INT,
    IN p_tamano ENUM('Peque�o', 'Mediano', 'Grande'),
    IN p_raza ENUM('Pastor Alem�n', 'Pitbull', 'Gran Dan�s', 'D�lmata'),
    IN p_estado_salud ENUM('Bueno', 'Regular', 'Malo'),
    IN p_fecha_ingreso DATE,
    IN p_id_refugio INT
)
BEGIN
    INSERT INTO Perro (Nombre, Edad, Tama�o, Raza, Estado_Salud, Fecha_Ingreso, ID_Refugio)
    VALUES (p_nombre, p_edad, p_tamano, p_raza, p_estado_salud, p_fecha_ingreso, p_id_refugio);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarRefugio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarRefugio`(
    IN p_nombre VARCHAR(100),
    IN p_direccion VARCHAR(255),
    IN p_telefono VARCHAR(20),
    IN p_email VARCHAR(100),
    IN p_capacidad INT,
    IN p_horario_atencion VARCHAR(100),
    IN p_id_administrador INT
)
BEGIN
    INSERT INTO Refugio (Nombre, Direcci�n, Tel�fono, Email, Capacidad, Horario_Atenci�n, ID_Administrador)
    VALUES (p_nombre, p_direccion, p_telefono, p_email, p_capacidad, p_horario_atencion, p_id_administrador);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarUsuarioAdoptante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarUsuarioAdoptante`(
    IN p_nombre VARCHAR(100),
    IN p_apellido_paterno VARCHAR(100),
    IN p_apellido_materno VARCHAR(100),
    IN p_direccion VARCHAR(255),
    IN p_telefono VARCHAR(20),
    IN p_email VARCHAR(100),
    IN p_fecha_registro DATE
)
BEGIN
    INSERT INTO Usuario_Adoptante (Nombre, Apellido_Paterno, Apellido_Materno, Direcci�n, Tel�fono, Email, Fecha_Registro)
    VALUES (p_nombre, p_apellido_paterno, p_apellido_materno, p_direccion, p_telefono, p_email, p_fecha_registro);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarUsuarioVisitante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarUsuarioVisitante`(
    IN p_nombre VARCHAR(100)
)
BEGIN
    INSERT INTO Usuario_Visitante (Nombre)
    VALUES (p_nombre);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarVeterinaria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarVeterinaria`(
    IN p_nombre VARCHAR(100),
    IN p_direccion VARCHAR(255),
    IN p_telefono VARCHAR(20),
    IN p_email VARCHAR(100),
    IN p_especialidad ENUM('Cirug�a', 'Medicina General', 'Dermatolog�a'),
    IN p_horario_atencion VARCHAR(100),
    IN p_id_administrador INT
)
BEGIN
    INSERT INTO Veterinaria (Nombre, Direcci�n, Tel�fono, Email, Especialidad, Horario_Atenci�n, ID_Administrador)
    VALUES (p_nombre, p_direccion, p_telefono, p_email, p_especialidad, p_horario_atencion, p_id_administrador);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-16 20:49:31
