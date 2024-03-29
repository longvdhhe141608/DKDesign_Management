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
  `status` int DEFAULT NULL,
  `avatar_url` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `FK_accvsrole_idx` (`role_id`),
  KEY `FK_accvsstatus_idx` (`status`),
  CONSTRAINT `FK_accvsrole` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FK_accvsstatus` FOREIGN KEY (`status`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'longvdh','12345678',2,1,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1669391357/image/default/1669391354106-8b99c4c1f4f0c6ac3e657c1e40d9aaaa.jpg.jpg'),(2,'huannn','12345678',3,1,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1669767542/image/default/1669767539166-unnamed_%283%29.png.png'),(3,'namvn','12345678',2,1,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(4,'dangnt','12345678',3,1,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(5,'huonghtt','12345678',2,1,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(6,'admin','12345678',1,1,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(7,'user1','12345678',3,1,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(8,'user2','12345678',3,1,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(9,'user3','12345678',2,1,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(10,'user4','12345678',2,1,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(11,'rita','12345678',2,1,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(12,'winky','12345678',3,1,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(13,'errol','12345678',3,1,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(14,'fawkes','12345678',3,1,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(15,'longtv','12345678',2,1,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(16,'anhhb','12345678',2,1,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(17,'hoavq','12345678',3,1,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(18,'hungdc','12345678',3,1,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(19,'thaonp','12345678',2,1,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(20,'hungnm','12345678',3,1,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(21,'hanhdh','12345678',3,1,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(22,'hieulc','12345678',3,1,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(23,'toanpv','12345678',2,1,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(24,'huynq','12345678',3,1,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(25,'sontb','12345678',3,1,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(26,'hungnn','12345678',2,1,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(27,'tungnq','12345678',3,1,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(28,'longvn','12345678',2,1,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(29,'vuldh1','%k1&9iUaSt',2,1,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(30,'duongvh1','i\"z7HaAC5#',3,1,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(31,'namvn1','R&78ovLK1+',2,1,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(32,'giangph1','+!pHE31F7n',3,1,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(33,'anhnh1','a#OsR8%0xl',3,2,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png'),(34,'longvdh1','%L08C(iZyq',3,2,'https://ssl.gstatic.com/accounts/ui/avatar_2x.png');
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
  `actionname` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
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
  KEY `FK_actionvsaa_idx` (`action_id`),
  CONSTRAINT `FK_action_can` FOREIGN KEY (`action_id`) REFERENCES `action` (`id`),
  CONSTRAINT `FK_role_can` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Thiết kế ngoại thất'),(2,'Thiết kế nội thất'),(3,'Thiết kế ngoại thất + Thiết kế nội thất');
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
  `content` varchar(21000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_time` datetime DEFAULT NULL,
  `task_id` bigint DEFAULT NULL,
  `acc_id` bigint DEFAULT NULL,
  `isPin` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_accvscomment_idx` (`acc_id`),
  KEY `FK_taskvscom_idx` (`task_id`),
  CONSTRAINT `FK_accvscomment` FOREIGN KEY (`acc_id`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FK_tvscom` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'hello','2022-11-18 00:00:00',2,2,_binary ''),(2,'hi','2022-11-18 00:00:00',2,2,_binary ''),(3,'aa','2022-11-18 00:00:00',3,3,NULL),(4,'aa','2022-11-18 00:00:00',2,1,_binary ''),(5,'ccc','2022-11-18 04:16:09',3,1,NULL),(6,'ee','2022-11-18 04:18:30',2,1,_binary ''),(7,'ass','2022-11-18 04:18:38',3,1,NULL),(8,'123','2022-11-20 18:22:40',2,1,_binary '\0'),(9,'aaa123','2022-11-20 18:22:52',2,1,_binary '\0'),(10,'aaa','2022-11-20 18:23:20',2,1,_binary '\0'),(11,'demo123','2022-11-20 18:27:17',2,1,_binary '\0'),(12,'đây là cmt mới','2022-11-20 18:30:43',2,1,_binary '\0'),(13,'ô','2022-11-20 18:41:37',2,1,_binary '\0'),(14,'demo pin','2022-11-20 18:42:21',3,1,_binary ''),(15,'demo không pin','2022-11-20 18:42:34',3,1,_binary '\0'),(16,'demo không pin 2','2022-11-20 18:46:16',3,1,_binary '\0'),(28,'file e nộp bị sai','2022-12-25 21:49:14',138,3,_binary '\0'),(29,'e cần hỗ trợ','2022-12-25 21:50:49',138,2,_binary '\0');
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
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Vũ Đình Hoàng Long',23,'Hải Dương',1,'2000-01-12','123432544656','longvdhhe141608@fpt.edu.vn','0906153610',1),(2,'Nguyễn Như Huấn',23,'Hà Nội',1,'2000-07-06','124341545676','huannnhe141550@fpt.edu.vn','0332000229',2),(3,'Hoàng Thị Thu Hương',23,'Nam Định',2,'2000-04-20','12569817598733','huonghtthe141616@fpt.edu.vn','0824504462',5),(4,'Vũ Nhất Nam',23,'Hà Nội',1,'2000-06-12','020743761045','namvnhe141550@fpt.edu.vn','0796078857',3),(5,'Nguyễn Thế Đăng',23,'Hải Dương',1,'2000-05-20','029122078591','dangnthe140402@fpt.edu.vn','0383842209',4),(6,'Long Đình Hoàng Vũ',NULL,NULL,1,NULL,NULL,'kimitohl1201@gmail.com',NULL,29),(7,'Vũ Hoàng Dương',NULL,NULL,1,NULL,NULL,'naruto@gmail.com',NULL,30),(8,'Vũ Nhất Nam',NULL,NULL,1,NULL,NULL,'nambi2511@gmail.com',NULL,31),(9,'Phạm Huyền Giang',NULL,NULL,1,NULL,NULL,'nihachidesune@gmail.com',NULL,32),(10,'Nguyễn Hoàng Anh',NULL,'',1,NULL,'','thedeng229@gmail.com','',33),(11,'Vũ Đình Hoàng Long',NULL,NULL,NULL,NULL,NULL,'watbdragonhoang1201@gmail.com',NULL,34);
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
  `task_id` bigint DEFAULT NULL,
  `poster` bigint DEFAULT NULL,
  `file_url` longtext,
  `poster_date` date DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_accvsiaf_idx` (`poster`),
  KEY `FK_provsiaf_idx` (`project_id`),
  KEY `FK_taskvsiaf_idx` (`task_id`),
  CONSTRAINT `FK_accvsiaf` FOREIGN KEY (`poster`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FK_provsiaf` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `FK_taskvsiaf` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_and_file`
--

LOCK TABLES `image_and_file` WRITE;
/*!40000 ALTER TABLE `image_and_file` DISABLE KEYS */;
INSERT INTO `image_and_file` VALUES (1,1,3,NULL,'http://res.cloudinary.com/dgbzprb8l/raw/upload/v1669025209/image/default/1669025202168-THE_PROJECT_PROPOSAL_de19e4aac11b44f380f157739e48b60d_1684477_%281%29.docx',NULL,1),(2,1,3,NULL,'http://res.cloudinary.com/dgbzprb8l/raw/upload/v1669025215/image/default/1669025209178-THE_PROJECT_PROPOSAL_de19e4aac11b44f380f157739e48b60d_1684477.docx',NULL,1),(3,9,62,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1669131655/image/default/1669131652626-Screenshot_%28846%29.png.png',NULL,1),(4,9,62,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1669131657/image/default/1669131655830-Screenshot_%28847%29.png.png',NULL,1),(5,9,62,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1669131660/image/default/1669131657985-Screenshot_%28848%29.png.png',NULL,1),(6,9,62,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1669131663/image/default/1669131660581-Screenshot_%28849%29.png.png',NULL,1),(7,9,62,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1669131665/image/default/1669131663526-Screenshot_%28850%29.png.png',NULL,1),(8,9,64,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1669132728/image/default/1669132726032-Capstone_Fa22_G4-SWP493-ERD_Diagram.pdf.pdf',NULL,1),(9,9,NULL,NULL,'http://res.cloudinary.com/dgbzprb8l/raw/upload/v1669420565/image/default/1669420562649-DANH_M%E1%BB%A4C_B%E1%BA%A2N_V%E1%BA%BC.xls',NULL,1),(10,9,81,NULL,'http://res.cloudinary.com/dgbzprb8l/raw/upload/v1669454403/image/default/1669454400580-Y%C3%AAu-c%E1%BA%A7u-c%E1%BB%A7a-kh%C3%A1ch-h%C3%A0ng.docx',NULL,1),(11,9,69,NULL,'http://res.cloudinary.com/dgbzprb8l/raw/upload/v1669465701/image/default/1669465676165-Report2_Project_Management_Plan.docx',NULL,1),(12,9,69,NULL,'http://res.cloudinary.com/dgbzprb8l/raw/upload/v1669465703/image/default/1669465700462-Y%C3%AAu-c%E1%BA%A7u-c%E1%BB%A7a-kh%C3%A1ch-h%C3%A0ng.docx',NULL,1),(13,9,79,NULL,'http://res.cloudinary.com/dgbzprb8l/raw/upload/v1669467272/image/default/1669467267604-Report2_Project_Management_Plan.docx',NULL,1),(14,9,79,NULL,'http://res.cloudinary.com/dgbzprb8l/raw/upload/v1669467274/image/default/1669467271723-SRS.xlsx',NULL,1),(15,9,79,NULL,'http://res.cloudinary.com/dgbzprb8l/raw/upload/v1669467395/image/default/1669467376938-Report2_Project_Management_Plan.docx',NULL,1),(16,9,79,NULL,'http://res.cloudinary.com/dgbzprb8l/raw/upload/v1669467403/image/default/1669467394140-SRS.xlsx',NULL,1),(39,9,69,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1670331380/image/default/1670331376856-317200202_1717074698664656_2438004760145924821_n.jpg.jpg',NULL,1),(40,9,69,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1670331384/image/default/1670331381818-316704243_1552433158502970_5222259926904823006_n.jpg.jpg',NULL,1),(41,9,69,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1670331387/image/default/1670331385747-1670230991094.png.png',NULL,1),(42,9,69,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1670331389/image/default/1670331388069-1670230954885.png.png',NULL,1),(43,9,77,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1670332497/image/default/1670332494218-317200202_1717074698664656_2438004760145924821_n.jpg.jpg',NULL,1),(44,9,77,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1670332502/image/default/1670332498956-316704243_1552433158502970_5222259926904823006_n.jpg.jpg',NULL,1),(45,49,124,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1670341725/image/default/1670341720018-ANH_VI%E1%BB%86T_-_C%E1%BA%A6U_GI%E1%BA%A4Y_%281%29.jpg.jpg',NULL,1),(46,49,124,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1670341730/image/default/1670341726383-ANH_VI%E1%BB%86T_-_C%E1%BA%A6U_GI%E1%BA%A4Y_%282%29.jpg.jpg',NULL,1),(47,49,126,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1670341986/image/default/1670341985226-Chi_ti%E1%BA%BFt_m%E1%BA%B7t_b%E1%BA%B1ng_b%E1%BA%BFp.png.png',NULL,1),(48,49,126,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1670341988/image/default/1670341987201-Chi_ti%E1%BA%BFt_m%E1%BA%B7t_c%E1%BA%AFt_1-1.png.png',NULL,1),(49,49,126,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1670341990/image/default/1670341989484-Chi_ti%E1%BA%BFt_m%E1%BA%B7t_c%E1%BA%AFt_2-2.png.png',NULL,1),(50,49,126,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1670341992/image/default/1670341991559-Chi_ti%E1%BA%BFt_m%E1%BA%AFt_c%E1%BA%AFt_3-3.png.png',NULL,1),(51,49,126,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1670341995/image/default/1670341994084-Chi_ti%E1%BA%BFt_m%E1%BA%B7t_c%E1%BA%AFt_5-5.png.png',NULL,1),(52,49,126,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1670341998/image/default/1670341996520-M%E1%BA%B7t_c%E1%BA%AFt_4-4.png.png',NULL,1),(53,49,NULL,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1670929471/image/default/1670929451645-ANH_VI%E1%BB%86T_-_C%E1%BA%A6U_GI%E1%BA%A4Y_2_%282%29.jpg.jpg',NULL,1),(54,49,NULL,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1670929471/image/default/1670929452626-ANH_VI%E1%BB%86T_-_C%E1%BA%A6U_GI%E1%BA%A4Y_2_%282%29.jpg.jpg',NULL,1),(55,49,NULL,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1670929473/image/default/1670929453538-ANH_VI%E1%BB%86T_-_C%E1%BA%A6U_GI%E1%BA%A4Y_2_%282%29.jpg.jpg',NULL,1),(56,49,NULL,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1670929473/image/default/1670929454521-ANH_VI%E1%BB%86T_-_C%E1%BA%A6U_GI%E1%BA%A4Y_2_%282%29.jpg.jpg',NULL,2),(57,49,NULL,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1670929473/image/default/1670929455313-ANH_VI%E1%BB%86T_-_C%E1%BA%A6U_GI%E1%BA%A4Y_2_%282%29.jpg.jpg',NULL,2),(58,49,NULL,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1670929473/image/default/1670929454991-ANH_VI%E1%BB%86T_-_C%E1%BA%A6U_GI%E1%BA%A4Y_2_%282%29.jpg.jpg',NULL,2),(59,49,NULL,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1670929473/image/default/1670929454539-ANH_VI%E1%BB%86T_-_C%E1%BA%A6U_GI%E1%BA%A4Y_2_%282%29.jpg.jpg',NULL,2),(60,49,NULL,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1670929761/image/default/1670929757558-ANH_VI%E1%BB%86T_-_C%E1%BA%A6U_GI%E1%BA%A4Y_2_%282%29.jpg.jpg',NULL,2),(61,51,132,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1671902346/image/default/1671902341883-ANH_VI%E1%BB%86T_-_C%E1%BA%A6U_GI%E1%BA%A4Y_%281%29.jpg.jpg',NULL,2),(62,51,132,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1671902350/image/default/1671902346479-ANH_VI%E1%BB%86T_-_C%E1%BA%A6U_GI%E1%BA%A4Y_%282%29.jpg.jpg',NULL,2),(63,51,132,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1671902369/image/default/1671902365552-ANH_VI%E1%BB%86T_-_C%E1%BA%A6U_GI%E1%BA%A4Y_%281%29.jpg.jpg',NULL,2),(64,51,132,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1671902566/image/default/1671902562433-ANH_VI%E1%BB%86T_-_C%E1%BA%A6U_GI%E1%BA%A4Y_2_%281%29.jpg.jpg',NULL,1),(65,51,132,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1671902569/image/default/1671902566341-ANH_VI%E1%BB%86T_-_C%E1%BA%A6U_GI%E1%BA%A4Y_2_%282%29.jpg.jpg',NULL,1),(66,51,132,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1671902582/image/default/1671902578567-ANH_VI%E1%BB%86T_-_C%E1%BA%A6U_GI%E1%BA%A4Y_2_%281%29.jpg.jpg',NULL,1),(67,51,134,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1671902949/image/default/1671902947756-Chi_ti%E1%BA%BFt_m%E1%BA%B7t_b%E1%BA%B1ng_b%E1%BA%BFp.png.png',NULL,1),(68,51,134,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1671902951/image/default/1671902949775-Chi_ti%E1%BA%BFt_m%E1%BA%B7t_c%E1%BA%AFt_1-1.png.png',NULL,1),(69,51,134,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1671902954/image/default/1671902951908-Chi_ti%E1%BA%BFt_m%E1%BA%B7t_c%E1%BA%AFt_2-2.png.png',NULL,1),(70,51,134,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1671902956/image/default/1671902953969-Chi_ti%E1%BA%BFt_m%E1%BA%AFt_c%E1%BA%AFt_3-3.png.png',NULL,1),(71,51,134,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1671902958/image/default/1671902956002-Chi_ti%E1%BA%BFt_m%E1%BA%B7t_c%E1%BA%AFt_5-5.png.png',NULL,1),(72,51,134,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1671902961/image/default/1671902958590-M%E1%BA%B7t_c%E1%BA%AFt_4-4.png.png',NULL,1),(73,52,138,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1671979037/image/default/1671979032790-ANH_VI%E1%BB%86T_-_C%E1%BA%A6U_GI%E1%BA%A4Y_%281%29.jpg.jpg',NULL,2),(74,52,138,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1671979043/image/default/1671979039902-ANH_VI%E1%BB%86T_-_C%E1%BA%A6U_GI%E1%BA%A4Y_%282%29.jpg.jpg',NULL,2),(75,52,138,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1671979188/image/default/1671979184757-ANH_VI%E1%BB%86T_-_C%E1%BA%A6U_GI%E1%BA%A4Y_2_%281%29.jpg.jpg',NULL,1),(76,52,138,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1671979193/image/default/1671979189933-ANH_VI%E1%BB%86T_-_C%E1%BA%A6U_GI%E1%BA%A4Y_2_%282%29.jpg.jpg',NULL,1),(77,52,139,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1671979299/image/default/1671979295810-Chi_ti%E1%BA%BFt_m%E1%BA%B7t_b%E1%BA%B1ng_b%E1%BA%BFp.png.png',NULL,1),(78,52,139,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1671979301/image/default/1671979299980-Chi_ti%E1%BA%BFt_m%E1%BA%B7t_c%E1%BA%AFt_1-1.png.png',NULL,1),(79,52,139,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1671979304/image/default/1671979302626-Chi_ti%E1%BA%BFt_m%E1%BA%B7t_c%E1%BA%AFt_2-2.png.png',NULL,1),(80,52,139,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1671979306/image/default/1671979305156-Chi_ti%E1%BA%BFt_m%E1%BA%AFt_c%E1%BA%AFt_3-3.png.png',NULL,1),(81,52,139,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1671979309/image/default/1671979307634-Chi_ti%E1%BA%BFt_m%E1%BA%B7t_c%E1%BA%AFt_5-5.png.png',NULL,1),(82,52,139,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1671979312/image/default/1671979310741-M%E1%BA%B7t_c%E1%BA%AFt_4-4.png.png',NULL,1),(83,53,142,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1672049255/image/default/1672049240039-ANH_VI%E1%BB%86T_-_C%E1%BA%A6U_GI%E1%BA%A4Y_%281%29.jpg.jpg',NULL,2),(84,53,142,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1672049272/image/default/1672049256792-ANH_VI%E1%BB%86T_-_C%E1%BA%A6U_GI%E1%BA%A4Y_%282%29.jpg.jpg',NULL,2),(85,53,142,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1672049413/image/default/1672049410080-ANH_VI%E1%BB%86T_-_C%E1%BA%A6U_GI%E1%BA%A4Y_2_%281%29.jpg.jpg',NULL,1),(86,53,142,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1672049417/image/default/1672049413947-ANH_VI%E1%BB%86T_-_C%E1%BA%A6U_GI%E1%BA%A4Y_2_%282%29.jpg.jpg',NULL,1),(87,53,144,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1672049641/image/default/1672049640032-Chi_ti%E1%BA%BFt_m%E1%BA%B7t_b%E1%BA%B1ng_b%E1%BA%BFp.png.png',NULL,1),(88,53,144,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1672049643/image/default/1672049641963-Chi_ti%E1%BA%BFt_m%E1%BA%B7t_c%E1%BA%AFt_1-1.png.png',NULL,1),(89,53,144,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1672049645/image/default/1672049644120-Chi_ti%E1%BA%BFt_m%E1%BA%B7t_c%E1%BA%AFt_2-2.png.png',NULL,1),(90,49,145,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1672071911/image/default/1672071907395-ANH_VI%E1%BB%86T_-_C%E1%BA%A6U_GI%E1%BA%A4Y_%281%29.jpg.jpg',NULL,2),(91,49,145,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1672071915/image/default/1672071911966-ANH_VI%E1%BB%86T_-_C%E1%BA%A6U_GI%E1%BA%A4Y_%282%29.jpg.jpg',NULL,2),(92,49,145,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1672071984/image/default/1672071981958-ANH_VI%E1%BB%86T_-_C%E1%BA%A6U_GI%E1%BA%A4Y_2_%281%29.jpg.jpg',NULL,1),(93,49,145,NULL,'http://res.cloudinary.com/dgbzprb8l/image/upload/v1672071989/image/default/1672071985786-ANH_VI%E1%BB%86T_-_C%E1%BA%A6U_GI%E1%BA%A4Y_2_%282%29.jpg.jpg',NULL,1);
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
  `detail` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_id` bigint DEFAULT NULL,
  `project_id` bigint DEFAULT NULL,
  `url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_noti_of_idx` (`account_id`),
  KEY `FK_noti_in_idx` (`project_id`),
  CONSTRAINT `FK_noti_in` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `FK_noti_of` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (142,'2022-12-25 00:11:01','Bạn đã được thêm vào dự án',2,51,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=51'),(143,'2022-12-25 00:11:08','Bạn đã được thêm vào dự án',3,51,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=51'),(144,'2022-12-25 00:12:42','Bạn có công việc được giao',2,51,'http://localhost:8080/DkDesignManagement_war/design/task/view-detail-task?project-id=51&section-id=28&task-id=131'),(145,'2022-12-25 00:13:32','Bạn có sub-task trong dự án đến ngày hết hạn',2,1,'http://localhost:8080/DkDesignManagement_war/design/sub-task/view-sub-task-detail?project-id=1&section-id=1&task-id=2&sub-task-id=4'),(146,'2022-12-25 00:14:34','Bạn có sub-task Chưa phê duyệt',1,51,'http://localhost:8080/DkDesignManagement_war/subtask?taskId=132'),(147,'2022-12-25 00:15:30','Sub-task của bạn đã được phê duyệt',2,51,'http://localhost:8080/DkDesignManagement_war/design/sub-task/view-sub-task-detail?project-id=51&section-id=28&task-id=131&sub-task-id=132'),(148,'2022-12-25 00:19:58','Bạn có sub-task Chờ phê duyệt',1,51,'http://localhost:8080/DkDesignManagement_war/subtask?taskId=132'),(149,'2022-12-25 00:21:37','Sub-task của bạn không được phê duyệt và trở về trạng thái đang thực hiện',2,51,'http://localhost:8080/DkDesignManagement_war/design/sub-task/view-sub-task-detail?project-id=51&section-id=28&task-id=131&sub-task-id=132'),(150,'2022-12-25 00:23:06','Bạn có sub-task Chờ phê duyệt',1,51,'http://localhost:8080/DkDesignManagement_war/subtask?taskId=132'),(151,'2022-12-25 00:23:28','Sub-task của bạn được phê duyệt và đã hoàn thành',2,51,'http://localhost:8080/DkDesignManagement_war/design/sub-task/view-sub-task-detail?project-id=51&section-id=28&task-id=131&sub-task-id=132'),(152,'2022-12-25 00:27:04','Bạn có công việc được giao',3,51,'http://localhost:8080/DkDesignManagement_war/design/task/view-detail-task?project-id=51&section-id=29&task-id=133'),(153,'2022-12-25 00:30:02','Bạn có sub-task Chờ phê duyệt',1,51,'http://localhost:8080/DkDesignManagement_war/subtask?taskId=134'),(154,'2022-12-25 00:30:22','Sub-task của bạn được phê duyệt và đã hoàn thành',3,51,'http://localhost:8080/DkDesignManagement_war/design/sub-task/view-sub-task-detail?project-id=51&section-id=29&task-id=133&sub-task-id=134'),(155,'2022-12-25 00:30:55','Yêu cầu của khách hàng đã bị sửa',2,51,'http://localhost:8080/DkDesignManagement_war/design/requirement/view-requirement?project-id=51'),(156,'2022-12-25 00:30:55','Yêu cầu của khách hàng đã bị sửa',3,51,'http://localhost:8080/DkDesignManagement_war/design/requirement/view-requirement?project-id=51'),(157,'2022-12-25 00:34:38','Bạn có sub-task Chờ phê duyệt',1,51,'http://localhost:8080/DkDesignManagement_war/subtask?taskId=134'),(158,'2022-12-25 00:34:47','Sub-task của bạn được phê duyệt và đã hoàn thành',3,51,'http://localhost:8080/DkDesignManagement_war/design/sub-task/view-sub-task-detail?project-id=51&section-id=29&task-id=133&sub-task-id=134'),(159,'2022-12-25 02:17:26','Bạn có công việc được giao',1,49,'http://localhost:8080/DkDesignManagement_war/design/task/view-detail-task?project-id=49&section-id=20&task-id=135'),(160,'2022-12-25 21:32:44','Bạn đã được thêm vào dự án',2,52,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=52'),(161,'2022-12-25 21:32:50','Bạn đã được thêm vào dự án',3,52,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=52'),(162,'2022-12-25 21:33:10','Bạn đã được thêm vào dự án',4,52,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=52'),(163,'2022-12-25 21:33:12','Bạn đã bị xóa ra khỏi dự án Phòng bếp Anh Việt – Cầu Giấy',4,52,'http://localhost:8080/DkDesignManagement_war/notification'),(164,'2022-12-25 21:34:24','Bạn có công việc được giao',2,52,'http://localhost:8080/DkDesignManagement_war/design/task/view-detail-task?project-id=52&section-id=30&task-id=136'),(165,'2022-12-25 21:35:13','Bạn có công việc được giao',3,52,'http://localhost:8080/DkDesignManagement_war/design/task/view-detail-task?project-id=52&section-id=31&task-id=137'),(166,'2022-12-25 21:36:18','Bạn có sub-task Chưa phê duyệt',1,52,'http://localhost:8080/DkDesignManagement_war/subtask?taskId=138'),(167,'2022-12-25 21:36:45','Sub-task của bạn đã được phê duyệt',2,52,'http://localhost:8080/DkDesignManagement_war/design/sub-task/view-sub-task-detail?project-id=52&section-id=30&task-id=136&sub-task-id=138'),(168,'2022-12-25 21:37:55','Bạn có sub-task Chờ phê duyệt',1,52,'http://localhost:8080/DkDesignManagement_war/subtask?taskId=138'),(169,'2022-12-25 21:38:59','Sub-task của bạn không được phê duyệt và trở về trạng thái đang thực hiện',2,52,'http://localhost:8080/DkDesignManagement_war/design/sub-task/view-sub-task-detail?project-id=52&section-id=30&task-id=136&sub-task-id=138'),(170,'2022-12-25 21:40:01','Bạn có sub-task Chờ phê duyệt',1,52,'http://localhost:8080/DkDesignManagement_war/subtask?taskId=138'),(171,'2022-12-25 21:40:18','Sub-task của bạn được phê duyệt và đã hoàn thành',2,52,'http://localhost:8080/DkDesignManagement_war/design/sub-task/view-sub-task-detail?project-id=52&section-id=30&task-id=136&sub-task-id=138'),(172,'2022-12-25 21:41:59','Bạn có sub-task Chờ phê duyệt',1,52,'http://localhost:8080/DkDesignManagement_war/subtask?taskId=139'),(173,'2022-12-25 21:42:40','Sub-task của bạn được phê duyệt và đã hoàn thành',3,52,'http://localhost:8080/DkDesignManagement_war/design/sub-task/view-sub-task-detail?project-id=52&section-id=31&task-id=137&sub-task-id=139'),(174,'2022-12-25 21:43:11','Yêu cầu của khách hàng đã bị sửa',2,52,'http://localhost:8080/DkDesignManagement_war/design/requirement/view-requirement?project-id=52'),(175,'2022-12-25 21:43:11','Yêu cầu của khách hàng đã bị sửa',3,52,'http://localhost:8080/DkDesignManagement_war/design/requirement/view-requirement?project-id=52'),(176,'2022-12-25 21:44:21','Bạn có sub-task Chờ phê duyệt',1,52,'http://localhost:8080/DkDesignManagement_war/subtask?taskId=138'),(177,'2022-12-25 21:44:31','Bạn có sub-task Chờ phê duyệt',1,52,'http://localhost:8080/DkDesignManagement_war/subtask?taskId=139'),(178,'2022-12-25 21:44:40','Sub-task của bạn được phê duyệt và đã hoàn thành',2,52,'http://localhost:8080/DkDesignManagement_war/design/sub-task/view-sub-task-detail?project-id=52&section-id=30&task-id=136&sub-task-id=138'),(179,'2022-12-25 21:44:44','Sub-task của bạn được phê duyệt và đã hoàn thành',3,52,'http://localhost:8080/DkDesignManagement_war/design/sub-task/view-sub-task-detail?project-id=52&section-id=31&task-id=137&sub-task-id=139'),(180,'2022-12-25 21:49:14','namvn đã bình luận về sub-task : Phác thảo ý tưởng',1,52,'http://localhost:8080/DkDesignManagement_war/subtask?taskId=138'),(181,'2022-12-25 21:49:14','namvn đã bình luận về sub-task : Phác thảo ý tưởng',2,52,'http://localhost:8080/DkDesignManagement_war/subtask?taskId=138'),(182,'2022-12-25 21:50:49','huannn đã bình luận về sub-task : Phác thảo ý tưởng',1,52,'http://localhost:8080/DkDesignManagement_war/subtask?taskId=138'),(183,'2022-12-25 21:55:18','Bạn đã được thêm vào dự án',4,49,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=49'),(184,'2022-12-25 21:55:30','Bạn đã bị xóa ra khỏi dự án Phòng bếp Anh Việt – Cầu Giấy',3,49,'http://localhost:8080/DkDesignManagement_war/notification'),(185,'2022-12-25 22:11:05','Bạn có sub-task Chưa phê duyệt',1,49,'http://localhost:8080/DkDesignManagement_war/subtask?taskId=140'),(186,'2022-12-25 22:13:56','Bạn có sub-task trong dự án đến ngày hết hạn',2,49,'http://localhost:8080/DkDesignManagement_war/design/sub-task/view-sub-task-detail?project-id=49&section-id=19&task-id=123&sub-task-id=140'),(187,'2022-12-26 17:02:09','Bạn đã được thêm vào dự án',2,53,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=53'),(188,'2022-12-26 17:02:19','Bạn đã được thêm vào dự án',3,53,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=53'),(189,'2022-12-26 17:02:43','Bạn đã được thêm vào dự án',4,53,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=53'),(190,'2022-12-26 17:03:44','Bạn có công việc được giao',2,53,'http://localhost:8080/DkDesignManagement_war/design/task/view-detail-task?project-id=53&section-id=32&task-id=141'),(191,'2022-12-26 17:05:55','Bạn có sub-task Chưa phê duyệt',1,53,'http://localhost:8080/DkDesignManagement_war/subtask?taskId=142'),(192,'2022-12-26 17:06:23','Sub-task của bạn đã được phê duyệt',2,53,'http://localhost:8080/DkDesignManagement_war/design/sub-task/view-sub-task-detail?project-id=53&section-id=32&task-id=141&sub-task-id=142'),(193,'2022-12-26 17:08:34','Bạn có sub-task Chờ phê duyệt',1,53,'http://localhost:8080/DkDesignManagement_war/subtask?taskId=142'),(194,'2022-12-26 17:09:09','Sub-task của bạn không được phê duyệt và trở về trạng thái đang thực hiện',2,53,'http://localhost:8080/DkDesignManagement_war/design/sub-task/view-sub-task-detail?project-id=53&section-id=32&task-id=141&sub-task-id=142'),(195,'2022-12-26 17:10:31','Bạn có sub-task Chờ phê duyệt',1,53,'http://localhost:8080/DkDesignManagement_war/subtask?taskId=142'),(196,'2022-12-26 17:10:41','Bạn có sub-task trong dự án đến ngày hết hạn',1,1,'http://localhost:8080/DkDesignManagement_war/subtask?taskId=4'),(197,'2022-12-26 17:10:41','Bạn có sub-task trong dự án đến ngày hết hạn',1,49,'http://localhost:8080/DkDesignManagement_war/subtask?taskId=140'),(198,'2022-12-26 17:11:08','Sub-task của bạn được phê duyệt và đã hoàn thành',2,53,'http://localhost:8080/DkDesignManagement_war/design/sub-task/view-sub-task-detail?project-id=53&section-id=32&task-id=141&sub-task-id=142'),(199,'2022-12-26 17:12:08','Bạn có công việc được giao',3,53,'http://localhost:8080/DkDesignManagement_war/design/task/view-detail-task?project-id=53&section-id=33&task-id=143'),(200,'2022-12-26 17:14:17','Bạn có sub-task Chờ phê duyệt',1,53,'http://localhost:8080/DkDesignManagement_war/subtask?taskId=144'),(201,'2022-12-26 17:14:31','Sub-task của bạn được phê duyệt và đã hoàn thành',3,53,'http://localhost:8080/DkDesignManagement_war/design/sub-task/view-sub-task-detail?project-id=53&section-id=33&task-id=143&sub-task-id=144'),(202,'2022-12-26 17:14:46','Yêu cầu của khách hàng đã bị sửa',2,53,'http://localhost:8080/DkDesignManagement_war/design/requirement/view-requirement?project-id=53'),(203,'2022-12-26 17:14:46','Yêu cầu của khách hàng đã bị sửa',3,53,'http://localhost:8080/DkDesignManagement_war/design/requirement/view-requirement?project-id=53'),(204,'2022-12-26 17:15:41','Bạn có sub-task Chờ phê duyệt',1,53,'http://localhost:8080/DkDesignManagement_war/subtask?taskId=142'),(205,'2022-12-26 17:15:53','Bạn có sub-task Chờ phê duyệt',1,53,'http://localhost:8080/DkDesignManagement_war/subtask?taskId=144'),(206,'2022-12-26 17:16:03','Sub-task của bạn được phê duyệt và đã hoàn thành',3,53,'http://localhost:8080/DkDesignManagement_war/design/sub-task/view-sub-task-detail?project-id=53&section-id=33&task-id=143&sub-task-id=144'),(207,'2022-12-26 17:16:07','Sub-task của bạn được phê duyệt và đã hoàn thành',2,53,'http://localhost:8080/DkDesignManagement_war/design/sub-task/view-sub-task-detail?project-id=53&section-id=32&task-id=141&sub-task-id=142'),(208,'2022-12-26 22:50:26','Bạn đã bị xóa ra khỏi dự án Phòng bếp Anh Việt – Cầu Giấy',2,49,'http://localhost:8080/DkDesignManagement_war/notification'),(209,'2022-12-26 23:25:19','Bạn có sub-task Chờ phê duyệt',1,49,'http://localhost:8080/DkDesignManagement_war/subtask?taskId=145'),(210,'2022-12-26 23:25:38','Sub-task của bạn không được phê duyệt và trở về trạng thái đang thực hiện',2,49,'http://localhost:8080/DkDesignManagement_war/design/sub-task/view-sub-task-detail?project-id=49&section-id=19&task-id=123&sub-task-id=145'),(211,'2022-12-26 23:26:33','Bạn có sub-task Chờ phê duyệt',1,49,'http://localhost:8080/DkDesignManagement_war/subtask?taskId=145'),(212,'2022-12-26 23:26:47','Sub-task của bạn được phê duyệt và đã hoàn thành',2,49,'http://localhost:8080/DkDesignManagement_war/design/sub-task/view-sub-task-detail?project-id=49&section-id=19&task-id=123&sub-task-id=145'),(213,'2022-12-27 21:46:19','Bạn đã bị xóa ra khỏi dự án Phòng bếp Anh Việt – Cầu Giấy',2,49,'http://localhost:8080/DkDesignManagement_war/notification'),(214,'2022-12-27 21:48:55','Dự án Phòng bếp Anh Việt – Cầu Giấy đã thay đổi trạng thái Đang thực hiện -> Đang bàn giao ',2,49,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=49'),(215,'2022-12-27 21:48:55','Dự án Phòng bếp Anh Việt – Cầu Giấy đã thay đổi trạng thái Đang thực hiện -> Đang bàn giao ',3,49,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=49'),(216,'2022-12-27 21:48:55','Dự án Phòng bếp Anh Việt – Cầu Giấy đã thay đổi trạng thái Đang thực hiện -> Đang bàn giao ',4,49,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=49'),(217,'2022-12-28 01:16:40','Bạn đã được thêm vào dự án',2,10,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=10'),(218,'2022-12-28 01:16:45','Bạn đã được thêm vào dự án',3,10,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=10'),(219,'2022-12-28 01:16:57','Bạn đã được thêm vào dự án',2,12,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=12'),(220,'2022-12-28 01:17:01','Bạn đã được thêm vào dự án',4,12,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=12'),(221,'2022-12-28 01:17:13','Bạn đã được thêm vào dự án',2,11,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=11'),(222,'2022-12-28 01:17:17','Bạn đã được thêm vào dự án',5,11,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=11'),(223,'2022-12-28 01:17:20','Bạn đã được thêm vào dự án',3,11,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=11'),(224,'2022-12-28 01:17:24','Bạn đã được thêm vào dự án',4,11,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=11'),(225,'2022-12-28 02:37:58','Dự án Phòng bếp Anh Việt – Cầu Giấy đã thay đổi trạng thái Đang bàn giao -> Đang thực hiện ',2,49,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=49'),(226,'2022-12-28 02:37:58','Dự án Phòng bếp Anh Việt – Cầu Giấy đã thay đổi trạng thái Đang bàn giao -> Đang thực hiện ',3,49,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=49'),(227,'2022-12-28 02:37:58','Dự án Phòng bếp Anh Việt – Cầu Giấy đã thay đổi trạng thái Đang bàn giao -> Đang thực hiện ',4,49,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=49'),(228,'2022-12-28 03:07:52','Bạn đã được thêm vào dự án',4,5,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=5'),(229,'2022-12-28 03:15:42','Bạn đã được thêm vào dự án',3,12,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=12'),(230,'2022-12-28 03:25:21','Dự án Phòng bếp Anh Việt 1 – Cầu Giấy đã thay đổi trạng thái Đang thực hiện -> Đang bàn giao ',2,49,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=49'),(231,'2022-12-28 03:25:21','Dự án Phòng bếp Anh Việt 1 – Cầu Giấy đã thay đổi trạng thái Đang thực hiện -> Đang bàn giao ',3,49,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=49'),(232,'2022-12-28 03:25:21','Dự án Phòng bếp Anh Việt 1 – Cầu Giấy đã thay đổi trạng thái Đang thực hiện -> Đang bàn giao ',4,49,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=49'),(233,'2022-12-28 09:35:31','Dự án Phòng bếp Anh Việt 1 – Cầu Giấy đã thay đổi trạng thái Đang bàn giao -> Đang thực hiện ',2,49,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=49'),(234,'2022-12-28 09:35:31','Dự án Phòng bếp Anh Việt 1 – Cầu Giấy đã thay đổi trạng thái Đang bàn giao -> Đang thực hiện ',3,49,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=49'),(235,'2022-12-28 09:35:31','Dự án Phòng bếp Anh Việt 1 – Cầu Giấy đã thay đổi trạng thái Đang bàn giao -> Đang thực hiện ',4,49,'http://localhost:8080/DkDesignManagement_war/design/project/summary?id=49'),(236,'2022-12-28 09:35:36','Bạn đã bị xóa ra khỏi dự án Phòng bếp Anh Việt 1 – Cầu Giấy',2,49,'http://localhost:8080/DkDesignManagement_war/notification'),(237,'2022-12-28 09:35:40','Bạn đã bị xóa ra khỏi dự án Phòng bếp Anh Việt 1 – Cầu Giấy',2,49,'http://localhost:8080/DkDesignManagement_war/notification'),(238,'2022-12-28 09:36:07','Bạn đã bị xóa ra khỏi dự án Phòng bếp Anh Việt 1 – Cầu Giấy',2,49,'http://localhost:8080/DkDesignManagement_war/notification'),(239,'2022-12-28 16:55:21','Bạn có công việc được giao',2,49,'http://localhost:8080/DkDesignManagement_war/design/task/view-detail-task?project-id=49&section-id=20&task-id=156');
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
  `project_name` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `closure_date` date DEFAULT NULL,
  `ended_date` date DEFAULT NULL,
  `creator` bigint DEFAULT NULL,
  `type` bigint DEFAULT NULL,
  `customer_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `customer_address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `customer_phone` varchar(45) DEFAULT NULL,
  `construction_area` bigint DEFAULT NULL,
  `detail` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `expected_cost` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_catevspro_idx` (`type`),
  KEY `FK_accvspro_idx` (`creator`),
  KEY `FK_provssta_idx` (`status`),
  CONSTRAINT `FK_accvspro` FOREIGN KEY (`creator`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FK_catevspro` FOREIGN KEY (`type`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_provssta` FOREIGN KEY (`status`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'Biệt thự nhà dân','2022-02-01','2022-05-20','2022-05-15',1,1,'Phùng Văn Thảo','Khu 6, phường Việt Hòa, tp Hải Dương','0981273645',600,'đẹp',3,200000000000),(2,'Biệt thự Vườn Lài','2022-03-01','2022-06-01','2022-05-29',1,2,'Hoàng Thị Thu Hương','Nam Định','0123456789',600,'detail',3,250000000000),(3,'Tủ bếp Anh Lân','2022-01-01','2022-03-31','2022-03-29',1,2,'Anh Lân','Hà Nội','0987654321',550,'detail',3,30000000),(4,'Tủ bếp Anh Đô','2022-09-01','2022-12-01',NULL,1,2,'Anh Đô','Vĩnh Yên','5432167890',575,'detail',1,25000000),(5,'Tủ bếp Anh Nguyên','2022-10-15','2023-01-31',NULL,1,2,'Anh Nguyên','Yên Lạc','0981234567',700,'detail',4,50000000),(6,'Tủ bếp Anh Phúc','2022-10-30','2023-02-01',NULL,3,2,'Anh Phúc','Lê Văn Thiểm','0876912345',50,'Thích sự giản dị và thoáng mát',1,40000000),(9,'Biệt thự Hoàng Long - Hải Dương','2022-12-09','2023-12-01',NULL,1,1,'Hoàng Long','Hải Dương','0906153610',650,'Chủ nhà tuổi Mão, mệnh Thổ, thích sự yên tĩnh và giản dị',4,35000000000),(10,'Phòng ăn hạng nhất','2022-11-10','2022-11-30',NULL,1,1,'Hoàng Long','Hải Dương','0906153610',40,NULL,4,75000000),(11,'Nhà ở hạng thường','2022-11-10','2023-01-03',NULL,1,1,'Hoàng Long','Hải Dương','0906153610',200,'đẹp',4,10000000000),(12,'Biệt thự nhà vườn Đại Lải','2022-12-10','2023-12-31',NULL,1,1,'Hoàng Long','Hà Nội','1234567890',500,'phải to',1,500000000000),(30,'Tủ bếp Anh Sơn','2022-05-01','2022-07-01','2022-06-25',3,2,'Anh Sơn','Smart City','0998978767',20,NULL,3,60000000),(31,'Tủ bếp Anh Việt','2022-04-12','2022-06-01','2022-05-29',5,2,'Nguyễn Quốc Việt','126 Trung Kính, phường Trung Hòa, quận Cầu Giấy, Hà Nội','0878560637',21,NULL,3,50000000),(32,'Tủ bếp Chi Trinh','2022-03-10','2022-06-01','2022-04-30',9,2,'Võ Thụy Trinh','B13-F4, T111, Hoàng Cầu, Đống Đa, Hà Nội','0761093246',23,NULL,3,30000000),(33,'Tủ bếp Chị Hải','2022-02-28','2022-04-01','2022-03-24',3,2,'Hoàng Bích Hải','431 Âu Cơ, quận Tây Hồ, Hà Nội','0302864170',19,NULL,3,40000000),(34,'Tủ bếp Chị Hạnh','2022-01-15','2022-03-01','2022-02-20',5,2,'Phùng Hiếu Hạnh','Ngõ 131 Thái Hà, Đống Đa, Hà Nội','0309360346',25,NULL,3,50000000),(35,'Tủ bếp Chi Hoa','2021-12-14','2022-02-01','2022-01-15',9,2,'Uất Quỳnh Hoa','5 ngõ Kim Mã Thượng, phường Cống Vị, Hà Nội','0566242717',30,NULL,3,70000000),(36,'Tủ bếp Chị Hương','2021-11-02','2022-01-31','2022-01-15',1,2,'Hồ Đinh Hương','Tầng 4, 777 Giải Phóng, phường Giáp Bát, quận Hai Bà Trưng, Hà Nội','0885013307',20,NULL,3,55000000),(37,'Tủ bếp Chị Lan','2021-10-20','2021-12-31','2021-12-20',1,2,'Đỗ Dạ Lan','Số 1 Đào Duy Anh, Đống Đa, Hà Nội','0994276242',26,NULL,3,50000000),(38,'Tủ bếp Chị Linh','2021-09-30','2021-11-01','2021-10-18',1,2,'Thân Đan Linh','Số 49 Nguyễn Thái Học, Sơn Tây, Hà Nội','0898156100',21,NULL,3,30000000),(39,'Tủ bếp Chị Loan','2021-09-10','2021-11-30','2021-12-01',9,2,'Lâm Bích Loan','Thôn Nghĩa Đạo,  Thuận Thành, Bắc Ninh','0780689392',22,NULL,3,40000000),(40,'Biệt thự HHH','2023-01-25','2023-04-25',NULL,1,1,'Huỳnh Trung Hải','Tiên Phương, Chương Mỹ, Hà Nội','0332000229',250,'Phong cách biệt thự hiện đại 3 tầng',1,2000000000),(41,'Nhà ở 2000','2022-11-26','2023-03-26',NULL,1,1,'Vũ Đình Chín','Số 10, ngách 41, ngõ 44, phố Quan Thánh, Hải Dương','0906153610',300,'Phong cách nhà ở hiện đại 3 tầng, gia chủ mệnh thổ, thích sự giản dị, hợp vs hướng đông đông nam',1,10000000000),(42,'Tủ bếp chị Nga','2022-11-26','2022-12-26',NULL,1,2,'Võ Khánh Nga','240 Nguyễn Đình Chính, Phường 11, Phú Nhuận, Hồ Chí Minh','0901379006',50,'Gia chủ mệnh thủy, muốn theo phong cách hiện đại',1,50000000),(48,'Phòng bếp Anh Việt – Cầu Giấy','2023-01-01','2023-08-01',NULL,1,2,'Nguyễn Hồng Việt','Căn 602N13, Khu Tài Đình Cư, P. Dịch Vọng, Cầu Giấy, Hà Nội','0830303755',25,'chủ nhà mệnh thủy, thích sự sạch sẽ thoáng mát',4,70000000),(49,'Phòng bếp Anh Việt 1 – Cầu Giấy','2023-01-01','2023-02-01',NULL,1,2,'Nguyễn Hồng Việt','Căn 602N13, Khu Tài Đình Cư, P. Dịch Vọng, Cầu Giấy, Hà Nội','0830303755',30,'chủ nhà mệnh thủy, thích sự sạch sẽ thoáng mát',1,70000000),(50,'Biệt thự HHH','2022-12-07','2023-06-01',NULL,1,1,'Huỳnh Trung Hải','Tiên Phương, Chương Mỹ, Hà Nội','0332000229',250,'abc',4,2000000000),(51,'Phòng bếp Anh Việt – Cầu Giấy','2023-01-01','2023-02-01','2022-12-25',1,2,'Nguyễn Hồng Việt','Căn 602N13, Khu Tài Đình Cư, P. Dịch Vọng, Cầu Giấy, Hà Nội','0830303755',25,'chủ nhà mệnh thủy, thích sự sạch sẽ thoáng mát',3,70000000),(52,'Phòng bếp Anh Việt – Cầu Giấy','2023-01-01','2023-02-01','2022-12-25',1,2,'Nguyễn Hồng Việt','Căn 602N13, Khu Tài Đình Cư, P. Dịch Vọng, Cầu Giấy, Hà Nội','0830303755',30,'chủ nhà mệnh thủy, thích sự sạch sẽ thoáng mát',3,70000000),(53,'Phòng bếp Anh Việt – Cầu Giấy','2023-01-01','2023-02-01','2022-12-26',1,2,'Nguyễn Hồng Việt','Căn 602N13, Khu Tài Đình Cư, P. Dịch Vọng, Cầu Giấy, Hà Nội','0830303755',30,'chủ nhà mệnh thủy, thích sự sạch sẽ thoáng mát',4,70000000);
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
  `status` int DEFAULT NULL,
  PRIMARY KEY (`project_id`,`account_id`),
  KEY `FK_rolevspp_idx` (`role_id`),
  KEY `FK_username_idx` (`account_id`),
  KEY `FK_ppvssta_idx` (`status`),
  CONSTRAINT `FK_accvspp` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FK_ppvssta` FOREIGN KEY (`status`) REFERENCES `status` (`id`),
  CONSTRAINT `FK_provspp` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `FK_rolevspp` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_participation`
--

LOCK TABLES `project_participation` WRITE;
/*!40000 ALTER TABLE `project_participation` DISABLE KEYS */;
INSERT INTO `project_participation` VALUES (1,1,2,1),(1,2,3,1),(1,3,3,1),(1,4,3,1),(2,1,2,1),(2,2,3,1),(2,3,3,1),(3,1,2,1),(3,2,3,1),(3,3,3,1),(4,1,2,1),(4,2,3,1),(4,3,3,1),(5,1,2,1),(5,2,3,1),(5,3,3,1),(5,4,3,1),(6,1,3,1),(6,2,3,1),(6,3,2,1),(9,1,2,1),(9,2,3,1),(9,3,3,1),(10,1,2,1),(10,2,3,1),(10,3,3,1),(11,1,2,1),(11,2,3,1),(11,3,3,1),(11,4,3,1),(11,5,3,1),(12,1,2,1),(12,2,3,1),(12,3,3,1),(12,4,3,1),(48,1,2,1),(48,2,3,1),(49,1,2,1),(49,2,3,1),(49,3,3,1),(49,4,3,1),(50,1,2,1),(50,2,3,1),(51,1,2,1),(51,2,3,1),(51,3,3,1),(52,1,2,1),(52,2,3,1),(52,3,3,1),(52,4,3,2),(53,1,2,1),(53,2,3,1),(53,3,3,1),(53,4,3,2);
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
  `project_id` bigint DEFAULT NULL,
  `requirement_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `requirement_detail` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `requirement_date` date DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_provsreq_idx` (`project_id`),
  KEY `FK_reqvssta_idx` (`status`),
  CONSTRAINT `FK_provsreq` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `FK_reqvssta` FOREIGN KEY (`status`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requirement`
--

LOCK TABLES `requirement` WRITE;
/*!40000 ALTER TABLE `requirement` DISABLE KEYS */;
INSERT INTO `requirement` VALUES (1,1,'Định vị','Nhà hướng đông',NULL,2),(2,1,'Mặt đứng','Nhà gồm 2 tầng, tầng 1 có 1 phòng bên làm phòng bếp, tầng 2 có ban công, tường ngoài tâng 1 sơn màu xám nhạt, tường ngoài tầng 2 dán gạch đá ong xám đậm, ban công có lan can inox',NULL,1),(3,1,'Tầng 1','Sảnh rộng 4.2m2, 1 không gian sinh hoạt chung rộng 19m2, 2 phòng ngủ mỗi phòng rộng 11m2, 1 wc rộng 4m2, 1 phòng bếp kiêm phòng ăn rộng 16.5m2, cầu thang thông tầng là cầu thang hình dạng chữ L gồm 20 bậc',NULL,2),(4,1,'Tầng 2','Để trống không gian phía trên phòng bếp tầng 1, mái của phòng bếp tầng 1 là mái tôn, hành lang rộng 6m2, 2 phòng ngủ, 1 phòng rộng 11m2, 1 phòng rộng 13.4m2, 1 phòng thờ rộng 10m2, 1 phòng wc rộng 4m2, ban công rộng 13.5m2',NULL,2),(5,1,'Tầng mái','Bao trùm tầng 2',NULL,2),(6,1,'Móng và cột','Móng được gia cường bằng cọc tre, đường kính cọc từ 8-10cm, dài 2-3m, 1m2 đóng 25 cọc, khoảng cách các cọc khoảng 2cm, sau khi đóng cọc phủ một lớp cát rồi mới đổ bê tông, cột gồm 13 cột',NULL,1),(7,1,'Hệ thống cấp điện','Dây điện đi ngầm trong tường, trần và sàn; tất cả phòng ngủ đều có điều hòa; phòng bếp có quạt hút gió; phải có hệ thống tiếp địa, dẫn sét, sơn chống gỉ cùng với tạo khoảng cách an toàn giữa các thiết bị điện trong nhà với người trong nhà',NULL,2),(8,1,'Hệ thống cấp nước','Đường nước dẫn xung quanh phòng bếp và phòng vệ sinh, bể nước đặt trên tầng mái',NULL,1),(9,1,'Hệ thống thoát nước','Bể phốt đặt dưới phòng bếp, đường dẫn chất thải ra ngoài đường kính khoảng  90-110cm, dài 8-9m',NULL,1),(10,1,'Tầng 3','Thông thoáng dùng để phơi quần áo',NULL,2),(11,1,'Tầng 4','Bể bơi ngoài trời có mái che nắng',NULL,2),(12,1,'Tầng 5','Vững, rộng, thoáng để tạo một khoảnh vườn nhỏ trên tầng 5',NULL,2),(13,9,'Định vị','Nhà hướng Tây Nam',NULL,3),(14,9,'Tầng 1','Một nhà tắm rộng 15m2, một nhà vệ sinh rộng 10m2, một phòng bếp kiêm phòng ăn rộng 20m2, 1 phòng khách, 1 phòng sinh hoạt chung rộng 10m2',NULL,3),(15,9,'Tầng 2','1 phòng vệ sinh rộng 10m2, 2 phòng ngủ 10m2 và 1 phòng ngủ 15m2',NULL,4),(16,9,'Tầng 3','2 phòng ngủ, 1 phòng vệ sinh, 1 phòng thờ',NULL,4),(17,9,'Tầng trệt','Rộng, thoáng để phơi quần áo',NULL,4),(18,9,'Móng và cột','Móng được gia cường bằng cọc tre, đường kính cọc từ 8-10cm, dài 2-3m, 1m2 đóng 25 cọc, khoảng cách các cọc khoảng 2cm, sau khi đóng cọc phủ một lớp cát rồi mới đổ bê tông, cột gồm 13 cột',NULL,1),(19,9,'Hệ thống nước','Tập trung nhiều ở nhà vệ sinh và tầng thượng',NULL,4),(62,49,'Tủ bếp','chữ U, theo phong cách hiện đại, có máy hút mùi, khung tủ bếp được làm bằng gỗ nhựa hardwood chống nước, thêm điểu hòa, a','2022-12-06',1),(63,49,'Cửa','Cửa sổ chính giữa bồn rửa ở góc bên phải, cửa ra vào ở góc bên trái','2022-12-06',4),(64,49,'Sàn','sàn gỗ','2022-12-06',4),(65,49,'Tường','lát gạch cam, các ổ điện và giá treo dụng cụ nhà bếp ở vị trí an toàn với trẻ nhỏ','2022-12-06',4),(66,49,'Trần','sơn trắng','2022-12-06',4),(67,49,'Bàn ghế','bàn ghế gỗ dành cho 4 người','2022-12-06',3),(69,48,'Tủ bếp','chữ U, theo phong cách hiện đại, có máy hút mùi, khung tủ bếp được làm bằng gỗ nhựa hardwood chống nước, thêm điểu hòa, a','2022-12-11',4),(70,48,'Cửa','Cửa sổ chính giữa bồn rửa ở góc bên phải, cửa ra vào ở góc bên trái','2022-12-11',4),(71,48,'Sàn','sàn gỗ','2022-12-11',4),(72,48,'Tường','lát gạch cam, các ổ điện và giá treo dụng cụ nhà bếp ở vị trí an toàn với trẻ nhỏ','2022-12-11',4),(90,51,'Tủ bếp','chữ U, theo phong cách hiện đại, có máy hút mùi. Khung tủ bếp được làm bằng gỗ nhựa hardwood chống nước.','2022-12-25',1),(91,51,'Cửa','Cửa sổ chính giữa bồn rửa ở góc bên phải, cửa ra vào ở góc bên trái','2022-12-25',4),(92,51,'Sàn','sàn gỗ','2022-12-25',4),(93,51,'Tường','lát gạch cam, các ổ điện và giá treo dụng cụ nhà bếp ở vị trí an toàn với trẻ nhỏ','2022-12-25',4),(94,51,'-	Trần','sơn trắng','2022-12-25',4),(95,51,'-	Bàn ghế','bàn ghế gỗ dành cho 4 người','2022-12-25',4),(96,52,'Tủ bếp','chữ U, theo phong cách hiện đại, có máy hút mùi. Khung tủ bếp được làm bằng gỗ nhựa hardwood chống nước','2022-12-25',2),(97,52,'-	Cửa','Cửa sổ chính giữa bồn rửa ở góc bên phải, cửa ra vào ở góc bên trái','2022-12-25',4),(98,52,'-	Sàn','sàn gỗ','2022-12-25',4),(99,52,'-	Tường','lát gạch cam, các ổ điện và giá treo dụng cụ nhà bếp ở vị trí an toàn với trẻ nhỏ','2022-12-25',4),(100,52,'-	Trần','sơn trắng','2022-12-25',4),(101,52,'-	Bàn ghế','bàn ghế gỗ dành cho 4 người','2022-12-25',4),(102,53,'-	Tủ bếp','chữ U, theo phong cách hiện đại, có máy hút mùi. Khung tủ bếp được làm bằng gỗ nhựa hardwood chống nước','2022-12-26',2),(103,53,'-	Cửa','Cửa sổ chính giữa bồn rửa ở góc bên phải, cửa ra vào ở góc bên trái','2022-12-26',4),(104,53,'-	Sàn','sàn gỗ','2022-12-26',4),(105,53,'-	Tường','lát gạch cam, các ổ điện và giá treo dụng cụ nhà bếp ở vị trí an toàn với trẻ nhỏ','2022-12-26',4),(106,53,'-	Trần','sơn trắng','2022-12-26',4),(107,4,'Tủ bếp','chữ U, theo phong cách hiện đại, có máy hút mùi','2022-12-28',1),(108,4,'Cửa','Cửa sổ chính giữa bồn rửa ở góc bên phải, cửa ra vào ở góc bên trái','2022-12-28',1),(109,4,'Sàn','sàn gỗ','2022-12-28',1),(110,4,'Tường','lát gạch cam, các ổ điện và giá treo dụng cụ nhà bếp ở vị trí an toàn với trẻ nhỏ','2022-12-28',1),(111,4,'Trần','sơn trắng','2022-12-28',1),(112,4,'Bàn ghế','bàn ghế gỗ dành cho 4 người','2022-12-28',1),(113,12,'Định vị','Nhà hướng đông','2022-12-28',4),(114,12,'Mặt đứng','Nhà gồm 2 tầng, tầng 1 có 1 phòng bên làm phòng bếp, tầng 2 có ban công, tường ngoài tâng 1 sơn màu xám nhạt, tường ngoài tầng 2 dán gạch đá ong xám đậm, ban công có lan can inox','2022-12-28',4),(115,12,'Tầng 1','Sảnh rộng 4.2m2, 1 không gian sinh hoạt chung rộng 19m2, 2 phòng ngủ mỗi phòng rộng 11m2, 1 wc rộng 4m2, 1 phòng bếp kiêm phòng ăn rộng 16.5m2, cầu thang thông tầng là cầu thang hình dạng chữ L gồm 20 bậc','2022-12-28',4),(116,12,'Tầng 2','Để trống không gian phía trên phòng bếp tầng 1, mái của phòng bếp tầng 1 là mái tôn, hành lang rộng 6m2, 2 phòng ngủ, 1 phòng rộng 11m2, 1 phòng rộng 13.4m2, 1 phòng thờ rộng 10m2, 1 phòng wc rộng 4m2, ban công rộng 13.5m2','2022-12-28',4),(117,12,'Tầng mái','Bao trùm tầng 2','2022-12-28',4),(118,12,'Móng và cột','Móng được gia cường bằng cọc tre, đường kính cọc từ 8-10cm, dài 2-3m, 1m2 đóng 25 cọc, khoảng cách các cọc khoảng 2cm, sau khi đóng cọc phủ một lớp cát rồi mới đổ bê tông, cột gồm 13 cột','2022-12-28',4),(119,12,'Hệ thống cấp điện','Dây điện đi ngầm trong tường, trần và sàn; tất cả phòng ngủ đều có điều hòa; phòng bếp có quạt hút gió; phải có hệ thống tiếp địa, dẫn sét, sơn chống gỉ cùng với tạo khoảng cách an toàn giữa các thiết bị điện trong nhà với người trong nhà','2022-12-28',4),(120,12,'Hệ thống cấp nước','Đường nước dẫn xung quanh phòng bếp và phòng vệ sinh, bể nước đặt trên tầng mái','2022-12-28',4),(121,12,'Hệ thống thoát nước','Bể phốt đặt dưới phòng bếp, đường dẫn chất thải ra ngoài đường kính khoảng 90-110cm, dài 8-9m','2022-12-28',4),(122,12,'Tầng 3','Thông thoáng dùng để phơi quần áo','2022-12-28',4),(123,6,'Phòng bếp','Thiết kế nội thất phòng bếp 30m2 với tủ bếp song song','2022-12-28',4),(124,6,'Tủ bếp','Tủ bếp song song, theo phong cách hiện đại, có máy hút mùi','2022-12-28',4),(125,6,'Cửa','1 cửa thông ra ban công mặt tiền, 1 cửa sổ mở quay ở phía tường đối diện','2022-12-28',4),(126,6,'Sàn','Sàn gỗ','2022-12-28',4);
/*!40000 ALTER TABLE `requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revision_history`
--

DROP TABLE IF EXISTS `revision_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revision_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `table_id` bigint DEFAULT NULL,
  `revision_no` int DEFAULT NULL,
  `revision_date` datetime DEFAULT NULL,
  `revision_detail` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `project_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revision_history`
--

LOCK TABLES `revision_history` WRITE;
/*!40000 ALTER TABLE `revision_history` DISABLE KEYS */;
INSERT INTO `revision_history` VALUES (17,9,1,'2022-12-06 19:59:08','Thời gian dự kiến kết thúc: 2023-02-01 -> 2023-12-01 <br> ','project',NULL),(18,14,1,'2022-12-06 20:15:50','Vị trí : Tầng 1 -> Tầng 1 <br>  Yêu cầu : Một nhà tắm rộng 15m2, một nhà vệ sinh rộng 10m2, một phòng bếp kiêm phòng ăn rộng 20m2, 1 phòng khách, 1 phòng sinh hoạt chung -> Một nhà tắm rộng 15m2, một nhà vệ sinh rộng 10m2, một phòng bếp kiêm phòng ăn rộng 20m2, 1 phòng khách, 1 phòng sinh hoạt chung rộng 10m2','requirement',NULL),(19,9,2,'2022-12-06 20:16:54','Yêu cầu : Tầng 1 đã bị xóa','requirement',NULL),(20,9,1,'2022-12-06 20:18:07','Yêu cầu : Định vị đã bị xóa','requirement',NULL),(21,62,1,'2022-12-06 22:54:06','Vị trí : Tủ bếp -> Tủ bếp <br>  Yêu cầu : chữ U, theo phong cách hiện đại, có máy hút mùi -> chữ U, theo phong cách hiện đại, có máy hút mùi, khung tủ bếp được làm bằng gỗ nhựa hardwood chống nước','requirement',NULL),(24,62,2,'2022-12-08 02:21:50','Vị trí : Tủ bếp -> Tủ bếp <br>  Yêu cầu : chữ U, theo phong cách hiện đại, có máy hút mùi, khung tủ bếp được làm bằng gỗ nhựa hardwood chống nước -> chữ U, theo phong cách hiện đại, có máy hút mùi, khung tủ bếp được làm bằng gỗ nhựa hardwood chống nước, thêm điểu hòa','requirement',NULL),(26,67,1,'2022-12-08 02:59:24','Yêu cầu : Bàn ghế đã bị xóa','requirement',NULL),(27,62,3,'2022-12-08 03:00:55','Vị trí : Tủ bếp -> Tủ bếp <br>  Yêu cầu : chữ U, theo phong cách hiện đại, có máy hút mùi, khung tủ bếp được làm bằng gỗ nhựa hardwood chống nước, thêm điểu hòa -> chữ U, theo phong cách hiện đại, có máy hút mùi, khung tủ bếp được làm bằng gỗ nhựa hardwood chống nước, thêm điểu hòa, a','requirement',NULL),(28,48,1,'2022-12-11 02:29:05','Thời gian dự kiến kết thúc: 2022-12-01 -> 2023-08-01 <br> ','project',48),(46,49,1,'2022-12-23 06:13:22','Diện tích xây dựng: 25 -> 30 <br> ','project',49),(47,90,1,'2022-12-25 00:30:55','Yêu cầu : chữ U, theo phong cách hiện đại, có máy hút mùi -> chữ U, theo phong cách hiện đại, có máy hút mùi. Khung tủ bếp được làm bằng gỗ nhựa hardwood chống nước. <br> ','requirement',51),(48,52,1,'2022-12-25 21:29:52','Diện tích xây dựng: 25 -> 30 <br> ','project',52),(49,96,1,'2022-12-25 21:43:11','Yêu cầu : chữ U, theo phong cách hiện đại, có máy hút mùi -> chữ U, theo phong cách hiện đại, có máy hút mùi. Khung tủ bếp được làm bằng gỗ nhựa hardwood chống nước <br> ','requirement',52),(50,53,1,'2022-12-26 16:59:46','Diện tích xây dựng: 25 -> 30 <br> ','project',53),(51,102,1,'2022-12-26 17:14:47','Yêu cầu : chữ U, theo phong cách hiện đại, có máy hút mùi -> chữ U, theo phong cách hiện đại, có máy hút mùi. Khung tủ bếp được làm bằng gỗ nhựa hardwood chống nước <br> ','requirement',53),(52,49,2,'2022-12-28 03:05:38','Tên công trình: Phòng bếp Anh Việt – Cầu Giấy -> Phòng bếp Anh Việt 1 – Cầu Giấy <br> ','project',49);
/*!40000 ALTER TABLE `revision_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin'),(2,'Trưởng nhóm'),(3,'Thiết kế');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `section_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(20000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `project_id` bigint DEFAULT NULL,
  `creator` bigint DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_createdby_idx` (`creator`),
  KEY `FK_ofproject_idx` (`project_id`),
  KEY `FK_status_section_idx` (`status`),
  CONSTRAINT `FK_createdby` FOREIGN KEY (`creator`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FK_ofproject` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `FK_status_section` FOREIGN KEY (`status`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (1,'Thiết kế bản vẽ',NULL,1,1,1),(2,'Lên hình ảnh 3D',NULL,1,1,1),(3,'Thiết kế bản vẽ',NULL,12,1,1),(4,'Thiết kế bản vẽ',NULL,9,1,3),(5,'Thiết kế bản vẽ',NULL,4,1,1),(6,'Lên hình ảnh 3D',NULL,9,1,3),(7,'Thiết kế bản vẽ 2D',NULL,41,1,1),(8,'Thiết kế bản vẽ 3D',NULL,42,1,1),(19,'Hình ảnh 3D',NULL,49,1,1),(20,'Hình ảnh 2D',NULL,49,1,1),(22,'Thiết kế 3D',NULL,4,1,1),(23,'Phần kiến trúc',NULL,50,1,3),(24,'Thiết kế 3D',NULL,50,1,3),(28,'Hình ảnh 3D',NULL,51,1,1),(29,'Hình ảnh 2D',NULL,51,1,1),(30,'Hình ảnh 3D',NULL,52,1,1),(31,'Hình ảnh 2D',NULL,52,1,1),(32,'Hình ảnh 3D',NULL,53,1,3),(33,'Hình ảnh 2D',NULL,53,1,3),(34,'Hình ảnh 3D',NULL,5,1,3),(35,'Hình ảnh 2D',NULL,5,1,3),(36,'Hình ảnh 3D',NULL,6,3,1),(37,'Hình ảnh 2D',NULL,6,3,1);
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status_account` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_project` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_requirement` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_task` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_section` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Mở','Đang thực hiện','Đang xử lí','Chưa phê duyệt','Hiện'),(2,'Chặn','Đang bàn giao','Đã đáp ứng','Đang thực hiện','Ẩn'),(3,NULL,'Đã hoàn thành','Đã xóa','Chờ phê duyệt','Đã xóa'),(4,NULL,'Đã xóa','Chưa được đáp ứng','Đã hoàn thành',NULL),(5,NULL,NULL,NULL,'Hủy bỏ',NULL),(6,NULL,NULL,NULL,'Đã xóa',NULL),(7,NULL,NULL,NULL,'Hủy bỏ do thành viên bị xóa',NULL);
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_id` bigint DEFAULT NULL,
  `section_id` bigint DEFAULT NULL,
  `task_id` bigint DEFAULT NULL,
  `creator` bigint DEFAULT NULL,
  `assignedto` bigint DEFAULT NULL,
  `requirement_id` bigint DEFAULT NULL,
  `task_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `starting_date` date DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `ended_date` date DEFAULT NULL,
  `number_of_file` int DEFAULT NULL,
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_accvst_idx` (`creator`),
  KEY `FK_asignedto_idx` (`assignedto`),
  KEY `FK_tvst_idx` (`task_id`),
  KEY `FK_ofrequirement_idx` (`requirement_id`),
  KEY `FK_ofsection_idx` (`section_id`),
  KEY `FK_provst_idx` (`project_id`),
  KEY `FK_tvssta_idx` (`status`),
  CONSTRAINT `FK_accvst` FOREIGN KEY (`creator`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FK_assignedto_avt` FOREIGN KEY (`assignedto`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FK_ofrequirement` FOREIGN KEY (`requirement_id`) REFERENCES `requirement` (`id`),
  CONSTRAINT `FK_ofsection` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`),
  CONSTRAINT `FK_provst` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `FK_tvssta` FOREIGN KEY (`status`) REFERENCES `status` (`id`),
  CONSTRAINT `FK_tvst` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,1,1,NULL,2,2,NULL,'Bản vẽ mặt bằng định vị','2022-02-06','2022-02-09','2022-02-08',1,NULL,2),(2,1,1,NULL,2,2,NULL,'Bản vẽ mặt đứng','2022-02-09','2022-02-21','2022-02-21',3,NULL,2),(3,1,1,2,2,2,2,'Bản vẽ mặt đúng AD','2022-02-09','2022-02-16','2022-02-16',1,NULL,4),(4,1,1,2,2,2,2,'Bản vẽ mặt đứng 1-4','2022-02-16','2022-02-19',NULL,1,NULL,3),(5,1,1,2,2,2,2,'Bản vẽ mặt cắt B-B','2022-02-19','2022-02-21','2022-02-21',1,NULL,4),(6,1,1,NULL,3,3,NULL,'Bản vẽ cho tầng 1','2022-02-21','2022-03-08','2022-03-07',5,NULL,4),(7,1,1,6,3,3,3,'Bản vẽ mặt bằng bố trí nội thất tầng 1','2022-02-21','2022-02-24','2022-02-24',1,NULL,4),(8,1,1,6,3,3,3,'Bản vẽ mặt bằng chi tiết tầng 1','2022-02-24','2022-02-27','2022-02-27',1,NULL,4),(9,1,1,6,3,3,3,'Bản vẽ mặt bằng lát sàn tầng 1','2022-02-27','2022-03-01','2022-03-02',1,NULL,4),(10,1,1,6,3,3,3,'Bản vẽ mặt bằng trần tầng 1','2022-03-01','2022-03-04','2022-03-04',1,NULL,4),(11,1,1,NULL,2,2,NULL,'Bản vẽ cho tầng 2','2022-03-08','2022-03-23','2022-03-22',5,NULL,4),(12,1,1,11,2,2,4,'Bản vẽ mặt bằng bố trí nội thất tầng 2','2022-03-08','2022-03-11','2022-03-11',1,NULL,5),(13,1,1,11,2,2,4,'Bản vẽ mặt bằng chi tiết tầng 2','2022-03-11','2022-03-14','2022-03-14',1,NULL,5),(14,1,1,11,2,2,4,'Bản vẽ mặt bằng lát sàn tầng 2','2022-03-14','2022-03-17','2022-03-17',1,NULL,5),(15,1,1,11,2,2,4,'Bản vẽ mặt bằng trần tầng 2','2022-03-17','2022-03-20','2022-03-20',1,NULL,5),(16,1,1,NULL,3,3,NULL,'Bản vẽ mặt bằng  mái','2022-03-17','2022-03-20','2022-03-20',1,NULL,4),(17,1,1,6,3,3,3,'Bản vẽ mặt bằng đinh vị cửa tầng 1','2022-03-04','2022-03-07','2022-03-07',1,NULL,4),(18,1,1,11,2,2,4,'Bản vẽ mặt bằng định vị cửa tầng 2','2022-03-20','2022-03-23','2022-03-22',1,NULL,4),(19,1,1,NULL,4,4,NULL,'Bản vẽ kết cấu','2022-02-21','2022-03-05','2022-03-05',13,NULL,4),(20,1,1,19,4,4,6,'Bản vẽ mặt bằng cọc tre gia cường đáy móng','2022-02-21','2022-02-22','2022-02-22',1,NULL,4),(21,1,1,19,4,4,6,'Bản vẽ mặt bằng định vị cổ cột','2022-02-22','2022-02-23','2022-02-23',1,NULL,4),(22,1,1,19,4,4,6,'Bản vẽ mặt bằng kết cấu móng','2022-02-23','2022-02-24','2022-02-24',1,NULL,4),(23,1,1,19,4,4,6,'Bản vẽ mặt bằng xây tường móng','2022-02-24','2022-02-25','2022-02-25',1,NULL,4),(24,1,1,19,4,4,6,'Bản vẽ mặt bằng định vị cột tầng 1','2022-02-25','2022-02-26','2022-02-26',1,NULL,6),(25,1,1,19,4,4,6,'Bản vẽ mặt bằng đinh vị cột tầng 2','2022-02-26','2022-02-27','2022-02-27',1,NULL,4),(26,1,1,19,4,4,6,'Bản vẽ mặt bằng kết cấu sàn tầng 2','2022-02-27','2022-02-28','2022-02-28',1,NULL,4),(27,1,1,19,4,4,6,'Bản vẽ mặt bằng kết cấu sàn mái','2022-02-28','2022-03-01','2022-03-01',1,NULL,4),(28,1,1,19,4,4,6,'Bản vẽ mặt bằng kết cấu sàn tầng 2','2022-03-01','2022-03-02','2022-03-02',1,NULL,4),(29,1,1,19,4,4,6,'Bản vẽ mặt bằng kết cấu sàn mái','2022-03-02','2022-03-03','2022-03-03',1,NULL,4),(30,1,1,19,4,4,6,'Bản vẽ mặt bằng cầu thang từ tầng 1 lên tầng 2','2022-03-03','2022-03-03','2022-03-03',1,NULL,4),(31,1,1,19,4,4,6,'Bản vẽ mặt bằng lanh tô tầng 1','2022-03-03','2022-03-04','2022-03-04',1,NULL,4),(32,1,1,19,4,4,6,'Bản vẽ mặt bằng lanh tô tầng 2','2022-03-04','2022-03-05','2022-03-05',1,NULL,4),(33,1,1,NULL,3,3,NULL,'Bản vẽ hệ thống cấp điện','2022-03-20','2022-04-11','2022-04-11',8,NULL,4),(34,1,1,33,3,3,7,'Bản vẽ mặt bằng cấp điện ổ cắm tầng 1','2022-03-20','2022-03-22','2022-03-22',1,NULL,4),(35,1,1,33,3,3,7,'Bản vẽ mặt bằng cấp điện ổ cắm tầng 2','2022-03-22','2022-03-24','2022-03-24',1,NULL,4),(36,1,1,33,3,3,7,'Bản vẽ mặt bằng cấp điện ổ cắm tầng mái','2022-03-24','2022-03-26','2022-03-28',1,NULL,4),(37,1,1,33,3,3,7,'Bản vẽ mặt bằng cấp điện chiếu sáng tầng 1','2022-03-28','2022-03-30','2022-03-30',1,NULL,4),(38,1,1,33,3,3,7,'Bản vẽ mặt bằng cấp điện chiếu sáng tầng 2','2022-03-30','2022-04-01','2022-04-01',1,NULL,4),(39,1,1,33,3,3,7,'Bản vẽ mặt bằng cấp điện điều hòa tầng 1','2022-04-03','2022-04-05','2022-04-05',1,NULL,4),(40,1,1,33,3,3,7,'Bản vẽ mặt bằng cấp điện điều hòa tầng 2','2022-04-05','2022-04-07','2022-04-07',1,NULL,4),(41,1,1,33,3,3,7,'Bản vẽ mặt bằng cọc tiếp địa tầng 1','2022-04-07','2022-04-09','2022-04-09',1,NULL,4),(42,1,1,33,3,3,7,'Bản vẽ mặt bằng chống sét tầng mái','2022-04-09','2022-04-11','2022-04-11',1,NULL,4),(43,1,1,NULL,2,2,NULL,'Bản vẽ hệ thống cấp nước','2022-04-11','2022-04-18','2022-04-18',4,NULL,2),(44,1,1,43,2,2,8,'Bản vẽ mặt bằng cấp nước tầng 1','2022-04-11','2022-04-13','2022-04-13',1,NULL,4),(45,1,1,43,2,2,8,'Bản vẽ mặt bằng cấp nước tầng 2','2022-04-13','2022-04-15','2022-04-15',1,NULL,4),(46,1,1,43,2,2,8,'Bản vẽ mặt bằng cấp nước tầng mái','2022-04-15','2022-04-17','2022-04-17',1,NULL,4),(47,1,1,43,2,2,8,'Sơ đồ đứng cấp nước','2022-04-17','2022-04-18','2022-04-18',1,NULL,6),(48,1,1,NULL,4,4,NULL,'Bản vẽ hệ thống thoát nước','2022-04-18','2022-04-30','2022-04-30',4,NULL,2),(49,1,1,48,4,4,9,'Bản vẽ mặt bằng thoát nước tầng 1','2022-04-18','2022-04-20','2022-04-22',1,NULL,4),(50,1,1,48,4,4,9,'Bản vẽ mặt bằng thoát nước tầng 2','2022-04-22','2022-04-24','2022-04-24',1,NULL,4),(51,1,1,48,4,4,9,'Bản vẽ mặt bằng thoát nước tầng mái','2022-04-24','2022-04-26','2022-04-28',1,NULL,4),(52,1,1,48,4,4,9,'Sơ đồ đứng thoát nước','2022-04-28','2022-04-30','2022-04-30',1,NULL,6),(53,1,2,NULL,3,3,NULL,'Hình ảnh 3D từng tầng','2022-04-30','2022-05-20','2022-05-15',3,NULL,4),(54,1,2,53,3,3,NULL,'Hình ảnh 3D tầng 1','2022-04-30','2022-05-05','2022-05-03',1,NULL,4),(55,1,2,53,3,3,NULL,'Hình ảnh 3D tầng 2','2022-05-05','2022-05-10','2022-05-06',1,NULL,4),(56,1,2,53,3,3,NULL,'Hình ảnh 3D tầng mái','2022-05-10','2022-05-15','2022-05-11',1,NULL,4),(57,1,2,NULL,3,3,NULL,'Tổng hợp hình ảnh 3D','2022-05-15','2022-05-20','2022-05-15',1,NULL,4),(59,12,3,NULL,1,1,NULL,'Bản vẽ mặt bằng định vị','2022-11-17','2023-01-31',NULL,2,'thời gian quá dài',2),(60,1,1,1,1,2,1,'Công việc số 1','2022-11-21','2022-11-24',NULL,3,'công việc không phù hợp',5),(61,9,4,NULL,1,2,NULL,'Phần kiến trúc','2022-11-22','2022-12-22',NULL,13,NULL,6),(62,9,4,61,1,2,14,'Mặt bằng tầng 1','2022-11-22','2022-11-24','2022-11-24',5,'wssss',6),(63,9,4,NULL,1,2,NULL,'Phần kết cấu','2022-11-22','2022-12-22',NULL,5,NULL,6),(64,9,4,63,1,2,13,'Mặt bằng định vị cọc','2022-11-22','2022-11-24',NULL,1,NULL,6),(65,9,4,63,2,2,14,'Mặt bằng tầng lửng','2022-11-25','2022-11-27','2022-11-24',1,NULL,6),(66,9,4,63,2,2,18,'Mặt bằng móng','2022-11-24','2022-11-26',NULL,1,NULL,6),(67,9,4,NULL,1,3,NULL,'Mặt bằng chi tiết móng','2022-11-27','2022-12-01','2022-11-24',1,NULL,6),(68,9,4,67,1,3,18,'Chi tiết móng P1','2022-11-27','2022-11-28','2022-11-24',1,NULL,6),(69,9,4,61,1,2,14,'Mặt bằng tường xây tầng 1','2022-11-24','2022-11-26',NULL,6,'Không phù hợp với yêu cầu khách hàng',6),(70,9,4,61,1,2,14,'Mặt bằng lát sàn tầng 1','2022-11-26','2022-11-28','2022-11-24',1,NULL,6),(71,9,4,61,1,2,14,'Mặt bằng cửa tầng 1','2022-11-29','2022-12-01','2022-11-24',1,NULL,6),(72,9,4,61,1,2,14,'Mặt bằng thang','2022-11-30','2022-12-01','2022-11-24',1,NULL,6),(73,9,4,63,1,2,18,'Chi tiết cọc','2022-11-24','2022-11-26',NULL,4,NULL,6),(74,9,4,63,2,2,14,'Mặt bằng kết cấu tầng 1','2022-11-24','2022-11-26','2022-11-24',1,NULL,6),(75,9,4,67,2,2,15,'Chi tiết móng P2','2022-11-27','2022-11-29',NULL,2,NULL,6),(76,9,4,NULL,1,3,NULL,'Hệ thống nước','2022-11-24','2022-12-24',NULL,0,NULL,6),(77,9,4,61,1,2,14,'Mặt bằng công năng tầng 1','2022-12-28','2023-01-24','2022-12-06',2,NULL,6),(78,9,4,61,1,2,14,'Mặt bằng trần thạch cao tầng 1','2022-11-22','2022-12-02',NULL,0,NULL,6),(79,9,4,61,1,2,14,'Mặt bằng định vị lát sàn tầng 1','2022-11-25','2022-11-27',NULL,4,NULL,6),(80,9,6,NULL,1,1,NULL,'Hình ảnh 3D tầng 1','2023-01-15','2023-01-19',NULL,0,NULL,6),(81,9,4,61,1,2,14,'Bản vẽ chi tiết tầng 1','2022-11-25','2022-11-26',NULL,1,NULL,6),(82,41,7,NULL,1,2,NULL,'Phần kiến trúc','2022-11-26','2022-12-10',NULL,0,NULL,2),(123,49,19,NULL,1,2,NULL,'Thiết kế 3D','2023-01-01','2023-01-08',NULL,2,NULL,7),(124,49,19,123,2,2,62,'Phác thảo ý tưởng','2023-01-01','2023-01-05',NULL,2,'Bỏ màu nâu vì màu nâu không hợp mệnh với chủ nhà (chủ nhà mệnh Thủy). Chuyển hết sang màu trắng.',7),(125,49,20,NULL,1,2,NULL,'Thiết kế chi tiết','2023-01-06','2023-01-19','2022-12-08',6,NULL,7),(126,49,20,125,1,2,62,'Chi tiết tủ bếp','2023-01-06','2023-01-10','2022-12-08',6,NULL,7),(127,50,23,NULL,1,1,NULL,'Phần kiến trúc','2022-12-08','2022-12-25',NULL,3,NULL,6),(129,50,NULL,NULL,1,1,NULL,'Trao đổi','2022-12-09','2022-12-11',NULL,NULL,NULL,2),(131,51,28,NULL,1,2,NULL,'Thiết kế 3D','2023-01-01','2023-01-10','2022-12-25',0,NULL,2),(132,51,28,131,2,2,90,'Phác thảo ý tưởng','2023-01-01','2023-01-08','2022-12-25',3,'Bỏ màu nâu vì màu nâu không hợp mệnh với chủ nhà (chủ nhà mệnh Thủy). Chuyển hết sang màu trắng.',2),(133,51,29,NULL,1,3,NULL,'Thiết kế chi tiết','2023-01-10','2023-01-25','2022-12-25',6,NULL,2),(134,51,29,133,1,3,90,'Chi tiết tủ bếp','2023-01-11','2023-01-19','2022-12-25',6,NULL,4),(135,49,20,NULL,1,1,NULL,'Tổng hợp thiết kế','2023-01-11','2023-01-27',NULL,0,NULL,6),(136,52,30,NULL,1,2,NULL,'Thiết kế 3D','2023-01-01','2023-01-11','2022-12-25',0,NULL,4),(137,52,31,NULL,1,3,NULL,'Thiết kế chi tiết','2023-01-12','2023-01-25','2022-12-25',6,NULL,4),(138,52,30,136,2,2,96,'Phác thảo ý tưởng','2023-01-01','2023-01-10','2022-12-25',2,'Bỏ màu nâu vì màu nâu không hợp mệnh với chủ nhà (chủ nhà mệnh Thủy). Chuyển hết sang màu trắng.',4),(139,52,31,137,1,3,96,'Chi tiết tủ bếp','2023-01-12','2023-01-18','2022-12-25',6,NULL,4),(140,49,19,123,2,2,62,'Tổng hợp 3D','2023-01-05','2022-12-10',NULL,1,NULL,7),(141,53,32,NULL,1,2,NULL,'Thiết kế 3D','2023-01-01','2023-01-10','2022-12-26',0,NULL,6),(142,53,32,141,2,2,102,'Phác thảo ý tưởng','2023-01-01','2023-01-05','2022-12-26',2,'Bỏ màu nâu vì màu nâu không hợp mệnh với chủ nhà (chủ nhà mệnh Thủy). Chuyển hết sang màu trắng.',6),(143,53,33,NULL,1,3,NULL,'Thiết kế chi tiết','2023-01-12','2023-01-20','2022-12-26',3,NULL,6),(144,53,33,143,1,3,102,'Chi tiết tủ bếp','2023-01-12','2023-01-17','2022-12-26',3,NULL,6),(145,49,19,123,1,2,62,'Phác thảo phòng bếp','2023-01-01','2023-01-08','2022-12-26',2,'Bỏ màu nâu vì màu nâu không hợp mệnh với chủ nhà (chủ nhà mệnh Thủy). Chuyển hết sang màu trắng.',4),(146,4,5,NULL,1,2,NULL,'Thiết kế chi tiết','2022-09-15','2022-11-15',NULL,12,NULL,2),(147,4,5,146,2,2,107,'Chi tiết tủ bếp','2022-09-15','2022-09-20',NULL,2,NULL,2),(148,4,5,146,2,2,108,'Chi tiết tường','2022-09-20','2022-09-25',NULL,2,NULL,2),(149,4,5,146,2,2,109,'Chi tiết cửa','2022-09-25','2022-09-30',NULL,2,NULL,2),(150,4,5,146,2,2,110,'Chi tiết sàn','2022-09-30','2022-10-05',NULL,2,NULL,2),(151,4,5,146,2,2,111,'Chi tiết trần','2022-10-05','2022-10-10',NULL,2,NULL,2),(152,4,5,146,2,2,112,'Chi tiết bàn ghế','2022-10-10','2022-10-15',NULL,2,NULL,6),(153,4,22,NULL,1,3,NULL,'Hình ảnh 3D','2022-09-01','2022-09-15',NULL,2,NULL,2),(154,4,22,NULL,3,3,107,'Phác thảo ý tưởng','2022-09-01','2022-09-14',NULL,2,NULL,2),(155,12,3,59,1,2,113,'Bản vẽ mặt bằng định vị chung','2022-11-17','2023-01-31',NULL,2,NULL,2),(156,49,20,NULL,1,2,NULL,'Thiết kế bản vẽ 2D','2023-01-01','2023-01-05',NULL,0,NULL,6),(157,6,36,NULL,3,1,NULL,'Thiết kế 3D','2022-10-30','2022-11-13',NULL,2,NULL,2),(158,6,36,157,3,1,123,'Phác thảo ý tưởng','2022-10-30','2022-11-07',NULL,2,NULL,2),(161,6,37,NULL,3,2,NULL,'Thiết kế chi tiết','2022-11-13','2022-01-15',NULL,6,NULL,2),(164,6,37,161,3,2,124,'Chi tiết tủ bếp','2022-11-13','2022-11-20',NULL,2,NULL,2),(165,6,37,161,3,2,125,'Chi tiết cửa','2022-11-20','2022-11-25',NULL,2,NULL,2),(166,6,37,161,3,2,126,'Chi tiết sàn','2022-11-25','2022-11-30',NULL,2,NULL,2);
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

-- Dump completed on 2022-12-29  3:02:44
