-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: dkmanagement
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  `role_id` bigint DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `FK_accvsrole_idx` (`role_id`),
  CONSTRAINT `FK_accvsrole` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'longvdh','123456',2,NULL),(2,'huannn','123456',3,NULL),(3,'namvn','123456',2,NULL),(4,'dangnt','123456',3,NULL),(5,'huonghtt','123456',2,NULL),(6,'admin','123456',1,NULL),(7,'user1','123456',3,NULL),(8,'user2','123456',3,NULL);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `action`
--

DROP TABLE IF EXISTS `action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `action` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `actionname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action`
--

LOCK TABLES `action` WRITE;
/*!40000 ALTER TABLE `action` DISABLE KEYS */;
INSERT INTO `action` VALUES (1,'Add members in project '),(2,'Remove members from project '),(3,'Create project '),(4,'Edit project '),(5,'Monitor project progress '),(6,'Accept/Reject plan'),(7,'Create customer requirement list '),(8,'Update customer requirement list '),(9,'Create a plan for project  '),(10,'Update task progress '),(11,'Update task'),(12,'Create sub-task '),(13,'Create account '),(14,'Edit account '),(15,'Search account '),(16,'View account '),(17,'Edit role of account ');
/*!40000 ALTER TABLE `action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allowed_action`
--

DROP TABLE IF EXISTS `allowed_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allowed_action` (
  `role_id` bigint NOT NULL,
  `action_id` bigint NOT NULL,
  PRIMARY KEY (`role_id`,`action_id`),
  KEY `FK_actionvsaa_idx` (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allowed_action`
--

LOCK TABLES `allowed_action` WRITE;
/*!40000 ALTER TABLE `allowed_action` DISABLE KEYS */;
INSERT INTO `allowed_action` VALUES (2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(3,9),(3,10),(3,11),(3,12),(1,13),(1,14),(1,15),(1,16),(1,17);
/*!40000 ALTER TABLE `allowed_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `big_task`
--

DROP TABLE IF EXISTS `big_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `big_task` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `description` varchar(20000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `project_id` bigint DEFAULT NULL,
  `creator` bigint DEFAULT NULL,
  `assigned_to` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_provsphase_idx` (`project_id`),
  KEY `FK_createdby_idx` (`creator`),
  KEY `FK_assignedto_idx` (`assigned_to`),
  CONSTRAINT `FK_assignedto` FOREIGN KEY (`assigned_to`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FK_createdby` FOREIGN KEY (`creator`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FK_provsphase` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `big_task`
--

LOCK TABLES `big_task` WRITE;
/*!40000 ALTER TABLE `big_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `big_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Ngoại thất'),(2,'Nội thất');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(21000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `comment_time` datetime DEFAULT NULL,
  `big_task_id` bigint DEFAULT NULL,
  `task_id` bigint DEFAULT NULL,
  `acc_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_accvscomment_idx` (`acc_id`),
  KEY `FK_phasevscom_idx` (`big_task_id`),
  KEY `FK_taskvscom_idx` (`task_id`),
  CONSTRAINT `FK_accvscomment` FOREIGN KEY (`acc_id`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FK_phasevscom` FOREIGN KEY (`big_task_id`) REFERENCES `big_task` (`id`),
  CONSTRAINT `FK_tvscom` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `cccd` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `id_acc` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_accvsemp_idx` (`id_acc`),
  CONSTRAINT `FK_accvsemp` FOREIGN KEY (`id_acc`) REFERENCES `accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Vũ Đình Hoàng Long',23,'Hải Dương',1,'2000-01-12','12345678909876','longvdhhe141608@fpt.edu.vn','0906153610',1),(2,'Nguyễn Như Huấn',23,'Hà Nội',1,'2000-07-06','12434154567658','huannnhe141550@fpt.edu.vn','0332000229',2),(3,'Hoàng Thị Thu Hương',23,'Nam ĐỊnh',2,'2000-04-20','12569817598733','huonghtthe141616@fpt.edu.vn','0824504462',5);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_and_file`
--

DROP TABLE IF EXISTS `image_and_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image_and_file` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_id` bigint DEFAULT NULL,
  `big_task_id` bigint DEFAULT NULL,
  `task_id` bigint DEFAULT NULL,
  `poster` bigint DEFAULT NULL,
  `file_url` longtext,
  `poster_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_accvsiaf_idx` (`poster`),
  KEY `FK_provsiaf_idx` (`project_id`),
  KEY `FK_phasevsiaf_idx` (`big_task_id`),
  KEY `FK_taskvsiaf_idx` (`task_id`),
  CONSTRAINT `FK_accvsiaf` FOREIGN KEY (`poster`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FK_phasevsiaf` FOREIGN KEY (`big_task_id`) REFERENCES `big_task` (`id`),
  CONSTRAINT `FK_provsiaf` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `FK_taskvsiaf` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_and_file`
--

LOCK TABLES `image_and_file` WRITE;
/*!40000 ALTER TABLE `image_and_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_and_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `detail` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `comment_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_comvsnoti_idx` (`comment_id`),
  CONSTRAINT `FK_comvsnoti` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_name` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `closure_date` date DEFAULT NULL,
  `ended_date` date DEFAULT NULL,
  `creator` bigint DEFAULT NULL,
  `type` bigint DEFAULT NULL,
  `customer_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `customer_address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `customer_phone` varchar(45) DEFAULT NULL,
  `construction_area` bigint DEFAULT NULL,
  `detail` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_catevspro_idx` (`type`),
  KEY `FK_accvspro_idx` (`creator`),
  CONSTRAINT `FK_accvspro` FOREIGN KEY (`creator`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FK_catevspro` FOREIGN KEY (`type`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'Biệt thự nhà dân','2022-02-01','2022-05-20','2022-05-01',1,1,'Phùng Văn Thảo','Khu 6, phường Việt Hòa, tp Hải Dương','0981273645',500,'detail',1),(2,'Biệt thự Vườn Lài','2022-03-01','2022-06-01','2022-05-29',1,2,'Hoàng Thị Thu Hương','Nam Định','0123456789',600,'detail',1),(3,'Tủ bếp Anh Lân','2022-01-01','2022-03-31','2022-03-29',1,2,'Anh Lân','Hà Nội','0987654321',550,'detail',1),(4,'Tủ bếp Anh Đô','2022-09-01','2022-12-01',NULL,1,2,'Anh Đô','Vĩnh Yên','5432167890',575,'detail',2),(5,'Tủ bếp Anh Nguyên','2022-10-15','2023-01-31',NULL,1,2,'Anh Nguyên','Yên Lạc','0981234567',700,'detail',2),(6,'Tủ bếp Anh Phúc','2022-10-30','2023-02-01',NULL,3,2,'Anh Phúc','Lê Văn Thiểm','0876912345',567,'detail',2);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_participation`
--

DROP TABLE IF EXISTS `project_participation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_participation` (
  `project_id` bigint NOT NULL,
  `account_id` bigint NOT NULL,
  `role_id` bigint DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`project_id`,`account_id`),
  KEY `FK_rolevspp_idx` (`role_id`),
  KEY `FK_username_idx` (`account_id`),
  CONSTRAINT `FK_accvspp` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FK_provspp` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `FK_rolevspp` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_participation`
--

LOCK TABLES `project_participation` WRITE;
/*!40000 ALTER TABLE `project_participation` DISABLE KEYS */;
INSERT INTO `project_participation` VALUES (1,1,2,NULL),(1,2,3,NULL),(1,3,3,NULL),(2,1,2,NULL),(2,2,3,NULL),(2,3,3,NULL),(3,1,2,NULL),(3,2,3,NULL),(3,3,3,NULL),(4,1,2,NULL),(4,2,3,NULL),(4,3,3,NULL),(5,1,2,NULL),(5,2,3,NULL),(5,3,3,NULL),(6,1,3,NULL),(6,2,3,NULL),(6,3,2,NULL);
/*!40000 ALTER TABLE `project_participation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requirement`
--

DROP TABLE IF EXISTS `requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requirement` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `requirement_date` date DEFAULT NULL,
  `requirement_detail` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `project_id` bigint DEFAULT NULL,
  `task_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_provsreq_idx` (`project_id`),
  CONSTRAINT `FK_provsreq` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requirement`
--

LOCK TABLES `requirement` WRITE;
/*!40000 ALTER TABLE `requirement` DISABLE KEYS */;
/*!40000 ALTER TABLE `requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin'),(2,'Leader'),(3,'Designer');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `big_task_id` bigint DEFAULT NULL,
  `task_id` bigint DEFAULT NULL,
  `creator` bigint DEFAULT NULL,
  `assignedto` bigint DEFAULT NULL,
  `requirement_id` bigint DEFAULT NULL,
  `task_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `task_status` int DEFAULT NULL,
  `starting_date` date DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `ended_date` date DEFAULT NULL,
  `gallery` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_phasevst_idx` (`big_task_id`),
  KEY `FK_accvst_idx` (`creator`),
  KEY `FK_asignedto_idx` (`assignedto`),
  KEY `FK_tvst_idx` (`task_id`),
  KEY `FK_ofrequirement_idx` (`requirement_id`),
  CONSTRAINT `FK_accvst` FOREIGN KEY (`creator`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FK_assignedto_avt` FOREIGN KEY (`assignedto`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FK_bigtvst` FOREIGN KEY (`big_task_id`) REFERENCES `big_task` (`id`),
  CONSTRAINT `FK_ofrequirement` FOREIGN KEY (`requirement_id`) REFERENCES `requirement` (`id`),
  CONSTRAINT `FK_tvst` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-08  0:30:02
