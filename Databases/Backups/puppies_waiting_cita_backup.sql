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
  `Estado` enum('Pendiente','Confirmada','Cancelada') COLLATE utf8mb4_general_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita`
--

LOCK TABLES `cita` WRITE;
/*!40000 ALTER TABLE `cita` DISABLE KEYS */;
INSERT INTO `cita` VALUES (11,'2024-08-29 16:50:00',5,5,5,'Cancelada',1),(12,'2024-09-22 14:30:00',3,5,5,'Cancelada',1),(13,'2024-08-24 16:00:00',1,4,24,'Confirmada',1),(14,'2024-08-23 11:56:00',24,1,23,'Confirmada',1),(15,'2024-08-23 11:38:00',24,4,26,'Confirmada',1);
/*!40000 ALTER TABLE `cita` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-22 23:40:56
