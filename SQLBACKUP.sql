-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: airbnbdantetabo
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `anfitrion`
--

DROP TABLE IF EXISTS `anfitrion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anfitrion` (
  `id_anfi` int NOT NULL AUTO_INCREMENT,
  `lastn_anfi` varchar(50) NOT NULL,
  `name_anfi` varchar(50) NOT NULL,
  `dni_anfi` varchar(15) NOT NULL,
  `mail_anfi` varchar(50) NOT NULL,
  `num_anfi` int NOT NULL,
  PRIMARY KEY (`id_anfi`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anfitrion`
--

LOCK TABLES `anfitrion` WRITE;
/*!40000 ALTER TABLE `anfitrion` DISABLE KEYS */;
INSERT INTO `anfitrion` VALUES (1,'Lopez','Josefina','18736322','lopezjosefina@gmail.com',11346782),(2,'Rodriguez','Lautaro','42361922','rodiguez009@gmail.com',11728591),(3,'Velazquez','Pablo','40333555','pablo_v@yahoo.com.ar',11349811),(4,'Furtado','Ludmila','22000675','furtado001@gmail.com',11990021),(5,'Gomez','Ernesto','17990756','ernesto@gmail.com',11443244),(6,'Tabo','Claudia','35674321','claudia_tabo@gmail.com',11189102),(7,'Greco','Agustin','31987678','agustin_08@hotmail.com',11774355),(8,'Valdez','Andrea','42135510','andreaandrea@gmail.com',11903354),(9,'Darin','Amalia','44559300','amaliad@gmail.com',11889922),(10,'Lopez','Nelida','22021671','lopeznelida@yahoo.com.ar',11523274),(11,'Guidotti','Mariano','40552688','marianog@gmail.com',11338802);
/*!40000 ALTER TABLE `anfitrion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `anfitrion_view`
--

DROP TABLE IF EXISTS `anfitrion_view`;
/*!50001 DROP VIEW IF EXISTS `anfitrion_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `anfitrion_view` AS SELECT 
 1 AS `lastn_anfi`,
 1 AS `name_anfi`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `calificacion`
--

DROP TABLE IF EXISTS `calificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calificacion` (
  `id_calif` int NOT NULL AUTO_INCREMENT,
  `id_hues` int NOT NULL,
  `id_prop` int NOT NULL,
  `calif` int NOT NULL,
  PRIMARY KEY (`id_calif`),
  KEY `id_hues` (`id_hues`),
  KEY `id_prop` (`id_prop`),
  CONSTRAINT `calificacion_ibfk_1` FOREIGN KEY (`id_hues`) REFERENCES `huesped` (`id_hues`),
  CONSTRAINT `calificacion_ibfk_2` FOREIGN KEY (`id_prop`) REFERENCES `propiedad` (`id_prop`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificacion`
--

LOCK TABLES `calificacion` WRITE;
/*!40000 ALTER TABLE `calificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `calificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `huesped`
--

DROP TABLE IF EXISTS `huesped`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `huesped` (
  `id_hues` int NOT NULL AUTO_INCREMENT,
  `lastn_hues` varchar(50) NOT NULL,
  `name_hues` varchar(50) NOT NULL,
  `dni_hues` varchar(15) NOT NULL,
  `mail_hues` varchar(50) NOT NULL,
  `num_hues` int NOT NULL,
  PRIMARY KEY (`id_hues`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huesped`
--

LOCK TABLES `huesped` WRITE;
/*!40000 ALTER TABLE `huesped` DISABLE KEYS */;
INSERT INTO `huesped` VALUES (1,'Gomez','Ernesto','42135510','Gomez.ernesto@gmail.com',11523274),(2,'Lopez','Claudia','44559300','Claudia.lopez@gmail.com',11346782),(3,'Rodriguez','Agustin','22021671','Agustin_rodriguez@yahoo.com.ar',11728591),(4,'Velazquez','Josefina','18736322','Jose.velaz@yahoo.com.ar',11889922),(5,'Furtado','Lautaro','42361922','lautaro_furtado@gmail.com',11349811),(6,'Darin','Pablo','40552688','Pablito.darin@gmail.com',11990021),(7,'Lopez','Ludmila','40333555','Ludmila.lo@hotmail.com',11443244),(8,'Guidotti','Andrea','22000675','Andrea01guidotti@gmail.com',11338802),(9,'Tabo','Amalia','17990756','Amalia.tabo@hotmail.com',11189102),(10,'Greco','Nelida','35674321','Greco_nelida@gmail.com',11774355),(11,'Valdez','Mariano','31987678','Valdezzmariano@gmail.com',11903354);
/*!40000 ALTER TABLE `huesped` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `huesped_view`
--

DROP TABLE IF EXISTS `huesped_view`;
/*!50001 DROP VIEW IF EXISTS `huesped_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `huesped_view` AS SELECT 
 1 AS `lastn_hues`,
 1 AS `name_hues`,
 1 AS `dni_hues`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `fech_pago` date NOT NULL,
  `monto_total` int NOT NULL,
  `id_hues` int NOT NULL,
  `id_reser` int NOT NULL,
  `id_prop` int NOT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `id_hues` (`id_hues`),
  KEY `id_reser` (`id_reser`),
  KEY `id_prop` (`id_prop`),
  CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`id_hues`) REFERENCES `huesped` (`id_hues`),
  CONSTRAINT `pago_ibfk_2` FOREIGN KEY (`id_reser`) REFERENCES `reserva` (`id_reser`),
  CONSTRAINT `pago_ibfk_3` FOREIGN KEY (`id_prop`) REFERENCES `propiedad` (`id_prop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propiedad`
--

DROP TABLE IF EXISTS `propiedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propiedad` (
  `id_prop` int NOT NULL AUTO_INCREMENT,
  `limit_hues` int NOT NULL,
  `direc_prop` varchar(100) DEFAULT NULL,
  `tipo_prop` varchar(20) DEFAULT NULL,
  `serv_prop` varchar(20) DEFAULT NULL,
  `prec_prop` int NOT NULL,
  `id_anfi` int NOT NULL,
  PRIMARY KEY (`id_prop`),
  KEY `id_anfi` (`id_anfi`),
  CONSTRAINT `propiedad_ibfk_1` FOREIGN KEY (`id_anfi`) REFERENCES `anfitrion` (`id_anfi`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedad`
--

LOCK TABLES `propiedad` WRITE;
/*!40000 ALTER TABLE `propiedad` DISABLE KEYS */;
INSERT INTO `propiedad` VALUES (11,4,'Diego gibson','Departamento','Estacionamiento',55000,1),(12,4,'Antartida argentina','Casa','Aire acondicionado',60000,2),(13,8,'Moldes','Casa','Jardin',120000,3),(14,3,'Lujan','Hotel','Wifi',76500,4),(15,5,'Luzuriaga','Casa','Cocina',34500,5),(16,6,'Pueyrredon','Casa','Acceso a la playa',12300,6),(17,3,'Bulevard Buenos Aires','Departamento','Wifi',54300,7),(18,2,'Ucrania','Hotel','Acceso a la playa',77000,8),(19,3,'Jose Hernandez','Casa de huespedes','Wifi',8000,9),(20,7,'Moldes','Casa','Estacionamiento',64770,10);
/*!40000 ALTER TABLE `propiedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva` (
  `id_reser` int NOT NULL AUTO_INCREMENT,
  `fech_reser_inicio` date NOT NULL,
  `fech_reser_fin` date NOT NULL,
  `cant_hues` int NOT NULL,
  `id_hues` int NOT NULL,
  `id_prop` int NOT NULL,
  `id_anfi` int NOT NULL,
  PRIMARY KEY (`id_reser`),
  KEY `id_hues` (`id_hues`),
  KEY `id_prop` (`id_prop`),
  KEY `id_anfi` (`id_anfi`),
  CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`id_hues`) REFERENCES `huesped` (`id_hues`),
  CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`id_prop`) REFERENCES `propiedad` (`id_prop`),
  CONSTRAINT `reserva_ibfk_3` FOREIGN KEY (`id_anfi`) REFERENCES `anfitrion` (`id_anfi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'airbnbdantetabo'
--

--
-- Dumping routines for database 'airbnbdantetabo'
--
/*!50003 DROP FUNCTION IF EXISTS `fullname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fullname`(
    id_hues_param INT
    ) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN 
        DECLARE fullname VARCHAR (100);
        SELECT name_hues || lastn_hues
        INTO fullname
        FROM huesped 
        WHERE id_hues = id_hues_param;
        RETURN fullname;
   END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `huespedDni` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `huespedDni`(p_id INT) RETURNS int
    DETERMINISTIC
BEGIN 
        DECLARE dni INT;
        SELECT dni_hues
        INTO dni
        FROM huesped 
        WHERE id_hues = p_dni;
        RETURN dni;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `huespedes_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `huespedes_sp`()
BEGIN
	SELECT * FROM huesped;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `anfitrion_view`
--

/*!50001 DROP VIEW IF EXISTS `anfitrion_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `anfitrion_view` AS select `anfitrion`.`lastn_anfi` AS `lastn_anfi`,`anfitrion`.`name_anfi` AS `name_anfi` from `anfitrion` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `huesped_view`
--

/*!50001 DROP VIEW IF EXISTS `huesped_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `huesped_view` AS select `huesped`.`lastn_hues` AS `lastn_hues`,`huesped`.`name_hues` AS `name_hues`,`huesped`.`dni_hues` AS `dni_hues` from `huesped` order by `huesped`.`lastn_hues` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-06 22:35:24
