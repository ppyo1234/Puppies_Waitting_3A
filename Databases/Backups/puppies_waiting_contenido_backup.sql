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
-- Table structure for table `contenido`
--

DROP TABLE IF EXISTS `contenido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contenido` (
  `ID_Contenido` int NOT NULL AUTO_INCREMENT,
  `T铆tulo` varchar(255) NOT NULL,
  `Texto` text NOT NULL,
  `Imagen` longblob NOT NULL,
  `Fecha_Publicaci贸n` date NOT NULL,
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
INSERT INTO `contenido` VALUES (1,'C贸mo cuidar a un cachorro','Gu铆a completa sobre el cuidado de cachorros.','','2024-07-01',3,1,1),(2,'Vacunas esenciales para perros','Lista de vacunas que son esenciales para los perros.','','2024-07-05',4,2,2),(3,'La importancia de la esterilizaci贸n','Beneficios de esterilizar a tu mascota.','','2024-07-10',3,3,3),(4,'Consejos para el entrenamiento canino','Mejores pr谩cticas para entrenar a tu perro.','','2024-07-15',4,4,4),(5,'C贸mo elegir el mejor alimento para tu perro','Recomendaciones para la alimentaci贸n de tu perro.','','2024-07-20',3,5,5),(6,'Qu茅 hacer en caso de emergencia con tu perro','Pasos a seguir en situaciones de emergencia.','','2024-07-25',4,6,6),(7,'La salud dental en perros','C贸mo mantener los dientes de tu perro saludables.','','2024-08-01',3,7,7),(8,'C贸mo manejar la ansiedad en perros','T茅cnicas para reducir la ansiedad en tu mascota.','','2024-08-05',4,8,8),(9,'Importancia de las visitas regulares al veterinario','Por qu茅 debes llevar a tu perro al veterinario con regularidad.','','2024-08-10',3,9,9),(10,'Preparando a tu perro para la adopci贸n','Consejos para preparar a tu perro para ser adoptado.','','2024-08-15',4,10,10);
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
    SET NEW.Fecha_Publicaci = IFNULL(NEW.Fecha_Publicaci, CURDATE());
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

-- Dump completed on 2024-08-16 21:47:47
