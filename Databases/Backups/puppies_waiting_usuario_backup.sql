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
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `ID_Usuario` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Apellido_Paterno` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Apellido_Materno` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Dirección` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Teléfono` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `Email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `contrasena` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `Rol` enum('Usuario','Administrador','Blogger') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Fecha_Registro` date NOT NULL,
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `ID_Usuario_Adoptante_UNIQUE` (`ID_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Daniel','Garcia','Pluma','Calle Bocanegra 8','5551967835','daniel.garcia@example.com','admin','Administrador','2024-01-01'),(2,'Dulce','Salvador','Antonio','Avenida Siempre Viva 742','555-0002','dulce.salvador@example.com','admin','Administrador','2024-01-10'),(3,'Arturo','García','Gonzalez','Calle Real 456','555-0003','arturo.garcia@example.com','123','Blogger','2024-02-01'),(4,'Sayurid','Bautista','Cruz','Avenida Libertad 789','555-0004','sayurid.bautista@example.com','123','Blogger','2024-02-15'),(5,'Luis','Rodríguez','Torres','Calle de la Paz 123','555-0005','luis.rodriguez@example.com','123','Usuario','2024-03-01'),(22,'jose arturo','ad','garcia','xicotepec','7641320224','ppyo@gamil.com','123','Usuario','2022-08-24'),(23,'José Luis','Cazarez','Vargas','Fuerte de San Juan 145','7647655934','Jcazarezvargas@gmail.com','123','Usuario','2022-08-24'),(24,'Daniela','Lopez','Neri','venustiano carranza','7641029432','dl7996409@gmail.com','12345','Usuario','2022-08-24'),(25,'Carlos','pazos','cruz','Privada Boca Negra #8','7641235117','carlos@gmail.com','1234','Usuario','2022-08-24'),(26,'JOan Saa','Salas','Vera','Reforma','34535435','joan@utxj','12345','Usuario','2022-08-24');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
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
