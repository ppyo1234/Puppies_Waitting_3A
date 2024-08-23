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
-- Table structure for table `refugio`
--

DROP TABLE IF EXISTS `refugio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refugio` (
  `ID_Refugio` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Dirección` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Teléfono` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `Email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Capacidad` int NOT NULL,
  `Horario_Atención` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ID_Administrador` int DEFAULT NULL,
  PRIMARY KEY (`ID_Refugio`),
  UNIQUE KEY `Email` (`Email`),
  KEY `refugio_ibfk_1_idx` (`ID_Administrador`),
  CONSTRAINT `refugio_ibfk_1` FOREIGN KEY (`ID_Administrador`) REFERENCES `usuario` (`ID_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refugio`
--

LOCK TABLES `refugio` WRITE;
/*!40000 ALTER TABLE `refugio` DISABLE KEYS */;
INSERT INTO `refugio` VALUES (1,'Refugio Canino A','Calle 123, Ciudad','555-1234','refugioA@example.com',50,'9am - 5pm',1),(2,'Refugio Canino B','Avenida 456, Ciudad','555-5678','refugioB@example.com',30,'10am - 6pm',2),(3,'Refugio Canino C','Calle 789, Ciudad','555-8765','refugioC@example.com',40,'8am - 4pm',1),(4,'Refugio Canino D','Avenida 101, Ciudad','555-4321','refugioD@example.com',20,'11am - 7pm',2),(5,'Refugio Canino E','Calle 202, Ciudad','555-6789','refugioE@example.com',25,'9am - 5pm',1),(6,'Refugio Canino F','Avenida 303, Ciudad','555-9876','refugioF@example.com',35,'10am - 6pm',2),(7,'Refugio Canino G','Calle 404, Ciudad','555-6543','refugioG@example.com',45,'8am - 4pm',1),(8,'Refugio Canino H','Avenida 505, Ciudad','555-3210','refugioH@example.com',30,'11am - 7pm',2),(9,'Refugio Canino I','Calle 606, Ciudad','555-5432','refugioI@example.com',20,'9am - 5pm',1),(10,'Refugio Canino J','Avenida 707, Ciudad','555-2109','refugioJ@example.com',25,'10am - 6pm',2);
/*!40000 ALTER TABLE `refugio` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-22 23:40:57
