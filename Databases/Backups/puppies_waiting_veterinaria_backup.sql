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
-- Table structure for table `veterinaria`
--

DROP TABLE IF EXISTS `veterinaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veterinaria` (
  `ID_Veterinaria` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Dirección` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Teléfono` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `Email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Especialidad` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `Horario_Atención` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ID_Administrador` int DEFAULT NULL,
  PRIMARY KEY (`ID_Veterinaria`),
  UNIQUE KEY `Email` (`Email`),
  KEY `veterinaria_ibfk_1_idx` (`ID_Administrador`),
  CONSTRAINT `veterinaria_ibfk_1` FOREIGN KEY (`ID_Administrador`) REFERENCES `usuario` (`ID_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veterinaria`
--

LOCK TABLES `veterinaria` WRITE;
/*!40000 ALTER TABLE `veterinaria` DISABLE KEYS */;
INSERT INTO `veterinaria` VALUES (1,'Veterinaria A','Calle 10, Ciudad','555-1111','vetA@example.com','Cirugía','9am - 5pm',1),(2,'Veterinaria B','Avenida 20, Ciudad','555-2222','vetB@example.com','Medicina General','10am - 6pm',2),(3,'Veterinaria C','Calle 30, Ciudad','555-3333','vetC@example.com','Dermatología','8am - 4pm',1),(4,'Veterinaria D','Avenida 40, Ciudad','555-4444','vetD@example.com','Cirugía','11am - 7pm',2),(5,'Veterinaria E','Calle 50, Ciudad','555-5555','vetE@example.com','Medicina General','9am - 5pm',1),(6,'Veterinaria F','Avenida 60, Ciudad','555-6666','vetF@example.com','Dermatología','10am - 6pm',2),(7,'Veterinaria G','Calle 70, Ciudad','555-7777','vetG@example.com','Cirugía','8am - 4pm',1),(8,'Veterinaria H','Avenida 80, Ciudad','555-8888','vetH@example.com','Medicina General','11am - 7pm',2);
/*!40000 ALTER TABLE `veterinaria` ENABLE KEYS */;
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
