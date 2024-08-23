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
  `Titulo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Texto` text COLLATE utf8mb4_general_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenido`
--

LOCK TABLES `contenido` WRITE;
/*!40000 ALTER TABLE `contenido` DISABLE KEYS */;
INSERT INTO `contenido` VALUES (1,'Cómo cuidar a un cachorro ','Cuidar a un cachorro requiere atención constante y dedicación para asegurar su desarrollo saludable y feliz. Es fundamental proporcionarle una dieta equilibrada adecuada para su edad, asegurándose de que reciba todas las vitaminas y nutrientes necesarios; además, debe tener acceso constante a agua fresca. Un programa de vacunación y desparasitación regular es esencial para protegerlo contra enfermedades y parásitos. El cachorro necesita un espacio seguro y cómodo para dormir, junto con una rutina de ejercicio diaria para mantenerlo activo y saludable. La socialización temprana con otras personas y animales, así como el entrenamiento básico, ayudan a desarrollar un comportamiento equilibrado. No menos importante es el amor y la paciencia, ya que el vínculo afectivo con su dueño es crucial para su bienestar emocional y su adaptación a su nuevo hogar.',_binary 'uploads/signos.jpg','2024-08-22',3,1,1),(2,'Vacunas esenciales para perros','Las vacunas esenciales para perros son fundamentales para proteger a los caninos de enfermedades graves y potencialmente mortales. Entre las más importantes se encuentran la vacuna contra el parvovirus, que previene una enfermedad altamente contagiosa y a menudo fatal que afecta el sistema digestivo; la vacuna contra el moquillo, que protege contra un virus que puede causar problemas respiratorios, gastrointestinales y neurológicos; y la vacuna contra la hepatitis infecciosa, que combate una enfermedad viral que afecta el hígado. Además, se recomienda la vacuna contra la leptospirosis, una enfermedad bacteriana que puede afectar tanto a animales como a humanos y que se transmite a través de la orina de animales infectados. Estas vacunas suelen administrarse en una serie de inyecciones durante el primer año de vida del cachorro, con refuerzos periódicos a lo largo de su vida para mantener una protección efectiva. Consultar con un veterinario es esencial para asegurar que el perro reciba las vacunas adecuadas y en el momento oportuno.',_binary 'uploads/2.jpeg','2024-07-05',4,2,2),(3,'La importancia de la esterilización','La esterilización de mascotas, tanto machos como hembras, es una práctica fundamental para promover la salud y el bienestar animal. Este procedimiento no solo previene la reproducción no deseada, reduciendo significativamente el número de animales abandonados y sin hogar, sino que también contribuye a la salud a largo plazo de los animales. En las hembras, la esterilización reduce el riesgo de cáncer de mama y elimina la posibilidad de infecciones uterinas y tumores ováricos. En los machos, ayuda a prevenir problemas como la hiperplasia prostática benigna y algunos tipos de cáncer testicular. Además, la esterilización puede disminuir comportamientos no deseados, como la agresividad y la marcación territorial, haciendo que los animales sean más fáciles de manejar en entornos domésticos. La esterilización es, por tanto, una medida responsable que no solo beneficia a las mascotas, sino que también contribuye a la reducción de la sobrepoblación animal y al bienestar general de la comunidad.',_binary 'uploads/signos.jpg','2024-08-22',3,3,3),(4,'Consejos para el entrenamiento canino','El entrenamiento canino es esencial para desarrollar una convivencia armoniosa entre perros y humanos, y es fundamental para el bienestar del animal. Para lograr un entrenamiento efectivo, es clave emplear técnicas de refuerzo positivo, recompensando comportamientos deseados con golosinas, elogios o juguetes, lo cual motiva al perro a repetir esos comportamientos. La paciencia y la consistencia son cruciales; las sesiones de entrenamiento deben ser breves pero frecuentes, evitando la frustración tanto para el perro como para el entrenador. Establecer comandos claros y mantener una rutina ayuda a que el perro entienda lo que se espera de él. Además, es importante adaptar el entrenamiento a la edad, raza y personalidad del perro para abordar sus necesidades específicas y asegurar un progreso constante. Incorporar socialización temprana y experiencias positivas con diferentes personas, animales y entornos también favorece el desarrollo de un comportamiento equilibrado y confiado. Con un enfoque cuidadoso y un compromiso constante, el entrenamiento canino no solo enseña habilidades prácticas, sino que también fortalece el vínculo entre el perro y su dueño.',_binary 'uploads/4.jpg','2024-07-15',4,4,4),(5,'Cómo elegir el mejor alimento para tu perro','Elegir el mejor alimento para tu perro es crucial para su salud y bienestar general. Es fundamental considerar la edad, tamaño, nivel de actividad y cualquier condición médica específica del perro al seleccionar su dieta. Optar por alimentos balanceados y de alta calidad, que cumplan con los estándares de nutrición establecidos por asociaciones veterinarias, garantiza que tu mascota reciba los nutrientes esenciales que necesita. Busca fórmulas que incluyan proteínas de alta calidad como carne o pescado, carbohidratos saludables como granos enteros o vegetales, y grasas saludables que proporcionen energía y apoyen la salud de la piel y el pelaje. Evita alimentos con altos niveles de subproductos, colorantes artificiales y conservantes, ya que estos pueden no ser beneficiosos para la salud a largo plazo. Consultar con un veterinario puede proporcionar recomendaciones personalizadas basadas en las necesidades específicas de tu perro y asegurar que el alimento elegido promueva una vida saludable y activa.',_binary 'uploads/comer.jpg','2024-08-22',3,5,5),(6,'Qué hacer en caso de emergencia con tu perro','En caso de un sismo, es crucial tener un plan de emergencia preparado para tu perro para garantizar su seguridad y bienestar. Primero, asegúrate de que tu mascota tenga un collar con una placa de identificación actualizada y, si es posible, un microchip registrado, para facilitar su recuperación en caso de separación. Durante el temblor, si estás en casa, mantén la calma y, si es seguro hacerlo, dirígete rápidamente a un área interior sin ventanas para proteger a tu perro de posibles caídas de escombros. Si estás fuera de casa, busca refugio en un lugar seguro y trata de contactar a alguien que pueda asistir a tu mascota. Después del sismo, revisa el área en busca de daños que puedan afectar a tu perro, como vidrios rotos o estructuras inestables. Proporciona a tu mascota un entorno tranquilo y seguro, y verifica si necesita atención veterinaria si muestra signos de estrés o lesiones. Mantén un kit de emergencia para mascotas con alimentos, agua, medicinas y otros suministros esenciales, y repasa regularmente tu plan de emergencia para estar preparado ante cualquier situación.',_binary 'uploads/6.jpeg','2024-07-25',4,6,6),(7,'La salud dental en perros','La salud dental en perros es esencial para su bienestar general y calidad de vida, ya que una boca sana contribuye a una mejor salud en todo el cuerpo. Los problemas dentales, como la acumulación de placa y sarro, pueden llevar a enfermedades periodontales, dolor, infecciones y pérdida de dientes, lo que afecta la capacidad del perro para comer y disfrutar de la vida. Para mantener una buena salud dental, es importante establecer una rutina de cuidado que incluya el cepillado regular de los dientes con una pasta dental específica para perros, así como ofrecerles juguetes y golosinas que ayuden a reducir la acumulación de placa. Las visitas periódicas al veterinario para chequeos dentales son cruciales para detectar y tratar problemas a tiempo. Además, una dieta equilibrada y adecuada puede apoyar la salud dental al reducir la formación de sarro. Prevenir y tratar las enfermedades dentales no solo mejora la salud oral de tu perro, sino que también puede evitar complicaciones más graves y costosas en el futuro.',_binary 'uploads/comer.jpg','2024-08-22',3,7,7),(11,'prueba','prueba',_binary 'uploads/signos.jpg','2024-08-22',3,NULL,NULL);
/*!40000 ALTER TABLE `contenido` ENABLE KEYS */;
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
