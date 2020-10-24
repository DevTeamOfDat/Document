CREATE DATABASE  IF NOT EXISTS `webbangiayphp` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `webbangiayphp`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: webbangiayphp
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chi_tiet_hoa_dons`
--

DROP TABLE IF EXISTS `chi_tiet_hoa_dons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `chi_tiet_hoa_dons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ma_hoa_don` int(11) NOT NULL,
  `ma_san_pham` int(11) NOT NULL,
  `gia_ban` double(15,2) NOT NULL DEFAULT '0.00',
  `so_luong` int(11) NOT NULL DEFAULT '0',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_hoa_dons`
--

LOCK TABLES `chi_tiet_hoa_dons` WRITE;
/*!40000 ALTER TABLE `chi_tiet_hoa_dons` DISABLE KEYS */;
INSERT INTO `chi_tiet_hoa_dons` VALUES (1,19,5,334.00,696754,0),(2,1,13,91715932.00,82,1),(3,3,20,38.00,15668379,0),(4,9,8,2193.00,1,0),(5,17,9,95.00,5,1),(6,12,15,465593.00,735765,1),(7,3,20,9532.00,75036037,0),(8,4,1,618.00,747,1),(9,9,12,9725.00,9,1),(10,3,19,31.00,574946,0),(11,11,19,3357071.00,249713,0),(12,15,19,1533.00,642054,1),(13,13,13,276487.00,307066,1),(14,12,4,83.00,866,0),(15,9,15,0.00,910291645,1),(16,3,16,719.00,61408,1),(17,5,16,57492191.00,632015671,1),(18,8,14,380951513.00,831,1),(19,12,4,7295.00,4016,1),(20,16,19,9.00,41881,0);
/*!40000 ALTER TABLE `chi_tiet_hoa_dons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chi_tiet_phieu_nhaps`
--

DROP TABLE IF EXISTS `chi_tiet_phieu_nhaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `chi_tiet_phieu_nhaps` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ma_phieu_nhap` int(11) NOT NULL,
  `ma_san_pham` int(11) NOT NULL,
  `gia_nhap` double(15,2) NOT NULL DEFAULT '0.00',
  `so_luong` int(11) NOT NULL DEFAULT '0',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_phieu_nhaps`
--

LOCK TABLES `chi_tiet_phieu_nhaps` WRITE;
/*!40000 ALTER TABLE `chi_tiet_phieu_nhaps` DISABLE KEYS */;
INSERT INTO `chi_tiet_phieu_nhaps` VALUES (1,11,12,36349.00,1,0),(2,12,15,5121816.00,54025,0),(3,11,20,58409288.00,5470,0),(4,16,20,979056.00,46820345,1),(5,20,1,36.00,9096,1),(6,1,15,88731.00,28342100,1),(7,18,17,179719989.00,576527517,1),(8,13,18,7718.00,4938,0),(9,3,2,688.00,134971693,1),(10,17,2,44189996.00,2221,1),(11,6,12,76269.00,98,1),(12,1,13,8977.00,2136590,1),(13,13,16,503.00,59485791,1),(14,9,1,36271.00,64353221,0),(15,12,1,3.00,80490335,0),(16,20,18,47886.00,80599,1),(17,15,6,687771394.00,2,0),(18,18,6,921637297.00,73860,1),(19,8,17,28067259.00,255122,1),(20,8,16,57416.00,5973,1);
/*!40000 ALTER TABLE `chi_tiet_phieu_nhaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dac_trung_san_phams`
--

DROP TABLE IF EXISTS `dac_trung_san_phams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dac_trung_san_phams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `loai_dac_trung` int(11) NOT NULL,
  `ma_san_pham` int(11) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dac_trung_san_phams`
--

LOCK TABLES `dac_trung_san_phams` WRITE;
/*!40000 ALTER TABLE `dac_trung_san_phams` DISABLE KEYS */;
INSERT INTO `dac_trung_san_phams` VALUES (1,7,7,0),(2,11,16,1),(3,20,13,1),(4,17,11,1),(5,2,6,0),(6,10,20,1),(7,9,8,0),(8,9,19,0),(9,17,16,1),(10,19,1,1),(11,14,9,0),(12,18,15,0),(13,12,13,1),(14,12,9,1),(15,16,16,1),(16,8,11,1),(17,10,13,0),(18,17,13,0),(19,9,16,0),(20,7,17,1);
/*!40000 ALTER TABLE `dac_trung_san_phams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dac_trungs`
--

DROP TABLE IF EXISTS `dac_trungs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dac_trungs` (
  `loai_dac_trung` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ten_dac_trung` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mo_ta` text COLLATE utf8mb4_unicode_ci,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`loai_dac_trung`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dac_trungs`
--

LOCK TABLES `dac_trungs` WRITE;
/*!40000 ALTER TABLE `dac_trungs` DISABLE KEYS */;
INSERT INTO `dac_trungs` VALUES (1,'Fermin Pollich','Est aut eos modi. Fugiat quia praesentium distinctio rem sequi enim pariatur in. Optio occaecati fugiat eveniet voluptatem facere. Ipsam et et aliquam necessitatibus.',1),(2,'Mr. Adriel Hermann','Saepe nihil et asperiores doloribus. Nobis vel dolor quaerat culpa. Qui aliquid omnis nobis et accusantium.',0),(3,'Veda Macejkovic','Dicta harum voluptatem culpa molestiae inventore. Eum maiores qui dolorem pariatur inventore accusamus aspernatur.',1),(4,'Jerod Johnston','Mollitia id totam est esse. Reprehenderit at laboriosam at animi iusto. Fugiat dolores suscipit quis consequatur quia. Ex libero autem possimus in voluptatem animi ratione fugit.',1),(5,'Layla Abshire','Deserunt debitis assumenda vel impedit. Ea repellendus tempore iure quaerat. Consequatur maiores dignissimos eum. Est maiores ducimus modi perspiciatis et. Exercitationem totam rem consequatur.',0),(6,'Ashleigh Schaden','Nam cumque laboriosam temporibus et. Mollitia voluptatem ipsum ducimus illum ipsam alias quia sapiente. Excepturi ea recusandae et qui qui. Voluptas distinctio sed odit fugiat aut eos velit.',1),(7,'Ms. Maryam Olson','Laudantium et dolore debitis id suscipit nisi eos. Omnis error aut suscipit consequatur occaecati aut possimus culpa. Similique praesentium ad ut.',1),(8,'Estefania Bernier III','Cumque animi illo non asperiores nisi earum praesentium. Eum assumenda sapiente omnis maiores. Facilis enim accusamus id. Nam blanditiis tempore architecto aut et non at.',0),(9,'Ms. Alyce Bayer I','Magnam id enim earum eum praesentium commodi officiis. Aut iusto omnis et nemo dolorem.',1),(10,'Mrs. Nya Mayer DDS','Explicabo voluptatibus nesciunt et ut nam. Sit commodi accusantium laborum aut nobis repudiandae officiis.',1),(11,'Christ Considine','Unde odio eius suscipit velit quis. Rerum dolores consequatur reiciendis ex. Facilis aut expedita exercitationem quaerat. A molestias nihil ex aspernatur quasi est numquam.',0),(12,'Kaylee Rutherford','Incidunt debitis quas ut. Vel voluptatibus id ab et velit veritatis. Dolores possimus quis nesciunt rerum ut neque tempore. Et sint aperiam quas in eveniet.',0),(13,'Braxton Terry','Voluptas inventore est praesentium. Voluptas odit et pariatur at perspiciatis. Doloribus nihil occaecati sed necessitatibus veritatis eos porro. Quia itaque modi quis quaerat.',0),(14,'Elias Lubowitz','Ut qui sint consequatur iste. Ex dolorem et rerum alias assumenda aut porro. Ipsa excepturi adipisci ad accusamus perspiciatis velit ad eum. Et fugit temporibus facilis atque laborum.',1),(15,'Eloise Ankunding','Excepturi placeat facere ut. Voluptatibus est quis at et aut quaerat minima. Voluptas facilis distinctio molestiae consectetur nesciunt.',1),(16,'Dr. Jovani Quitzon DVM','Minima inventore et ipsam illo. Et eos ducimus voluptatibus sed et.',1),(17,'Julia Cremin','Accusantium totam porro vitae est. Hic sint consequatur quia at accusantium. Occaecati sunt est et libero hic sint. Blanditiis qui fugit nemo voluptas voluptate ut minima.',1),(18,'Prof. Johnpaul Jerde','Commodi consectetur velit placeat ipsa quia quibusdam. Rerum inventore qui eius molestias ipsa. Cupiditate ullam possimus neque a nulla aperiam. Enim iusto dicta aliquid enim ex.',1),(19,'Dr. Soledad Deckow','Autem voluptas ab iusto est asperiores. Atque omnis earum voluptas voluptas at qui libero. Quibusdam voluptatem tempore ad.',1),(20,'Amy King','Explicabo molestiae dolorem quis doloribus quo illo error est. Et officiis et similique et impedit ut. Perspiciatis a ipsam amet accusamus ducimus.',1);
/*!40000 ALTER TABLE `dac_trungs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hinh_anh_san_phams`
--

DROP TABLE IF EXISTS `hinh_anh_san_phams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hinh_anh_san_phams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ma_san_pham` int(11) NOT NULL,
  `hinh_anh` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `hinh_anh_san_phams_hinh_anh_unique` (`hinh_anh`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hinh_anh_san_phams`
--

LOCK TABLES `hinh_anh_san_phams` WRITE;
/*!40000 ALTER TABLE `hinh_anh_san_phams` DISABLE KEYS */;
INSERT INTO `hinh_anh_san_phams` VALUES (1,19,'https://lorempixel.com/640/480/?34794',1),(2,6,'https://lorempixel.com/640/480/?80431',1),(3,2,'https://lorempixel.com/640/480/?94972',0),(4,20,'https://lorempixel.com/640/480/?48505',0),(5,15,'https://lorempixel.com/640/480/?44959',0),(6,10,'https://lorempixel.com/640/480/?51358',1),(7,3,'https://lorempixel.com/640/480/?30287',0),(8,6,'https://lorempixel.com/640/480/?70431',0),(9,11,'https://lorempixel.com/640/480/?92000',1),(10,1,'https://lorempixel.com/640/480/?94637',0),(11,16,'https://lorempixel.com/640/480/?59511',0),(12,4,'https://lorempixel.com/640/480/?61297',0),(13,6,'https://lorempixel.com/640/480/?50534',1),(14,15,'https://lorempixel.com/640/480/?16702',1),(15,13,'https://lorempixel.com/640/480/?52387',0),(16,17,'https://lorempixel.com/640/480/?76387',0),(17,12,'https://lorempixel.com/640/480/?10955',0),(18,5,'https://lorempixel.com/640/480/?48537',1),(19,1,'https://lorempixel.com/640/480/?74016',1),(20,16,'https://lorempixel.com/640/480/?35763',0);
/*!40000 ALTER TABLE `hinh_anh_san_phams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoa_dons`
--

DROP TABLE IF EXISTS `hoa_dons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hoa_dons` (
  `ma_hoa_don` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ma_nhan_vien` int(11) NOT NULL,
  `ma_khach_hang` int(11) NOT NULL,
  `ngay_lap` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loai_don` tinyint(1) NOT NULL,
  `trang_thai` tinyint(1) NOT NULL,
  `tong_tien` double(15,2) NOT NULL DEFAULT '0.00',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ma_hoa_don`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoa_dons`
--

LOCK TABLES `hoa_dons` WRITE;
/*!40000 ALTER TABLE `hoa_dons` DISABLE KEYS */;
INSERT INTO `hoa_dons` VALUES (1,20,6,'20-09-1975 | 17:09',1,0,0.00,1),(2,13,4,'28-02-2012 | 10:07',1,1,0.00,1),(3,9,19,'11-07-2019 | 10:32',1,1,0.00,1),(4,20,15,'15-08-1997 | 01:09',0,1,0.00,0),(5,16,15,'08-03-1971 | 10:58',0,1,0.00,0),(6,12,2,'10-08-1978 | 21:54',0,1,0.00,0),(7,12,6,'07-02-1991 | 20:24',0,1,0.00,1),(8,13,6,'24-11-2004 | 03:00',0,0,0.00,1),(9,20,19,'26-03-1987 | 21:06',1,1,0.00,1),(10,12,19,'20-12-2012 | 16:25',0,0,0.00,0),(11,20,10,'25-10-2005 | 13:47',1,1,0.00,0),(12,16,10,'04-10-1999 | 23:34',1,1,0.00,1),(13,16,6,'25-11-2019 | 22:05',0,0,0.00,0),(14,16,19,'22-06-2018 | 16:41',0,0,0.00,0),(15,16,19,'23-04-2013 | 04:51',1,0,0.00,0),(16,9,4,'05-10-1998 | 02:36',1,1,0.00,0),(17,13,10,'21-07-2004 | 23:17',0,1,0.00,1),(18,16,6,'15-04-1972 | 18:20',0,1,0.00,1),(19,9,2,'30-09-2013 | 20:32',0,0,0.00,0),(20,12,14,'11-03-1999 | 02:21',0,1,0.00,1);
/*!40000 ALTER TABLE `hoa_dons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khuyen_mai_san_phams`
--

DROP TABLE IF EXISTS `khuyen_mai_san_phams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `khuyen_mai_san_phams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ma_san_pham` int(11) DEFAULT NULL,
  `ma_loai_san_pham` int(11) DEFAULT NULL,
  `ma_thuong_hieu` int(11) DEFAULT NULL,
  `ma_ngay_khuyen_mai` int(11) NOT NULL,
  `muc_khuyen_mai` int(11) NOT NULL DEFAULT '0' COMMENT '%',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khuyen_mai_san_phams`
--

LOCK TABLES `khuyen_mai_san_phams` WRITE;
/*!40000 ALTER TABLE `khuyen_mai_san_phams` DISABLE KEYS */;
INSERT INTO `khuyen_mai_san_phams` VALUES (1,17,13,11,1,9,1),(2,12,15,14,15,72,0),(3,11,12,9,9,83,1),(4,7,10,20,12,9,1),(5,12,20,7,20,72,0),(6,19,15,15,17,58,1),(7,9,4,9,15,96,1),(8,7,19,6,18,60,1),(9,3,16,20,16,77,1),(10,8,10,8,4,72,0),(11,20,5,11,14,37,0),(12,14,17,6,11,90,0),(13,10,11,15,8,99,1),(14,12,8,8,12,30,0),(15,7,1,9,1,95,1),(16,2,10,10,15,28,0),(17,17,2,19,14,97,0),(18,19,13,18,11,7,1),(19,9,19,19,6,21,1),(20,1,2,17,6,33,0);
/*!40000 ALTER TABLE `khuyen_mai_san_phams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loai_dons`
--

DROP TABLE IF EXISTS `loai_dons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `loai_dons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gia_tri` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mo_ta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai_dons`
--

LOCK TABLES `loai_dons` WRITE;
/*!40000 ALTER TABLE `loai_dons` DISABLE KEYS */;
INSERT INTO `loai_dons` VALUES (1,'true','Lập trực tuyến',1),(2,'false','Lập tại cửa hàng',1);
/*!40000 ALTER TABLE `loai_dons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loai_san_phams`
--

DROP TABLE IF EXISTS `loai_san_phams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `loai_san_phams` (
  `ma_loai_san_pham` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ten_loai_san_pham` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mo_ta` text COLLATE utf8mb4_unicode_ci,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ma_loai_san_pham`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai_san_phams`
--

LOCK TABLES `loai_san_phams` WRITE;
/*!40000 ALTER TABLE `loai_san_phams` DISABLE KEYS */;
INSERT INTO `loai_san_phams` VALUES (1,'Prof. Betsy Skiles','Et ut mollitia sint. Ut excepturi porro nam. Pariatur sit ad et quia doloribus.',1),(2,'Gwen Schuppe','Nemo rem quod reiciendis iure. Temporibus velit quia omnis nemo ipsam. Sunt sed exercitationem delectus unde qui quos et. Porro accusantium est debitis dolor veniam architecto beatae consectetur.',1),(3,'Dr. Isidro Hand IV','Ipsa sit laudantium sed est. Et omnis inventore nihil non. Quidem unde natus omnis magnam. Sunt iusto aut exercitationem consequatur omnis laboriosam molestiae a.',1),(4,'Mr. Niko Pollich','Eum id et consequatur quod debitis natus quisquam. Rem minima nesciunt iusto accusantium ex quia qui. Sunt qui voluptatem et excepturi. Ut adipisci praesentium magnam dolores sit.',0),(5,'Marshall Stark II','Similique mollitia cumque itaque sit labore sed. Et voluptatem quia neque rerum dolorum placeat voluptatem. Enim ab itaque asperiores corrupti nam.',0),(6,'Dr. Lamont Leuschke DVM','Fugiat et praesentium aut voluptatem rem dolorum. Et in et quia necessitatibus. Culpa quo omnis ut. Fuga consequatur delectus maxime magnam et. Ut quia nihil non rerum esse sed.',1),(7,'Ms. Izabella Bruen III','Non libero laboriosam est dolorum aut. Voluptatem rerum sapiente nam et. Officia amet rerum quasi exercitationem.',0),(8,'Valentine Schultz','Et mollitia quis est ea omnis. Consectetur magnam eaque neque rerum. Occaecati minima quaerat ab alias voluptatibus harum.',0),(9,'Verner Gibson','Tenetur delectus dignissimos qui qui enim quae eius. Consequatur blanditiis aut voluptas commodi qui quia saepe ipsa. Sed consequatur sit aperiam cum aut ratione.',1),(10,'Braxton Frami','Expedita similique cupiditate provident mollitia. Suscipit amet at ab minima nihil officia. Inventore culpa ut qui eaque. Laudantium voluptatem quidem molestiae placeat veritatis labore.',1),(11,'Chaz Stanton','Perspiciatis rerum qui rem consequatur et ea. Quidem aut optio iure sequi cum ut voluptatibus.',0),(12,'Desmond Langworth','Aliquid sit maiores totam eveniet. Unde cum ut esse ut. Iste unde laborum unde voluptatem. Eligendi ullam blanditiis autem libero rerum dolorum et.',1),(13,'Rolando Schinner','Consequuntur vel hic nisi dolores. Ex voluptas minima at ad atque accusantium expedita. Commodi ut quia fugiat mollitia voluptas atque. Rerum eos et in esse cum sed.',1),(14,'Pierre Lockman Sr.','Et eos totam et et nemo ratione et. Reprehenderit quisquam unde molestiae adipisci fugiat. Cum pariatur aut optio. Delectus nulla inventore placeat quis quaerat sequi maiores voluptas.',0),(15,'Dorothy Gerhold','Suscipit omnis est quos ad omnis. Officia omnis voluptatem suscipit ducimus deleniti autem odit. Unde repellat non qui molestias autem neque. Iste et sint voluptates explicabo fugit.',0),(16,'Clinton Hoeger I','Rerum similique consequuntur assumenda sequi voluptas quis laudantium. Mollitia officia id sit tenetur molestiae quibusdam id. Optio quia vel sint consequuntur.',0),(17,'Nettie Heidenreich','Ut officiis veritatis velit quaerat tempora voluptas voluptas. Quam quia non qui dignissimos nesciunt id et. Autem temporibus debitis facere suscipit esse quidem.',0),(18,'Paris Emard','Ea rerum et amet eius ab quod cum. Autem repudiandae quo ea nobis expedita eos et. Reiciendis doloremque non facere maiores. Rerum id esse modi amet consectetur.',1),(19,'Cecil Kutch','Molestiae molestiae optio debitis qui velit laboriosam. Quia temporibus sed magnam quisquam omnis eos soluta. Maiores repellat voluptates quisquam sed quia.',1),(20,'Prof. Triston Pouros IV','Vel ut id architecto. Necessitatibus itaque eius corrupti sit. Exercitationem laborum vel iste qui quas ratione unde deserunt.',1);
/*!40000 ALTER TABLE `loai_san_phams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loai_tai_khoans`
--

DROP TABLE IF EXISTS `loai_tai_khoans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `loai_tai_khoans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gia_tri` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mo_ta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai_tai_khoans`
--

LOCK TABLES `loai_tai_khoans` WRITE;
/*!40000 ALTER TABLE `loai_tai_khoans` DISABLE KEYS */;
INSERT INTO `loai_tai_khoans` VALUES (1,'KH','Khách hàng',1),(2,'NV','Nhân viên',1),(3,'QT','Quản trị',1);
/*!40000 ALTER TABLE `loai_tai_khoans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (10,'2014_10_12_000000_create_tai_khoans_table',1),(11,'2014_10_12_100000_create_password_resets_table',1),(12,'2016_06_01_000001_create_oauth_auth_codes_table',1),(13,'2016_06_01_000002_create_oauth_access_tokens_table',1),(14,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(15,'2016_06_01_000004_create_oauth_clients_table',1),(16,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(17,'2019_08_19_000000_create_failed_jobs_table',1),(18,'2020_10_14_004211_create_nha_cung_caps_table',1),(19,'2020_10_14_014912_create_phieu_nhaps_table',2),(20,'2020_10_14_162121_create_hoa_dons_table',2),(21,'2020_10_14_163956_create_thuong_hieus_table',2),(22,'2020_10_14_164434_create_loai_san_phams_table',2),(23,'2020_10_14_165345_create_dac_trungs_table',2),(24,'2020_10_14_165414_create_san_phams_table',2),(25,'2020_10_14_165443_create_nhan_xets_table',2),(26,'2020_10_14_165509_create_dac_trung_san_phams_table',2),(27,'2020_10_14_172357_create_loai_tai_khoans_table',2),(28,'2020_10_14_172842_create_trang_thais_table',2),(29,'2020_10_14_173319_create_loai_dons_table',2),(30,'2020_10_15_060930_create_ngay_khuyen_mais_table',2),(31,'2020_10_15_061300_create_voichers_table',2),(32,'2020_10_15_144412_create_hinh_anh_san_phams_table',2),(33,'2020_10_15_151242_create_khuyen_mai_san_phams_table',2),(34,'2020_10_15_160006_create_chi_tiet_hoa_dons_table',2),(35,'2020_10_15_160024_create_chi_tiet_phieu_nhaps_table',2),(36,'2020_10_16_013408_create_tin_tucs_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ngay_khuyen_mais`
--

DROP TABLE IF EXISTS `ngay_khuyen_mais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ngay_khuyen_mais` (
  `ma_ngay_khuyen_mai` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ngay_gio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ma_ngay_khuyen_mai`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ngay_khuyen_mais`
--

LOCK TABLES `ngay_khuyen_mais` WRITE;
/*!40000 ALTER TABLE `ngay_khuyen_mais` DISABLE KEYS */;
INSERT INTO `ngay_khuyen_mais` VALUES (1,'24-03-2009',1),(2,'02-05-1978',0),(3,'08-12-2002',0),(4,'24-02-1999',0),(5,'20-04-2000',0),(6,'26-01-1982',1),(7,'30-07-2009',1),(8,'20-11-1976',0),(9,'12-06-1994',0),(10,'29-06-2016',0),(11,'19-04-1996',1),(12,'26-09-1988',1),(13,'17-07-1982',0),(14,'27-09-1978',0),(15,'11-07-2004',1),(16,'08-11-2012',1),(17,'19-09-2017',0),(18,'31-03-2015',0),(19,'04-06-1976',1),(20,'21-09-2007',1);
/*!40000 ALTER TABLE `ngay_khuyen_mais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nha_cung_caps`
--

DROP TABLE IF EXISTS `nha_cung_caps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `nha_cung_caps` (
  `ma_nha_cung_cap` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dia_chi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hot_line` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `so_dien_thoai` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hinh_anh` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ma_nha_cung_cap`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nha_cung_caps`
--

LOCK TABLES `nha_cung_caps` WRITE;
/*!40000 ALTER TABLE `nha_cung_caps` DISABLE KEYS */;
INSERT INTO `nha_cung_caps` VALUES (1,'Hamill PLC','9586 Greenholt Courts Apt. 827\nElmoreton, OR 71116-0803','9981169','lance.gleason@boyer.com','393328152','https://lorempixel.com/640/480/?37296',0),(2,'Orn, Streich and Metz','711 Rowe Summit Apt. 476\nNorth Samanthabury, MI 40252-4685','76','torey.smith@hudson.com','200327','https://lorempixel.com/640/480/?52663',0),(3,'Gulgowski, Spinka and Hackett','12366 Mavis Views\nRamonafurt, WI 78511-4283','62','wehner.kyra@crona.com','79036','https://lorempixel.com/640/480/?74113',0),(4,'Terry-Treutel','5622 Rosamond Points Apt. 361\nDinaland, WA 30412-6613','7','aorn@cruickshank.com','8','https://lorempixel.com/640/480/?68647',0),(5,'Littel and Sons','99860 Larson Skyway Apt. 854\nKertzmannside, MT 17663','745','alford00@lemke.com','99','https://lorempixel.com/640/480/?65200',0),(6,'D\'Amore, Abernathy and Jacobs','70681 Eulah Parkway\nEast Demetrisfort, IN 69918','282304','estark@bins.com','2','https://lorempixel.com/640/480/?58227',0),(7,'Koch-Rogahn','10787 Rutherford Spring\nSouth Ashley, HI 98176','18','gislason.clifton@nikolaus.com','0','https://lorempixel.com/640/480/?85889',0),(8,'Hettinger-Fay','37287 Hauck Roads Suite 713\nSouth Dereck, MS 77739','5916','jerel.ebert@braun.com','88','https://lorempixel.com/640/480/?61361',0),(9,'Sauer, Weber and VonRueden','406 Kub Land Suite 056\nNorth Efrenton, AR 03430','892024875','doyle.julia@hoeger.info','78213','https://lorempixel.com/640/480/?46254',0),(10,'Heidenreich-Johnston','785 Leila Orchard Apt. 319\nAdahmouth, TX 56056','938213','hhegmann@jast.info','6','https://lorempixel.com/640/480/?59206',1),(11,'Stracke Group','537 Daugherty Expressway\nNew Ladariusborough, LA 18125','215720','purdy.earlene@runolfsson.com','9927140','https://lorempixel.com/640/480/?14347',1),(12,'Jakubowski Group','5585 O\'Kon Highway Apt. 887\nFarrellview, SC 10437','1','vicenta.mcglynn@hoeger.com','8796','https://lorempixel.com/640/480/?49711',0),(13,'Kunde PLC','96544 Reinger Cove Suite 501\nEast Chadrick, NJ 64479','16090','garett85@heller.com','56414854','https://lorempixel.com/640/480/?70991',0),(14,'Haag, Daugherty and Hudson','75648 Rowe Crescent Suite 088\nNorth Abigaleville, ND 04256','4','hudson.tess@mosciski.com','3','https://lorempixel.com/640/480/?63781',1),(15,'Fahey, Champlin and Predovic','1759 Arch Parkways\nLake Rutheborough, FL 26604-1348','806110','jakubowski.london@mante.com','20823','https://lorempixel.com/640/480/?63435',0),(16,'Sporer, Abbott and Smith','7141 Fahey Run Suite 844\nWest Alvena, NE 21751-2078','4972','devon.waters@balistreri.com','3332','https://lorempixel.com/640/480/?89904',0),(17,'Dare LLC','5989 Weber Tunnel\nEast Ally, AZ 94205','75512304','makenzie.luettgen@gibson.net','932126852','https://lorempixel.com/640/480/?82034',1),(18,'Cole LLC','88766 Osbaldo Run\nChristinestad, DE 47107-5869','81229','heath.streich@monahan.com','23914','https://lorempixel.com/640/480/?82666',0),(19,'Muller-Murphy','3278 Giuseppe Plains\nSouth Benedictport, WV 42316','50903','corwin.nyasia@abbott.com','4','https://lorempixel.com/640/480/?16170',0),(20,'Larkin Ltd','280 Doyle Pines\nSouth Jovani, NM 26389-4105','1','clair.stanton@walter.com','595618531','https://lorempixel.com/640/480/?43707',1);
/*!40000 ALTER TABLE `nha_cung_caps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhan_xets`
--

DROP TABLE IF EXISTS `nhan_xets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `nhan_xets` (
  `ma_nhan_xet` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ma_san_pham` int(11) DEFAULT NULL,
  `ma_khach_hang` int(11) NOT NULL,
  `binh_luan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ma_nhan_xet`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhan_xets`
--

LOCK TABLES `nhan_xets` WRITE;
/*!40000 ALTER TABLE `nhan_xets` DISABLE KEYS */;
INSERT INTO `nhan_xets` VALUES (1,11,19,'Doloribus quibusdam perspiciatis quia veritatis. Praesentium eveniet quia a delectus. Sint ut beatae amet a iusto quaerat excepturi placeat.',0),(2,3,6,'Numquam ab voluptatibus dolore eum. Qui saepe eius optio qui voluptatibus aut. Aut porro enim qui facilis id consectetur. Mollitia eius eius repellat aperiam.',0),(3,19,2,'Doloremque et ut accusamus aut. Accusamus aliquid sequi et sapiente. Et vitae natus sed aut illum iusto illum.',0),(4,1,15,'Molestiae quas et tempora et et. Voluptas ut eos quia culpa. Facilis illo nisi minus eaque. Aut est ut aut nulla odio qui tempora.',0),(5,20,8,'Optio commodi error aut eos officiis quia explicabo. Ut accusantium vitae nostrum est labore. Et alias ipsam ad sunt iure nostrum laboriosam.',0),(6,14,6,'Excepturi veniam illo autem et ratione. Et voluptatem dicta quod ea. Qui id deleniti officia debitis sit sit.',0),(7,5,4,'Fugiat facilis molestias soluta occaecati dignissimos. Consectetur eligendi sequi omnis iure eius assumenda incidunt. Enim sit odio aut ut. Quis maxime ut nam corrupti corporis.',0),(8,19,6,'Et quia ut eligendi accusantium. Sunt sit eaque laboriosam veritatis voluptatem error vel. Repellat eum aut quia quod accusamus iste. Beatae neque illo quo ut aut.',0),(9,19,8,'Et reiciendis dicta iure ducimus aperiam alias eius. Consequatur eaque ratione provident debitis nesciunt atque aut. At dolores quia sunt accusamus voluptatibus quisquam.',0),(10,13,8,'Quia vel qui omnis placeat. Architecto reprehenderit iure sed et et eos. Ut eius consequuntur et.',0),(11,7,4,'Nisi sed autem ea nam aut fugit error quasi. Voluptatum tempore labore dolor nihil perferendis. Quaerat aperiam distinctio quia et unde sunt voluptas. Omnis suscipit sed qui dolorem.',0),(12,9,8,'Quasi necessitatibus et quis eum optio. Ipsum quo qui tenetur voluptas quas deserunt mollitia. Nulla in ab est eligendi velit at voluptatem. Consequatur rerum ratione non soluta.',0),(13,3,6,'Cum dolores est qui est. Qui delectus blanditiis alias nobis modi. Reiciendis voluptatum nisi et fugit quasi sint.',1),(14,6,2,'Suscipit in non nihil et laborum id doloremque. Eaque omnis quibusdam est fugit. Ratione magnam aut ut autem atque quae natus.',1),(15,7,2,'Atque adipisci ut animi pariatur et sed alias quia. Cupiditate alias eveniet eveniet quis nostrum. Dolores nemo deleniti et est rem tempora facere. Id omnis est est totam deserunt consequatur eaque.',0),(16,8,15,'Vel non suscipit error hic facere. Voluptatem magni ut laborum provident ut enim. Suscipit atque dignissimos eligendi provident. Omnis laboriosam saepe est ut sapiente aut.',1),(17,18,2,'Temporibus illum tempora repellendus ut. Suscipit quaerat laboriosam ea magnam labore ut sit. Quos corrupti nemo possimus rerum quasi. Mollitia aut sint maiores quos voluptatum.',1),(18,13,8,'Ut qui quo quia delectus aut. Eaque quia et aspernatur ea nihil reprehenderit et. Omnis ipsam pariatur sunt quidem. Esse minima labore aut eum.',0),(19,7,10,'Aut accusamus consequuntur modi illum id fuga. Consequatur autem vero unde molestias maxime. Quia est fuga sint consequatur nemo quidem. Dignissimos aut aut fuga error et illum quos.',0),(20,7,14,'Aut consequatur neque sint rerum voluptas. Adipisci commodi laborum libero suscipit inventore. Qui voluptate facilis aliquam est aliquam sunt est. Qui error delectus quia facilis odio omnis aut.',0);
/*!40000 ALTER TABLE `nhan_xets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('d5db3a0c40273d0425686190ad655e4f680543728202bc2bb84cbfd024243e2926afe8a53b835777',NULL,3,'WebsiteBanGiayPHP','[]',0,'2020-10-22 17:26:35','2020-10-22 17:26:35','2021-10-23 00:26:35'),('eee00e47ec3cd728640b6071bb1fed1d52d61bbd39c81302822e5054919daf83de189feef62e658d',NULL,3,'WebsiteBanGiayPHP','[]',0,'2020-10-22 17:22:04','2020-10-22 17:22:04','2021-10-23 00:22:04');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','ICt8jhj7NL5Pomtp63EGFHnoZSAPJYabctyJvZnY',NULL,'http://localhost',1,0,0,'2020-10-22 07:41:02','2020-10-22 07:41:02'),(2,NULL,'Laravel Password Grant Client','ElQFWlL6xkjK3Omxm5cF0rjrAF7ZggHqUjDBvbjz','users','http://localhost',0,1,0,'2020-10-22 07:41:02','2020-10-22 07:41:02'),(3,NULL,'Laravel Personal Access Client','VHkNvUbzgDcD9vaJlJdqtVfYtPItyiq1Q4PsOBA7',NULL,'http://localhost',1,0,0,'2020-10-22 07:42:23','2020-10-22 07:42:23'),(4,NULL,'Laravel Password Grant Client','SqjXAWiH2FdD5LNdI1l2pBxxcQmjwitAmuOMNpiJ','users','http://localhost',0,1,0,'2020-10-22 07:42:23','2020-10-22 07:42:23');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2020-10-22 07:41:02','2020-10-22 07:41:02'),(2,3,'2020-10-22 07:42:23','2020-10-22 07:42:23');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieu_nhaps`
--

DROP TABLE IF EXISTS `phieu_nhaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `phieu_nhaps` (
  `ma_phieu_nhap` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ma_nhan_vien` int(11) NOT NULL,
  `ma_nha_cung_cap` int(11) NOT NULL,
  `ngay_nhap` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trang_thai` tinyint(1) NOT NULL,
  `tong_tien` double(15,2) NOT NULL DEFAULT '0.00',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ma_phieu_nhap`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieu_nhaps`
--

LOCK TABLES `phieu_nhaps` WRITE;
/*!40000 ALTER TABLE `phieu_nhaps` DISABLE KEYS */;
INSERT INTO `phieu_nhaps` VALUES (1,11,5,'21-11-2003 | 08:21',0,0.00,0),(2,3,10,'22-06-1996 | 02:38',0,0.00,1),(3,1,10,'15-04-1991 | 15:06',0,0.00,1),(4,1,10,'27-08-1984 | 08:02',0,0.00,0),(5,5,19,'29-10-1980 | 04:43',1,0.00,0),(6,1,14,'09-02-2010 | 03:33',1,0.00,1),(7,17,5,'29-11-1971 | 13:00',0,0.00,1),(8,17,1,'02-07-2004 | 14:19',1,0.00,0),(9,11,8,'30-03-2010 | 09:35',1,0.00,1),(10,3,14,'13-02-2013 | 09:46',0,0.00,0),(11,5,14,'23-08-1972 | 18:49',1,0.00,0),(12,1,18,'24-04-1982 | 07:14',0,0.00,0),(13,3,18,'21-08-1984 | 23:52',0,0.00,1),(14,1,18,'22-10-1978 | 07:00',0,0.00,0),(15,17,6,'29-06-2006 | 12:21',1,0.00,1),(16,1,2,'26-05-2015 | 15:38',0,0.00,0),(17,11,6,'04-12-2003 | 13:05',1,0.00,0),(18,3,6,'14-02-2019 | 06:22',0,0.00,0),(19,18,12,'10-10-2000 | 07:55',1,0.00,1),(20,18,11,'22-05-1998 | 11:58',1,0.00,1);
/*!40000 ALTER TABLE `phieu_nhaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `san_phams`
--

DROP TABLE IF EXISTS `san_phams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `san_phams` (
  `ma_san_pham` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ma_thuong_hieu` int(11) NOT NULL,
  `ma_loai_san_pham` int(11) NOT NULL,
  `ten_san_pham` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gia_ban` double(15,2) NOT NULL DEFAULT '0.00',
  `so_luong` int(11) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ma_san_pham`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `san_phams`
--

LOCK TABLES `san_phams` WRITE;
/*!40000 ALTER TABLE `san_phams` DISABLE KEYS */;
INSERT INTO `san_phams` VALUES (1,14,1,'Dr. Issac Rutherford IV',83.00,852778348,0),(2,16,9,'Marcelino Wisoky',20.00,3811,1),(3,19,11,'Jabari Grimes',562148050.00,541587,0),(4,18,2,'Ms. Maegan Hermann III',35906949.00,8742510,1),(5,1,19,'Collin Welch',2208.00,2280436,1),(6,1,7,'Jevon Auer IV',0.00,865760,1),(7,5,13,'Prof. Maida Kassulke I',7285412.00,588560,0),(8,14,17,'Timmothy Bergnaum',97215291.00,48758582,1),(9,4,8,'German Thiel',616845704.00,16905195,0),(10,12,13,'Suzanne Koepp IV',257233.00,785,0),(11,16,16,'Leanna Fisher',812218.00,2732,0),(12,10,10,'Jayden Heaney',78.00,7178050,1),(13,13,15,'Jordyn Kutch',380.00,53,0),(14,12,2,'Rosamond Heller',12.00,101,0),(15,3,17,'Francisco Kling',20881963.00,6,0),(16,14,11,'Althea Cummerata',446350.00,129248829,1),(17,13,3,'Mr. Jonas McLaughlin IV',41977646.00,4790355,0),(18,17,17,'Erica DuBuque',12784812.00,461,0),(19,7,10,'Loren Pfeffer',787.00,26,0),(20,18,2,'Heather Lockman',33613.00,32220,1);
/*!40000 ALTER TABLE `san_phams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tai_khoans`
--

DROP TABLE IF EXISTS `tai_khoans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tai_khoans` (
  `ma_tai_khoan` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NOT NULL DEFAULT '2020-10-22 07:38:11',
  `mat_khau` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ho_ten` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dia_chi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `so_dien_thoai` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hinh_anh` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loai_tai_khoan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'KH',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ma_tai_khoan`),
  UNIQUE KEY `tai_khoans_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tai_khoans`
--

LOCK TABLES `tai_khoans` WRITE;
/*!40000 ALTER TABLE `tai_khoans` DISABLE KEYS */;
INSERT INTO `tai_khoans` VALUES (1,'noah50@hotmail.com','2020-10-22 07:38:12','.GuZ/Dc1Vgr\\a','Anderson Lind','42784 Spinka Greens\nVolkmanborough, MA 19236','254684169','https://lorempixel.com/640/480/?79726','QT',1,NULL,NULL,NULL),(2,'harmon72@gmail.com','2020-10-22 07:38:12','TgD-EhY~INVB7s6xEP+','Ms. Karine Gleason','17969 Granville Flats\nWest Noelia, VA 71646','754312932','https://lorempixel.com/640/480/?66425','KH',1,NULL,NULL,NULL),(3,'stoltenberg.amari@schmeler.net','2020-10-22 07:38:12','`\'blw(Vk','Miss Candida Daugherty MD','70764 Mueller Ranch\nDestiniborough, KY 54066-7145','2','https://lorempixel.com/640/480/?90803','QT',0,NULL,NULL,NULL),(4,'howell.bethel@yahoo.com','2020-10-22 07:38:13','|uk40r:087:R!!(ddx1_','Sofia Beier','58284 Gregory Parks Apt. 702\nNorth Orrinhaven, CT 68875-0497','7602097','https://lorempixel.com/640/480/?66719','KH',1,NULL,NULL,NULL),(5,'hessel.corbin@fadel.com','2020-10-22 07:38:13','a;,-RoS$8w7|M*r9u','Vernie Quigley','2200 Sheila Summit\nKubmouth, MS 95369-8914','639','https://lorempixel.com/640/480/?21370','QT',1,NULL,NULL,NULL),(6,'waldo22@schoen.com','2020-10-22 07:38:13','>b-_M-z~(JkPm','Sammy Moen','17158 Bradtke Mountains Apt. 722\nFreddieshire, WV 99297-4455','74754172','https://lorempixel.com/640/480/?48231','KH',1,NULL,NULL,NULL),(7,'powlowski.randy@gmail.com','2020-10-22 07:38:13','w&cO:)9p%wQHIMb6it\'','Pascale Beatty','59803 Breitenberg Knoll Apt. 071\nEast Trentonton, NV 38070-0729','9304','https://lorempixel.com/640/480/?86432','QT',1,NULL,NULL,NULL),(8,'hackett.leann@cormier.org','2020-10-22 07:38:13','Tlb}_4E6KEK','Monica O\'Hara','95656 Hane Plains Apt. 972\nKurtismouth, SD 32045','5','https://lorempixel.com/640/480/?90525','KH',1,NULL,NULL,NULL),(9,'theodore23@nicolas.biz','2020-10-22 07:38:13','.c0pwI>pbHU>-','Ariel Pagac V','38742 Yundt Points Apt. 612\nGoodwinport, ND 62595','7028174','https://lorempixel.com/640/480/?26043','NV',1,NULL,NULL,NULL),(10,'wgoyette@witting.net','2020-10-22 07:38:13','ROTE28whnw=Uy<^gt5','Vada Luettgen','476 Rice Fort\nTillmanchester, SC 58899','756017436','https://lorempixel.com/640/480/?99558','KH',1,NULL,NULL,NULL),(11,'joy61@torp.com','2020-10-22 07:38:13','nhBG|(bQ,.f','Brigitte Klein','152 Muriel Parkway\nLake Ruthiefort, MA 39896-0055','470324487','https://lorempixel.com/640/480/?95011','QT',0,NULL,NULL,NULL),(12,'stephania90@jacobi.com','2020-10-22 07:38:13','ZgLR<&@Xn','Prof. Kyle Heller','11082 Gutmann Keys\nWest Heloise, NH 01184','838182339','https://lorempixel.com/640/480/?90322','NV',1,NULL,NULL,NULL),(13,'schinner.osvaldo@grant.com','2020-10-22 07:38:13',')qzR~]6U^8','Jonatan Powlowski','1867 O\'Keefe Shoal Suite 746\nEast Ahmad, VA 23884','17817','https://lorempixel.com/640/480/?87615','NV',0,NULL,NULL,NULL),(14,'mertie.erdman@von.info','2020-10-22 07:38:13','|2$c;IX)\'!9$i+t','Timmothy Nicolas','662 Heber Crossroad\nLake Zelda, GA 36547-5995','839522182','https://lorempixel.com/640/480/?49807','KH',0,NULL,NULL,NULL),(15,'zboncak.susan@gmail.com','2020-10-22 07:38:13','L|&}u6PFoCd)OpBv','Lionel Moen','100 Darrel Neck Suite 424\nWatersmouth, NC 95991','72','https://lorempixel.com/640/480/?79570','KH',0,NULL,NULL,NULL),(16,'janae.torphy@kertzmann.org','2020-10-22 07:38:13',';aW-!@-h[','Dawn Schmeler','36218 Reva Ports Suite 447\nDaremouth, MI 65307','91964','https://lorempixel.com/640/480/?42011','NV',0,NULL,NULL,NULL),(17,'ebatz@jacobson.com','2020-10-22 07:38:13','}]W}=5u]/z|VBWQxI','Tito Kemmer DVM','7951 Cronin Fords Suite 915\nLake Consuelo, TN 85146-6723','379109097','https://lorempixel.com/640/480/?66425','QT',1,NULL,NULL,NULL),(18,'kaya39@grady.com','2020-10-22 07:38:14','JJs%C`!:oiaYZ[W91','Dr. Bonnie Kris MD','20365 Harvey Course\nNorth Jessburgh, AR 54249-3982','12269','https://lorempixel.com/640/480/?58424','QT',0,NULL,NULL,NULL),(19,'deborah.jacobi@gottlieb.org','2020-10-22 07:38:14','cl#$xZCe[tl~.a>k?','Hipolito Farrell','6354 Kellen Center Apt. 904\nRempelside, LA 93042','990157068','https://lorempixel.com/640/480/?80707','KH',0,NULL,NULL,NULL),(20,'miles.will@kuhlman.org','2020-10-22 07:38:14','On~H/uDaCdhm8c:0y)','Thalia Fisher','957 Powlowski Glen Apt. 297\nCruzfort, NH 44705-5159','38','https://lorempixel.com/640/480/?35035','NV',0,NULL,NULL,NULL),(21,'admin@gmail.com','2020-10-22 17:22:03','$2y$10$oCtuc/o2xqDDAtaE6dIwzOaBNM9jhe3Qf2TXEN7dQLPjjtwNIVyO.','VanNam212','TP Hà Nội','0345164784',NULL,'KH',1,NULL,NULL,NULL),(27,'admin2@gmail.com','2020-10-22 17:26:35','$2y$10$bm8cxQSB7ZiiiDsumAtEo.wKQk0wR279TCS.NqxDRUB/vwERF2tNC','VanNam212','TP Hà Nội','0345164784',NULL,'QT',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tai_khoans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thuong_hieus`
--

DROP TABLE IF EXISTS `thuong_hieus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `thuong_hieus` (
  `ma_thuong_hieu` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ten_thuong_hieu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ma_thuong_hieu`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thuong_hieus`
--

LOCK TABLES `thuong_hieus` WRITE;
/*!40000 ALTER TABLE `thuong_hieus` DISABLE KEYS */;
INSERT INTO `thuong_hieus` VALUES (1,'Bednar, Yost and Goyette',0),(2,'Thiel, Bailey and Waelchi',1),(3,'Torp PLC',1),(4,'Schneider, Schimmel and Wuckert',1),(5,'Donnelly Inc',0),(6,'McDermott Group',1),(7,'Leannon LLC',1),(8,'Bashirian Inc',0),(9,'Mohr-Jacobi',1),(10,'Kilback, Dickinson and Lowe',0),(11,'Pfannerstill LLC',0),(12,'Strosin, Jacobi and Lehner',0),(13,'Buckridge, O\'Keefe and Hoppe',1),(14,'Vandervort PLC',1),(15,'Bechtelar, Gulgowski and Orn',1),(16,'Labadie, Gaylord and Erdman',0),(17,'Shields, Rowe and Windler',1),(18,'Schimmel-Langworth',1),(19,'Boyle PLC',1),(20,'Conn, Stokes and Hamill',0);
/*!40000 ALTER TABLE `thuong_hieus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tin_tucs`
--

DROP TABLE IF EXISTS `tin_tucs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tin_tucs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tieu_de` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noi_dung` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `highlight` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ngay_dang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '22-10-2020',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tin_tucs`
--

LOCK TABLES `tin_tucs` WRITE;
/*!40000 ALTER TABLE `tin_tucs` DISABLE KEYS */;
INSERT INTO `tin_tucs` VALUES (1,'Dr.','Soluta dolorum iure asperiores. Dicta doloribus voluptates eos harum sunt. Odit ducimus qui vel veniam optio minus. Velit temporibus occaecati veritatis nihil soluta officia consequatur.','MR.','http://www.ratke.com/omnis-ea-eligendi-sed-maxime-dolor-quo-corporis','https://lorempixel.com/640/480/?98697','22-10-2020',1),(2,'Dr.','Numquam fuga in omnis fuga laboriosam et. Autem in eius et rerum. In aut sapiente laudantium vitae. Vero repudiandae cum adipisci vel.','PROF.','http://www.ruecker.com/est-nostrum-et-reiciendis-in','https://lorempixel.com/640/480/?48076','22-10-2020',1),(3,'Dr.','Consequatur aliquid a id earum corrupti distinctio. Voluptas molestiae reprehenderit rem. Blanditiis nostrum qui nostrum ad quia deleniti inventore.','MR.','http://www.mertz.com/veritatis-mollitia-officia-nam-nobis.html','https://lorempixel.com/640/480/?17285','22-10-2020',0),(4,'Dr.','Distinctio aut quod ducimus. Quo quibusdam rerum perspiciatis est rerum placeat dolor. Aut maxime veniam nihil et error non. Ducimus saepe incidunt dolor nihil ducimus.','MISS','http://brown.info/est-similique-dicta-voluptas-numquam-aspernatur','https://lorempixel.com/640/480/?80347','22-10-2020',0),(5,'Ms.','Repellendus vel a sit iste. Qui illo nulla ut ad molestiae. Molestias aliquid optio a qui tempora voluptatem.','DR.','http://brakus.org/occaecati-quas-sunt-et-eveniet-quaerat','https://lorempixel.com/640/480/?57776','22-10-2020',0),(6,'Dr.','Quis aspernatur iusto quam sed necessitatibus. Doloribus repudiandae officia qui aperiam tempora eum enim fugiat. A est voluptas nihil nemo itaque ut.','PROF.','http://www.hermann.info/minima-et-eius-a-repellendus-consequuntur.html','https://lorempixel.com/640/480/?73919','22-10-2020',1),(7,'Mr.','Dolorem nesciunt perferendis qui animi. Cum accusamus sit atque et sit animi. Quia id voluptas ut repellendus non quo repellat. Qui ut laudantium consequatur similique cupiditate.','MR.','https://www.padberg.info/dolor-ut-enim-numquam-veritatis-minima-ut-veritatis-quis','https://lorempixel.com/640/480/?68535','22-10-2020',1),(8,'Ms.','Enim et enim voluptas et perferendis. Dolorem perferendis dolor sit esse sint ullam iste. Exercitationem est nostrum est omnis numquam nisi optio.','MISS','http://www.satterfield.com/aut-odit-iure-et-assumenda-omnis-esse-mollitia','https://lorempixel.com/640/480/?35635','22-10-2020',0),(9,'Mrs.','Molestiae dolor est totam fuga. Saepe eos rerum occaecati est et minima. Quia omnis aspernatur ut error assumenda. Voluptate quia repellendus fugit illo nostrum ullam.','MISS','http://www.huels.org/illum-beatae-quisquam-voluptatem-vel-quidem-unde-voluptatibus-numquam.html','https://lorempixel.com/640/480/?13950','22-10-2020',0),(10,'Ms.','Porro quis corporis accusantium in iusto aperiam. Ipsam sequi ea consequuntur distinctio provident dolores possimus iste. Voluptas ut laboriosam placeat consequatur error commodi.','PROF.','http://www.mckenzie.info/quia-maiores-debitis-illo-saepe','https://lorempixel.com/640/480/?96351','22-10-2020',1),(11,'Prof.','Non ex neque natus saepe. Non voluptas possimus earum enim magni enim voluptas ut. Sed eos quidem facilis blanditiis doloribus velit est earum.','DR.','http://oconner.com/sunt-ut-dolorum-et-dicta','https://lorempixel.com/640/480/?70875','22-10-2020',1),(12,'Prof.','Qui vel reprehenderit et non. Voluptatem dolorum eaque nihil similique est quis ut. Consequatur eius pariatur perferendis ab. Eos ut autem omnis perspiciatis.','DR.','http://emard.com/a-delectus-blanditiis-omnis-doloremque.html','https://lorempixel.com/640/480/?64306','22-10-2020',1),(13,'Mr.','Voluptatibus voluptas fugiat in aut. Pariatur doloribus repudiandae eos cum.','DR.','http://sauer.info/placeat-consequatur-quia-voluptatem-et-corporis-libero-aperiam','https://lorempixel.com/640/480/?82010','22-10-2020',0),(14,'Prof.','Nemo et porro autem et consequuntur possimus ab. Repudiandae sed pariatur aspernatur numquam ad possimus non. Rerum qui ducimus dolore.','MR.','http://www.wunsch.com/','https://lorempixel.com/640/480/?71804','22-10-2020',0),(15,'Mr.','Aspernatur at molestias temporibus labore. Explicabo possimus at et magni et at voluptates. Cupiditate ullam quia occaecati iure.','DR.','http://www.becker.biz/quo-et-consequatur-debitis-dolorem-sequi-possimus-quos.html','https://lorempixel.com/640/480/?77103','22-10-2020',0),(16,'Dr.','Cupiditate aut laudantium corporis voluptatem impedit nam labore voluptatem. Quibusdam similique voluptatem sed eveniet sunt eos. Unde voluptas vitae eaque molestias autem.','DR.','https://www.langosh.com/enim-dolores-assumenda-dolores-delectus-officiis-rerum-quia-non','https://lorempixel.com/640/480/?85576','22-10-2020',1),(17,'Ms.','Quo iure nisi facere eos et. In et in veritatis similique. Hic facere minus non praesentium amet non.','DR.','http://www.simonis.com/','https://lorempixel.com/640/480/?15397','22-10-2020',0),(18,'Dr.','Harum corrupti pariatur et. Omnis blanditiis soluta in ut. Quibusdam vel odio quo quia necessitatibus autem omnis sequi. Quas quasi ut aut eos dolorem.','MRS.','http://www.wolff.com/voluptatem-consectetur-odio-qui-veritatis-blanditiis-et-et','https://lorempixel.com/640/480/?57587','22-10-2020',0),(19,'Prof.','Consequatur a laborum nulla facere. Voluptatem sed qui qui vitae. Porro omnis ipsum quia et non amet quam. Accusantium architecto tempora ut est omnis alias.','MISS','https://hoeger.com/illo-dolor-velit-quas-praesentium-a.html','https://lorempixel.com/640/480/?79939','22-10-2020',0),(20,'Dr.','Velit ratione inventore similique voluptas eos. Nisi incidunt dolores est atque ipsa magni ab. Placeat dignissimos modi eum accusantium molestiae qui accusantium.','PROF.','http://www.ritchie.com/facilis-rerum-odit-et-velit-voluptatibus-aut-voluptatem','https://lorempixel.com/640/480/?19844','22-10-2020',0);
/*!40000 ALTER TABLE `tin_tucs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trang_thais`
--

DROP TABLE IF EXISTS `trang_thais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `trang_thais` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gia_tri` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mo_ta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trang_thais`
--

LOCK TABLES `trang_thais` WRITE;
/*!40000 ALTER TABLE `trang_thais` DISABLE KEYS */;
INSERT INTO `trang_thais` VALUES (1,'true','Đã gửi/nhận hàng',1),(2,'false','Chưa gửi/nhận hàng',1);
/*!40000 ALTER TABLE `trang_thais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voichers`
--

DROP TABLE IF EXISTS `voichers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `voichers` (
  `ma_voicher` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ma_khach_hang` int(11) NOT NULL,
  `muc_voicher` int(11) NOT NULL DEFAULT '0',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ma_voicher`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voichers`
--

LOCK TABLES `voichers` WRITE;
/*!40000 ALTER TABLE `voichers` DISABLE KEYS */;
INSERT INTO `voichers` VALUES (1,10,58,0),(2,4,40,1),(3,19,3,1),(4,15,91,0),(5,10,68,1),(6,14,84,0),(7,15,78,0),(8,10,96,0),(9,2,2,1),(10,4,95,0),(11,8,71,1),(12,14,94,0),(13,14,47,1),(14,2,66,1),(15,8,74,0),(16,6,59,0),(17,10,78,0),(18,14,93,0),(19,19,40,0),(20,19,69,1);
/*!40000 ALTER TABLE `voichers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-23  7:56:54
