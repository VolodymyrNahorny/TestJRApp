CREATE DATABASE IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `test`;
-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	5.7.16-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id`           INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name`         VARCHAR(45)      NOT NULL,
  `age`          INT(11)          NOT NULL,
  `is_admin`     TINYINT(4)       NOT NULL,
  `updated_time` DATETIME         NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 90
  DEFAULT CHARSET = utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User`
  DISABLE KEYS */;
INSERT INTO `User` VALUES (5, 'Leha', 21, 1, '2016-11-13 20:59:03'), (13, 'Max', 12, 0, '2016-11-16 18:05:53'),
  (15, 'Fax', 20, 0, '2016-11-16 18:05:53'), (16, 'Rembo', 32, 0, '2016-11-16 18:05:53'),
  (17, 'Stalone', 21, 0, '2016-11-16 18:05:53'), (18, 'Evgen', 23, 0, '2016-11-16 18:05:53'),
  (19, 'Ravshan', 54, 0, '2016-11-16 18:05:53'), (22, 'Max', 12, 0, '2016-11-16 18:06:14'),
  (24, 'Fax', 20, 0, '2016-11-16 18:06:24'), (25, 'Good', 45, 0, '2016-11-16 18:06:36'),
  (26, 'Rembo', 32, 0, '2016-11-16 18:06:51'), (27, 'Stalone', 21, 0, '2016-11-16 18:06:51'),
  (28, 'Evgen', 23, 0, '2016-11-16 18:06:51'), (29, 'Ravshan', 54, 0, '2016-11-16 18:06:51'),
  (30, 'Daniel', 12, 0, '2016-11-16 18:06:51'), (31, 'Rex', 345, 0, '2016-11-16 18:06:51'),
  (32, 'Stalone', 21, 0, '2016-11-16 18:07:51'), (33, 'Fax', 20, 0, '2016-11-16 18:07:53'),
  (34, 'Fax', 20, 0, '2016-11-16 18:07:55'), (36, 'Max', 12, 0, '2016-11-16 18:07:58'),
  (37, 'Sofia', 23, 0, '2016-11-16 18:08:04'), (38, 'Maria', 33, 0, '2016-11-16 18:08:10'),
  (39, 'Tanya', 44, 0, '2016-11-16 18:08:12'), (40, 'Rita', 32, 0, '2016-11-16 18:08:14'),
  (41, 'Rama', 21, 0, '2016-11-16 18:08:16'), (42, 'Gala', 23, 0, '2016-11-16 18:08:18'),
  (43, 'Sanya', 32, 0, '2016-11-16 18:08:21'), (44, 'Bobik', 34, 0, '2016-11-16 18:08:22'),
  (45, 'Tema', 43, 0, '2016-11-16 18:08:24'), (47, 'Ariya', 22, 0, '2016-11-16 18:08:31'),
  (48, 'Propan', 36, 0, '2016-11-16 18:08:33'), (49, 'Butan', 35, 0, '2016-11-16 18:08:35'),
  (50, 'Graviy', 53, 0, '2016-11-16 18:08:37'), (51, 'Eminem', 51, 0, '2016-11-16 18:08:40'),
  (52, 'Rob', 72, 0, '2016-11-16 18:08:42'), (53, 'Bob', 12, 0, '2016-11-16 18:08:44'),
  (54, 'Tim', 21, 0, '2016-11-16 18:08:46'), (55, 'Henk', 23, 0, '2016-11-16 18:08:48'),
  (56, 'Bob', 32, 0, '2016-11-16 18:08:50'), (57, 'Nick', 45, 0, '2016-11-16 18:08:52'),
  (58, 'Wood', 45, 0, '2016-11-16 18:08:54'), (59, '', 0, 0, '2016-11-18 01:24:11'),
  (60, 'Fax', 0, 0, '2016-11-19 03:23:14'), (61, 'Fax', 12, 0, '2016-11-19 03:23:43'),
  (62, 'Fax', 0, 0, '2016-11-19 03:23:52'), (63, 'Fax', 0, 0, '2016-11-19 03:23:58'),
  (64, 'Fax', 0, 0, '2016-11-19 03:24:06'), (65, 'Fax', 0, 0, '2016-11-19 03:24:13'),
  (66, 'Fax', 0, 0, '2016-11-19 03:24:30'), (67, 'Fax', 0, 0, '2016-11-19 03:24:37'),
  (68, 'Fax', 0, 0, '2016-11-19 03:24:44'), (69, 'Fax', 0, 0, '2016-11-19 03:24:49'),
  (70, 'Fax', 0, 0, '2016-11-19 03:25:06'), (71, 'Fax', 0, 0, '2016-11-19 03:25:12'),
  (72, 'Fax', 0, 0, '2016-11-19 03:25:17'), (73, 'Fax', 0, 0, '2016-11-19 03:25:23'),
  (74, 'Fax', 0, 0, '2016-11-19 03:25:28'), (75, 'Fax', 0, 0, '2016-11-19 03:25:32'),
  (76, 'Fax', 0, 0, '2016-11-19 03:25:36'), (77, 'Fax', 0, 0, '2016-11-19 03:25:44'),
  (78, 'Fax', 0, 0, '2016-11-19 03:25:48'), (79, 'Fax', 0, 0, '2016-11-19 03:26:01'),
  (80, 'Fax', 0, 0, '2016-11-19 03:26:05'), (81, 'Fax', 0, 0, '2016-11-19 03:26:10'),
  (82, 'Fax', 0, 0, '2016-11-19 03:26:15'), (83, 'Fax', 0, 0, '2016-11-19 03:26:19'),
  (84, 'Fax', 0, 0, '2016-11-19 03:26:25'), (85, 'Fax', 0, 0, '2016-11-19 03:26:29'),
  (86, 'Fax', 0, 0, '2016-11-19 03:26:33'), (87, 'Fax', 0, 0, '2016-11-19 03:26:38'),
  (88, 'Fax', 0, 0, '2016-11-19 03:26:43');
/*!40000 ALTER TABLE `User`
  ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2016-11-19 17:01:08
