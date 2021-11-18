-- MySQL dump 10.13  Distrib 8.0.26, for macos11.3 (x86_64)
--
-- Host: localhost    Database: mysite
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'shoppingWebAdmins');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (2,1,65),(3,1,66),(4,1,67),(5,1,68),(6,1,69),(7,1,70),(8,1,71),(9,1,72),(10,1,73),(11,1,74),(12,1,75),(13,1,76),(14,1,77),(15,1,78),(16,1,79),(17,1,80),(18,1,81),(19,1,82),(20,1,83),(21,1,84),(22,1,85),(23,1,86),(24,1,87),(25,1,88),(26,1,89),(27,1,90),(28,1,91),(29,1,92),(30,1,93),(31,1,94),(32,1,95),(33,1,96),(34,1,97),(35,1,98),(36,1,99),(37,1,100),(38,1,101),(39,1,102),(40,1,103),(41,1,104),(42,1,105),(43,1,106),(44,1,107),(45,1,108),(46,1,109),(47,1,110),(48,1,111),(49,1,112),(50,1,113),(51,1,114),(52,1,115),(53,1,116),(54,1,117),(55,1,118),(56,1,119),(57,1,120),(58,1,121),(59,1,122),(60,1,123),(61,1,124),(62,1,125),(63,1,126),(64,1,127),(1,1,128);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add book',7,'add_book'),(26,'Can change book',7,'change_book'),(27,'Can delete book',7,'delete_book'),(28,'Can view book',7,'view_book'),(29,'Can add author',8,'add_author'),(30,'Can change author',8,'change_author'),(31,'Can delete author',8,'delete_author'),(32,'Can view author',8,'view_author'),(33,'Can add comment',9,'add_comment'),(34,'Can change comment',9,'change_comment'),(35,'Can delete comment',9,'delete_comment'),(36,'Can view comment',9,'view_comment'),(37,'Can add commodity',10,'add_commodity'),(38,'Can change commodity',10,'change_commodity'),(39,'Can delete commodity',10,'delete_commodity'),(40,'Can view commodity',10,'view_commodity'),(41,'Can add shopping_address',11,'add_shopping_address'),(42,'Can change shopping_address',11,'change_shopping_address'),(43,'Can delete shopping_address',11,'delete_shopping_address'),(44,'Can view shopping_address',11,'view_shopping_address'),(45,'Can add group_buying',12,'add_group_buying'),(46,'Can change group_buying',12,'change_group_buying'),(47,'Can delete group_buying',12,'delete_group_buying'),(48,'Can view group_buying',12,'view_group_buying'),(49,'Can add sharing_discounting',13,'add_sharing_discounting'),(50,'Can change sharing_discounting',13,'change_sharing_discounting'),(51,'Can delete sharing_discounting',13,'delete_sharing_discounting'),(52,'Can view sharing_discounting',13,'view_sharing_discounting'),(53,'Can add user',14,'add_user'),(54,'Can change user',14,'change_user'),(55,'Can delete user',14,'delete_user'),(56,'Can view user',14,'view_user'),(57,'Can add cart',15,'add_cart'),(58,'Can change cart',15,'change_cart'),(59,'Can delete cart',15,'delete_cart'),(60,'Can view cart',15,'view_cart'),(61,'Can add order',16,'add_order'),(62,'Can change order',16,'change_order'),(63,'Can delete order',16,'delete_order'),(64,'Can view order',16,'view_order'),(65,'Can add shopping_address',17,'add_shopping_address'),(66,'Can change shopping_address',17,'change_shopping_address'),(67,'Can delete shopping_address',17,'delete_shopping_address'),(68,'Can view shopping_address',17,'view_shopping_address'),(69,'Can add comment',18,'add_comment'),(70,'Can change comment',18,'change_comment'),(71,'Can delete comment',18,'delete_comment'),(72,'Can view comment',18,'view_comment'),(73,'Can add sharing_discounting',19,'add_sharing_discounting'),(74,'Can change sharing_discounting',19,'change_sharing_discounting'),(75,'Can delete sharing_discounting',19,'delete_sharing_discounting'),(76,'Can view sharing_discounting',19,'view_sharing_discounting'),(77,'Can add cart',20,'add_cart'),(78,'Can change cart',20,'change_cart'),(79,'Can delete cart',20,'delete_cart'),(80,'Can view cart',20,'view_cart'),(81,'Can add commodity',21,'add_commodity'),(82,'Can change commodity',21,'change_commodity'),(83,'Can delete commodity',21,'delete_commodity'),(84,'Can view commodity',21,'view_commodity'),(85,'Can add group_buying',22,'add_group_buying'),(86,'Can change group_buying',22,'change_group_buying'),(87,'Can delete group_buying',22,'delete_group_buying'),(88,'Can view group_buying',22,'view_group_buying'),(89,'Can add user',23,'add_user'),(90,'Can change user',23,'change_user'),(91,'Can delete user',23,'delete_user'),(92,'Can view user',23,'view_user'),(93,'Can add order',24,'add_order'),(94,'Can change order',24,'change_order'),(95,'Can delete order',24,'delete_order'),(96,'Can view order',24,'view_order'),(97,'Can add user',25,'add_user'),(98,'Can change user',25,'change_user'),(99,'Can delete user',25,'delete_user'),(100,'Can view user',25,'view_user'),(101,'Can add commodity',26,'add_commodity'),(102,'Can change commodity',26,'change_commodity'),(103,'Can delete commodity',26,'delete_commodity'),(104,'Can view commodity',26,'view_commodity'),(105,'Can add order',27,'add_order'),(106,'Can change order',27,'change_order'),(107,'Can delete order',27,'delete_order'),(108,'Can view order',27,'view_order'),(109,'Can add comment',28,'add_comment'),(110,'Can change comment',28,'change_comment'),(111,'Can delete comment',28,'delete_comment'),(112,'Can view comment',28,'view_comment'),(113,'Can add shopping_address',29,'add_shopping_address'),(114,'Can change shopping_address',29,'change_shopping_address'),(115,'Can delete shopping_address',29,'delete_shopping_address'),(116,'Can view shopping_address',29,'view_shopping_address'),(117,'Can add group_buying',30,'add_group_buying'),(118,'Can change group_buying',30,'change_group_buying'),(119,'Can delete group_buying',30,'delete_group_buying'),(120,'Can view group_buying',30,'view_group_buying'),(121,'Can add sharing_discounting',31,'add_sharing_discounting'),(122,'Can change sharing_discounting',31,'change_sharing_discounting'),(123,'Can delete sharing_discounting',31,'delete_sharing_discounting'),(124,'Can view sharing_discounting',31,'view_sharing_discounting'),(125,'Can add cart',32,'add_cart'),(126,'Can change cart',32,'change_cart'),(127,'Can delete cart',32,'delete_cart'),(128,'Can view cart',32,'view_cart'),(129,'Can add order_ commodities',33,'add_order_commodities'),(130,'Can change order_ commodities',33,'change_order_commodities'),(131,'Can delete order_ commodities',33,'delete_order_commodities'),(132,'Can view order_ commodities',33,'view_order_commodities'),(133,'Can add item_recommend',34,'add_item_recommend'),(134,'Can change item_recommend',34,'change_item_recommend'),(135,'Can delete item_recommend',34,'delete_item_recommend'),(136,'Can view item_recommend',34,'view_item_recommend'),(137,'Can add user_recommend',35,'add_user_recommend'),(138,'Can change user_recommend',35,'change_user_recommend'),(139,'Can delete user_recommend',35,'delete_user_recommend'),(140,'Can view user_recommend',35,'view_user_recommend');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$d2Q3IASIOIMf$R7r9cHZk8B0MhOztNufSPKlw9HEoiC2H5/NJppuNpUk=','2021-11-17 09:26:44.460280',1,'admin','','','',1,1,'2021-11-04 06:03:43.027775'),(2,'pbkdf2_sha256$150000$SG2j3JQkVpzH$sTsNs5d/teWOJfQbVg/SxXNZJQPV1fbkkvjvgtJ7Ujo=',NULL,0,'chw','','','',0,1,'2021-11-04 06:09:43.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,2,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `info` varchar(100) NOT NULL,
  `pub` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'T',25.00,'','tinghua');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookstore_author`
--

DROP TABLE IF EXISTS `bookstore_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookstore_author` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  `age` int NOT NULL,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookstore_author`
--

LOCK TABLES `bookstore_author` WRITE;
/*!40000 ALTER TABLE `bookstore_author` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookstore_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-11-04 06:08:47.491500','1','shoppingWebAdmins',1,'[{\"added\": {}}]',3,1),(2,'2021-11-04 06:09:44.052920','2','chw',1,'[{\"added\": {}}]',4,1),(3,'2021-11-04 06:09:54.324239','2','chw',2,'[{\"changed\": {\"fields\": [\"groups\"]}}]',4,1),(4,'2021-11-17 09:35:34.773626','6','ONE-NETBOOk Onemix_0_ONE',1,'[{\"added\": {}}]',26,1),(5,'2021-11-17 09:36:24.312919','7','Lenovo 82B8000RAU Id_0_Lenovo',1,'[{\"added\": {}}]',26,1),(6,'2021-11-17 09:36:42.459841','8','Wireless Keyboard Bl_0_Lenovo',1,'[{\"added\": {}}]',26,1),(7,'2021-11-17 09:37:13.788141','9','Dell E7440 14_0_Dell',1,'[{\"added\": {}}]',26,1),(8,'2021-11-17 09:37:44.693025','10','Bluetooth headset_0_Apple',1,'[{\"added\": {}}]',26,1),(9,'2021-11-17 09:38:32.838604','11','Type-c headphones_1025_Dell',1,'[{\"added\": {}}]',26,1),(10,'2021-11-17 09:38:56.174611','12','The Bluetooth headse_12321_Apple',1,'[{\"added\": {}}]',26,1),(11,'2021-11-17 09:39:24.616937','13','Sport Gym Earphones_1231_ONE',1,'[{\"added\": {}}]',26,1),(12,'2021-11-17 09:40:25.799498','14','Makeup Brush Set_39_TSL',1,'[{\"added\": {}}]',26,1),(13,'2021-11-17 09:40:58.097315','15','Makeup Bag_3214_YSL',1,'[{\"added\": {}}]',26,1),(14,'2021-11-17 09:41:38.127117','16','32 Colors Eyeshadows_8856_Channel',1,'[{\"added\": {}}]',26,1),(15,'2021-11-17 09:42:06.290241','17','16 Highly Pigmented_0_YSL',1,'[{\"added\": {}}]',26,1),(16,'2021-11-17 09:42:43.118379','18','Aloe Vera Lip_0_Aloe',1,'[{\"added\": {}}]',26,1),(17,'2021-11-17 09:43:05.153259','19','Gloss Liquid Oil_0_TSL',1,'[{\"added\": {}}]',26,1),(18,'2021-11-17 09:43:36.942477','20','Melting Pout Matte L_8800_YSL',1,'[{\"added\": {}}]',26,1),(19,'2021-11-17 09:44:35.341131','21','Travel Sized Lip Set_0_GUCCI',1,'[{\"added\": {}}]',26,1),(20,'2021-11-17 09:45:06.977764','22','Kindergarten dress_0_Kindergarten',1,'[{\"added\": {}}]',26,1),(21,'2021-11-17 09:45:34.375734','23','High heel ankle boot_0_Lining',1,'[{\"added\": {}}]',26,1),(22,'2021-11-17 09:46:03.751149','24','Women summer 2020 ne_8565_Anta',1,'[{\"added\": {}}]',26,1),(23,'2021-11-17 09:46:36.206185','25','T-shirt woman_6642_Lining',1,'[{\"added\": {}}]',26,1),(24,'2021-11-17 09:47:16.973444','26','T-Shirt Portuguese_0_Adidas',1,'[{\"added\": {}}]',26,1),(25,'2021-11-17 09:47:43.061873','27','Christmas Women Ladi_0_Nike',1,'[{\"added\": {}}]',26,1),(26,'2021-11-17 09:48:09.231428','28','Basketball Jersey Sp_0_Nike',1,'[{\"added\": {}}]',26,1),(27,'2021-11-17 09:48:37.391346','29','FOX JEANS_0_YSL',1,'[{\"added\": {}}]',26,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(8,'bookstore','author'),(7,'bookstore','book'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(20,'shopping_website','cart'),(18,'shopping_website','comment'),(21,'shopping_website','commodity'),(22,'shopping_website','group_buying'),(24,'shopping_website','order'),(19,'shopping_website','sharing_discounting'),(17,'shopping_website','shopping_address'),(23,'shopping_website','user'),(32,'shoppingWeb','cart'),(28,'shoppingWeb','comment'),(26,'shoppingWeb','commodity'),(30,'shoppingWeb','group_buying'),(34,'shoppingWeb','item_recommend'),(27,'shoppingWeb','order'),(33,'shoppingWeb','order_commodities'),(31,'shoppingWeb','sharing_discounting'),(29,'shoppingWeb','shopping_address'),(25,'shoppingWeb','user'),(35,'shoppingWeb','user_recommend'),(15,'users','cart'),(9,'users','comment'),(10,'users','commodity'),(12,'users','group_buying'),(16,'users','order'),(13,'users','sharing_discounting'),(11,'users','shopping_address'),(14,'users','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-10-27 09:45:34.340281'),(2,'auth','0001_initial','2021-10-27 09:45:34.397879'),(3,'admin','0001_initial','2021-10-27 09:45:34.509388'),(4,'admin','0002_logentry_remove_auto_add','2021-10-27 09:45:34.540823'),(5,'admin','0003_logentry_add_action_flag_choices','2021-10-27 09:45:34.547616'),(6,'contenttypes','0002_remove_content_type_name','2021-10-27 09:45:34.589866'),(7,'auth','0002_alter_permission_name_max_length','2021-10-27 09:45:34.609303'),(8,'auth','0003_alter_user_email_max_length','2021-10-27 09:45:34.625346'),(9,'auth','0004_alter_user_username_opts','2021-10-27 09:45:34.632309'),(10,'auth','0005_alter_user_last_login_null','2021-10-27 09:45:34.655225'),(11,'auth','0006_require_contenttypes_0002','2021-10-27 09:45:34.656819'),(12,'auth','0007_alter_validators_add_error_messages','2021-10-27 09:45:34.674297'),(13,'auth','0008_alter_user_username_max_length','2021-10-27 09:45:34.702088'),(14,'auth','0009_alter_user_last_name_max_length','2021-10-27 09:45:34.728120'),(15,'auth','0010_alter_group_name_max_length','2021-10-27 09:45:34.740429'),(16,'auth','0011_update_proxy_permissions','2021-10-27 09:45:34.747036'),(17,'bookstore','0001_initial','2021-10-27 09:45:34.755375'),(18,'sessions','0001_initial','2021-10-27 09:45:34.764338'),(19,'bookstore','0002_book_info','2021-10-27 10:00:51.758663'),(20,'bookstore','0003_author','2021-10-27 10:16:03.100523'),(21,'bookstore','0004_auto_20211027_1845','2021-10-27 10:45:13.100468'),(22,'bookstore','0005_book_pub','2021-10-27 11:34:11.480800'),(23,'users','0001_initial','2021-10-31 03:34:25.456011'),(24,'shopping_website','0001_initial','2021-10-31 04:29:42.324573'),(25,'shopping_website','0002_auto_20211031_1242','2021-10-31 04:50:12.262441'),(26,'shoppingWeb','0001_initial','2021-10-31 05:14:40.870114'),(27,'shoppingWeb','0002_user_username','2021-10-31 05:18:02.218264'),(28,'shoppingWeb','0003_auto_20211101_1435','2021-11-01 06:35:06.854276'),(29,'shoppingWeb','0004_commodity_category','2021-11-03 00:30:15.105643'),(30,'shoppingWeb','0005_auto_20211112_1653','2021-11-12 08:53:57.810843'),(31,'shoppingWeb','0006_auto_20211116_1750','2021-11-16 09:50:47.421628'),(32,'shoppingWeb','0007_auto_20211116_2231','2021-11-16 14:31:34.540138'),(33,'shoppingWeb','0008_auto_20211116_2244','2021-11-16 14:44:18.583795'),(34,'shoppingWeb','0009_auto_20211117_1646','2021-11-17 08:46:09.369945'),(35,'shoppingWeb','0010_auto_20211118_0204','2021-11-17 18:04:25.824572'),(36,'auth','0012_alter_user_first_name_max_length','2021-11-18 02:58:35.494962'),(37,'shoppingWeb','0011_auto_20211118_1058','2021-11-18 02:58:35.605504'),(38,'shoppingWeb','0012_remove_comment_commentator','2021-11-18 03:28:51.983660');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('9n2olfdzfxwjj7bplxjzrdzm2ei7lk1i','MDY5NmU0M2ZjNTIxMjc0YjNkMWI0ZTEzNTFmYjRkM2RiOTU1ZTVmYzp7InVzZXJuYW1lIjoidGVzdDE2IiwidWlkIjo2LCJfc2Vzc2lvbl9leHBpcnkiOjQzMjAwfQ==','2021-11-16 20:57:20.192376'),('egbvbcfif5ten9flmco7ud56nyxihqkf','NDkzMDM4NDJkZDVkNGNmODdlZTk4NDBjZmI1ZTg0MzhmZTBiOGFmMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTQwMWU1NDNlOGQ1MzU2YmM1ZDFjOWVmN2ZmOWVmZGI2MGI1YTVhIn0=','2021-11-18 06:04:32.619739'),('gy97prgq24s3zikumhzgtm5ftlnl6iiq','NDkzMDM4NDJkZDVkNGNmODdlZTk4NDBjZmI1ZTg0MzhmZTBiOGFmMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OTQwMWU1NDNlOGQ1MzU2YmM1ZDFjOWVmN2ZmOWVmZGI2MGI1YTVhIn0=','2021-12-01 09:26:44.462171');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingWeb_cart`
--

DROP TABLE IF EXISTS `shoppingWeb_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingWeb_cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `buyer_id_id` int NOT NULL,
  `commodity_id_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingWeb_cart_buyer_id_id_6bf265b3_fk_shoppingWeb_user_id` (`buyer_id_id`),
  KEY `shoppingWeb_cart_commodity_id_id_6603880c_fk_shoppingW` (`commodity_id_id`),
  CONSTRAINT `shoppingWeb_cart_buyer_id_id_6bf265b3_fk_shoppingWeb_user_id` FOREIGN KEY (`buyer_id_id`) REFERENCES `shoppingWeb_user` (`id`),
  CONSTRAINT `shoppingWeb_cart_commodity_id_id_6603880c_fk_shoppingW` FOREIGN KEY (`commodity_id_id`) REFERENCES `shoppingWeb_commodity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingWeb_cart`
--

LOCK TABLES `shoppingWeb_cart` WRITE;
/*!40000 ALTER TABLE `shoppingWeb_cart` DISABLE KEYS */;
INSERT INTO `shoppingWeb_cart` VALUES (1,10,3,1),(2,2,3,2);
/*!40000 ALTER TABLE `shoppingWeb_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingWeb_comment`
--

DROP TABLE IF EXISTS `shoppingWeb_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingWeb_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `time` datetime(6) NOT NULL,
  `commodity_ID` int NOT NULL,
  `Rating` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingWeb_comment`
--

LOCK TABLES `shoppingWeb_comment` WRITE;
/*!40000 ALTER TABLE `shoppingWeb_comment` DISABLE KEYS */;
INSERT INTO `shoppingWeb_comment` VALUES (1,' good product! ','2021-11-18 11:09:06.000000',12,2,4),(2,' Nice, I will recommend to my friends ','2021-11-18 10:31:10.000000',16,3,5),(3,' Gooooood! ','2021-11-18 10:27:47.000000',25,2,3),(4,' good product! ','2021-11-18 11:16:34.000000',10,5,6),(5,' good product! ','2021-11-18 10:57:38.000000',26,4,3),(6,' very cheap! ','2021-11-18 11:18:09.000000',23,0,5),(7,' Gooooood! ','2021-11-18 11:19:55.000000',26,2,3),(8,' Nothing ','2021-11-18 10:43:54.000000',19,1,3),(9,' Nothing ','2021-11-18 11:03:54.000000',22,4,5),(10,' good product! ','2021-11-18 11:15:42.000000',13,3,6),(11,' good product! ','2021-11-18 11:19:16.000000',27,3,3),(12,' good product! ','2021-11-18 11:20:32.000000',13,0,5),(13,' good product! ','2021-11-18 11:06:28.000000',13,0,3),(14,' Gooooood! ','2021-11-18 10:59:44.000000',27,3,5),(15,' Gooooood! ','2021-11-18 11:11:19.000000',10,2,5),(16,' very cheap! ','2021-11-18 11:11:07.000000',29,0,4),(17,' Nice, I will recommend to my friends ','2021-11-18 10:31:56.000000',27,4,3),(18,' Nice, I will recommend to my friends ','2021-11-18 10:37:53.000000',5,3,4),(19,' good product! ','2021-11-18 11:13:54.000000',15,0,4),(20,' Nice, I will recommend to my friends ','2021-11-18 11:11:27.000000',21,3,4),(21,' good product! ','2021-11-18 11:11:34.000000',28,3,6),(22,' Gooooood! ','2021-11-18 10:25:41.000000',15,4,3),(23,' Nice, I will recommend to my friends ','2021-11-18 10:41:14.000000',18,5,5),(24,' very cheap! ','2021-11-18 10:43:10.000000',3,2,6),(25,' Nice, I will recommend to my friends ','2021-11-18 11:14:33.000000',25,4,3),(26,' good product! ','2021-11-18 10:48:02.000000',21,2,3),(27,' Gooooood! ','2021-11-18 11:22:03.000000',5,3,4),(28,' Nice, I will recommend to my friends ','2021-11-18 11:02:29.000000',19,5,3),(29,' Gooooood! ','2021-11-18 10:34:43.000000',4,1,3),(30,' good product! ','2021-11-18 11:20:49.000000',20,5,4),(31,' Nice, I will recommend to my friends ','2021-11-18 10:26:09.000000',1,5,3),(32,' Nothing ','2021-11-18 10:43:21.000000',15,2,6),(33,' Gooooood! ','2021-11-18 11:13:03.000000',12,0,3),(34,' Nothing ','2021-11-18 10:35:28.000000',20,1,5),(35,' very cheap! ','2021-11-18 10:37:31.000000',19,3,5),(36,' good product! ','2021-11-18 10:28:30.000000',9,2,3),(37,' Nothing ','2021-11-18 10:51:35.000000',1,5,5),(38,' very cheap! ','2021-11-18 10:30:55.000000',24,5,3),(39,' Nice, I will recommend to my friends ','2021-11-18 10:51:29.000000',14,4,3),(40,' very cheap! ','2021-11-18 11:12:53.000000',16,2,4),(41,' Nothing ','2021-11-18 10:47:25.000000',6,3,3),(42,' Nothing ','2021-11-18 10:45:23.000000',1,1,3),(43,' good product! ','2021-11-18 11:07:38.000000',28,1,4),(44,' Nice, I will recommend to my friends ','2021-11-18 11:10:25.000000',13,3,6),(45,' Nothing ','2021-11-18 11:21:14.000000',27,2,4),(46,' very cheap! ','2021-11-18 11:10:18.000000',18,2,6),(47,' Gooooood! ','2021-11-18 11:23:08.000000',11,3,4),(48,' Nothing ','2021-11-18 10:59:06.000000',15,4,3),(49,' Nice, I will recommend to my friends ','2021-11-18 10:26:58.000000',15,5,3),(50,' very cheap! ','2021-11-18 10:53:47.000000',8,0,6),(51,' Gooooood! ','2021-11-18 10:40:54.000000',10,4,3),(52,' good product! ','2021-11-18 10:57:31.000000',15,1,5),(53,' Nice, I will recommend to my friends ','2021-11-18 11:23:14.000000',20,0,4),(54,' Nice, I will recommend to my friends ','2021-11-18 10:45:43.000000',29,4,6),(55,' good product! ','2021-11-18 11:13:55.000000',28,0,6),(56,' good product! ','2021-11-18 10:52:50.000000',21,0,4),(57,' good product! ','2021-11-18 11:06:39.000000',25,0,3),(58,' good product! ','2021-11-18 10:26:17.000000',9,0,3),(59,' Nice, I will recommend to my friends ','2021-11-18 11:14:13.000000',18,5,5),(60,' Nice, I will recommend to my friends ','2021-11-18 10:24:11.000000',22,4,6),(61,' Gooooood! ','2021-11-18 11:11:14.000000',12,4,4),(62,' Gooooood! ','2021-11-18 10:50:35.000000',9,5,6),(63,' Nice, I will recommend to my friends ','2021-11-18 11:00:53.000000',7,0,4),(64,' very cheap! ','2021-11-18 10:32:49.000000',19,2,4),(65,' Gooooood! ','2021-11-18 11:19:16.000000',10,5,3),(66,' Gooooood! ','2021-11-18 10:38:49.000000',10,2,6),(67,' very cheap! ','2021-11-18 11:16:40.000000',2,3,3),(68,' Nice, I will recommend to my friends ','2021-11-18 10:54:56.000000',27,2,3),(69,' Nothing ','2021-11-18 10:25:17.000000',27,4,5),(70,' Nice, I will recommend to my friends ','2021-11-18 11:06:07.000000',27,5,4),(71,' very cheap! ','2021-11-18 11:04:16.000000',13,0,6),(72,' Nice, I will recommend to my friends ','2021-11-18 11:13:50.000000',16,0,5),(73,' very cheap! ','2021-11-18 10:29:29.000000',10,3,5),(74,' very cheap! ','2021-11-18 10:59:10.000000',22,1,5),(75,' Nothing ','2021-11-18 10:34:47.000000',4,4,3),(76,' Nice, I will recommend to my friends ','2021-11-18 11:21:10.000000',20,5,4),(77,' Nothing ','2021-11-18 10:38:17.000000',1,2,4),(78,' Nothing ','2021-11-18 10:39:14.000000',1,0,4),(79,' Gooooood! ','2021-11-18 11:07:19.000000',18,2,6),(80,' Gooooood! ','2021-11-18 10:37:49.000000',22,4,4),(81,' good product! ','2021-11-18 10:24:16.000000',26,3,3),(82,' Nice, I will recommend to my friends ','2021-11-18 10:51:07.000000',3,5,6),(83,' Nice, I will recommend to my friends ','2021-11-18 10:33:17.000000',4,5,5),(84,' good product! ','2021-11-18 10:42:31.000000',28,1,3),(85,' Nice, I will recommend to my friends ','2021-11-18 10:40:41.000000',15,2,4),(86,' Nothing ','2021-11-18 11:12:36.000000',8,4,5),(87,' Nothing ','2021-11-18 10:50:22.000000',2,3,3),(88,' Nothing ','2021-11-18 11:13:10.000000',20,3,5),(89,' good product! ','2021-11-18 10:30:20.000000',21,1,3),(90,' Nice, I will recommend to my friends ','2021-11-18 10:43:18.000000',1,0,6),(91,' Gooooood! ','2021-11-18 10:35:53.000000',24,2,6),(92,' good product! ','2021-11-18 11:06:57.000000',14,0,6),(93,' Nice, I will recommend to my friends ','2021-11-18 10:35:14.000000',14,1,5),(94,' Gooooood! ','2021-11-18 10:52:28.000000',18,4,3),(95,' Nothing ','2021-11-18 10:34:00.000000',8,0,4),(96,' good product! ','2021-11-18 10:50:20.000000',25,0,5),(97,' good product! ','2021-11-18 11:05:22.000000',7,2,6),(98,' Nothing ','2021-11-18 10:39:49.000000',20,0,4),(99,' good product! ','2021-11-18 11:16:41.000000',2,5,5),(100,' very cheap! ','2021-11-18 11:22:04.000000',11,0,5),(101,' good product! ','2021-11-18 11:21:14.000000',16,2,3),(102,' Nothing ','2021-11-18 10:31:53.000000',29,2,4),(103,' Gooooood! ','2021-11-18 11:16:36.000000',21,4,5),(104,' Nice, I will recommend to my friends ','2021-11-18 10:55:57.000000',22,5,3),(105,' Gooooood! ','2021-11-18 10:30:54.000000',2,0,5),(106,' Nice, I will recommend to my friends ','2021-11-18 10:59:09.000000',7,4,5),(107,' Nothing ','2021-11-18 10:26:28.000000',18,2,4),(108,' good product! ','2021-11-18 11:03:50.000000',7,1,6),(109,' Gooooood! ','2021-11-18 10:43:52.000000',26,4,6),(110,' Gooooood! ','2021-11-18 11:14:00.000000',17,3,6),(111,' very cheap! ','2021-11-18 11:22:31.000000',7,1,3),(112,' Nice, I will recommend to my friends ','2021-11-18 11:09:45.000000',14,4,4),(113,' Nice, I will recommend to my friends ','2021-11-18 10:51:09.000000',14,1,6),(114,' Nice, I will recommend to my friends ','2021-11-18 10:30:52.000000',13,5,4),(115,' good product! ','2021-11-18 10:27:28.000000',9,4,3),(116,' Nice, I will recommend to my friends ','2021-11-18 10:26:54.000000',13,0,5),(117,' Gooooood! ','2021-11-18 10:35:37.000000',12,1,4),(118,' very cheap! ','2021-11-18 10:53:59.000000',15,0,3),(119,' Nothing ','2021-11-18 10:35:44.000000',27,2,4),(120,' very cheap! ','2021-11-18 10:41:20.000000',27,3,6),(121,' Nothing ','2021-11-18 10:51:52.000000',28,3,5),(122,' Nice, I will recommend to my friends ','2021-11-18 11:16:13.000000',12,0,5),(123,' very cheap! ','2021-11-18 10:43:48.000000',27,1,4),(124,' Gooooood! ','2021-11-18 10:29:41.000000',6,2,3),(125,' Nice, I will recommend to my friends ','2021-11-18 10:35:54.000000',25,5,3),(126,' good product! ','2021-11-18 11:06:54.000000',24,4,4),(127,' Nothing ','2021-11-18 10:45:55.000000',24,1,5),(128,' very cheap! ','2021-11-18 10:49:09.000000',16,3,6),(129,' very cheap! ','2021-11-18 10:28:11.000000',9,5,4),(130,' good product! ','2021-11-18 10:57:41.000000',26,5,3),(131,' Nice, I will recommend to my friends ','2021-11-18 11:01:00.000000',14,4,5),(132,' Gooooood! ','2021-11-18 10:56:25.000000',21,3,3),(133,' Nothing ','2021-11-18 10:45:21.000000',21,4,5),(134,' Gooooood! ','2021-11-18 10:58:33.000000',1,0,6),(135,' very cheap! ','2021-11-18 10:36:22.000000',18,3,4),(136,' Nice, I will recommend to my friends ','2021-11-18 10:52:09.000000',22,3,5),(137,' Nothing ','2021-11-18 11:06:55.000000',24,5,6),(138,' Gooooood! ','2021-11-18 11:18:15.000000',11,5,6),(139,' Nothing ','2021-11-18 10:47:52.000000',5,4,6),(140,' Nothing ','2021-11-18 11:13:28.000000',7,5,5),(141,' very cheap! ','2021-11-18 10:52:58.000000',25,3,6),(142,' Nice, I will recommend to my friends ','2021-11-18 11:01:36.000000',15,0,3),(143,' very cheap! ','2021-11-18 10:34:28.000000',1,3,4),(144,' Gooooood! ','2021-11-18 11:06:51.000000',15,2,5),(145,' good product! ','2021-11-18 11:20:21.000000',12,1,5),(146,' very cheap! ','2021-11-18 10:49:41.000000',13,0,4),(147,' Gooooood! ','2021-11-18 11:12:04.000000',19,0,5),(148,' Gooooood! ','2021-11-18 10:36:42.000000',20,3,4),(149,' very cheap! ','2021-11-18 10:46:12.000000',2,1,5),(150,' very cheap! ','2021-11-18 10:38:07.000000',27,5,3),(151,' Gooooood! ','2021-11-18 10:58:46.000000',14,3,5),(152,' Nothing ','2021-11-18 11:22:01.000000',7,4,5),(153,' Nice, I will recommend to my friends ','2021-11-18 10:40:00.000000',4,2,5),(154,' Nothing ','2021-11-18 10:41:06.000000',11,1,6),(155,' good product! ','2021-11-18 11:18:35.000000',26,0,4),(156,' Nice, I will recommend to my friends ','2021-11-18 10:50:43.000000',1,4,4),(157,' good product! ','2021-11-18 11:12:09.000000',14,1,6),(158,' Gooooood! ','2021-11-18 10:31:40.000000',12,2,3),(159,' Nothing ','2021-11-18 11:03:53.000000',17,1,6),(160,' Nice, I will recommend to my friends ','2021-11-18 10:47:29.000000',1,3,5),(161,' good product! ','2021-11-18 11:11:46.000000',12,1,3),(162,' Nice, I will recommend to my friends ','2021-11-18 10:29:29.000000',14,4,6),(163,' very cheap! ','2021-11-18 11:04:57.000000',26,0,6),(164,' Nothing ','2021-11-18 10:59:09.000000',12,4,4),(165,' very cheap! ','2021-11-18 10:55:59.000000',20,5,5),(166,' Nice, I will recommend to my friends ','2021-11-18 10:56:39.000000',17,1,6),(167,' very cheap! ','2021-11-18 10:36:38.000000',2,2,5),(168,' good product! ','2021-11-18 10:35:57.000000',3,0,5),(169,' Nothing ','2021-11-18 10:58:29.000000',12,4,3),(170,' Gooooood! ','2021-11-18 10:26:37.000000',8,4,6),(171,' very cheap! ','2021-11-18 11:15:05.000000',24,0,3),(172,' Nice, I will recommend to my friends ','2021-11-18 11:22:04.000000',12,1,5),(173,' Nice, I will recommend to my friends ','2021-11-18 10:45:27.000000',26,4,4),(174,' Nothing ','2021-11-18 10:31:50.000000',21,2,4),(175,' Nice, I will recommend to my friends ','2021-11-18 10:47:00.000000',22,1,3),(176,' Nice, I will recommend to my friends ','2021-11-18 10:48:24.000000',29,2,5),(177,' Nice, I will recommend to my friends ','2021-11-18 10:23:54.000000',3,5,4),(178,' Nice, I will recommend to my friends ','2021-11-18 10:27:28.000000',6,3,5),(179,' good product! ','2021-11-18 11:14:50.000000',17,4,4),(180,' very cheap! ','2021-11-18 11:04:50.000000',23,0,6),(181,' Nothing ','2021-11-18 10:44:08.000000',5,0,5),(182,' Nothing ','2021-11-18 10:49:52.000000',6,5,6),(183,' good product! ','2021-11-18 10:48:15.000000',24,3,6),(184,' good product! ','2021-11-18 10:52:11.000000',24,3,3),(185,' Nothing ','2021-11-18 10:57:55.000000',13,1,3),(186,' Nothing ','2021-11-18 10:26:05.000000',9,5,3),(187,' Gooooood! ','2021-11-18 11:22:47.000000',9,5,5),(188,' Gooooood! ','2021-11-18 10:33:04.000000',2,2,4),(189,' Nice, I will recommend to my friends ','2021-11-18 11:13:05.000000',19,5,4),(190,' Nice, I will recommend to my friends ','2021-11-18 10:48:09.000000',15,3,6),(191,' good product! ','2021-11-18 10:30:10.000000',23,3,4),(192,' Nothing ','2021-11-18 10:24:23.000000',15,0,5),(193,' Nothing ','2021-11-18 10:55:13.000000',8,0,4),(194,' good product! ','2021-11-18 11:22:53.000000',24,1,4),(195,' Nothing ','2021-11-18 10:51:28.000000',6,4,3),(196,' Nothing ','2021-11-18 10:41:14.000000',14,2,6),(197,' Nice, I will recommend to my friends ','2021-11-18 11:23:28.000000',22,3,4),(198,' Nice, I will recommend to my friends ','2021-11-18 10:27:22.000000',10,5,6),(199,' good product! ','2021-11-18 11:08:32.000000',1,0,5);
/*!40000 ALTER TABLE `shoppingWeb_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingWeb_commodity`
--

DROP TABLE IF EXISTS `shoppingWeb_commodity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingWeb_commodity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `manufacturer` varchar(20) NOT NULL,
  `amount` int NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `sales` decimal(12,2) NOT NULL,
  `category` smallint NOT NULL,
  `price` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingWeb_commodity`
--

LOCK TABLES `shoppingWeb_commodity` WRITE;
/*!40000 ALTER TABLE `shoppingWeb_commodity` DISABLE KEYS */;
INSERT INTO `shoppingWeb_commodity` VALUES (1,'Razer keyboard 15','Razer',100,NULL,0.00,0,88.00),(2,'ThinkBook 14','lenovo',100,NULL,0.00,0,88.00),(3,'Perfect good food ','Perfect food',88,NULL,0.00,5,88.00),(4,'Razer keyboard 16','Razer',70,NULL,0.00,0,88.00),(5,'Razer keyboard 17','Razer',20,NULL,0.00,0,88.00),(6,'ONE-NETBOOk Onemix','ONE',100,'download.jpeg',0.00,0,2299.00),(7,'Lenovo 82B8000RAU IdeaPad','Lenovo',165,'download_CREEVvd.jpeg',0.00,0,699.00),(8,'Wireless Keyboard Bluetooth','Lenovo',132,'download_7NQLPKN.jpeg',0.00,0,88.00),(9,'Dell E7440 14','Dell',1645,'download_8aCvS5k.jpeg',0.00,0,325.00),(10,'Bluetooth headset','Apple',123,'download_ZHNcLG0.jpeg',0.00,0,299.00),(11,'Type-c headphones','Dell',1076,'download_XUVMLNt.jpeg',1025.00,0,25.00),(12,'The Bluetooth headset','Apple',1231,'download_hI7sBnD.jpeg',12321.00,0,39.00),(13,'Sport Gym Earphones','ONE',1231,'download_6IBp5XG.jpeg',1231.00,0,9.00),(14,'Makeup Brush Set','TSL',312,'download_4a7ZZYf.jpeg',39.00,3,13.00),(15,'Makeup Bag','YSL',2313,'download_J6hpAVj.jpeg',3214.00,7,23.00),(16,'32 Colors Eyeshadows Palette','Channel',985,'download_j9xXGgq.jpeg',8856.00,3,12000.00),(17,'16 Highly Pigmented','YSL',8856,'download_oPmd6FE.jpeg',0.00,3,78.00),(18,'Aloe Vera Lip','Aloe',312,'download_tqcevD8.jpeg',0.00,3,29.00),(19,'Gloss Liquid Oil','TSL',1328,'download_BGrk0Oj.jpeg',0.00,3,9.00),(20,'Melting Pout Matte Liquid','YSL',876,'download_VCzDEpx.jpeg',8800.00,7,40.00),(21,'Travel Sized Lip Set','GUCCI',546,'download_JB2X2Sn.jpeg',0.00,3,78.00),(22,'Kindergarten dress','Kindergarten',7742,'download_wuwylXG.jpeg',0.00,4,48.00),(23,'High heel ankle boots','Lining',8534,'download_7FjpVcV.jpeg',0.00,7,98.00),(24,'Women summer 2020 new','Anta',7623,'download_sD7MQNC.jpeg',8565.00,4,39.00),(25,'T-shirt woman','Lining',6654,'download_A8eQulz.jpeg',6642.00,4,78.00),(26,'T-Shirt Portuguese','Adidas',6544,'download_GOefLVH.jpeg',0.00,4,39.00),(27,'Christmas Women Ladies Dress','Nike',6542,'download_PsCwbuV.jpeg',0.00,4,29.00),(28,'Basketball Jersey Sports T Shirt','Nike',88432,'download_9sCSPef.jpeg',0.00,4,27.00),(29,'FOX JEANS','YSL',7756,'download_ZchrRzq.jpeg',0.00,6,49.00);
/*!40000 ALTER TABLE `shoppingWeb_commodity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingWeb_group_buying`
--

DROP TABLE IF EXISTS `shoppingWeb_group_buying`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingWeb_group_buying` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` int NOT NULL,
  `commodity_ID_id` int NOT NULL,
  `discounting_rate` decimal(15,10) NOT NULL,
  `identity_token` varchar(20) NOT NULL,
  `initiator` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingWeb_group_bu_commodity_ID_id_a349d97b_fk_shoppingW` (`commodity_ID_id`),
  CONSTRAINT `shoppingWeb_group_bu_commodity_ID_id_a349d97b_fk_shoppingW` FOREIGN KEY (`commodity_ID_id`) REFERENCES `shoppingWeb_commodity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingWeb_group_buying`
--

LOCK TABLES `shoppingWeb_group_buying` WRITE;
/*!40000 ALTER TABLE `shoppingWeb_group_buying` DISABLE KEYS */;
INSERT INTO `shoppingWeb_group_buying` VALUES (2,88,2,1.0000000000,'g_1','test2'),(3,88,2,1.0000000000,'g_1','test2'),(4,88,2,1.0000000000,'g_1','test2'),(5,88,2,1.0000000000,'g_1','test2'),(6,88,2,1.0000000000,'g_1','test2');
/*!40000 ALTER TABLE `shoppingWeb_group_buying` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingWeb_group_buying_participators`
--

DROP TABLE IF EXISTS `shoppingWeb_group_buying_participators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingWeb_group_buying_participators` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_buying_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shoppingWeb_group_buying_group_buying_id_user_id_b47942cf_uniq` (`group_buying_id`,`user_id`),
  KEY `shoppingWeb_group_bu_user_id_a9872ac6_fk_shoppingW` (`user_id`),
  CONSTRAINT `shoppingWeb_group_bu_group_buying_id_dd380f48_fk_shoppingW` FOREIGN KEY (`group_buying_id`) REFERENCES `shoppingWeb_group_buying` (`id`),
  CONSTRAINT `shoppingWeb_group_bu_user_id_a9872ac6_fk_shoppingW` FOREIGN KEY (`user_id`) REFERENCES `shoppingWeb_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingWeb_group_buying_participators`
--

LOCK TABLES `shoppingWeb_group_buying_participators` WRITE;
/*!40000 ALTER TABLE `shoppingWeb_group_buying_participators` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingWeb_group_buying_participators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingWeb_item_recommend`
--

DROP TABLE IF EXISTS `shoppingWeb_item_recommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingWeb_item_recommend` (
  `id` int NOT NULL AUTO_INCREMENT,
  `commodity_ID` int NOT NULL,
  `commodity_recommended` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingWeb_item_recommend`
--

LOCK TABLES `shoppingWeb_item_recommend` WRITE;
/*!40000 ALTER TABLE `shoppingWeb_item_recommend` DISABLE KEYS */;
INSERT INTO `shoppingWeb_item_recommend` VALUES (1,1,'[17, 28, 21, 23, 14, 27]'),(2,2,'[26, 6, 29, 10, 27, 28]'),(3,3,'[25, 5, 12, 19, 24, 16]'),(4,4,'[8, 21, 6, 28, 7, 27]'),(5,5,'[25, 12, 11, 24, 16, 3]'),(6,6,'[29, 27, 21, 2, 10, 20]'),(7,7,'[21, 28, 8, 18, 17, 4]'),(8,8,'[7, 4, 21, 29, 28, 18]'),(9,9,'[6, 18, 27, 4, 21, 10]'),(10,10,'[29, 27, 6, 20, 22, 2]'),(11,11,'[12, 5, 25, 19, 16, 15]'),(12,12,'[23, 11, 5, 16, 17, 3]'),(13,13,'[17, 16, 23, 12, 5, 28]'),(14,14,'[17, 27, 18, 7, 28, 22]'),(15,15,'[29, 16, 5, 11, 17, 23]'),(16,16,'[29, 5, 12, 24, 6, 17]'),(17,17,'[18, 19, 14, 25, 16, 23]'),(18,18,'[17, 27, 7, 21, 26, 14]'),(19,19,'[17, 5, 23, 11, 3, 14]'),(20,20,'[6, 10, 4, 22, 14, 28]'),(21,21,'[28, 7, 6, 18, 4, 29]'),(22,22,'[10, 6, 5, 27, 17, 16]'),(23,23,'[12, 17, 19, 5, 15, 13]'),(24,24,'[5, 16, 29, 2, 11, 3]'),(25,25,'[5, 3, 29, 11, 17, 16]'),(26,26,'[2, 18, 6, 27, 16, 4]'),(27,27,'[6, 18, 10, 14, 2, 17]'),(28,28,'[21, 7, 16, 4, 18, 2]'),(29,29,'[6, 10, 16, 15, 25, 2]');
/*!40000 ALTER TABLE `shoppingWeb_item_recommend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingWeb_order`
--

DROP TABLE IF EXISTS `shoppingWeb_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingWeb_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_amount` decimal(12,2) NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `time` datetime(6) NOT NULL,
  `buyer_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingWeb_order_buyer_id_af4c01dc_fk_shoppingWeb_user_id` (`buyer_id`),
  CONSTRAINT `shoppingWeb_order_buyer_id_af4c01dc_fk_shoppingWeb_user_id` FOREIGN KEY (`buyer_id`) REFERENCES `shoppingWeb_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingWeb_order`
--

LOCK TABLES `shoppingWeb_order` WRITE;
/*!40000 ALTER TABLE `shoppingWeb_order` DISABLE KEYS */;
INSERT INTO `shoppingWeb_order` VALUES (39,785.00,'credit card','2021-11-17 16:34:16.743507',3),(40,785.00,'credit card','2021-11-17 16:42:45.471701',3),(41,785.00,'credit card','2021-11-17 16:43:46.795657',3),(42,785.00,'credit card','2021-11-17 16:44:38.063093',3),(43,785.00,'credit card','2021-11-17 16:44:55.500355',3),(44,785.00,'credit card','2021-11-17 16:47:27.383808',3),(45,785.00,'credit card','2021-11-17 16:47:43.605167',3),(46,785.00,'credit card','2021-11-17 16:47:53.474666',3),(47,785.00,'credit card','2021-11-17 16:49:11.750148',3),(48,785.00,'credit card','2021-11-17 16:49:59.518889',3),(49,785.00,'credit card','2021-11-17 16:50:49.653895',3),(50,785.00,'credit card','2021-11-17 16:51:51.719588',3),(51,785.00,'credit card','2021-11-17 16:56:32.698243',3),(52,785.00,'credit card','2021-11-17 16:57:41.551822',3),(53,785.00,'credit card','2021-11-17 16:58:42.677217',3),(54,785.00,'credit card','2021-11-17 16:59:02.832517',3),(55,785.00,'credit card','2021-11-17 17:37:15.579560',3),(56,2299.00,'credit card','2021-11-18 05:38:38.337661',3),(57,2475.00,'credit card','2021-11-18 05:39:38.567441',3);
/*!40000 ALTER TABLE `shoppingWeb_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingWeb_order_commodities`
--

DROP TABLE IF EXISTS `shoppingWeb_order_commodities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingWeb_order_commodities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL,
  `commodity_id` int DEFAULT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingWeb_order_co_commodity_id_564c3da4_fk_shoppingW` (`commodity_id`),
  KEY `shoppingWeb_order_co_order_id_6cb45cf6_fk_shoppingW` (`order_id`),
  CONSTRAINT `shoppingWeb_order_co_commodity_id_564c3da4_fk_shoppingW` FOREIGN KEY (`commodity_id`) REFERENCES `shoppingWeb_commodity` (`id`),
  CONSTRAINT `shoppingWeb_order_co_order_id_6cb45cf6_fk_shoppingW` FOREIGN KEY (`order_id`) REFERENCES `shoppingWeb_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingWeb_order_commodities`
--

LOCK TABLES `shoppingWeb_order_commodities` WRITE;
/*!40000 ALTER TABLE `shoppingWeb_order_commodities` DISABLE KEYS */;
INSERT INTO `shoppingWeb_order_commodities` VALUES (10,5,1,39),(11,15,15,39),(12,5,1,40),(13,15,15,40),(14,5,1,41),(15,15,15,41),(16,5,1,42),(17,15,15,42),(18,5,1,43),(19,15,15,43),(20,5,1,44),(21,15,15,44),(22,5,1,45),(23,15,15,45),(24,5,1,46),(25,15,15,46),(26,5,1,47),(27,15,15,47),(28,5,1,48),(29,15,15,48),(30,5,1,49),(31,15,15,49),(32,5,1,50),(33,15,15,50),(34,5,1,51),(35,15,15,51),(36,5,1,52),(37,15,15,52),(38,5,1,53),(39,15,15,53),(40,5,1,54),(41,15,15,54),(42,5,1,55),(43,15,15,55),(44,1,6,56),(45,1,6,57),(46,2,8,57);
/*!40000 ALTER TABLE `shoppingWeb_order_commodities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingWeb_sharing_discounting`
--

DROP TABLE IF EXISTS `shoppingWeb_sharing_discounting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingWeb_sharing_discounting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `discounting_rate` decimal(15,10) NOT NULL,
  `helped_list` longtext,
  `commodity_ID_id` int NOT NULL,
  `initiator_id` int NOT NULL,
  `identity_token` varchar(20) NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingWeb_sharing__commodity_ID_id_b1458eca_fk_shoppingW` (`commodity_ID_id`),
  KEY `shoppingWeb_sharing__initiator_id_d306eaa5_fk_shoppingW` (`initiator_id`),
  CONSTRAINT `shoppingWeb_sharing__commodity_ID_id_b1458eca_fk_shoppingW` FOREIGN KEY (`commodity_ID_id`) REFERENCES `shoppingWeb_commodity` (`id`),
  CONSTRAINT `shoppingWeb_sharing__initiator_id_d306eaa5_fk_shoppingW` FOREIGN KEY (`initiator_id`) REFERENCES `shoppingWeb_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingWeb_sharing_discounting`
--

LOCK TABLES `shoppingWeb_sharing_discounting` WRITE;
/*!40000 ALTER TABLE `shoppingWeb_sharing_discounting` DISABLE KEYS */;
INSERT INTO `shoppingWeb_sharing_discounting` VALUES (1,0.8125000000,'test1,test2,test3,test5',3,3,'788123',88);
/*!40000 ALTER TABLE `shoppingWeb_sharing_discounting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingWeb_shopping_address`
--

DROP TABLE IF EXISTS `shoppingWeb_shopping_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingWeb_shopping_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `phone` varchar(15) NOT NULL,
  `receiver` varchar(20) NOT NULL,
  `address_country` varchar(20) NOT NULL,
  `address_detailed` varchar(20) NOT NULL,
  `buyer_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shoppingWeb_shopping_buyer_id_a36c8d23_fk_shoppingW` (`buyer_id`),
  CONSTRAINT `shoppingWeb_shopping_buyer_id_a36c8d23_fk_shoppingW` FOREIGN KEY (`buyer_id`) REFERENCES `shoppingWeb_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingWeb_shopping_address`
--

LOCK TABLES `shoppingWeb_shopping_address` WRITE;
/*!40000 ALTER TABLE `shoppingWeb_shopping_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingWeb_shopping_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingWeb_user`
--

DROP TABLE IF EXISTS `shoppingWeb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingWeb_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(33) NOT NULL,
  `birth` date NOT NULL,
  `name` varchar(20) NOT NULL,
  `gender` smallint NOT NULL,
  `email` varchar(254) NOT NULL,
  `create_time` date NOT NULL,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingWeb_user`
--

LOCK TABLES `shoppingWeb_user` WRITE;
/*!40000 ALTER TABLE `shoppingWeb_user` DISABLE KEYS */;
INSERT INTO `shoppingWeb_user` VALUES (3,'202cb962ac59075b964b07152d234b70','1970-01-01','test2',1,'gj_chw@126.com','2021-11-01','test2'),(4,'202cb962ac59075b964b07152d234b70','1970-01-01','test2',1,'test@mail.google.com','2021-11-16','test1'),(5,'202cb962ac59075b964b07152d234b70','1970-01-01','test2',1,'test@mail.google.com','2021-11-16','test5'),(6,'202cb962ac59075b964b07152d234b70','1970-01-01','PPO',1,'test@mail.google.com','2021-11-16','test16');
/*!40000 ALTER TABLE `shoppingWeb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingWeb_user_recommend`
--

DROP TABLE IF EXISTS `shoppingWeb_user_recommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingWeb_user_recommend` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `user_recommended` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingWeb_user_recommend`
--

LOCK TABLES `shoppingWeb_user_recommend` WRITE;
/*!40000 ALTER TABLE `shoppingWeb_user_recommend` DISABLE KEYS */;
INSERT INTO `shoppingWeb_user_recommend` VALUES (1,4,'[25, 10, 6, 4]'),(2,5,'[26, 17]'),(3,3,'[20, 29, 8, 3, 17, 5]'),(4,6,'[2, 20, 19, 4, 12, 21]');
/*!40000 ALTER TABLE `shoppingWeb_user_recommend` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-18 14:23:23
