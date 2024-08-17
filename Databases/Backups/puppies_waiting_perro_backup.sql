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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-16 21:47:48
