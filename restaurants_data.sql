-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: restaurants
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `idclient` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` char(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idclient`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Laura','612612612','laura@gmail.com'),(2,'Maria','631631631','maria@gmail.com'),(3,'Maitane','688699688','maitane@gmail.com'),(4,'Ander','698698678','ander@hotmail.com'),(5,'Mikel','654678654','mikel12@gmail.com'),(6,'Malen','623688654','malen54@gmail.com'),(7,'Xuban','682987345','xuban98@hotmail.com');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_client` int NOT NULL,
  `fk_local` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_clients_has_locals_locals1_idx` (`fk_local`),
  KEY `fk_clients_has_locals_clients1_idx` (`fk_client`),
  CONSTRAINT `fk_clients_has_locals_clients1` FOREIGN KEY (`fk_client`) REFERENCES `clients` (`idclient`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_clients_has_locals_locals1` FOREIGN KEY (`fk_local`) REFERENCES `locals` (`idlocal`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (1,1,2),(2,1,4),(3,1,5),(4,1,7),(5,2,1),(6,2,4),(7,3,2),(8,4,5),(9,5,7),(10,5,3);
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locals`
--

DROP TABLE IF EXISTS `locals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locals` (
  `idlocal` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `direction` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` char(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_responsible` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `isOpen` tinyint NOT NULL,
  PRIMARY KEY (`idlocal`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  UNIQUE KEY `direction_UNIQUE` (`direction`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locals`
--

LOCK TABLES `locals` WRITE;
/*!40000 ALTER TABLE `locals` DISABLE KEYS */;
INSERT INTO `locals` VALUES (1,'Aizkora Taberna','Calle cuchilleria 66','945896754','Mikel Beltran',0),(2,'Ioar','Calle cuchilleria 36','945467485','Jesus Cano',1),(3,'Txapeldun','Calle cuchilleria 34','945789356','Iñigo Lopez',1),(4,'El siete','Calle cuchilleria 3','945272298','Ane Gartzia',1),(5,'Erkiaga','Calle herreria 38','94527 6808','Borja Roa',0),(6,'Perretxico','Calle san antonio 38','945637829','Miren Aramburu',1),(7,'Deportivo Alaves','Plaza virgen blanca 1','945163784','Mario Otxoa',1);
/*!40000 ALTER TABLE `locals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables`
--

DROP TABLE IF EXISTS `tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tables` (
  `idtable` int NOT NULL AUTO_INCREMENT,
  `number_table` int NOT NULL,
  `number_people` int NOT NULL,
  `isAvailable` tinyint NOT NULL,
  `date_booked` datetime DEFAULT NULL,
  `fk_local` int NOT NULL,
  `fk_client` int DEFAULT NULL,
  PRIMARY KEY (`idtable`),
  KEY `fk_tables_locals1_idx` (`fk_local`),
  KEY `fk_tables_clients1_idx` (`fk_client`),
  CONSTRAINT `fk_tables_clients1` FOREIGN KEY (`fk_client`) REFERENCES `clients` (`idclient`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_tables_locals1` FOREIGN KEY (`fk_local`) REFERENCES `locals` (`idlocal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables`
--

LOCK TABLES `tables` WRITE;
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
INSERT INTO `tables` VALUES (1,1,4,1,NULL,4,NULL),(2,2,6,0,'2022-09-21 00:00:00',4,1),(3,3,2,1,NULL,4,NULL),(4,1,4,1,NULL,5,NULL),(5,2,5,1,NULL,5,NULL),(6,3,4,1,NULL,5,NULL),(7,1,4,1,NULL,6,NULL),(8,2,2,1,NULL,6,NULL),(9,3,6,1,NULL,6,NULL),(10,4,3,0,'2022-09-25 00:00:00',7,5);
/*!40000 ALTER TABLE `tables` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-22 16:15:19
