-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: PC_robin
-- ------------------------------------------------------
-- Server version	8.0.11

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
-- Table structure for table `m_custom_menu`
--


CREATE DATABASE `PC_robin` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE pc_robin;


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_custom_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_type` int(11) NOT NULL,
  `basic_price` int(11) NOT NULL,
  `base` int(11) NOT NULL,
  `cpu` int(11) NOT NULL,
  `ram` int(11) NOT NULL,
  `graphics` int(11) NOT NULL,
  `storage` int(11) NOT NULL,
  `os` int(11) NOT NULL,
  `office` int(11) NOT NULL,
  `assemble` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_custom_menu`
--

LOCK TABLES `m_custom_menu` WRITE;
/*!40000 ALTER TABLE `m_custom_menu` DISABLE KEYS */;
INSERT INTO `m_custom_menu` VALUES (1,'最新ABXモデル　エントリータイプ',1,59800,19,1,4,7,10,14,16,20),(2,'最新ABXモデル　スタンダードタイプ',1,74800,19,2,5,7,11,14,16,20),(3,'最新ABXモデル　パフォーマンスタイプ',1,113800,19,3,6,8,12,14,16,20),(4,'最新ABXモデル　普段使い用OFFICE搭載',2,76600,19,1,4,7,10,14,17,20),(5,'最新ABXモデル　ゲーム用',2,127800,19,3,6,9,12,14,16,20),(6,'最新ABXモデル　デザイン用',2,109800,19,2,6,9,12,14,16,20),(7,'最新ABXモデル　core i3搭載タイプ',3,59800,19,1,4,7,10,14,16,20),(8,'最新ABXモデル　core i5搭載タイプ',3,67800,19,2,4,7,10,14,16,20),(9,'最新ABXモデル　core i6搭載タイプ',3,98800,19,3,5,8,11,14,16,20);
/*!40000 ALTER TABLE `m_custom_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_custom_type`
--

DROP TABLE IF EXISTS `m_custom_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_custom_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_UNIQUE` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_custom_type`
--

LOCK TABLES `m_custom_type` WRITE;
/*!40000 ALTER TABLE `m_custom_type` DISABLE KEYS */;
INSERT INTO `m_custom_type` VALUES (1,'価格'),(3,'性能'),(2,'用途');
/*!40000 ALTER TABLE `m_custom_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_delivery_method`
--

DROP TABLE IF EXISTS `m_delivery_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_delivery_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_delivery_method`
--

LOCK TABLES `m_delivery_method` WRITE;
/*!40000 ALTER TABLE `m_delivery_method` DISABLE KEYS */;
INSERT INTO `m_delivery_method` VALUES (1,'特急配送',1000),(2,'通常配送',0),(3,'日時指定配送',500);
/*!40000 ALTER TABLE `m_delivery_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_item`
--

DROP TABLE IF EXISTS `m_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_type` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `file_name` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_item`
--

LOCK TABLES `m_item` WRITE;
/*!40000 ALTER TABLE `m_item` DISABLE KEYS */;
INSERT INTO `m_item` VALUES (1,2,'インテル Core i3-8100(3.60GHz/4コア/4スレッド/6MB)',10000,NULL),(2,2,'インテル Core i5-8400(2.80GHz/TB時最大4.00GHz/6コア/6スレッド9MBキャッシュ)',18000,NULL),(3,2,'インテル Core i7-8700K(3.70GHz/TB時最大4.70GHz/6コア/12スレッド/12MB)',36000,NULL),(4,3,'4GB (4GBx1) PC4-17000 (2133MHz)',5000,NULL),(5,3,'8GB (8GBx1) PC4-17000 (2133MHz)',10000,NULL),(6,3,'16GB (8GBx2) PC4-17000 (2133MHz)',20000,NULL),(7,4,'インテルHDグラフィックス(プロセッサー内蔵)',0,NULL),(8,4,'AMD Radeon™ 530',6000,NULL),(9,4,'AMD Radeon™ RX Vega M GL グラフィックス',20000,NULL),(10,5,'500GB ハードドライブ (SATA, 7200回転)',3000,NULL),(11,5,'1TB ハードドライブ (SATA, 7200回転)',5000,NULL),(12,5,'128GB M.2 SSD (SATA NVMe)　＋\n1TB ハードドライブ (SATA, 5400回転)',10000,NULL),(13,5,'256GB M.2 SSD (SATA NVMe)　＋ 1TB ハードドライブ (SATA, 5400回転)',15000,NULL),(14,6,'Windows 10 Home (64bit)',16000,NULL),(15,6,'Windows 10 Business (64bit)',27000,NULL),(16,7,'オフィス搭載なし',0,NULL),(17,7,'Microsoft Office Personal Premium',16800,NULL),(18,7,'Microsoft Office Home & Business Premium',22400,NULL),(19,1,'オールインワンモデルABX-2018年版',25800,NULL),(20,8,'組み立ててお届け',0,NULL),(21,8,'自分で組み立てる',-10000,NULL);
/*!40000 ALTER TABLE `m_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_item_type`
--

DROP TABLE IF EXISTS `m_item_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `m_item_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_category` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_UNIQUE` (`type_name`),
  UNIQUE KEY `type_category_UNIQUE` (`type_category`),
  UNIQUE KEY `type_img_UNIQUE` (`type_img`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_item_type`
--

LOCK TABLES `m_item_type` WRITE;
/*!40000 ALTER TABLE `m_item_type` DISABLE KEYS */;
INSERT INTO `m_item_type` VALUES (1,'base','ベースモデル','01_base.png'),(2,'cpu','プロセッサー（CPU)','02_cpu.png'),(3,'ram','メモリ','03_ram.png'),(4,'graphics','グラフィックス','04_graphics.png'),(5,'storage','ストレージ','05_storage.png'),(6,'os','OS','06_os.png'),(7,'office','オフィス','07_office.png'),(8,'assemble','組み立て','08_assemble.png');
/*!40000 ALTER TABLE `m_item_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_buy`
--

DROP TABLE IF EXISTS `t_buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_buy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `delivery_method_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `base` int(11) NOT NULL,
  `cpu` int(11) NOT NULL,
  `ram` int(11) NOT NULL,
  `graphics` int(11) NOT NULL,
  `storage` int(11) NOT NULL,
  `os` int(11) NOT NULL,
  `office` int(11) NOT NULL,
  `assemble` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_buy`
--

LOCK TABLES `t_buy` WRITE;
/*!40000 ALTER TABLE `t_buy` DISABLE KEYS */;
INSERT INTO `t_buy` VALUES (1,11,76600,1,'2018-07-25 15:09:32',19,1,4,7,10,14,17,20),(2,11,59800,1,'2018-07-25 15:36:30',19,1,4,7,10,14,16,20),(3,11,76600,1,'2018-07-25 15:37:38',19,1,4,7,10,14,17,20),(4,11,76600,1,'2018-07-25 16:42:43',19,1,4,7,10,14,17,20),(5,13,76600,1,'2018-07-25 16:48:53',19,1,4,7,10,14,17,20),(6,11,84600,3,'2018-07-25 18:25:03',19,2,4,7,10,14,17,20),(7,11,59800,1,'2018-07-26 10:04:06',19,1,4,7,10,14,16,20),(8,11,49800,1,'2018-07-26 10:53:32',19,1,4,7,10,14,16,21),(9,15,112800,1,'2018-07-26 10:59:01',19,3,6,9,11,14,16,21),(10,15,59800,1,'2018-07-26 11:18:02',19,1,4,7,10,14,16,20);
/*!40000 ALTER TABLE `t_buy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` text,
  `zipcode` text,
  `address` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(256) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `idx_t_user_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (11,'テストユーザー','test@gmail.com','51c38be2eadb0e47af837f995740eeebc48af2f5b8411b48bb2a3221c4f3b965','166-0003','東京都杉並区','090-1234-1234','2018-07-10'),(15,'テストユーザー','test@test.com','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','166-0003','東京都杉並区高円寺南','090-1234-1234','2018-07-26');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-26 12:02:48
