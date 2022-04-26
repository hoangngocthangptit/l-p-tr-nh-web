-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: hr.cyj41au55ncu.ap-southeast-1.rds.amazonaws.com    Database: HR_Management
-- ------------------------------------------------------
-- Server version	8.0.23

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `Absence`
--

DROP TABLE IF EXISTS `Absence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Absence` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staffId` int DEFAULT NULL,
  `teamId` int DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `request_date` datetime DEFAULT NULL,
  `duration` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staffId` (`staffId`),
  KEY `teamId` (`teamId`),
  CONSTRAINT `Absence_ibfk_1` FOREIGN KEY (`staffId`) REFERENCES `User` (`id`),
  CONSTRAINT `Absence_ibfk_2` FOREIGN KEY (`teamId`) REFERENCES `Team` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Absence`
--

LOCK TABLES `Absence` WRITE;
/*!40000 ALTER TABLE `Absence` DISABLE KEYS */;
INSERT INTO `Absence` VALUES 
(1,131,29,'2020-03-01 00:00:00','2020-04-01 00:00:00','Approved','Absence','Nghỉ đẻ','2020-02-02 00:00:00',''),
(2,132,29,'2021-04-01 00:00:00','2021-04-01 00:00:00','Approved','Late Arriving','Xin đến muộn','2021-03-31 00:00:00','1'),
(3,133,29,'2022-03-10 00:00:00','2022-03-15 00:00:00','Rejected','Absence','Đi du lịch','2022-03-01 00:00:00',''),
(4,134,29,'2022-03-10 00:00:00','2022-03-15 00:00:00','Rejected','Absence','Đi du lịch','2022-03-01 00:00:00',''),
(5,136,34,'2022-03-10 00:00:00','2022-03-10 00:00:00','Submitted','Soon Leaving','Giỗ mẹ chồng','2022-03-01 00:00:00','2'),
(6,137,34,'2022-03-10 00:00:00','2022-03-15 00:00:00','Approved','Absence','Nghỉ phẫu thuật','2022-03-01 00:00:00',''),
(14,131,35,'2022-03-20 00:00:00','2022-03-21 00:00:00','Submitted','Absence','Sickness','2022-03-17 06:05:52',''),
(16,131,35,'2022-03-24 00:00:00','2022-03-25 00:00:00','Submitted','Late Arriving','Illness','2022-03-23 00:00:00',NULL);
/*!40000 ALTER TABLE `Absence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contract`
--

DROP TABLE IF EXISTS `Contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contract` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Contract_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contract`
--

LOCK TABLES `Contract` WRITE;
/*!40000 ALTER TABLE `Contract` DISABLE KEYS */;
INSERT INTO `Contract` VALUES 
(1,131,'2022-01-12 00:00:00','2023-02-11 00:00:00','Archived'),
(2,132,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(3,133,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(4,134,'2022-01-01 00:00:00','2023-02-01 00:00:00','Active'),
(5,136,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(6,137,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(7,140,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(8,142,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(9,143,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(10,144,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(11,145,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(12,146,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(13,147,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(14,148,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(15,150,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(16,151,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(17,156,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(18,157,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(19,160,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(20,162,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(21,163,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(22,164,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(23,165,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(24,166,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(25,168,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(26,169,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(27,171,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(28,172,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(29,173,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(30,174,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(31,175,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(32,176,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(33,178,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(34,180,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(35,177,'2022-01-01 00:00:00','2023-01-01 00:00:00','Active'),
(36,157,'2022-03-31 00:00:00','2022-03-31 00:00:00','Active'),
(37,157,'2022-03-26 00:00:00','2022-03-26 00:00:00','Active'),
(38,157,'2022-03-18 00:00:00','2022-04-06 00:00:00','Active'),
(39,157,'2022-03-18 00:00:00','2022-03-31 00:00:00','Active'),
(40,131,'2022-03-17 00:00:00','2022-04-09 00:00:00','Archived');
/*!40000 ALTER TABLE `Contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Feedback`
--

DROP TABLE IF EXISTS `Feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `request_id` int DEFAULT NULL,
  `star` int DEFAULT NULL,
  `comment` text,
  `feedback_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `request_id` (`request_id`),
  CONSTRAINT `Feedback_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `Request` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Feedback`
--

LOCK TABLES `Feedback` WRITE;
/*!40000 ALTER TABLE `Feedback` DISABLE KEYS */;
INSERT INTO `Feedback` VALUES 
(15,23,5,'Good new screen','2022-03-03 00:00:00'),
(16,26,2,'Salary is not good','2022-03-09 00:00:00'),
(17,28,4,'Internet is in normal condition, but still lag in 20h00','2022-01-03 00:00:00'),
(27,32,5,'nice','2022-03-21 00:00:00'),(28,33,5,'Very good','2022-03-23 00:00:00');
/*!40000 ALTER TABLE `Feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Post`
--

DROP TABLE IF EXISTS `Post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `thumbnail` varchar(250) DEFAULT NULL,
  `category` varchar(250) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `brief_information` varchar(250) DEFAULT NULL,
  `content` text,
  `flag` tinyint(1) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `slider_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slider_id` (`slider_id`),
  CONSTRAINT `Post_ibfk_1` FOREIGN KEY (`slider_id`) REFERENCES `Slider` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Post`
--

LOCK TABLES `Post` WRITE;
/*!40000 ALTER TABLE `Post` DISABLE KEYS */;
/*!40000 ALTER TABLE `Post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project`
--

DROP TABLE IF EXISTS `Project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Project` (
  `projectCode` varchar(10) NOT NULL,
  `teamId` int DEFAULT NULL,
  `projectName` varchar(50) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`projectCode`),
  KEY `teamId` (`teamId`),
  CONSTRAINT `Project_ibfk_1` FOREIGN KEY (`teamId`) REFERENCES `Team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project`
--

LOCK TABLES `Project` WRITE;
/*!40000 ALTER TABLE `Project` DISABLE KEYS */;
INSERT INTO `Project` VALUES 
('SSJ',35,'Super Jin','2022-03-22 00:00:00','2022-03-26 00:00:00','Active',''),
('SWD',29,'SWD project','2010-01-01 00:00:00','2018-01-01 00:00:00','Active',''),
('SWG',29,'SWS project','2022-03-11 00:00:00','2022-03-18 00:00:00','Active','hh'),
('SWP',32,'SWP project','2010-01-01 00:00:00','2012-01-01 00:00:00','Inactive',''),
('SWR',31,'SWT project','2018-01-01 00:00:00','2021-01-01 00:00:00','Active',NULL),
('SWRP',29,'New project','2022-03-18 00:00:00','2022-03-23 00:00:00','Active',''),
('SWS',29,'SWS project','2022-03-11 00:00:00','2022-03-18 00:00:00','Active',''),
('SWV',33,'SWG project','2022-03-11 00:00:00','2022-03-18 00:00:00','Active','');
/*!40000 ALTER TABLE `Project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Request`
--

DROP TABLE IF EXISTS `Request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `incharge_id` int DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `request_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `raised_staff_id` int DEFAULT NULL,
  `support_type_id` int DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `incharge_id` (`incharge_id`),
  KEY `support_type_id` (`support_type_id`),
  KEY `Request_ibfk_2` (`raised_staff_id`),
  CONSTRAINT `Request_ibfk_1` FOREIGN KEY (`incharge_id`) REFERENCES `User` (`id`),
  CONSTRAINT `Request_ibfk_2` FOREIGN KEY (`raised_staff_id`) REFERENCES `User` (`id`),
  CONSTRAINT `Request_ibfk_3` FOREIGN KEY (`support_type_id`) REFERENCES `Support_Type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Request`
--

LOCK TABLES `Request` WRITE;
/*!40000 ALTER TABLE `Request` DISABLE KEYS */;
INSERT INTO `Request` VALUES 
(23,'Computer broken screen',131,'Closed','2022-02-22 00:00:00','2022-03-01 00:00:00',136,14,NULL),
(24,'Software problems',150,'Assigned','2022-03-07 00:00:00','2022-03-17 05:27:33',180,14,NULL),
(25,'Broken chair',168,'Completed','2022-02-24 00:00:00','2022-02-24 00:00:00',137,16,NULL),
(26,'Check Salary',168,'Closed','2022-03-08 00:00:00','2022-03-08 00:00:00',151,17,NULL),
(27,'Budget Project',168,'Assigned','2022-02-25 00:00:00','2022-03-23 14:43:20',180,16,NULL),
(28,'Internet problems',150,'Closed','2022-01-01 00:00:00','2022-01-01 00:00:00',145,14,NULL),
(29,'Email problems',157,'Completed','2021-12-12 00:00:00','2022-03-23 15:13:35',145,14,NULL),
(30,'Server problems',176,'Assigned','2022-01-05 00:00:00','2022-01-05 00:00:00',156,14,NULL),
(31,'Forgot account',176,'Submitted','2022-03-08 00:00:00','2022-03-08 00:00:00',160,14,NULL),
(32,'Insurance Problems',168,'Closed','2022-03-01 00:00:00','2022-03-01 00:00:00',145,17,NULL),
(33,'Check my money',166,'Closed','2022-03-21 00:00:00','2022-03-22 05:55:41',145,16,'I want to check my Money for this month'),
(36,'Change Position',166,'Submitted','2022-03-22 00:00:00','2022-03-23 14:42:57',163,16,'a'),
(37,'My Test Environment is in trouble',157,'Submitted','2022-03-23 00:00:00','2022-03-23 14:10:42',131,14,'I can\'t test. It noticed \"Error in Environment\".'),
(39,'Update Windows',157,'Submitted','2022-03-23 00:00:00','2022-03-23 14:22:25',145,23,'I want to update my new version of Windows in my computer.');
/*!40000 ALTER TABLE `Request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Resource`
--

DROP TABLE IF EXISTS `Resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Resource` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staffId` int DEFAULT NULL,
  `resourceRole` varchar(50) DEFAULT NULL,
  `fromDate` datetime DEFAULT NULL,
  `toDate` datetime DEFAULT NULL,
  `percentOfEffort` double DEFAULT NULL,
  `projectCode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `staffId` (`staffId`),
  KEY `projectCode` (`projectCode`),
  CONSTRAINT `Resource_ibfk_1` FOREIGN KEY (`staffId`) REFERENCES `User` (`id`),
  CONSTRAINT `Resource_ibfk_2` FOREIGN KEY (`projectCode`) REFERENCES `Project` (`projectCode`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Resource`
--

LOCK TABLES `Resource` WRITE;
/*!40000 ALTER TABLE `Resource` DISABLE KEYS */;
INSERT INTO `Resource` VALUES 
(1,131,'PM','2010-01-01 00:00:00','2012-01-01 00:00:00',0,'SWP'),
(2,132,'QA','2010-01-01 00:00:00','2012-01-01 00:00:00',1,'SWP'),
(3,134,'PM','2010-01-01 00:00:00','2012-01-01 00:00:00',10,'SWP'),
(4,148,'PM','2010-01-01 00:00:00','2018-01-01 00:00:00',5,'SWD'),
(5,156,'PM','2022-03-11 00:00:00','2022-03-18 00:00:00',2,'SWG'),
(6,162,'PM','2018-01-01 00:00:00','2020-01-01 00:00:00',1,'SWR'),
(7,163,'PM','2022-03-11 00:00:00','2022-03-18 00:00:00',90,'SWS'),
(8,165,'PM','2022-03-11 00:00:00','2022-03-18 00:00:00',10,'SWV'),
(9,156,'PM','2022-03-22 00:00:00','2022-03-26 00:00:00',0,'SSJ'),
(10,157,'PM','2022-03-18 00:00:00','2022-03-23 00:00:00',0,'SWRP');
/*!40000 ALTER TABLE `Resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Setting`
--

DROP TABLE IF EXISTS `Setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Setting`
--

LOCK TABLES `Setting` WRITE;
/*!40000 ALTER TABLE `Setting` DISABLE KEYS */;
INSERT INTO `Setting` VALUES 
(2,'Post Status'),
(3,'Request Status'),
(4,'Absence Type'),
(5,'Absence Request Status'),
(6,'Timesheet Process'),
(7,'Timesheet Status'),
(8,'Staff Status'),
(9,'Project Roles'),
(10,'Role');
/*!40000 ALTER TABLE `Setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Setting_Value`
--

DROP TABLE IF EXISTS `Setting_Value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Setting_Value` (
  `id` int NOT NULL AUTO_INCREMENT,
  `setting_id` int NOT NULL,
  `value` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `order_number` int DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `setting_id` (`setting_id`),
  CONSTRAINT `Setting_Value_ibfk_1` FOREIGN KEY (`setting_id`) REFERENCES `Setting` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Setting_Value`
--

LOCK TABLES `Setting_Value` WRITE;
/*!40000 ALTER TABLE `Setting_Value` DISABLE KEYS */;
INSERT INTO `Setting_Value` VALUES 
(10,2,'Draft','Inactive',3,NULL),
(11,2,'Deleted','Inactive',3,NULL),
(12,2,'Published','Active',3,''),
(17,3,'Submitted','Active',3,NULL),
(18,3,'Assigned','Active',3,NULL),
(19,3,'Completed','Active',3,NULL),
(20,3,'Closed','Active',3,NULL),
(21,4,'Absence','Active',2,NULL),
(22,4,'Late Arriving','Active',2,NULL),
(23,4,'Soon Leaving','Active',2,NULL),
(24,5,'Submitted','Active',3,NULL),
(25,5,'Approved','Active',3,NULL),
(26,5,'Rejected','Active',3,NULL),
(27,6,'Training','Active',3,NULL),
(28,6,'Requirement','Active',3,NULL),
(29,6,'Design','Active',3,NULL),
(30,6,'Coding','Active',3,NULL),
(31,6,'Testing','Active',3,NULL),
(32,6,'Supporting','Active',3,NULL),
(33,7,'Submitted','Active',3,NULL),
(34,7,'Approved','Active',3,''),
(35,7,'Rejected','Active',3,NULL),
(36,8,'Registered','Active',3,NULL),
(37,8,'Verified','Active',3,NULL),
(38,8,'Active','Active',3,NULL),
(39,8,'Inactive','Active',3,NULL),
(40,9,'PM','Active',2,NULL),
(41,9,'Designer','Active',2,NULL),
(42,9,'Developer','Active',2,NULL),
(43,9,'Tester','Active',2,NULL),
(44,9,'QA','Active',2,''),
(45,10,'Admin','Active',2,NULL),
(46,10,'HR','Active',2,NULL),
(47,10,'Manager','Active',2,NULL),
(48,10,'Staff','Active',2,NULL),
(52,2,'new value','Active',2,'something'),
(53,2,'Activatevbnvn','Inactive',2,'Something');
/*!40000 ALTER TABLE `Setting_Value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Slider`
--

DROP TABLE IF EXISTS `Slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Slider` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `backlink` varchar(250) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `Note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Slider`
--

LOCK TABLES `Slider` WRITE;
/*!40000 ALTER TABLE `Slider` DISABLE KEYS */;
/*!40000 ALTER TABLE `Slider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Support_Type`
--

DROP TABLE IF EXISTS `Support_Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Support_Type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `in_charge_team_id` int DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `in_charge_team_id` (`in_charge_team_id`),
  CONSTRAINT `Support_Type_ibfk_1` FOREIGN KEY (`in_charge_team_id`) REFERENCES `Team` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Support_Type`
--

LOCK TABLES `Support_Type` WRITE;
/*!40000 ALTER TABLE `Support_Type` DISABLE KEYS */;
INSERT INTO `Support_Type` VALUES 
(14,'IT Support',30,'ITS@gmail.com','active','Support type'),
(15,'Financial Support',31,'FS@gmail.com','active',NULL),
(16,'Administrative Office',32,'AO@gmail.com','active',NULL),
(17,'HR Support',33,'HRS@gmail.com','active',NULL),
(23,'IT',30,'IT@gmail.com','inactive',''),
(26,'ABCDE',31,'abc@gmail.com','active','something');
/*!40000 ALTER TABLE `Support_Type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Team`
--

DROP TABLE IF EXISTS `Team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Team` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  `parent_team_id` int DEFAULT NULL,
  `team_type` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`name`),
  UNIQUE KEY `code_UNIQUE` (`code`),
  KEY `manager_id` (`manager_id`),
  KEY `parent_team_id` (`parent_team_id`),
  CONSTRAINT `Team_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `User` (`id`),
  CONSTRAINT `Team_ibfk_2` FOREIGN KEY (`parent_team_id`) REFERENCES `Team` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Team`
--

LOCK TABLES `Team` WRITE;
/*!40000 ALTER TABLE `Team` DISABLE KEYS */;
INSERT INTO `Team` VALUES 
(29,'ITI','IT Intern',157,NULL,'Non-BA','Active','2022-03-23 00:00:00','new comment'),
(30,'ITS','IT Support',157,NULL,'BA','Active','2022-03-09 14:59:03',NULL),
(31,'FS','Financial Support',162,NULL,'BA','Active','2022-03-09 14:59:03',NULL),
(32,'AO','Administrative Office',163,NULL,'BA','Active','2022-03-09 14:59:03',NULL),
(33,'HRS','HR Support',165,NULL,'BA','Active','2022-03-09 14:59:03',NULL),
(34,'HRP','HRMS Project',137,NULL,'Non-BA','Active','2022-03-09 00:00:00',NULL),
(35,'HRT','HRMS Testing',179,35,'Non-BA','Active','2022-03-09 00:00:00',NULL),
(36,'HRB','HRMS BA',171,35,'Non-BA','Active','2022-03-09 00:00:00',NULL),
(37,'HRD','HRMS Development',177,35,'Non-BA','Active','2022-03-09 00:00:00',NULL),
(38,'HRQ','HRMS Q&A',164,35,'Non-BA','Active','2022-03-09 00:00:00',NULL),
(39,'MKT','Markering',156,NULL,'Non-BA','Active','2022-03-09 00:00:00',NULL),
(44,'abc','abc',162,NULL,'BA','Active','2022-03-22 00:00:00',''),
(45,'SE','Game',157,NULL,'BA','Active',NULL,'');
/*!40000 ALTER TABLE `Team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Team_User`
--

DROP TABLE IF EXISTS `Team_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Team_User` (
  `team_id` int NOT NULL,
  `staff_id` int NOT NULL,
  `project_role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`team_id`,`staff_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `Team_User_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `Team` (`id`),
  CONSTRAINT `Team_User_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Team_User`
--

LOCK TABLES `Team_User` WRITE;
/*!40000 ALTER TABLE `Team_User` DISABLE KEYS */;
INSERT INTO `Team_User` VALUES 
(29,131,'Manager'),
(29,132,'Member'),
(29,134,'Member'),
(29,169,'Member'),
(29,175,'Member'),
(30,148,'Member'),
(30,150,'Member'),
(30,157,'Manager'),
(30,176,'Member'),
(30,178,'Member'),
(31,162,'Manager'),
(31,174,'Member'),
(31,180,'Member'),
(32,163,'Manager'),
(32,166,'Member'),
(32,168,'Member'),
(33,165,'Manager'),
(34,136,'Member'),
(34,137,'Manager'),
(35,140,'Member'),
(35,142,'Member'),
(35,179,'Manager'),
(36,133,NULL),
(36,143,'Member'),
(36,146,'Member'),
(36,171,'Manager'),
(37,144,'Member'),
(37,147,'Member'),
(37,177,'Manager'),
(38,145,'Member'),
(38,164,'Manager'),
(39,151,'Member'),
(39,156,'Manager');
/*!40000 ALTER TABLE `Team_User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Timesheet`
--

DROP TABLE IF EXISTS `Timesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Timesheet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timesheetDate` datetime DEFAULT NULL,
  `timesheetTitle` varchar(250) DEFAULT NULL,
  `projectCode` varchar(10) DEFAULT NULL,
  `process` varchar(50) DEFAULT NULL,
  `duration` double DEFAULT NULL,
  `workResults` text,
  `status` varchar(50) DEFAULT NULL,
  `rejectReason` text,
  `in_charge_staff_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projectCode` (`projectCode`),
  KEY `in_charge_staff_id_idx` (`in_charge_staff_id`),
  CONSTRAINT `in_charge_staff_id` FOREIGN KEY (`in_charge_staff_id`) REFERENCES `User` (`id`),
  CONSTRAINT `Timesheet_ibfk_1` FOREIGN KEY (`projectCode`) REFERENCES `Project` (`projectCode`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Timesheet`
--

LOCK TABLES `Timesheet` WRITE;
/*!40000 ALTER TABLE `Timesheet` DISABLE KEYS */;
INSERT INTO `Timesheet` VALUES 
(1,'2022-01-01 00:00:00','Define Requirement','SWP','Requirement',4,'Identified half of requirements','Submitted',NULL,163),
(2,'2022-01-02 00:00:00','Draw UML Diagram','SWD','Design',4,'Finish UML Diagram','Submitted',NULL,134),
(3,'2022-01-02 00:00:00','Review UML Diagram','SWD','Testing',2,'Found 5 defects','Submitted',NULL,131),
(4,'2022-01-01 00:00:00','Write SRS','SWD','Requirement',8,'Done 20% SRS','Submitted',NULL,134),
(5,'2022-01-01 00:00:00','Code Backend Screen 12','SWS','Coding',4,'Done 100% Function A','Submitted',NULL,169),
(6,'2022-01-03 00:00:00','Design Frontend Screen 15','SWS','Design',4,'Done 100% UI','Submitted',NULL,175),
(7,'2022-01-02 00:00:00','Write Financial Report','SWR','Requirement',3,'Done 100% Report','Rejected','Wrong Format. Write report again.',163),
(8,'2022-01-04 00:00:00','Fix Bugs In Function A','SWS','Coding',4,'All Bugs are fixed','Approved',NULL,169),
(10,'2022-01-05 00:00:00','Review Code Screen B','SWS','Testing',2.5,'Found 3 bugs','Rejected','Test failed',169),
(11,'2022-01-05 00:00:00','Unit Test for Screen C','SWS','Testing',3.5,'Finished UT and found 2 bugs','Approved',NULL,169),
(12,'2022-01-06 00:00:00','Training new software','SWS','Training',2,'Finish the first training','Approved',NULL,169),
(13,'2022-03-17 00:00:00','ABCD','SWG','Design',4,'abc','Submitted',NULL,175),
(14,'2022-03-03 00:00:00','qwz','SWD','Requirement',3,'sdf','Submitted',NULL,175),
(19,'2022-03-06 00:00:00','reqwrwe','SWD','Training',2,'zzzzz','Submitted',NULL,131),
(20,'2010-01-01 00:00:00','Test','SWD','Training',1,'','Submitted',NULL,131),
(21,'2022-03-17 00:00:00','abc','SWS','Training',2,'donee','Submitted',NULL,131),
(22,'2022-03-23 00:00:00','Design UML v2','SWG','Supporting',3,'Done 100%','Submitted',NULL,169);
/*!40000 ALTER TABLE `Timesheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `middle_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `avata` text,
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES 
(131,'aa','38333733363335333433333332333133','Alibaba','','Alidai','aa@gmail.com','0984403431','Male','2022-03-25','Active','Nice','gun.jpg','Staff'),
(132,'ee','38336234643434373336323531353434','Eira','','Evans','ee@gmail.com','0392725662','Other','1988-10-08','Active',NULL,NULL,'Staff'),
(133,'ejppp','37363336333335333936393731376334','Eira','','Johnsonnnnn','ej@gmail.com','0735079675','Male','1980-11-10','Active','het han hop dong',NULL,'Staff'),
(134,'kj','39356436333430333537383635333633','Keisha','','Jones','kj@gmail.com','0985447620','Female','1984-08-20','Active',NULL,NULL,'Staff'),
(135,'aj','33333636313661343936333464346436','Acacia','','Johnson','aj@gmail.com','0660911073','Female','1978-05-11','Inactive',NULL,NULL,'Manager'),
(136,'jw','37366135653630353737363430336234','Jena','','White','jw@gmail.com','0440253644','Male','1967-04-10','Active',NULL,NULL,'Staff'),
(137,'gh','35353536303362343334623430373933','Griselda','','Hall','gh@gmail.com','0895705949','Female','1994-02-14','Active',NULL,NULL,'Staff'),
(138,'fg','35343235333435356534373661343437','Fiona','','Green','fg@gmail.com','0692177888','Female','2009-03-29','Inactive',NULL,NULL,'Staff'),
(139,'db','30373133383432373635393633353234','Daria','','Brown','db@gmail.com','0588913012','Female','2001-12-31','Inactive',NULL,NULL,'Staff'),
(140,'be','37363235363661353936623639363534','Brenna','','Evans','be@gmail.com','0573204472','Other','2001-03-11','Active',NULL,NULL,'Staff'),
(141,'hc','33356137363538343537353662363737','Hebe','','Carney','hc@gmail.com','0844576052','Female','2006-06-25','Verified',NULL,NULL,'Staff'),
(142,'jw0','39373734333732343636383334346334','Jena','','Williams','jw0@gmail.com','0152041054','Male','2008-01-21','Active',NULL,NULL,'Staff'),
(143,'ft','39343336363334353235323637343234','Farah','','Thompson','ft@gmail.com','0824844030','Female','1994-06-14','Active',NULL,NULL,'Staff'),
(144,'dt','62363033373432333537643666343137','Delwyn','','Thompson','dt@gmail.com','0369671617','Male','1969-06-03','Active',NULL,NULL,'Staff'),
(145,'cd','31343236363463363834313735373033','Cleopatra','','Davies','cd@gmail.com','0486401872','Male','1979-01-10','Active',NULL,NULL,'Staff'),
(146,'ct','35373235343764366334383538336436','Cleopatra','','Thompson','ct@gmail.com','0478302257','Female','1996-03-30','Active',NULL,NULL,'Staff'),
(147,'ic','34353233343330333435643437333537','Imelda','','Carney','ic@gmail.com','0290436230','Female','1962-10-01','Active',NULL,NULL,'Staff'),
(148,'ch','37343537313538333637343739366434','Cosima','','Hall','ch@gmail.com','0167483698','Male','1973-12-12','Active',NULL,NULL,'Staff'),
(149,'ht','33366134303337356134333434366135','Hebe','','Thomas','ht@gmail.com','0843601538','Other','1963-02-26','Registered',NULL,NULL,'Admin'),
(150,'fd','35333136313539373736333464343336','Fiona','','Davies','fd@gmail.com','0807867016','Other','1975-10-18','Active',NULL,NULL,'Staff'),
(151,'ct0','31346534613538366534313731343335','Cosima','','Thompson','ct0@gmail.com','0751814215','Other','2006-04-27','Active',NULL,NULL,'Staff'),
(152,'gj','61366536353566363334613561363533','Griselda','','Jones','gj@gmail.com','0523506296','Other','1967-04-30','Registered',NULL,NULL,'HR'),
(153,'dg','38343936373763366136333336343535','Delwyn','','Green','dg@gmail.com','0189519542','Other','1967-02-25','Inactive',NULL,NULL,'Staff'),
(154,'ce','39346536383436353636353665366137','Cleopatra','','Evans','ce@gmail.com','0391574587','Other','1969-08-07','Inactive',NULL,NULL,'Staff'),
(155,'dh','31363334353435333236303736346234','Delwyn','','Hughes','dh@gmail.com','0939462457','Other','2005-08-11','Inactive',NULL,NULL,'Staff'),
(156,'bw','64366336393332353234313361343836','Bridget','','Wilson','bw@gmail.com','0728070353','Male','1969-12-25','Active',NULL,NULL,'Manager'),
(157,'ic0','31363136313631363136313631363136','Imeldaa Carney','','Carney','ic0@gmail.com','0993025579','Male','1979-02-01','Active',NULL,'gun.jpg','HR'),
(158,'aw','63363437333737343933363636373733','Acacia','','Williams','aw@gmail.com','0578317146','Female','1968-05-01','Inactive',NULL,NULL,'Staff'),
(159,'dh0','64363836663437363535663434366234','Daria','','Hall','dh0@gmail.com','0509272147','Female','1990-10-07','Inactive',NULL,NULL,'Staff'),
(160,'ej0','61363636373537343436613436343936','Euphemia','','Jones','ej0@gmail.com','0471504645','Male','1995-10-19','Active',NULL,NULL,'Staff'),
(161,'fh','62343235383538363735323533336137','Farah','','Hughes','fh@gmail.com','0153381355','Female','1994-08-14','Inactive',NULL,NULL,'Staff'),
(162,'aw0','36336135613633343333393732376236','Acacia','','Wright','aw0@gmail.com','0189784459','Female','1985-01-25','Active',NULL,NULL,'Admin'),
(163,'eh','39363136333637373237323638356137','Euphemia','','Hughes','eh@gmail.com','0554281745','Other','1993-09-06','Active',NULL,NULL,'Staff'),
(164,'gt','34333433343730353937643466363636','Guinevere','','Taylor','gt@gmail.com','0394988292','Male','1985-04-18','Active',NULL,NULL,'Staff'),
(165,'gt0','35333635343735366134313433373235','Guinevere','','Taylor','gt0@gmail.com','0573382895','Female','1988-05-20','Active',NULL,NULL,'Staff'),
(166,'ks','35333133373532356234613634353435','Keisha','','Smith','ks@gmail.com','0395900898','Other','1961-10-13','Active',NULL,NULL,'Staff'),
(167,'cw','39353536363438333935393632363637','Cleopatra','','Wilson','cw@gmail.com','0747973233','Other','1990-02-22','Inactive',NULL,NULL,'Admin'),
(168,'kw','39356434363734373533313739333134','Keisha','','Walker','kw@gmail.com','0591453862','Other','2006-10-25','Active',NULL,NULL,'Staff'),
(169,'bt','36353035323537353035363761373934','Bridget','','Thompson','bt@gmail.com','0331196017','Male','1980-09-29','Active',NULL,NULL,'Staff'),
(170,'kj0','62363835613537356436383634343433','Keisha','','Johnson','kj0@gmail.com','0233430576','Female','1979-03-10','Active',NULL,NULL,'Admin'),
(171,'et','63343636323434373234643633353235','Euphemia','','Thompson','et@gmail.com','0812689492','Other','1990-03-17','Active',NULL,NULL,'Staff'),
(172,'gr','36376636333332373433373639353733','Guinevere','','Roberts','gr@gmail.com','0360345014','Other','1991-06-22','Active',NULL,NULL,'Staff'),
(173,'br','34373734323764363133363534356336','Brenna','','Robinson','br@gmail.com','0209802545','Male','2004-09-30','Active',NULL,NULL,'Staff'),
(174,'gt1','34373334343539343836323361353636','Guinevere','','Taylor','gt1@gmail.com','0295825728','Male','1976-03-16','Active',NULL,NULL,'Staff'),
(175,'at','38373137633638333837343761373933','Acacia','','Thomas','at@gmail.com','0443778969','Female','1970-06-28','Active',NULL,NULL,'Staff'),
(176,'ah','32356137343732376134373734376334','Acacia','','Hughes','ah@gmail.com','0917845600','Other','1980-05-15','Active',NULL,NULL,'Staff'),
(177,'ih','31343835653434373436653635353337','Imelda','','Hall','ih@gmail.com','0751282233','Male','2002-07-20','Active',NULL,NULL,'Staff'),
(178,'ds','34333237323439343937333638353535','Delwyn','','Smith','ds@gmail.com','0471559165','Other','1976-04-27','Active',NULL,NULL,'Staff'),
(179,'de','36366234663431363136353661356137','Delwyn','','Evans','de@gmail.com','0525275736','Male','2009-09-20','Verified',NULL,NULL,'Manager'),
(180,'bw0','38333733363335333433333332333133','Bridget','','Wright','datnhhe150442@fpt.edu.vn','0688163681','Male','1974-08-28','Active',NULL,NULL,'Staff'),
(181,'hpm','38333733363335333433333332333133','Pham','','Hieu','hieupmhe151472@fpt.edu.vn','012345','Male',NULL,NULL,'',NULL,'Staff'),
(186,'sdfas','653636376532353734363536653234373037363630343233363330333133353331333536383634363436393735373836','fasdfasd',NULL,NULL,'huyddhe151062@fpt.edu.vn','0975158137','Male',NULL,NULL,NULL,NULL,'Staff'),
(188,'nghiem','31333133313331333133313331333133','Nghiem','Hoang','Dat','xichmaomega@gmail.com','0972342846','male',NULL,NULL,NULL,NULL,'Staff'),
(190,'hieu',NULL,NULL,NULL,NULL,'dragonranker123@gmail.com','0123123123','Female',NULL,NULL,NULL,NULL,'Staff');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-23 23:05:18
