DROP DATABASE IF EXISTS mysql_rest_sql_docker ;
CREATE DATABASE mysql_rest_sql_docker;

USE mysql_rest_sql_docker;

-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 82.180.44.110    Database: stratos_dev
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.8-MariaDB-log

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


DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_code_companies` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES 
(1,'PAD','DIGITS & Co.','best agency all around','2024-03-12 09:07:02','2024-03-26 12:38:19'),
(2,'PAC','Pac-Man Ltd','we made best videogames','2024-03-12 09:07:02','2024-03-12 09:07:02');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `orders_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `qty` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_lines`
--

LOCK TABLES `orders_lines` WRITE;
/*!40000 ALTER TABLE `orders_lines` DISABLE KEYS */;
INSERT INTO `orders_lines` VALUES 
(1,1,1,3,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(2,1,3,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(3,1,5,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(4,2,5,2,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
/*!40000 ALTER TABLE `orders_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modalita_fatturazione`
--

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES 
(1,1,1,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(2,1,1,0,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(3,2,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(4,1,2,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP),
(5,1,1,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mpn` varchar(50) NOT NULL,
  `measure_unit` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `price` DECIMAL(11,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_mpn_products` (`mpn`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES 
(1, 'mpn-099', 1 , 'monitor lcd', 'best monitor for you!', 100.50,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP ),
(2, 'mpn-222', 2 , 'helpdesk', 'hourly sold help desk!', 25,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP ),
(3, 'mpn-000', 1 , 'desktop pc', 'best personal compouter', 500,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP ),
(4, 'mpn-001', 1 , 'portable pc', 'laptop workstation', 600,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP ),
(5, 'mpn-431', 3 , 'printer cartridges', '4 cartridges for hp deskjet printer', 600,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP );
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measure_unit`
--

DROP TABLE IF EXISTS `measure_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `measure_unit` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_measure_unit_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measure_unit`
--

LOCK TABLES `measure_unit` WRITE;
/*!40000 ALTER TABLE `measure_unit` DISABLE KEYS */;
INSERT INTO `measure_unit` VALUES 
(1,'PIECE','one unit'),
(2,'HOUR','60 minutes'),
(3,'BOX4','four unit box');
/*!40000 ALTER TABLE `measure_unit` ENABLE KEYS */;
UNLOCK TABLES;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
