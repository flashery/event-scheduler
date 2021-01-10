-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: scheduler
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `start` timestamp NOT NULL,
  `end` timestamp NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interval` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'2020-12-31 08:00:00','2021-01-30 08:00:00','Test Event','Mon,Tue,Fri,','2021-01-09 22:17:05','2021-01-09 22:17:05'),(2,'2020-12-31 08:00:00','2021-01-30 08:00:00','Test Event','Mon,Tue,Fri,Sun,','2021-01-09 22:18:34','2021-01-09 22:18:34'),(3,'2020-12-31 08:00:00','2021-01-30 08:00:00','Test Event','Sun,','2021-01-09 22:18:43','2021-01-09 22:18:43'),(4,'2020-12-31 08:00:00','2021-01-30 08:00:00','Test Event','Sun,Fri,Thu,','2021-01-09 22:18:58','2021-01-09 22:18:58'),(5,'2020-12-31 08:00:00','2021-01-30 08:00:00','Test Event','Sun,Fri,Thu,Sat,','2021-01-09 22:19:04','2021-01-09 22:19:04'),(6,'2020-12-31 08:00:00','2021-01-31 08:00:00','Test Event','Sun,Fri,Thu,Sat,','2021-01-09 22:19:31','2021-01-09 22:19:31'),(7,'2020-12-31 08:00:00','2021-01-31 08:00:00','Test Event','Sun,Fri,Thu,Sat,','2021-01-09 22:20:56','2021-01-09 22:20:56'),(8,'2020-12-31 08:00:00','2021-01-30 08:00:00','Test Event','Sun,Fri,Thu,Sat,','2021-01-09 22:23:25','2021-01-09 22:23:25'),(9,'2020-12-31 08:00:00','2021-01-30 08:00:00','Test Event','Sun,Fri,Thu,Sat,','2021-01-09 22:23:33','2021-01-09 22:23:33'),(10,'2020-12-31 08:00:00','2021-01-30 08:00:00','Test Event','Sun,Fri,Thu,Sat,','2021-01-09 22:23:34','2021-01-09 22:23:34'),(11,'2020-12-31 08:00:00','2021-01-30 08:00:00','Test Event','Mon,Tue,Fri,Sun,','2021-01-09 22:23:46','2021-01-09 22:23:46'),(12,'2020-12-31 08:00:00','2021-01-30 08:00:00','Test Event','Mon,Tue,Fri,','2021-01-09 22:28:05','2021-01-09 22:28:05'),(13,'2020-12-31 16:00:00','2021-01-30 16:00:00','Test Event','Mon,Tue,Fri,','2021-01-09 22:30:20','2021-01-09 22:30:20'),(14,'2020-12-31 16:00:00','2021-01-30 16:00:00','Test Event','Mon,Tue,Fri,','2021-01-09 22:31:53','2021-01-09 22:31:53'),(15,'2020-12-31 16:00:00','2021-01-30 16:00:00','Test Event','Mon,Tue,Fri,','2021-01-09 22:32:35','2021-01-09 22:32:35'),(16,'2020-12-31 16:00:00','2021-01-30 16:00:00','Test Event','Mon,Tue,Fri,Sun,','2021-01-09 22:32:40','2021-01-09 22:32:40');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2021_01_10_015119_create_events_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-10 15:04:24
