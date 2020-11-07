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
  `ma_hoa_don` bigint(20) NOT NULL,
  `ma_san_pham` bigint(20) NOT NULL,
  `danh_sach_loai_dac_trung` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gia_ban` double(15,2) NOT NULL DEFAULT '0.00',
  `so_luong` int(11) NOT NULL DEFAULT '0',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_hoa_dons`
--

LOCK TABLES `chi_tiet_hoa_dons` WRITE;
/*!40000 ALTER TABLE `chi_tiet_hoa_dons` DISABLE KEYS */;
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
  `ma_phieu_nhap` bigint(20) NOT NULL,
  `ma_san_pham` bigint(20) NOT NULL,
  `danh_sach_loai_dac_trung` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gia_nhap` double(15,2) NOT NULL DEFAULT '0.00',
  `so_luong` int(11) NOT NULL DEFAULT '0',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_phieu_nhaps`
--

LOCK TABLES `chi_tiet_phieu_nhaps` WRITE;
/*!40000 ALTER TABLE `chi_tiet_phieu_nhaps` DISABLE KEYS */;
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
  `danh_sach_loai_dac_trung` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ma_san_pham` bigint(20) NOT NULL,
  `so_luong` int(11) NOT NULL DEFAULT '0',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dac_trung_san_phams`
--

LOCK TABLES `dac_trung_san_phams` WRITE;
/*!40000 ALTER TABLE `dac_trung_san_phams` DISABLE KEYS */;
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
  `mo_ta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`loai_dac_trung`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dac_trungs`
--

LOCK TABLES `dac_trungs` WRITE;
/*!40000 ALTER TABLE `dac_trungs` DISABLE KEYS */;
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
  `ma_san_pham` bigint(20) NOT NULL,
  `hinh_anh` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `hinh_anh_san_phams_hinh_anh_unique` (`hinh_anh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hinh_anh_san_phams`
--

LOCK TABLES `hinh_anh_san_phams` WRITE;
/*!40000 ALTER TABLE `hinh_anh_san_phams` DISABLE KEYS */;
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
  `ma_nhan_vien` bigint(20) DEFAULT NULL,
  `ma_khach_hang` bigint(20) DEFAULT NULL,
  `ma_voucher` bigint(20) DEFAULT NULL,
  `ngay_lap` date NOT NULL DEFAULT '2020-11-07',
  `loai_don` tinyint(1) NOT NULL DEFAULT '1',
  `trang_thai` tinyint(1) NOT NULL DEFAULT '1',
  `tong_tien` double(15,2) NOT NULL DEFAULT '0.00',
  `thanh_tien` double(15,2) NOT NULL DEFAULT '0.00',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ma_hoa_don`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoa_dons`
--

LOCK TABLES `hoa_dons` WRITE;
/*!40000 ALTER TABLE `hoa_dons` DISABLE KEYS */;
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
  `ma_san_pham` bigint(20) NOT NULL,
  `ma_ngay_khuyen_mai` bigint(20) NOT NULL,
  `muc_khuyen_mai` int(11) NOT NULL COMMENT '%',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khuyen_mai_san_phams`
--

LOCK TABLES `khuyen_mai_san_phams` WRITE;
/*!40000 ALTER TABLE `khuyen_mai_san_phams` DISABLE KEYS */;
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
  `mo_ta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
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
  `mo_ta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ma_loai_san_pham`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai_san_phams`
--

LOCK TABLES `loai_san_phams` WRITE;
/*!40000 ALTER TABLE `loai_san_phams` DISABLE KEYS */;
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
  `mo_ta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
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
) ENGINE=InnoDB AUTO_INCREMENT=299 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (272,'2014_10_12_000000_create_tai_khoans_table',1),(273,'2014_10_12_100000_create_password_resets_table',1),(274,'2016_06_01_000001_create_oauth_auth_codes_table',1),(275,'2016_06_01_000002_create_oauth_access_tokens_table',1),(276,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(277,'2016_06_01_000004_create_oauth_clients_table',1),(278,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(279,'2019_08_19_000000_create_failed_jobs_table',1),(280,'2020_10_14_004211_create_nha_cung_caps_table',1),(281,'2020_10_14_014912_create_phieu_nhaps_table',1),(282,'2020_10_14_162121_create_hoa_dons_table',1),(283,'2020_10_14_163956_create_thuong_hieus_table',1),(284,'2020_10_14_164434_create_loai_san_phams_table',1),(285,'2020_10_14_165345_create_dac_trungs_table',1),(286,'2020_10_14_165414_create_san_phams_table',1),(287,'2020_10_14_165443_create_nhan_xets_table',1),(288,'2020_10_14_165509_create_dac_trung_san_phams_table',1),(289,'2020_10_14_172357_create_loai_tai_khoans_table',1),(290,'2020_10_14_172842_create_trang_thais_table',1),(291,'2020_10_14_173319_create_loai_dons_table',1),(292,'2020_10_15_060930_create_ngay_khuyen_mais_table',1),(293,'2020_10_15_061300_create_vouchers_table',1),(294,'2020_10_15_144412_create_hinh_anh_san_phams_table',1),(295,'2020_10_15_160006_create_chi_tiet_hoa_dons_table',1),(296,'2020_10_15_160024_create_chi_tiet_phieu_nhaps_table',1),(297,'2020_10_16_013408_create_tin_tucs_table',1),(298,'2020_10_27_013014_create_khuyen_mai_san_phams_table',1);
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
  `ngay_gio` date NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ma_ngay_khuyen_mai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ngay_khuyen_mais`
--

LOCK TABLES `ngay_khuyen_mais` WRITE;
/*!40000 ALTER TABLE `ngay_khuyen_mais` DISABLE KEYS */;
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
  `dia_chi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hot_line` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `so_dien_thoai` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hinh_anh` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ma_nha_cung_cap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nha_cung_caps`
--

LOCK TABLES `nha_cung_caps` WRITE;
/*!40000 ALTER TABLE `nha_cung_caps` DISABLE KEYS */;
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
  `ma_san_pham` bigint(20) DEFAULT NULL,
  `ma_khach_hang` bigint(20) NOT NULL,
  `binh_luan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ma_nhan_xet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhan_xets`
--

LOCK TABLES `nhan_xets` WRITE;
/*!40000 ALTER TABLE `nhan_xets` DISABLE KEYS */;
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
INSERT INTO `oauth_access_tokens` VALUES ('56ed34150a034be2ceddfc60b2d1ad46f6479ee77b747ffed19ee876b10175e671b0510b21eaa021',2,1,'WebsiteBanGiayPHP','[]',0,'2020-11-07 14:07:46','2020-11-07 14:07:46','2021-11-07 21:07:46'),('8a40d509c35b535580037a7732494a769b89331378ecfab7904ec77a4ed61c32e69be3433ef508c0',1,1,'WebsiteBanGiayPHP','[]',0,'2020-11-07 14:06:18','2020-11-07 14:06:18','2021-11-07 21:06:18');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','JQ4jMxSoee55pLMcoxSugRRlBlfHlv4xRE83RnoX',NULL,'http://localhost',1,0,0,'2020-11-07 07:05:14','2020-11-07 07:05:14'),(2,NULL,'Laravel Password Grant Client','uckC5jiq0P4oaiYSCwagVjqX3SOsaknfCprAPc7g','users','http://localhost',0,1,0,'2020-11-07 07:05:14','2020-11-07 07:05:14');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2020-11-07 07:05:14','2020-11-07 07:05:14');
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
  `ma_nhan_vien` bigint(20) NOT NULL,
  `ma_nha_cung_cap` bigint(20) NOT NULL,
  `ngay_nhap` date NOT NULL DEFAULT '2020-11-07',
  `tong_tien` double(15,2) NOT NULL DEFAULT '0.00',
  `ghi_chu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ma_phieu_nhap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieu_nhaps`
--

LOCK TABLES `phieu_nhaps` WRITE;
/*!40000 ALTER TABLE `phieu_nhaps` DISABLE KEYS */;
/*!40000 ALTER TABLE `phieu_nhaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `products`
--

DROP TABLE IF EXISTS `products`;
/*!50001 DROP VIEW IF EXISTS `products`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `products` AS SELECT 
 1 AS `ma_san_pham`,
 1 AS `ma_thuong_hieu`,
 1 AS `ma_loai_san_pham`,
 1 AS `ten_san_pham`,
 1 AS `gia_ban`,
 1 AS `so_luong`,
 1 AS `isActive`,
 1 AS `ten_thuong_hieu`,
 1 AS `ten_loai_san_pham`,
 1 AS `image`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `san_phams`
--

DROP TABLE IF EXISTS `san_phams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `san_phams` (
  `ma_san_pham` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ma_thuong_hieu` bigint(20) NOT NULL,
  `ma_loai_san_pham` bigint(20) NOT NULL,
  `ten_san_pham` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gia_ban` double(15,2) NOT NULL DEFAULT '0.00',
  `so_luong` int(11) NOT NULL DEFAULT '0',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ma_san_pham`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `san_phams`
--

LOCK TABLES `san_phams` WRITE;
/*!40000 ALTER TABLE `san_phams` DISABLE KEYS */;
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
  `email_verified_at` timestamp NOT NULL DEFAULT '2020-11-07 07:04:16',
  `mat_khau` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ho_ten` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dia_chi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `so_dien_thoai` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hinh_anh` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `loai_tai_khoan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'KH',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ma_tai_khoan`),
  UNIQUE KEY `tai_khoans_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tai_khoans`
--

LOCK TABLES `tai_khoans` WRITE;
/*!40000 ALTER TABLE `tai_khoans` DISABLE KEYS */;
INSERT INTO `tai_khoans` VALUES (1,'admin@gmail.com','2020-11-06 17:00:00','$2y$10$VuF8fR4o841h47QMGHSvP.ochTgFo4fdCwWnaaY1CO65CmmxiqND2','VanNam212','TP Hà Nội','0345164784','','QT',1,NULL,NULL,NULL),(2,'user@gmail.com','2020-11-06 17:00:00','$2y$10$n49lVnIUs.rlxR74KNLweO.qKWPutAmDb6U.E0oqWpQpBERO0NHYq','Nguyen Van Nam','TP Hà Nội','0345164784','','KH',1,NULL,NULL,NULL);
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
  `hinh_anh` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ma_thuong_hieu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thuong_hieus`
--

LOCK TABLES `thuong_hieus` WRITE;
/*!40000 ALTER TABLE `thuong_hieus` DISABLE KEYS */;
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
  `highlight` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ngay_dang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2020-11-07',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tin_tucs`
--

LOCK TABLES `tin_tucs` WRITE;
/*!40000 ALTER TABLE `tin_tucs` DISABLE KEYS */;
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
  `mo_ta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trang_thais`
--

LOCK TABLES `trang_thais` WRITE;
/*!40000 ALTER TABLE `trang_thais` DISABLE KEYS */;
INSERT INTO `trang_thais` VALUES (1,'true','Khách đã nhận hàng',1),(2,'false','Khách chưa nhận hàng',1);
/*!40000 ALTER TABLE `trang_thais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vouchers`
--

DROP TABLE IF EXISTS `vouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vouchers` (
  `ma_voucher` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ma_khach_hang` bigint(20) NOT NULL,
  `muc_voucher` int(11) NOT NULL DEFAULT '0',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ma_voucher`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vouchers`
--

LOCK TABLES `vouchers` WRITE;
/*!40000 ALTER TABLE `vouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `vouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'webbangiayphp'
--
/*!50003 DROP PROCEDURE IF EXISTS `itemProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `itemProduct`(in ngay date, in masp bigint(20))
begin
	select san_phams.*, ten_thuong_hieu, ten_loai_san_pham, 
	(select muc_khuyen_mai from khuyen_mai_san_phams, ngay_khuyen_mais where khuyen_mai_san_phams.ma_ngay_khuyen_mai = ngay_khuyen_mais.ma_ngay_khuyen_mai and ngay_khuyen_mais.ngay_gio = ngay and khuyen_mai_san_phams.ma_san_pham = san_phams.ma_san_pham) as muc_km,
	(select hinh_anh from hinh_anh_san_phams where hinh_anh_san_phams.ma_san_pham = san_phams.ma_san_pham and hinh_anh is not null limit 1) as image,
	(gia_ban*(1-(select muc_khuyen_mai from khuyen_mai_san_phams, ngay_khuyen_mais where khuyen_mai_san_phams.ma_ngay_khuyen_mai = ngay_khuyen_mais.ma_ngay_khuyen_mai and ngay_khuyen_mais.ngay_gio = ngay and khuyen_mai_san_phams.ma_san_pham = san_phams.ma_san_pham and ngay_khuyen_mais.ngay_gio is not null)/100)) as gia_moi
	from san_phams, thuong_hieus, loai_san_phams
	where san_phams.ma_loai_san_pham = loai_san_phams.ma_loai_san_pham
	and san_phams.ma_thuong_hieu = thuong_hieus.ma_thuong_hieu and san_phams.ma_san_pham = masp;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listProduct`(in ngay date)
begin
	select san_phams.*, ten_thuong_hieu, ten_loai_san_pham, 
	(select muc_khuyen_mai from khuyen_mai_san_phams, ngay_khuyen_mais where khuyen_mai_san_phams.ma_ngay_khuyen_mai = ngay_khuyen_mais.ma_ngay_khuyen_mai and ngay_khuyen_mais.ngay_gio = ngay and khuyen_mai_san_phams.ma_san_pham = san_phams.ma_san_pham) as muc_km,
	(select hinh_anh from hinh_anh_san_phams where hinh_anh_san_phams.ma_san_pham = san_phams.ma_san_pham and hinh_anh is not null limit 1) as image,
	(gia_ban*(1-(select muc_khuyen_mai from khuyen_mai_san_phams, ngay_khuyen_mais where khuyen_mai_san_phams.ma_ngay_khuyen_mai = ngay_khuyen_mais.ma_ngay_khuyen_mai and ngay_khuyen_mais.ngay_gio = ngay and khuyen_mai_san_phams.ma_san_pham = san_phams.ma_san_pham and ngay_khuyen_mais.ngay_gio is not null)/100)) as gia_moi
	from san_phams, thuong_hieus, loai_san_phams
	where san_phams.ma_loai_san_pham = loai_san_phams.ma_loai_san_pham
	and san_phams.ma_thuong_hieu = thuong_hieus.ma_thuong_hieu;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `products`
--

/*!50001 DROP VIEW IF EXISTS `products`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `products` AS select `san_phams`.`ma_san_pham` AS `ma_san_pham`,`san_phams`.`ma_thuong_hieu` AS `ma_thuong_hieu`,`san_phams`.`ma_loai_san_pham` AS `ma_loai_san_pham`,`san_phams`.`ten_san_pham` AS `ten_san_pham`,`san_phams`.`gia_ban` AS `gia_ban`,`san_phams`.`so_luong` AS `so_luong`,`san_phams`.`isActive` AS `isActive`,`thuong_hieus`.`ten_thuong_hieu` AS `ten_thuong_hieu`,`loai_san_phams`.`ten_loai_san_pham` AS `ten_loai_san_pham`,(select `hinh_anh_san_phams`.`hinh_anh` from `hinh_anh_san_phams` where ((`hinh_anh_san_phams`.`ma_san_pham` = `san_phams`.`ma_san_pham`) and (`hinh_anh_san_phams`.`hinh_anh` is not null)) limit 1) AS `image` from ((`san_phams` join `thuong_hieus`) join `loai_san_phams`) where ((`san_phams`.`ma_loai_san_pham` = `loai_san_phams`.`ma_loai_san_pham`) and (`san_phams`.`ma_thuong_hieu` = `thuong_hieus`.`ma_thuong_hieu`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-07 21:12:36
