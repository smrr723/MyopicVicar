-- MySQL dump 10.13  Distrib 5.5.54, for debian-linux-gnu (x86_64)
--
-- Host: 0.0.0.0    Database: freereg2_development
-- ------------------------------------------------------
-- Server version	5.5.54-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `refinery_authentication_devise_roles`
--

DROP TABLE IF EXISTS `refinery_authentication_devise_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_authentication_devise_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_authentication_devise_roles`
--

LOCK TABLES `refinery_authentication_devise_roles` WRITE;
/*!40000 ALTER TABLE `refinery_authentication_devise_roles` DISABLE KEYS */;
INSERT INTO `refinery_authentication_devise_roles` VALUES (1,'Refinery'),(2,'Superuser');
/*!40000 ALTER TABLE `refinery_authentication_devise_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_authentication_devise_roles_users`
--

DROP TABLE IF EXISTS `refinery_authentication_devise_roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_authentication_devise_roles_users` (
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  KEY `refinery_roles_users_role_id_user_id` (`role_id`,`user_id`),
  KEY `refinery_roles_users_user_id_role_id` (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_authentication_devise_roles_users`
--

LOCK TABLES `refinery_authentication_devise_roles_users` WRITE;
/*!40000 ALTER TABLE `refinery_authentication_devise_roles_users` DISABLE KEYS */;
INSERT INTO `refinery_authentication_devise_roles_users` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(1,2),(2,2);
/*!40000 ALTER TABLE `refinery_authentication_devise_roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_authentication_devise_user_plugins`
--

DROP TABLE IF EXISTS `refinery_authentication_devise_user_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_authentication_devise_user_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refinery_user_plugins_user_id_name` (`user_id`,`name`),
  KEY `index_refinery_authentication_devise_user_plugins_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_authentication_devise_user_plugins`
--

LOCK TABLES `refinery_authentication_devise_user_plugins` WRITE;
/*!40000 ALTER TABLE `refinery_authentication_devise_user_plugins` DISABLE KEYS */;
INSERT INTO `refinery_authentication_devise_user_plugins` VALUES (1,1,'county_pages',1),(2,1,'refinery_authentication_devise',2),(3,1,'refinery_pages',3),(4,1,'refinery_files',4),(5,1,'refinery_images',5);
/*!40000 ALTER TABLE `refinery_authentication_devise_user_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_authentication_devise_users`
--

DROP TABLE IF EXISTS `refinery_authentication_devise_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_authentication_devise_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `encrypted_password` varchar(255) NOT NULL,
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `userid_detail_id` varchar(255) DEFAULT NULL,
  `password_salt` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_refinery_authentication_devise_users_on_id` (`id`),
  KEY `index_refinery_authentication_devise_users_on_slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_authentication_devise_users`
--

LOCK TABLES `refinery_authentication_devise_users` WRITE;
/*!40000 ALTER TABLE `refinery_authentication_devise_users` DISABLE KEYS */;
INSERT INTO `refinery_authentication_devise_users` VALUES (1,'demo','de@example.com','fvR/eknIjHyjdBtGu5RXDg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-07 19:22:19','2017-04-07 19:22:19','demo',NULL,'DGRARJNgNREw7jRMCgha',NULL),(2,'Captainkirk','kirk.dawson.bc@gmail.com','yHt4rwirqmqD5lyOHdOeRQ','2017-04-08 00:22:36','2017-04-08 00:22:36','24.66.233.174','24.66.233.174',1,NULL,NULL,NULL,'2017-04-07 22:46:31','2017-04-08 00:22:36','captainkirk','58e816c58d994a1b890c1956','EHgQcWxdRYsD59dFGX33',NULL),(3,'testuser1','freereg.testuser1@gmail.com','oPcYgPtI/F07Vipx+JSUuQ',NULL,NULL,NULL,NULL,NULL,NULL,'uNj1sW8aNpXS4xax71QW','2017-04-07 22:49:47','2017-04-07 22:49:47','2017-04-07 22:49:47','testuser1','58e817898d994a1bc496ceb4','NZ4pgRA-mdsyRsLxQLNc',NULL),(4,'testuser2','freereg-testuser2@gmail.com','Be1W53oKLxYdX18JF9053Q',NULL,NULL,NULL,NULL,NULL,NULL,'DAXLAcXBsrLaoCxKCDiB','2017-04-07 22:52:37','2017-04-07 22:52:37','2017-04-07 22:52:37','testuser2','58e818348d994a1be697599b','grgsCg_jogFgmm2cU2ZE',NULL),(5,'testuser3','freereg-testuser3@gmail.com','xJVWtlue2NQx/MK8VfCvGQ',NULL,NULL,NULL,NULL,NULL,NULL,'MedvuqfiSTBDHVD9Pxzg','2017-04-07 22:53:03','2017-04-07 22:53:03','2017-04-07 22:53:03','testuser3','58e8184e8d994a1bf55d15eb','QQVMRZSrcNzeVrE73Z2v',NULL);
/*!40000 ALTER TABLE `refinery_authentication_devise_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_county_pages`
--

DROP TABLE IF EXISTS `refinery_county_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_county_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `chapman_code` varchar(255) DEFAULT NULL,
  `content` text,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_county_pages`
--

LOCK TABLES `refinery_county_pages` WRITE;
/*!40000 ALTER TABLE `refinery_county_pages` DISABLE KEYS */;
INSERT INTO `refinery_county_pages` VALUES (1,'England','ENG',NULL,1,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(2,'Bedfordshire','BDF',NULL,2,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(3,'Berkshire','BRK',NULL,3,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(4,'Buckinghamshire','BKM',NULL,4,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(5,'Cambridgeshire','CAM',NULL,5,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(6,'Cheshire','CHS',NULL,6,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(7,'Cornwall','CON',NULL,7,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(8,'Cumberland','CUL',NULL,8,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(9,'Derbyshire','DBY',NULL,9,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(10,'Devon','DEV',NULL,10,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(11,'Dorset','DOR',NULL,11,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(12,'Durham','DUR',NULL,12,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(13,'Essex','ESS',NULL,13,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(14,'Gloucestershire','GLS',NULL,14,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(15,'Hampshire','HAM',NULL,15,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(16,'Herefordshire','HEF',NULL,16,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(17,'Hertfordshire','HRT',NULL,17,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(18,'Huntingdonshire','HUN',NULL,18,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(19,'Isle of Wight','IOW',NULL,19,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(20,'Kent','KEN',NULL,20,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(21,'Lancashire','LAN',NULL,21,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(22,'Leicestershire','LEI',NULL,22,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(23,'Lincolnshire','LIN',NULL,23,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(24,'London (City)','LND',NULL,24,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(25,'Middlesex','MDX',NULL,25,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(26,'Norfolk','NFK',NULL,26,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(27,'Northamptonshire','NTH',NULL,27,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(28,'Northumberland','NBL',NULL,28,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(29,'Nottinghamshire','NTT',NULL,29,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(30,'Oxfordshire','OXF',NULL,30,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(31,'Rutland','RUT',NULL,31,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(32,'Shropshire','SAL',NULL,32,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(33,'Somerset','SOM',NULL,33,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(34,'Staffordshire','STS',NULL,34,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(35,'Suffolk','SFK',NULL,35,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(36,'Surrey','SRY',NULL,36,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(37,'Sussex','SSX',NULL,37,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(38,'Warwickshire','WAR',NULL,38,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(39,'Westmorland','WES',NULL,39,'2017-04-07 19:20:21','2017-04-07 19:20:21'),(40,'Wiltshire','WIL',NULL,40,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(41,'Worcestershire','WOR',NULL,41,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(42,'Yorkshire','YKS',NULL,42,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(43,'Yorkshire, East Riding','ERY',NULL,43,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(44,'Yorkshire, North Riding','NRY',NULL,44,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(45,'Yorkshire, West Riding','WRY',NULL,45,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(46,'Channel Islands','CHI',NULL,46,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(47,'Alderney','ALD',NULL,47,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(48,'Guernsey','GSY',NULL,48,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(49,'Jersey','JSY',NULL,49,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(50,'Isle of Man','IOM',NULL,50,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(51,'Sark','SRK',NULL,51,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(52,'Scotland','SCT',NULL,52,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(53,'Aberdeenshire','ABD',NULL,53,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(54,'Angus (Forfarshire)','ANS',NULL,54,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(55,'Argyllshire','ARL',NULL,55,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(56,'Ayrshire','AYR',NULL,56,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(57,'Banffshire','BAN',NULL,57,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(58,'Berwickshire','BEW',NULL,58,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(59,'Borders','BOR',NULL,59,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(60,'Bute','BUT',NULL,60,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(61,'Caithness','CAI',NULL,61,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(62,'Central','CEN',NULL,62,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(63,'Clackmannanshire','CLK',NULL,63,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(64,'Dumfries and Galloway','DGY',NULL,64,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(65,'Dumfriesshire','DFS',NULL,65,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(66,'Dunbartonshire','DNB',NULL,66,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(67,'East Lothian','ELN',NULL,67,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(68,'Fife','FIF',NULL,68,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(69,'Grampian','GMP',NULL,69,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(70,'Highland','HLD',NULL,70,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(71,'Inverness-shire','INV',NULL,71,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(72,'Kincardineshire','KCD',NULL,72,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(73,'Kinross-shire','KRS',NULL,73,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(74,'Kirkcudbrightshire','KKD',NULL,74,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(75,'Lanarkshire','LKS',NULL,75,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(76,'Lothian','LTN',NULL,76,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(77,'Midlothian','MLN',NULL,77,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(78,'Morayshire','MOR',NULL,78,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(79,'Nairnshire','NAI',NULL,79,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(80,'Orkney','OKI',NULL,80,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(81,'Orkney Isles','OKI',NULL,81,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(82,'Peeblesshire','PEE',NULL,82,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(83,'Perthshire','PER',NULL,83,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(84,'Renfrewshire','RFW',NULL,84,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(85,'Ross and Cromarty','ROC',NULL,85,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(86,'Roxburghshire','ROX',NULL,86,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(87,'Selkirkshire','SEL',NULL,87,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(88,'Shetland','SHI',NULL,88,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(89,'Shetland Isles','SHI',NULL,89,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(90,'Stirlingshire','STI',NULL,90,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(91,'Strathclyde','STD',NULL,91,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(92,'Sutherland','SUT',NULL,92,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(93,'Tayside','TAY',NULL,93,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(94,'West Lothian','WLN',NULL,94,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(95,'Western Isles','WIS',NULL,95,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(96,'Wigtownshire','WIG',NULL,96,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(97,'Wales','WLS',NULL,97,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(98,'Anglesey','AGY',NULL,98,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(99,'Brecknockshire','BRE',NULL,99,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(100,'Caernarfonshire','CAE',NULL,100,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(101,'Cardiganshire','CGN',NULL,101,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(102,'Carmarthenshire','CMN',NULL,102,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(103,'Clwyd','CWD',NULL,103,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(104,'Denbighshire','DEN',NULL,104,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(105,'Dyfed','DFD',NULL,105,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(106,'Flintshire','FLN',NULL,106,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(107,'Glamorgan','GLA',NULL,107,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(108,'Mid Glamorgan','MGM',NULL,108,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(109,'South Glamorgan','SGM',NULL,109,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(110,'West Glamorgan','WGM',NULL,110,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(111,'Gwent','GNT',NULL,111,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(112,'Gwynedd','GWN',NULL,112,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(113,'Merionethshire','MER',NULL,113,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(114,'Monmouthshire','MON',NULL,114,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(115,'Montgomeryshire','MGY',NULL,115,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(116,'Pembrokeshire','PEM',NULL,116,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(117,'Powys','POW',NULL,117,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(118,'Radnorshire','RAD',NULL,118,'2017-04-07 19:20:22','2017-04-07 19:20:22'),(119,'Unknown','UNK',NULL,119,'2017-04-07 19:20:22','2017-04-07 19:20:22');
/*!40000 ALTER TABLE `refinery_county_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_image_translations`
--

DROP TABLE IF EXISTS `refinery_image_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_image_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refinery_image_id` int(11) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `image_alt` varchar(255) DEFAULT NULL,
  `image_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_refinery_image_translations_on_refinery_image_id` (`refinery_image_id`),
  KEY `index_refinery_image_translations_on_locale` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_image_translations`
--

LOCK TABLES `refinery_image_translations` WRITE;
/*!40000 ALTER TABLE `refinery_image_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `refinery_image_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_images`
--

DROP TABLE IF EXISTS `refinery_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_mime_type` varchar(255) DEFAULT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `image_size` int(11) DEFAULT NULL,
  `image_width` int(11) DEFAULT NULL,
  `image_height` int(11) DEFAULT NULL,
  `image_uid` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `image_title` varchar(255) DEFAULT NULL,
  `image_alt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_images`
--

LOCK TABLES `refinery_images` WRITE;
/*!40000 ALTER TABLE `refinery_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `refinery_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_page_part_translations`
--

DROP TABLE IF EXISTS `refinery_page_part_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_page_part_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refinery_page_part_id` int(11) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `body` text,
  PRIMARY KEY (`id`),
  KEY `index_refinery_page_part_translations_on_refinery_page_part_id` (`refinery_page_part_id`),
  KEY `index_refinery_page_part_translations_on_locale` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_page_part_translations`
--

LOCK TABLES `refinery_page_part_translations` WRITE;
/*!40000 ALTER TABLE `refinery_page_part_translations` DISABLE KEYS */;
INSERT INTO `refinery_page_part_translations` VALUES (1,1,'en','2017-04-07 19:19:43','2017-04-07 19:19:43','<p>Welcome to our site. This is just a place holder page while we gather our content.</p>'),(2,2,'en','2017-04-07 19:19:43','2017-04-07 19:19:43','<p>This is another block of content over here.</p>'),(3,3,'en','2017-04-07 19:19:43','2017-04-07 19:19:43','<h2>Sorry, there was a problem...</h2><p>The page you requested was not found.</p><p><a href=\"/\">Return to the home page</a></p>'),(4,4,'en','2017-04-07 19:19:43','2017-04-07 19:19:43','<p>This is just a standard text page example. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin metus dolor, hendrerit sit amet, aliquet nec, posuere sed, purus. Nullam et velit iaculis odio sagittis placerat. Duis metus tellus, pellentesque ut, luctus id, egestas a, lorem. Praesent vitae mauris. Aliquam sed nulla. Sed id nunc vitae leo suscipit viverra. Proin at leo ut lacus consequat rhoncus. In hac habitasse platea dictumst. Nunc quis tortor sed libero hendrerit dapibus.\n\nInteger interdum purus id erat. Duis nec velit vitae dolor mattis euismod. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse pellentesque dignissim lacus. Nulla semper euismod arcu. Suspendisse egestas, erat a consectetur dapibus, felis orci cursus eros, et sollicitudin purus urna et metus. Integer eget est sed nunc euismod vestibulum. Integer nulla dui, tristique in, euismod et, interdum imperdiet, enim. Mauris at lectus. Sed egestas tortor nec mi.</p>'),(5,5,'en','2017-04-07 19:19:43','2017-04-07 19:19:43','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus fringilla nisi a elit. Duis ultricies orci ut arcu. Ut ac nibh. Duis blandit rhoncus magna. Pellentesque semper risus ut magna. Etiam pulvinar tellus eget diam. Morbi blandit. Donec pulvinar mauris at ligula. Sed pellentesque, ipsum id congue molestie, lectus risus egestas pede, ac viverra diam lacus ac urna. Aenean elit.</p>'),(6,6,'en','2017-04-07 19:19:43','2017-04-07 19:19:43',NULL),(7,7,'en','2017-04-07 19:19:43','2017-04-07 19:19:43',NULL);
/*!40000 ALTER TABLE `refinery_page_part_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_page_parts`
--

DROP TABLE IF EXISTS `refinery_page_parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_page_parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refinery_page_id` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `body` text,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_refinery_page_parts_on_id` (`id`),
  KEY `index_refinery_page_parts_on_refinery_page_id` (`refinery_page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_page_parts`
--

LOCK TABLES `refinery_page_parts` WRITE;
/*!40000 ALTER TABLE `refinery_page_parts` DISABLE KEYS */;
INSERT INTO `refinery_page_parts` VALUES (1,1,'body',NULL,0,'2017-04-07 19:19:43','2017-04-07 19:19:43','Body'),(2,1,'side_body',NULL,1,'2017-04-07 19:19:43','2017-04-07 19:19:43','Side Body'),(3,2,'body',NULL,0,'2017-04-07 19:19:43','2017-04-07 19:19:43','Body'),(4,3,'body',NULL,0,'2017-04-07 19:19:43','2017-04-07 19:19:43','Body'),(5,3,'side_body',NULL,1,'2017-04-07 19:19:43','2017-04-07 19:19:43','Side Body'),(6,4,'title_body_slug_body',NULL,0,'2017-04-07 19:19:43','2017-04-07 19:19:43','{:title=>\"Body\", :slug=>\"body\"}'),(7,4,'title_side_body_slug_side_body',NULL,1,'2017-04-07 19:19:43','2017-04-07 19:19:43','{:title=>\"Side Body\", :slug=>\"side_body\"}');
/*!40000 ALTER TABLE `refinery_page_parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_page_translations`
--

DROP TABLE IF EXISTS `refinery_page_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_page_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refinery_page_id` int(11) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `custom_slug` varchar(255) DEFAULT NULL,
  `menu_title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_refinery_page_translations_on_refinery_page_id` (`refinery_page_id`),
  KEY `index_refinery_page_translations_on_locale` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_page_translations`
--

LOCK TABLES `refinery_page_translations` WRITE;
/*!40000 ALTER TABLE `refinery_page_translations` DISABLE KEYS */;
INSERT INTO `refinery_page_translations` VALUES (1,1,'en','2017-04-07 19:19:42','2017-04-07 19:19:42','Home',NULL,NULL,'home'),(2,2,'en','2017-04-07 19:19:43','2017-04-07 19:19:43','Page not found',NULL,NULL,'page-not-found'),(3,3,'en','2017-04-07 19:19:43','2017-04-07 19:19:43','About',NULL,NULL,'about'),(4,4,'en','2017-04-07 19:19:43','2017-04-07 19:19:43','County Pages',NULL,NULL,'county-pages');
/*!40000 ALTER TABLE `refinery_page_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_pages`
--

DROP TABLE IF EXISTS `refinery_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `show_in_menu` tinyint(1) DEFAULT '1',
  `link_url` varchar(255) DEFAULT NULL,
  `menu_match` varchar(255) DEFAULT NULL,
  `deletable` tinyint(1) DEFAULT '1',
  `draft` tinyint(1) DEFAULT '0',
  `skip_to_first_child` tinyint(1) DEFAULT '0',
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `view_template` varchar(255) DEFAULT NULL,
  `layout_template` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `custom_slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_refinery_pages_on_depth` (`depth`),
  KEY `index_refinery_pages_on_id` (`id`),
  KEY `index_refinery_pages_on_lft` (`lft`),
  KEY `index_refinery_pages_on_parent_id` (`parent_id`),
  KEY `index_refinery_pages_on_rgt` (`rgt`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_pages`
--

LOCK TABLES `refinery_pages` WRITE;
/*!40000 ALTER TABLE `refinery_pages` DISABLE KEYS */;
INSERT INTO `refinery_pages` VALUES (1,NULL,NULL,NULL,1,'/','^/$',0,0,0,1,4,0,NULL,NULL,'2017-04-07 19:19:42','2017-04-07 19:19:43',NULL),(2,1,NULL,NULL,0,NULL,'^/404$',0,0,0,2,3,1,NULL,NULL,'2017-04-07 19:19:43','2017-04-07 19:19:43',NULL),(3,NULL,NULL,NULL,1,NULL,NULL,1,0,0,5,6,0,NULL,NULL,'2017-04-07 19:19:43','2017-04-07 19:19:43',NULL),(4,NULL,NULL,NULL,1,'/county_pages','^/county_pages(/|/.+?|)$',0,0,0,7,8,0,NULL,NULL,'2017-04-07 19:19:43','2017-04-07 19:19:43',NULL);
/*!40000 ALTER TABLE `refinery_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_resource_translations`
--

DROP TABLE IF EXISTS `refinery_resource_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_resource_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refinery_resource_id` int(11) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `resource_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_refinery_resource_translations_on_refinery_resource_id` (`refinery_resource_id`),
  KEY `index_refinery_resource_translations_on_locale` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_resource_translations`
--

LOCK TABLES `refinery_resource_translations` WRITE;
/*!40000 ALTER TABLE `refinery_resource_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `refinery_resource_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_resources`
--

DROP TABLE IF EXISTS `refinery_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_mime_type` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `file_uid` varchar(255) DEFAULT NULL,
  `file_ext` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_resources`
--

LOCK TABLES `refinery_resources` WRITE;
/*!40000 ALTER TABLE `refinery_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `refinery_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20140228035904'),('20140228035905'),('20140228035911'),('20140228035918'),('20140228035925'),('20140228035926'),('20140228035933'),('20140228035934'),('20140320025549'),('20140523143725'),('20140610180803'),('20160607204757'),('20160607204758'),('20160611162602'),('20160611162603'),('20160611162604'),('20160611162605'),('20160611162606'),('20160611162607'),('20160611162608');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seo_meta`
--

DROP TABLE IF EXISTS `seo_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seo_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seo_meta_id` int(11) DEFAULT NULL,
  `seo_meta_type` varchar(255) DEFAULT NULL,
  `browser_title` varchar(255) DEFAULT NULL,
  `meta_description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_seo_meta_on_id` (`id`),
  KEY `id_type_index_on_seo_meta` (`seo_meta_id`,`seo_meta_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seo_meta`
--

LOCK TABLES `seo_meta` WRITE;
/*!40000 ALTER TABLE `seo_meta` DISABLE KEYS */;
INSERT INTO `seo_meta` VALUES (1,1,'Refinery::Page::Translation',NULL,NULL,'2017-04-07 19:19:42','2017-04-07 19:19:42'),(2,2,'Refinery::Page::Translation',NULL,NULL,'2017-04-07 19:19:43','2017-04-07 19:19:43'),(3,3,'Refinery::Page::Translation',NULL,NULL,'2017-04-07 19:19:43','2017-04-07 19:19:43'),(4,4,'Refinery::Page::Translation',NULL,NULL,'2017-04-07 19:19:43','2017-04-07 19:19:43');
/*!40000 ALTER TABLE `seo_meta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-08 19:29:22
