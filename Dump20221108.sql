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
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `FK_accvsrole_idx` (`role_id`),
  KEY `FK_accvsstatus_idx` (`status`),
  CONSTRAINT `FK_accvsrole` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FK_accvsstatus` FOREIGN KEY (`status`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'longvdh','123456',2,1),(2,'huannn','123456',3,1),(3,'namvn','123456',2,1),(4,'dangnt','123456',3,1),(5,'huonghtt','123456',2,1),(6,'admin','123456',1,1),(7,'user1','123456',3,1),(8,'user2','123456',3,1),(9,'user3','123456',2,1),(10,'user4','123456',2,1),(11,'rita','123456',2,1),(12,'winky','123456',3,1),(13,'errol','123456',3,1),(14,'fawkes','123456',3,1),(15,'longtv','123456',2,1),(16,'anhhb','123456',2,1),(17,'hoavq','123456',3,1),(18,'hungdc','123456',3,1),(19,'thaonp','123456',2,1),(20,'hungnm','123456',3,1),(21,'hanhdh','123456',3,1),(22,'hieulc','123456',3,1),(23,'toanpv','123456',2,1),(24,'huynq','123456',3,1),(25,'sontb','123456',3,1),(26,'hungnn','123456',2,1),(27,'tungnq','123456',3,1),(28,'longvn','123456',2,1);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_accvscomment_idx` (`acc_id`),
  KEY `FK_taskvscom_idx` (`task_id`),
  CONSTRAINT `FK_accvscomment` FOREIGN KEY (`acc_id`) REFERENCES `accounts` (`id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Vũ Đình Hoàng Long',23,'Hải Dương',1,'2000-01-12','123432544656','longvdhhe141608@fpt.edu.vn','0906153610',1),(2,'Nguyễn Như Huấn',23,'Hà Nội',1,'2000-07-06','12434154567658','huannnhe141550@fpt.edu.vn','0332000229',2),(3,'Hoàng Thị Thu Hương',23,'Nam ĐỊnh',2,'2000-04-20','12569817598733','huonghtthe141616@fpt.edu.vn','0824504462',5),(4,'Nguyễn Như Huấn',23,'Hà Nội',1,'2000-07-06','020743761045','huannnhe141550@fpt.edu.vn','0332000229',2),(5,'Nguyễn Thế Đăng',23,'Hải Dương',1,'2000-05-20','029122078591','dangnthe140402@fpt.edu.vn','0383842209',4);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_accvsiaf_idx` (`poster`),
  KEY `FK_provsiaf_idx` (`project_id`),
  KEY `FK_taskvsiaf_idx` (`task_id`),
  CONSTRAINT `FK_accvsiaf` FOREIGN KEY (`poster`) REFERENCES `accounts` (`id`),
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
  `detail` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_catevspro_idx` (`type`),
  KEY `FK_accvspro_idx` (`creator`),
  KEY `FK_provssta_idx` (`status`),
  CONSTRAINT `FK_accvspro` FOREIGN KEY (`creator`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FK_catevspro` FOREIGN KEY (`type`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_provssta` FOREIGN KEY (`status`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'Biệt thự nhà dân','2022-02-01','2022-05-20','2022-05-15',1,1,'Phùng Văn Thảo','Khu 6, phường Việt Hòa, tp Hải Dương','0981273645',600,'đẹp',2),(2,'Biệt thự Vườn Lài','2022-03-01','2022-06-01','2022-05-29',1,2,'Hoàng Thị Thu Hương','Nam Định','0123456789',600,'detail',2),(3,'Tủ bếp Anh Lân','2022-01-01','2022-03-31','2022-03-29',1,2,'Anh Lân','Hà Nội','0987654321',550,'detail',2),(4,'Tủ bếp Anh Đô','2022-09-01','2022-12-01',NULL,1,2,'Anh Đô','Vĩnh Yên','5432167890',575,'detail',1),(5,'Tủ bếp Anh Nguyên','2022-10-15','2023-01-31',NULL,1,2,'Anh Nguyên','Yên Lạc','0981234567',700,'detail',1),(6,'Tủ bếp Anh Phúc','2022-10-30','2023-02-01',NULL,3,2,'Anh Phúc','Lê Văn Thiểm','0876912345',567,'detail',1),(9,'Biệt thự mới','2022-11-09','2023-03-01',NULL,1,1,'Hoàng Long','Hải Dương','0906153610',650,'sạch',2),(10,'Phòng ăn hạng nhất','2022-11-10','2022-11-30',NULL,1,1,'Hoàng Long','Hải Dương','0906153610',40,NULL,2),(11,'Nhà ở hạng thường','2022-11-10','2023-01-03',NULL,1,1,'Hoàng Long','Hải Dương','0906153610',200,'đẹp',2),(12,'Biệt thự nhà vườn Đại Lải','2022-12-10','2022-11-11',NULL,1,1,'Hoàng Long','Hà Nội','1234567890',500,'phải to',2),(30,'Tủ bếp Anh Sơn','2022-05-01','2022-07-01','2022-06-25',3,2,'Anh Sơn','Smart City','0998978767',20,NULL,1),(31,'Tủ bếp Anh Việt','2022-04-12','2022-06-01','2022-05-29',5,2,'Nguyễn Quốc Việt','126 Trung Kính, phường Trung Hòa, quận Cầu Giấy, Hà Nội','0878560637',21,NULL,1),(32,'Tủ bếp Chi Trinh','2022-03-10','2022-06-01','2022-04-30',9,2,'Võ Thụy Trinh','B13-F4, T111, Hoàng Cầu, Đống Đa, Hà Nội','0761093246',23,NULL,1),(33,'Tủ bếp Chị Hải','2022-02-28','2022-04-01','2022-03-24',3,2,'Hoàng Bích Hải','431 Âu Cơ, quận Tây Hồ, Hà Nội','0302864170',19,NULL,1),(34,'Tủ bếp Chị Hạnh','2022-01-15','2022-03-01','2022-02-20',5,2,'Phùng Hiếu Hạnh','Ngõ 131 Thái Hà, Đống Đa, Hà Nội','0309360346',25,NULL,1),(35,'Tủ bếp Chi Hoa','2021-12-14','2022-02-01','2022-01-15',9,2,'Uất Quỳnh Hoa','5 ngõ Kim Mã Thượng, phường Cống Vị, Hà Nội','0566242717',30,NULL,1),(36,'Tủ bếp Chị Hương','2021-11-02','2022-01-31','2022-01-15',1,2,'Hồ Đinh Hương','Tầng 4, 777 Giải Phóng, phường Giáp Bát, quận Hai Bà Trưng, Hà Nội','0885013307',20,NULL,1),(37,'Tủ bếp Chị Lan','2021-10-20','2021-12-31','2021-12-20',1,2,'Đỗ Dạ Lan','Số 1 Đào Duy Anh, Đống Đa, Hà Nội','0994276242',26,NULL,1),(38,'Tủ bếp Chị Linh','2021-09-30','2021-11-01','2021-10-18',1,2,'Thân Đan Linh','Số 49 Nguyễn Thái Học, Sơn Tây, Hà Nội','0898156100',21,NULL,1),(39,'Tủ bếp Chị Loan','2021-09-10','2021-11-30','2021-12-01',9,2,'Lâm Bích Loan','Thôn Nghĩa Đạo,  Thuận Thành, Bắc Ninh','0780689392',22,NULL,1);
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
INSERT INTO `project_participation` VALUES (1,1,2,1),(1,2,3,1),(1,3,3,1),(1,4,3,1),(2,1,2,1),(2,2,3,1),(2,3,3,1),(3,1,2,1),(3,2,3,1),(3,3,3,1),(4,1,2,1),(4,2,3,1),(4,3,3,1),(5,1,2,1),(5,2,3,1),(5,3,3,1),(6,1,3,1),(6,2,3,1),(6,3,2,1),(9,1,2,1),(10,1,2,1),(11,1,2,1),(12,1,2,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requirement`
--

LOCK TABLES `requirement` WRITE;
/*!40000 ALTER TABLE `requirement` DISABLE KEYS */;
INSERT INTO `requirement` VALUES (1,1,'Định vị','Nhà hướng đông',NULL,2),(2,1,'Mặt đứng','Nhà gồm 2 tầng, tầng 1 có 1 phòng bên làm phòng bếp, tầng 2 có ban công, tường ngoài tâng 1 sơn màu xám nhạt, tường ngoài tầng 2 dán gạch đá ong xám đậm, ban công có lan can inox',NULL,2),(3,1,'Tầng 1','Sảnh rộng 4.2m2, 1 không gian sinh hoạt chung rộng 19m2, 2 phòng ngủ mỗi phòng rộng 11m2, 1 wc rộng 4m2, 1 phòng bếp kiêm phòng ăn rộng 16.5m2, cầu thang thông tầng là cầu thang hình dạng chữ L gồm 20 bậc',NULL,2),(4,1,'Tầng 2','Để trống không gian phía trên phòng bếp tầng 1, mái của phòng bếp tầng 1 là mái tôn, hành lang rộng 6m2, 2 phòng ngủ, 1 phòng rộng 11m2, 1 phòng rộng 13.4m2, 1 phòng thờ rộng 10m2, 1 phòng wc rộng 4m2, ban công rộng 13.5m2',NULL,2),(5,1,'Tầng mái','Bao trùm tầng 2',NULL,2),(6,1,'Móng và cột','Móng được gia cường bằng cọc tre, đường kính cọc từ 8-10cm, dài 2-3m, 1m2 đóng 25 cọc, khoảng cách các cọc khoảng 2cm, sau khi đóng cọc phủ một lớp cát rồi mới đổ bê tông, cột gồm 13 cột',NULL,2),(7,1,'Hệ thống cấp điện','Dây điện đi ngầm trong tường, trần và sàn; tất cả phòng ngủ đều có điều hòa; phòng bếp có quạt hút gió; phải có hệ thống tiếp địa, dẫn sét, sơn chống gỉ cùng với tạo khoảng cách an toàn giữa các thiết bị điện trong nhà với người trong nhà',NULL,2),(8,1,'Hệ thống cấp nước','Đường nước dẫn xung quanh phòng bếp và phòng vệ sinh, bể nước đặt trên tầng mái',NULL,2),(9,1,'Hệ thống thoát nước','Bể phốt đặt dưới phòng bếp, đường dẫn chất thải ra ngoài đường kính khoảng  90-110cm, dài 8-9m',NULL,2);
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
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_createdby_idx` (`creator`),
  KEY `FK_ofproject_idx` (`project_id`),
  CONSTRAINT `FK_createdby` FOREIGN KEY (`creator`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FK_ofproject` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (1,'Thiết kế bản vẽ',NULL,1,1),(2,'Lên hình ảnh 3D',NULL,1,1);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Mở','Đang thực hiện','Đang xử lí','Chưa phê duyệt'),(2,'Chặn','Đang bàn giao','Đã đáp ứng','Đang thực hiện'),(3,NULL,'Đã hoàn thành',NULL,'Chờ phê duyệt'),(4,NULL,NULL,NULL,'Đã hoàn thành'),(5,NULL,NULL,NULL,'Hủy bỏ');
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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,1,1,NULL,2,2,1,'Bản vẽ mặt bằng định vị','2022-02-06','2022-02-09','2022-02-08',1,NULL,4),(2,1,1,NULL,2,2,2,'Bản vẽ mặt đứng','2022-02-09','2022-02-21','2022-02-21',3,NULL,4),(3,1,1,2,2,2,2,'Bản vẽ mặt đúng AD','2022-02-09','2022-02-16','2022-02-16',1,NULL,4),(4,1,1,2,2,2,2,'Bản vẽ mặt đứng 1-4','2022-02-16','2022-02-19','2022-02-20',1,NULL,4),(5,1,1,2,2,2,2,'Bản vẽ mặt cắt B-B','2022-02-19','2022-02-21','2022-02-21',1,NULL,4),(6,1,1,NULL,3,3,3,'Bản vẽ cho tầng 1','2022-02-21','2022-03-08','2022-03-07',5,NULL,4),(7,1,1,6,3,3,3,'Bản vẽ mặt bằng bố trí nội thất tầng 1','2022-02-21','2022-02-24','2022-02-24',1,NULL,4),(8,1,1,6,3,3,3,'Bản vẽ mặt bằng chi tiết tầng 1','2022-02-24','2022-02-27','2022-02-27',1,NULL,4),(9,1,1,6,3,3,3,'Bản vẽ mặt bằng lát sàn tầng 1','2022-02-27','2022-03-01','2022-03-02',1,NULL,4),(10,1,1,6,3,3,3,'Bản vẽ mặt bằng trần tầng 1','2022-03-01','2022-03-04','2022-03-04',1,NULL,4),(11,1,1,NULL,2,2,4,'Bản vẽ cho tầng 2','2022-03-08','2022-03-23','2022-03-22',5,NULL,4),(12,1,1,11,2,2,4,'Bản vẽ mặt bằng bố trí nội thất tầng 2','2022-03-08','2022-03-11','2022-03-11',1,NULL,4),(13,1,1,11,2,2,4,'Bản vẽ mặt bằng chi tiết tầng 2','2022-03-11','2022-03-14','2022-03-14',1,NULL,4),(14,1,1,11,2,2,4,'Bản vẽ mặt bằng lát sàn tầng 2','2022-03-14','2022-03-17','2022-03-17',1,NULL,4),(15,1,1,11,2,2,4,'Bản vẽ mặt bằng trần tầng 2','2022-03-17','2022-03-20','2022-03-20',1,NULL,4),(16,1,1,NULL,3,3,5,'Bản vẽ mặt bằng  mái','2022-03-17','2022-03-20','2022-03-20',1,NULL,4),(17,1,1,6,3,3,3,'Bản vẽ mặt bằng đinh vị cửa tầng 1','2022-03-04','2022-03-07','2022-03-07',1,NULL,4),(18,1,1,11,2,2,4,'Bản vẽ mặt bằng định vị cửa tầng 2','2022-03-20','2022-03-23','2022-03-22',1,NULL,4),(19,1,1,NULL,4,4,6,'Bản vẽ kết cấu','2022-02-21','2022-03-05','2022-03-05',13,NULL,4),(20,1,1,19,4,4,6,'Bản vẽ mặt bằng cọc tre gia cường đáy móng','2022-02-21','2022-02-22','2022-02-22',1,NULL,4),(21,1,1,19,4,4,6,'Bản vẽ mặt bằng định vị cổ cột','2022-02-22','2022-02-23','2022-02-23',1,NULL,4),(22,1,1,19,4,4,6,'Bản vẽ mặt bằng kết cấu móng','2022-02-23','2022-02-24','2022-02-24',1,NULL,4),(23,1,1,19,4,4,6,'Bản vẽ mặt bằng xây tường móng','2022-02-24','2022-02-25','2022-02-25',1,NULL,4),(24,1,1,19,4,4,6,'Bản vẽ mặt bằng định vị cột tầng 1','2022-02-25','2022-02-26','2022-02-26',1,NULL,4),(25,1,1,19,4,4,6,'Bản vẽ mặt bằng đinh vị cột tầng 2','2022-02-26','2022-02-27','2022-02-27',1,NULL,4),(26,1,1,19,4,4,6,'Bản vẽ mặt bằng kết cấu sàn tầng 2','2022-02-27','2022-02-28','2022-02-28',1,NULL,4),(27,1,1,19,4,4,6,'Bản vẽ mặt bằng kết cấu sàn mái','2022-02-28','2022-03-01','2022-03-01',1,NULL,4),(28,1,1,19,4,4,6,'Bản vẽ mặt bằng kết cấu sàn tầng 2','2022-03-01','2022-03-02','2022-03-02',1,NULL,4),(29,1,1,19,4,4,6,'Bản vẽ mặt bằng kết cấu sàn mái','2022-03-02','2022-03-03','2022-03-03',1,NULL,4),(30,1,1,19,4,4,6,'Bản vẽ mặt bằng cầu thang từ tầng 1 lên tầng 2','2022-03-03','2022-03-03','2022-03-03',1,NULL,4),(31,1,1,19,4,4,6,'Bản vẽ mặt bằng lanh tô tầng 1','2022-03-03','2022-03-04','2022-03-04',1,NULL,4),(32,1,1,19,4,4,6,'Bản vẽ mặt bằng lanh tô tầng 2','2022-03-04','2022-03-05','2022-03-05',1,NULL,4),(33,1,1,NULL,3,3,7,'Bản vẽ hệ thống cấp điện','2022-03-20','2022-04-11','2022-04-11',8,NULL,4),(34,1,1,33,3,3,7,'Bản vẽ mặt bằng cấp điện ổ cắm tầng 1','2022-03-20','2022-03-22','2022-03-22',1,NULL,4),(35,1,1,33,3,3,7,'Bản vẽ mặt bằng cấp điện ổ cắm tầng 2','2022-03-22','2022-03-24','2022-03-24',1,NULL,4),(36,1,1,33,3,3,7,'Bản vẽ mặt bằng cấp điện ổ cắm tầng mái','2022-03-24','2022-03-26','2022-03-28',1,NULL,4),(37,1,1,33,3,3,7,'Bản vẽ mặt bằng cấp điện chiếu sáng tầng 1','2022-03-28','2022-03-30','2022-03-30',1,NULL,4),(38,1,1,33,3,3,7,'Bản vẽ mặt bằng cấp điện chiếu sáng tầng 2','2022-03-30','2022-04-01','2022-04-01',1,NULL,4),(39,1,1,33,3,3,7,'Bản vẽ mặt bằng cấp điện điều hòa tầng 1','2022-04-03','2022-04-05','2022-04-05',1,NULL,4),(40,1,1,33,3,3,7,'Bản vẽ mặt bằng cấp điện điều hòa tầng 2','2022-04-05','2022-04-07','2022-04-07',1,NULL,4),(41,1,1,33,3,3,7,'Bản vẽ mặt bằng cọc tiếp địa tầng 1','2022-04-07','2022-04-09','2022-04-09',1,NULL,4),(42,1,1,33,3,3,7,'Bản vẽ mặt bằng chống sét tầng mái','2022-04-09','2022-04-11','2022-04-11',1,NULL,4),(43,1,1,NULL,2,2,8,'Bản vẽ hệ thống cấp nước','2022-04-11','2022-04-18','2022-04-18',4,NULL,4),(44,1,1,43,2,2,8,'Bản vẽ mặt bằng cấp nước tầng 1','2022-04-11','2022-04-13','2022-04-13',1,NULL,4),(45,1,1,43,2,2,8,'Bản vẽ mặt bằng cấp nước tầng 2','2022-04-13','2022-04-15','2022-04-15',1,NULL,4),(46,1,1,43,2,2,8,'Bản vẽ mặt bằng cấp nước tầng mái','2022-04-15','2022-04-17','2022-04-17',1,NULL,4),(47,1,1,43,2,2,8,'Sơ đồ đứng cấp nước','2022-04-17','2022-04-18','2022-04-18',1,NULL,4),(48,1,1,NULL,4,4,9,'Bản vẽ hệ thống thoát nước','2022-04-18','2022-04-30','2022-04-30',4,NULL,4),(49,1,1,48,4,4,9,'Bản vẽ mặt bằng thoát nước tầng 1','2022-04-18','2022-04-20','2022-04-22',1,NULL,4),(50,1,1,48,4,4,9,'Bản vẽ mặt bằng thoát nước tầng 2','2022-04-22','2022-04-24','2022-04-24',1,NULL,4),(51,1,1,48,4,4,9,'Bản vẽ mặt bằng thoát nước tầng mái','2022-04-24','2022-04-26','2022-04-28',1,NULL,4),(52,1,1,48,4,4,9,'Sơ đồ đứng thoát nước','2022-04-28','2022-04-30','2022-04-30',1,NULL,4),(53,1,2,NULL,3,3,NULL,'Hình ảnh 3D từng tầng','2022-04-30','2022-05-20','2022-05-15',3,NULL,4),(54,1,2,53,3,3,NULL,'Hình ảnh 3D tầng 1','2022-04-30','2022-05-05','2022-05-03',1,NULL,4),(55,1,2,53,3,3,NULL,'Hình ảnh 3D tầng 2','2022-05-05','2022-05-10','2022-05-06',1,NULL,4),(56,1,2,53,3,3,NULL,'Hình ảnh 3D tầng mái','2022-05-10','2022-05-15','2022-05-11',1,NULL,4),(57,1,2,NULL,3,3,NULL,'Tổng hợp hình ảnh 3D','2022-05-15','2022-05-20','2022-05-15',1,NULL,4);
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

-- Dump completed on 2022-11-12  3:05:56
