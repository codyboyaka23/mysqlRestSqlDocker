-- Active: 1716285598106@@127.0.0.1@33666@mysql_rest_sql_docker
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




DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
  `updated_at` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` TIMESTAMP DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_customers_emails` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES 
(1,'chico','chico@chico.es','2024-03-12 09:07:02','2024-03-26 12:38:19',NULL),
(2,'2PAC','2@pac.com','2024-03-12 09:07:02','2024-03-12 09:07:02',NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
  `updated_at` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` TIMESTAMP DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_code_companies` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES 
(1,'PAD','DIGITS & Co.','best agency all around','2024-03-12 09:07:02','2024-03-26 12:38:19',NULL),
(2,'PAC','Pac-Man Ltd','we made best videogames','2024-03-12 09:07:02','2024-03-12 09:07:02',NULL);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `measure_units`
--

DROP TABLE IF EXISTS `measure_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `measure_units` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `description` varchar(100) NOT NULL,
  `deleted_at` TIMESTAMP DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_measure_unit_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measure_units`
--

LOCK TABLES `measure_units` WRITE;
/*!40000 ALTER TABLE `measure_units` DISABLE KEYS */;
INSERT INTO `measure_units` VALUES 
(1,'PIECE','one unit',NULL),
(2,'HOUR','60 minutes',NULL),
(3,'BOX4','four unit box',NULL);
/*!40000 ALTER TABLE `measure_units` ENABLE KEYS */;
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
  `measure_unit_id` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `price` DECIMAL(11,2) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
  `updated_at` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` TIMESTAMP DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_mpn_products` (`mpn`),
  KEY `fk_product_measure_unit` (`measure_unit_id`),
  CONSTRAINT `fk_product_measure_unit` FOREIGN KEY (`measure_unit_id`) REFERENCES `measure_units` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE INDEX idx_products_deleted_at ON products(deleted_at);

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES 
(1, 'mpn-099', 1 , 'monitor lcd', 'best monitor for you!', 100.50,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,NULL ),
(2, 'mpn-222', 2 , 'helpdesk', 'hourly sold help desk!', 25,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,NULL ),
(3, 'mpn-000', 1 , 'desktop pc', 'best personal compouter', 500,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,NULL ),
(4, 'mpn-001', 1 , 'portable pc', 'laptop workstation', 600,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,NULL ),
(5, 'mpn-431', 3 , 'printer cartridges', '4 cartridges for hp deskjet printer', 600,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP,NULL );
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
  `updated_at` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_order_customer` (`customer_id`),
  CONSTRAINT `fk_order_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  KEY `fk_order_company` (`company_id`),
  CONSTRAINT `fk_order_company` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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


DROP TABLE IF EXISTS `orders_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `qty` int(10) unsigned NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
  `updated_at` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_line_product` (`product_id`),
  CONSTRAINT `fk_line_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  KEY `fk_line_order` (`order_id`),
  CONSTRAINT `fk_line_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
-- Table structure for table `customer_care_activities`
--

DROP TABLE IF EXISTS `customer_care_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_care_activities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_customer_care_activities_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Dumping data for table `customer_care_activities`
--

LOCK TABLES `customer_care_activities` WRITE;
/*!40000 ALTER TABLE `customer_care_activities` DISABLE KEYS */;
INSERT INTO `customer_care_activities` VALUES 
(1,'LEAD','first contact'),
(2,'HELPDESK','60 minutes helpdesk'),
(3,'ADVICE','alerting client');
/*!40000 ALTER TABLE `customer_care_activities` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `customer_care_activities_history`
--

DROP TABLE IF EXISTS `customer_care_activities_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_care_activities_history` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_care_activity_id` int(10) UNSIGNED NOT NULL,
  `order_line_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_rel_activities_orders_lines` (`customer_care_activity_id`),
  CONSTRAINT `fk_rel_activities_orders_lines` FOREIGN KEY (`customer_care_activity_id`) REFERENCES `customer_care_activities` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  KEY `fk_rel_orders_lines_activities` (`order_line_id`),
  CONSTRAINT `fk_rel_orders_lines_activities` FOREIGN KEY (`order_line_id`) REFERENCES `orders_lines` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  KEY `fk_customer_care_activities_customer` (`customer_id`),
  CONSTRAINT `fk_customer_care_activities_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Dumping data for table `customer_care_activities_history`
--

LOCK TABLES `customer_care_activities` WRITE;
/*!40000 ALTER TABLE `customer_care_activities_history` DISABLE KEYS */;
INSERT INTO `customer_care_activities_history` VALUES (1,1,2,1,"2024-05-22 10:04:54"),(2,1,1,1,CURRENT_TIMESTAMP), (3,2,2,1,CURRENT_TIMESTAMP);
/*!40000 ALTER TABLE `customer_care_activities_history` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;



CREATE VIEW orders_compressed_aggregates
AS
SELECT orders.active AS orderStatus, 
orders.id AS orderID, 
orders.created_at, 
orders.updated_at,
companies.name AS company, 
companies.code AS companyCode, 
customers.id AS customerID,
customers.name AS customer,
customers.email AS customerEmail,
orders_lines.id AS orderlineID, 
products.name AS product, 
orders_lines.qty , 
measure_units.code AS measureUnit, 
products.price,
customer_care_activities.code AS last_cca_code ,
rccao.created_at AS last_cca_date
FROM orders 
LEFT OUTER JOIN companies ON companies.id = orders.company_id 
JOIN customers ON customers.id = orders.customer_id
JOIN orders_lines ON orders_lines.order_id = orders.id
JOIN products ON products.id = orders_lines.id
JOIN measure_units ON measure_units.id = products.measure_unit_id
LEFT JOIN customer_care_activities_history AS rccao ON orders_lines.id = rccao.order_line_id
LEFT JOIN customer_care_activities ON rccao.customer_care_activity_id = customer_care_activities.id
GROUP BY orders_lines.id ORDER BY rccao.created_at DESC;