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
INSERT INTO `chi_tiet_hoa_dons` VALUES (1,14,9,7393783.00,3419,0),(2,1,9,5.00,618194,1),(3,12,12,6.00,1819272,0),(4,2,6,1318.00,83802385,0),(5,11,12,30.00,2105,0),(6,2,3,563210821.00,359,0),(7,8,18,704158020.00,249747276,1),(8,9,14,756011.00,91,1),(9,16,17,728136.00,53121,0),(10,8,1,96.00,2,0),(11,14,16,682.00,16,0),(12,17,15,767060411.00,593679998,0),(13,10,9,85949.00,3425,0),(14,9,6,23438.00,943,0),(15,14,18,7399643.00,45977491,1),(16,19,1,64.00,884,1),(17,10,19,2070825.00,8679938,1),(18,10,11,6079791.00,398736,0),(19,17,13,62886.00,29,1),(20,5,1,9.00,30196,0);
/*!40000 ALTER TABLE `chi_tiet_hoa_dons` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_bill_detail_insert` AFTER INSERT ON `chi_tiet_hoa_dons` FOR EACH ROW begin
	declare masp bigint(20);
    declare slhd int(11) default 0;
    declare slsp int(11) default 0;
    declare gia_ban double(15,2);
    declare gia_ban_sp double(15,2);
    declare tong_tien double(15,2);
    declare ma_voucher int(11);
    declare muc_voucher int(11);
    declare muc_km int(11) default 0;
    declare ngay_lap date;
    
	set masp = NEW.ma_san_pham;
    set ngay_lap = (select ngay_lap from webbangiayphp.hoa_dons where hoa_dons.ma_hoa_don = NEW.ma_hoa_don);
    set gia_ban_sp = (select gia_ban from webbangiayphp.san_phams where san_phams.ma_san_pham = masp);
    set slhd = NEW.so_luong;
    
    set slsp = (select so_luong from webbangiayphp.san_phams where san_phams.ma_san_pham = masp);
    set muc_km = (select muc_khuyen_mai from webbangiayphp.khuyen_mai_san_phams where khuyen_mai_san_phams.ma_san_pham = masp 
    and khuyen_mai_san_phams.ma_ngay_khuyen_mai = 
    (select ma_ngay_khuyen_mai from webbangiayphp.ngay_khuyen_mais where ngay_khuyen_mais.ngay_gio = ngay_lap));
    if muc_km != 0 then
		set gia_ban = gia_ban_sp*(1-muc_km/100);
    end if;
    set tong_tien = (select tong_tien from webbangiayphp.hoa_dons where hoa_dons.ma_hoa_don = NEW.ma_hoa_don);
    set ma_voucher = (select ma_voucher from webbangiayphp.hoa_dons where hoa_dons.ma_hoa_don = NEW.ma_hoa_don);
    if ma_voucher is not null then
		set muc_voucher = (select muc_voucher from webbangiayphp.vouchers where vouchers.ma_voucher = ma_voucher);
    end if;
    if slsp >= slhd then
		update webbangiayphp.san_phams set webbangiayphp.san_phams.so_luong = (slsp-slhd) 
		where webbangiayphp.san_phams.ma_san_pham = masp;
        update webbangiayphp.hoa_dons set webbangiayphp.hoa_dons.tong_tien = (tong_tien + gia_ban*slhd) 
		where webbangiayphp.hoa_dons.ma_hoa_don = NEW.ma_hoa_don;
    end if;
    set tong_tien = (select tong_tien from webbangiayphp.hoa_dons where hoa_dons.ma_hoa_don = NEW.ma_hoa_don);
    if ma_voucher is not null then
		update webbangiayphp.hoa_dons set webbangiayphp.hoa_dons.thanh_tien = (tong_tien*(1-muc_voucher/100)) 
		where webbangiayphp.hoa_dons.ma_hoa_don = NEW.ma_hoa_don;
        
        update webbangiayphp.vouchers set webbangiayphp.vouchers.isActive = 0 
        where webbangiayphp.vouchers.ma_voucher = ma_voucher;
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_bill_detail_delete` AFTER UPDATE ON `chi_tiet_hoa_dons` FOR EACH ROW begin
	declare masp bigint(20);
    declare slhd int(11) default 0;
    declare slsp int(11) default 0;
    declare isActive tinyint(1);
    declare gia_ban double(15,2);
    declare tong_tien double(15,2);
    
	set masp = NEW.ma_san_pham;
    set slhd = NEW.so_luong;
    set slsp = (select so_luong from webbangiayphp.san_phams where san_phams.ma_san_pham = masp);
    set isActive = NEW.isActive;
    set gia_ban = NEW.gia_ban;
    set tong_tien = (select tong_tien from webbangiayphp.hoa_dons where hoa_dons.ma_hoa_don = NEW.ma_hoa_don);
    if isActive = 0 then
		update webbangiayphp.san_phams set webbangiayphp.san_phams.so_luong = (slsp+slpn) 
		where webbangiayphp.san_phams.ma_san_pham = masp;
        update webbangiayphp.hoa_dons set webbangiayphp.hoa_dons.tong_tien = (tong_tien - gia_ban*slhd) 
		where webbangiayphp.hoa_dons.ma_hoa_don = NEW.ma_hoa_don;
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
INSERT INTO `chi_tiet_phieu_nhaps` VALUES (1,5,18,4175242.00,658,0),(2,4,13,72604628.00,3,0),(3,15,3,930345.00,26,1),(4,14,9,9948674.00,99054,1),(5,13,6,394776.00,91893,1),(6,6,20,7.00,6,0),(7,9,8,479635.00,9333532,1),(8,8,3,358793917.00,14,1),(9,19,1,343727.00,622,1),(10,5,3,46588.00,95,0),(11,3,20,14.00,7925866,1),(12,7,5,607.00,380785071,0),(13,16,14,80258831.00,6,0),(14,17,19,8259.00,975046321,0),(15,15,7,5779.00,32694,1),(16,6,16,9017.00,9727,1),(17,5,4,80463.00,0,0),(18,1,3,566.00,997528231,0),(19,4,5,7033.00,305965,1),(20,2,17,59718114.00,876500,0);
/*!40000 ALTER TABLE `chi_tiet_phieu_nhaps` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_coupon_detail_insert` AFTER INSERT ON `chi_tiet_phieu_nhaps` FOR EACH ROW begin
	declare muc1 double(15,2) default 500000;
    declare muc2 double(15,2) default 2000000;
    declare muc3 double(15,2) default 10000000;
    declare muc4 double(15,2) default 20000000;
    declare muc5 double(15,2) default 50000000;
    declare muc6 double(15,2) default 100000000;
	declare masp bigint(20);
    declare slpn int(11) default 0;
    declare slsp int(11) default 0;
    declare gia_nhap double(15,2);
    declare gia_ban double(15,2);
    declare tong_tien double(15,2);
    
	set masp = NEW.ma_san_pham;
    set slpn = NEW.so_luong;
    set gia_nhap = NEW.gia_nhap;
    set slsp = (select so_luong from webbangiayphp.san_phams where san_phams.ma_san_pham = NEW.ma_san_pham);
    set tong_tien = (select tong_tien from webbangiayphp.phieu_nhaps where phieu_nhaps.ma_phieu_nhap = NEW.ma_phieu_nhap);
	update webbangiayphp.san_phams set webbangiayphp.san_phams.so_luong = (slsp+slpn) 
	where webbangiayphp.san_phams.ma_san_pham = masp;
    update webbangiayphp.phieu_nhaps set webbangiayphp.phieu_nhaps.tong_tien = (tong_tien + slpn*gia_nhap) 
	where webbangiayphp.phieu_nhaps.ma_phieu_nhap = NEW.ma_phieu_nhap;
	case gia_nhap 
		when gia_nhap<=muc1 then set gia_ban = (gia_nhap*1.2);
		when gia_nhap>muc1 and gia_nhap<=muc2 then set gia_ban = (gia_nhap*1.15);
		when gia_nhap>muc2 and gia_nhap<=muc3 then set gia_ban = (gia_nhap*1.1);
		when gia_nhap>muc3 and gia_nhap<=muc4 then set gia_ban = (gia_nhap*1.08);
		when gia_nhap>muc4 and gia_nhap<=muc5 then set gia_ban = (gia_nhap*1.04);
		when gia_nhap>muc5 and gia_nhap<=muc6 then set gia_ban = (gia_nhap*1.02);
		else set gia_ban = (gia_nhap*1.01);
	end case;
    update webbangiayphp.san_phams set webbangiayphp.san_phams.gia_ban = gia_ban where san_phams.ma_san_pham = masp;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_coupon_detail_delete` AFTER UPDATE ON `chi_tiet_phieu_nhaps` FOR EACH ROW begin
	declare masp bigint(20);
    declare slpn int(11) default 0;
    declare slsp int(11) default 0;
    declare isActive tinyint(1);
    declare gia_nhap double(15,2);
    declare tong_tien double(15,2);
    
    set gia_nhap = NEW.gia_nhap;
    set tong_tien = (select tong_tien from webbangiayphp.phieu_nhaps where phieu_nhaps.ma_phieu_nhap = NEW.ma_phieu_nhap);
	set masp = NEW.ma_san_pham;
    set slpn = NEW.so_luong;
    set slsp = (select so_luong from webbangiayphp.san_phams where san_phams.ma_san_pham = masp);
    set isActive = NEW.isActive;
    if isActive = 0 then
		update webbangiayphp.san_phams set webbangiayphp.san_phams.so_luong = (slsp-slpn) 
		where webbangiayphp.san_phams.ma_san_pham = masp;
        update webbangiayphp.phieu_nhaps set webbangiayphp.phieu_nhaps.tong_tien = (tong_tien - slpn*gia_nhap) 
		where webbangiayphp.phieu_nhaps.ma_phieu_nhap = NEW.ma_phieu_nhap;
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
INSERT INTO `dac_trung_san_phams` VALUES (1,7,4,1),(2,7,14,0),(3,8,19,0),(4,4,17,0),(5,20,1,0),(6,15,7,1),(7,15,18,0),(8,7,11,0),(9,13,20,0),(10,8,3,1),(11,15,4,1),(12,5,16,0),(13,8,19,1),(14,4,15,1),(15,14,10,1),(16,8,17,0),(17,15,16,0),(18,18,7,1),(19,8,19,0),(20,1,14,1);
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
  `mo_ta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`loai_dac_trung`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dac_trungs`
--

LOCK TABLES `dac_trungs` WRITE;
/*!40000 ALTER TABLE `dac_trungs` DISABLE KEYS */;
INSERT INTO `dac_trungs` VALUES (1,'Deion Lind V','Dolor velit modi a autem. Ut rerum dicta quas est est. Pariatur neque magnam dolores aut sint. Dolores error nisi et. Ut accusantium suscipit tenetur possimus. Ut eos numquam delectus et.',0),(2,'Ressie Jacobs','Dolor id commodi iure voluptates. Voluptate ipsam pariatur maiores.',1),(3,'Louie Beahan','Amet ipsa sit aliquam veritatis eveniet tempore est. Impedit iste est est dolorum.',0),(4,'Dr. Jarrod Kutch IV','Sed velit neque et dolores aspernatur quis. Sint deleniti iure et aliquam error. Aut impedit molestias quos molestiae laudantium beatae dolores nihil.',0),(5,'Dr. Alverta O\'Hara III','Suscipit consequatur ut quo et. Doloremque porro occaecati delectus nulla iste omnis laborum. Totam totam et vel in quo ad veniam eius.',1),(6,'Raegan Durgan III','Distinctio cupiditate voluptas dolorem rerum. Nisi repudiandae ad deserunt minima. Explicabo ratione nihil et nisi est est.',0),(7,'Marley Wolf','Beatae sunt consequatur nihil sit. Consequuntur magni sed non consequatur est dolor voluptate nobis. Sit porro vero quo sed. Ipsum minima voluptates aspernatur magni similique in.',1),(8,'Alvis Borer','Quo in quo deleniti praesentium incidunt ea. Ut officia recusandae ut deserunt nisi aut. Impedit magnam maiores facilis qui.',1),(9,'Dr. Wilber Pfeffer','Mollitia nihil dolores voluptate qui nam voluptatem. Unde ea sint perspiciatis necessitatibus nihil. Mollitia rerum est accusamus rem sit minus perspiciatis. Aliquid fugit voluptas sit cumque.',0),(10,'Kolby Renner','Maxime quibusdam placeat consequatur enim. Sit omnis architecto dicta voluptatem. Aperiam voluptas rerum et.',1),(11,'Devon Upton','Consectetur repellat iste illo sit sunt. Nam recusandae blanditiis asperiores id voluptatibus eum placeat. Est doloremque eveniet officiis voluptate laudantium et et atque.',0),(12,'Jaydon Mills','Natus ipsum veniam in sit. Vel ut qui sed temporibus voluptatem. Aliquid voluptatem repellendus qui eum alias aut.',0),(13,'Devante Shields','Nihil omnis tempore amet aliquam cumque. Vero id perferendis repellendus modi voluptatem laborum sed perspiciatis. Illo ratione distinctio ut eveniet est sint.',0),(14,'Garnet Brown','Aliquam doloremque modi facere consequatur consequatur. Hic asperiores odio voluptas omnis molestiae omnis. Tenetur consequatur corporis rerum quae.',1),(15,'Miss Annette Johns MD','Aspernatur nihil ut qui omnis. Qui rerum dolores quaerat laudantium quia fugit et. Et omnis provident nostrum aut sit.',1),(16,'Juanita Smith DDS','Voluptatem consequuntur eveniet quos. Et provident impedit et ut. Nisi asperiores possimus vitae quia. Voluptatum in et officia tempora. Tempore voluptatem eius maiores.',1),(17,'Berneice Jacobi','Ut aut officia aut voluptatem vero. Laborum at qui voluptatibus atque sunt nihil. Culpa aut qui dicta natus.',1),(18,'Mrs. Icie Nicolas','Totam ex beatae ea. Soluta et recusandae illum quo omnis expedita illo cumque. Et est accusamus est omnis fugit ipsum quo.',0),(19,'Neoma Feil','Suscipit consequuntur et eligendi aut tempore. Et eos ipsum ut.',0),(20,'Kimberly Wunsch IV','Est quos perspiciatis distinctio vel doloribus. Enim voluptates aliquam facilis blanditiis perspiciatis consequuntur modi. Nemo doloribus veniam dolor perspiciatis sequi est consequatur.',1);
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
INSERT INTO `hinh_anh_san_phams` VALUES (1,16,'https://lorempixel.com/640/480/?32216',1),(2,17,'https://lorempixel.com/640/480/?83868',1),(3,12,'https://lorempixel.com/640/480/?97204',1),(4,2,'https://lorempixel.com/640/480/?32564',1),(5,15,'https://lorempixel.com/640/480/?53780',1),(6,15,'https://lorempixel.com/640/480/?55675',1),(7,14,'https://lorempixel.com/640/480/?65557',0),(8,14,'https://lorempixel.com/640/480/?83859',0),(9,13,'https://lorempixel.com/640/480/?40782',1),(10,20,'https://lorempixel.com/640/480/?32759',1),(11,11,'https://lorempixel.com/640/480/?15552',1),(12,6,'https://lorempixel.com/640/480/?54961',0),(13,2,'https://lorempixel.com/640/480/?61280',1),(14,19,'https://lorempixel.com/640/480/?78235',1),(15,12,'https://lorempixel.com/640/480/?21386',0),(16,11,'https://lorempixel.com/640/480/?23106',1),(17,13,'https://lorempixel.com/640/480/?73197',1),(18,17,'https://lorempixel.com/640/480/?34669',0),(19,8,'https://lorempixel.com/640/480/?57102',1),(20,11,'https://lorempixel.com/640/480/?50577',1);
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
  `ma_nhan_vien` int(11) DEFAULT NULL,
  `ma_khach_hang` int(11) DEFAULT NULL,
  `ma_voucher` int(11) DEFAULT NULL,
  `ngay_lap` date NOT NULL DEFAULT '2020-10-27',
  `loai_don` tinyint(1) NOT NULL DEFAULT '1',
  `trang_thai` tinyint(1) NOT NULL DEFAULT '1',
  `tong_tien` double(15,2) NOT NULL DEFAULT '0.00',
  `thanh_tien` double(15,2) NOT NULL DEFAULT '0.00',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ma_hoa_don`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoa_dons`
--

LOCK TABLES `hoa_dons` WRITE;
/*!40000 ALTER TABLE `hoa_dons` DISABLE KEYS */;
INSERT INTO `hoa_dons` VALUES (1,13,11,NULL,'0000-00-00',0,0,0.00,0.00,0),(2,16,2,NULL,'0000-00-00',0,0,0.00,0.00,1),(3,8,5,NULL,'0000-00-00',0,1,0.00,0.00,1),(4,8,11,NULL,'0000-00-00',0,0,0.00,0.00,0),(5,6,3,NULL,'0000-00-00',0,0,0.00,0.00,0),(6,17,10,NULL,'0000-00-00',0,0,0.00,0.00,1),(7,19,10,NULL,'0000-00-00',0,0,0.00,0.00,0),(8,14,1,NULL,'0000-00-00',0,1,0.00,0.00,0),(9,8,11,NULL,'0000-00-00',1,1,0.00,0.00,0),(10,14,2,NULL,'0000-00-00',1,1,0.00,0.00,1),(11,17,5,NULL,'0000-00-00',1,1,0.00,0.00,1),(12,16,5,NULL,'0000-00-00',1,0,0.00,0.00,1),(13,6,7,NULL,'0000-00-00',1,1,0.00,0.00,1),(14,17,2,NULL,'0000-00-00',1,0,0.00,0.00,0),(15,16,11,NULL,'0000-00-00',0,0,0.00,0.00,0),(16,14,3,NULL,'0000-00-00',0,0,0.00,0.00,1),(17,6,2,NULL,'0000-00-00',0,0,0.00,0.00,0),(18,4,5,NULL,'0000-00-00',1,1,0.00,0.00,1),(19,19,2,NULL,'0000-00-00',0,1,0.00,0.00,0),(20,19,7,NULL,'0000-00-00',0,1,0.00,0.00,0);
/*!40000 ALTER TABLE `hoa_dons` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_bill_insert` AFTER INSERT ON `hoa_dons` FOR EACH ROW begin
	declare isActive tinyint(1); 
    declare mahd bigint(20);
    declare makh int(11);
    declare so_luong int(11) default 0;
    declare sl int(11);
    declare muc_voucher int(11) default 0;
    
    declare list_mahd cursor for (select ma_hoa_don from webbangiayphp.hoa_dons where webbangiayphp.hoa_dons.ma_khach_hang = makh and hoa_dons.isActive = 1);
    set makh = NEW.ma_khach_hang;
    open list_mahd;
		fetch list_mahd into mahd;
        set sl = (select sum(so_luong) from webbangiayphp.chi_tiet_hoa_dons where chi_tiet_hoa_dons.ma_hoa_don = hoa_dons.ma_hoa_don);
        set so_luong = so_luong + sl;
    close list_mahd;
    case so_luong
		when so_luong = 5 then set muc_voucher = so_luong;
		when so_luong = 10 then set muc_voucher = so_luong;
        when so_luong = 15 then set muc_voucher = so_luong;
        when so_luong % 5 = 0 and so_luong >= 20 then set muc_voucher = 20;
    end case;
    if muc_voucher > 0 then
		insert into vouchers (ma_khach_hang, muc_voucher) values (makh, muc_voucher);
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_bill_delete` AFTER UPDATE ON `hoa_dons` FOR EACH ROW begin
	declare isActive tinyint(1); 
    declare mahd int(11);
    set mahd = NEW.ma_hoa_don;
    set isActive = NEW.isActive;
    update webbangiayphp.chi_tiet_hoa_dons set webbangiayphp.chi_tiet_hoa_dons.isActive = 0
    where webbangiayphp.chi_tiet_hoa_dons.ma_hoa_don = mahd;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `khuyen_mai_san_phams`
--

DROP TABLE IF EXISTS `khuyen_mai_san_phams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `khuyen_mai_san_phams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ma_san_pham` int(11) NOT NULL,
  `ma_ngay_khuyen_mai` int(11) NOT NULL,
  `muc_khuyen_mai` int(11) NOT NULL COMMENT '%',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khuyen_mai_san_phams`
--

LOCK TABLES `khuyen_mai_san_phams` WRITE;
/*!40000 ALTER TABLE `khuyen_mai_san_phams` DISABLE KEYS */;
INSERT INTO `khuyen_mai_san_phams` VALUES (1,18,7,3,0),(2,3,17,59,0),(3,7,15,33,1),(4,16,17,51,0),(5,13,10,48,0),(6,10,12,80,1),(7,19,16,76,0),(8,11,8,61,0),(9,13,6,35,1),(10,1,15,6,0),(11,9,7,80,0),(12,4,10,40,0),(13,14,1,14,0),(14,17,16,49,1),(15,7,19,99,1),(16,7,1,56,0),(17,10,20,90,1),(18,12,20,90,1),(19,1,9,98,0),(20,19,10,61,1);
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
  `mo_ta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ma_loai_san_pham`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai_san_phams`
--

LOCK TABLES `loai_san_phams` WRITE;
/*!40000 ALTER TABLE `loai_san_phams` DISABLE KEYS */;
INSERT INTO `loai_san_phams` VALUES (1,'Josephine Rutherford','Voluptatem ab quod quis eum eos maiores voluptas. Perferendis totam fugit in optio vitae in. Eum omnis voluptas tenetur aliquam eaque.',1),(2,'Cristal Denesik Sr.','Distinctio magnam molestiae quia aut modi provident. Fugit quis consequatur consequatur. Ipsum ducimus aut quasi enim neque.',1),(3,'Mr. Sage Bernier','Expedita voluptatem velit fugiat aut ad consequatur. Modi aliquam voluptate exercitationem consequatur temporibus. Corrupti voluptatem impedit voluptas sequi sed ducimus sit accusantium.',0),(4,'Mr. Michel Lueilwitz','Dolor repellendus quae minima sit iste sed. In exercitationem ut est sequi. Ea odit ut maxime pariatur occaecati excepturi ut molestias.',0),(5,'Carmelo Kilback','Labore est nisi natus quaerat id suscipit. Reiciendis odit dolorem natus dignissimos quidem commodi. Molestiae accusamus voluptates quidem recusandae hic sint qui.',1),(6,'Ms. Michelle Jones IV','Sit fugit eaque maxime aut unde. Doloribus qui iusto temporibus nihil. Ipsa dignissimos dignissimos occaecati vel est.',0),(7,'Lonny Towne','Distinctio eveniet dignissimos molestias optio deleniti eaque autem. Sed quam quo voluptas dolore a inventore aut.',0),(8,'Calista Denesik','Aut ad dolorum iusto ipsum vel ut. Provident ut rerum qui ut ut aliquam. Voluptas et consectetur nobis dignissimos. Nihil aut sit deleniti ut sunt.',0),(9,'Maryjane Herzog III','Voluptatem fugiat id in atque mollitia et provident. Et ab dolorem sit id ab sequi. Animi hic qui quo perferendis qui. Magni quod ullam animi molestiae ratione odio ex.',0),(10,'Dr. Easton Nicolas V','Modi quasi nemo iure error ratione reiciendis. Nisi commodi minus ab eos libero voluptatibus ab. Et quia vero velit eos.',1),(11,'Ellsworth Wiegand','Aut unde voluptatem quis fugit. Qui ut quidem eos ut soluta. Id ipsa eum sed nostrum et nisi. Tempora animi omnis vel omnis.',1),(12,'Mrs. Eleonore Kunde DVM','Iusto molestiae quod dolor magni explicabo natus dolores rerum. Cumque non quas tempora dicta maxime. Deleniti nesciunt dignissimos fugit.',0),(13,'Humberto Bashirian','Sed possimus et ullam expedita. Voluptate temporibus aut necessitatibus. Cumque atque molestiae autem. Deleniti qui qui similique illum dolor.',1),(14,'Sarah Effertz','In odit dignissimos facere provident cumque nostrum nostrum. Sit ipsam et aliquid commodi saepe unde autem. Repellendus aut voluptatem quis eos maxime. Qui omnis et magnam.',1),(15,'D\'angelo Runolfsson','Et provident qui sit provident quisquam et occaecati. Quas eius ut nihil sunt perspiciatis quae. Qui nemo dolorum id.',1),(16,'Mrs. Isabella Swift','Sapiente voluptatum sint ut possimus. Modi molestias ut rerum incidunt. Aliquam nisi facere velit.',1),(17,'Lauretta Spinka','Ullam quia eligendi dolorem accusamus. Magni repellat sit soluta amet qui veritatis ipsam voluptates. Quisquam saepe adipisci tenetur iure quod sed magni. Sed saepe amet ex doloremque sit.',1),(18,'Mr. Omer Treutel II','Nobis autem accusamus repellendus mollitia nobis vel nostrum suscipit. Libero et enim officia soluta nam atque. At quam voluptatem est totam at sunt non non. Est illo velit esse non et ut.',1),(19,'Julius Howell Sr.','Vero asperiores quo veritatis. Dolore vitae non excepturi numquam. Repellat et sunt deleniti atque voluptas quia. Laudantium iure dolor eos ullam quia.',1),(20,'Donato Lowe','Et cumque eos ipsam omnis ut maxime voluptate. Aperiam deserunt reiciendis ut dolorum eos vel. Voluptas omnis odit est et a. Est ducimus sint est aperiam.',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_tai_khoans_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(6,'2016_06_01_000004_create_oauth_clients_table',1),(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(8,'2019_08_19_000000_create_failed_jobs_table',1),(9,'2020_10_14_004211_create_nha_cung_caps_table',1),(11,'2020_10_14_014912_create_phieu_nhaps_table',2),(12,'2020_10_14_162121_create_hoa_dons_table',3),(13,'2020_10_14_163956_create_thuong_hieus_table',3),(14,'2020_10_14_164434_create_loai_san_phams_table',3),(15,'2020_10_14_165345_create_dac_trungs_table',3),(16,'2020_10_14_165414_create_san_phams_table',3),(17,'2020_10_14_165443_create_nhan_xets_table',3),(18,'2020_10_14_165509_create_dac_trung_san_phams_table',3),(19,'2020_10_14_172357_create_loai_tai_khoans_table',3),(20,'2020_10_14_172842_create_trang_thais_table',3),(21,'2020_10_14_173319_create_loai_dons_table',3),(22,'2020_10_15_060930_create_ngay_khuyen_mais_table',3),(23,'2020_10_15_061300_create_vouchers_table',3),(24,'2020_10_15_144412_create_hinh_anh_san_phams_table',3),(25,'2020_10_15_160006_create_chi_tiet_hoa_dons_table',3),(26,'2020_10_15_160024_create_chi_tiet_phieu_nhaps_table',3),(27,'2020_10_16_013408_create_tin_tucs_table',3),(28,'2020_10_27_013014_create_khuyen_mai_san_phams_table',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ngay_khuyen_mais`
--

LOCK TABLES `ngay_khuyen_mais` WRITE;
/*!40000 ALTER TABLE `ngay_khuyen_mais` DISABLE KEYS */;
INSERT INTO `ngay_khuyen_mais` VALUES (1,'0000-00-00',1),(2,'0000-00-00',1),(3,'0000-00-00',1),(4,'0000-00-00',0),(5,'0000-00-00',0),(6,'0000-00-00',1),(7,'0000-00-00',0),(8,'0000-00-00',0),(9,'0000-00-00',1),(10,'0000-00-00',0),(11,'0000-00-00',0),(12,'0000-00-00',1),(13,'0000-00-00',0),(14,'0000-00-00',0),(15,'0000-00-00',0),(16,'0000-00-00',1),(17,'0000-00-00',1),(18,'0000-00-00',0),(19,'0000-00-00',1),(20,'0000-00-00',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nha_cung_caps`
--

LOCK TABLES `nha_cung_caps` WRITE;
/*!40000 ALTER TABLE `nha_cung_caps` DISABLE KEYS */;
INSERT INTO `nha_cung_caps` VALUES (1,'McLaughlin-Considine','8487 Balistreri Path Suite 664\nSouth Elna, SD 45801','125826607','block.myron@haag.com','451','https://lorempixel.com/640/480/?35378',0),(2,'Harris, Wunsch and Grady','3559 Donavon Crossing Suite 549\nPort Mckenzieland, NV 05146-0470','104805','uriah.bernier@borer.com','4','https://lorempixel.com/640/480/?84182',1),(3,'Koepp Group','93182 Fisher Underpass Apt. 427\nAlysonshire, KY 09441-2544','0','treutel.mable@shields.info','450285','https://lorempixel.com/640/480/?73308',1),(4,'Schneider and Sons','91989 Hyatt Tunnel\nNorth Davonte, FL 66762-0586','28887818','lennie12@hackett.org','80714','https://lorempixel.com/640/480/?14175',1),(5,'Pouros-Deckow','9233 Sheldon Union\nSouth Ameliehaven, AL 41171','23','powlowski.amiya@krajcik.net','1','https://lorempixel.com/640/480/?72770',1),(6,'Buckridge Ltd','33348 Lincoln Grove Apt. 782\nSchroederburgh, PA 62964-3718','921504','lukas.beier@hammes.com','587478995','https://lorempixel.com/640/480/?22614',1),(7,'Hermann-Doyle','42778 Christopher Parkways\nLake Rex, MD 97083-8159','348','eugenia48@jaskolski.net','2','https://lorempixel.com/640/480/?75687',0),(8,'Jast-Luettgen','9100 Rodriguez Spur Suite 302\nNew Herminio, DC 40328-3236','17248887','sschimmel@spinka.com','79','https://lorempixel.com/640/480/?25204',1),(9,'Witting, Berge and Franecki','23925 Toby Skyway\nNorth Holdentown, OR 94109','73149','hershel12@fisher.com','2798213','https://lorempixel.com/640/480/?40900',1),(10,'Grant-Ferry','686 Hudson Mall Apt. 281\nEast Aliaton, WY 10106','315806','bernhard.dena@bashirian.info','23543077','https://lorempixel.com/640/480/?23421',1),(11,'Jaskolski, Daugherty and Legros','144 Altenwerth Shoal\nGaylordhaven, MS 76803','26','hgrant@watsica.info','623','https://lorempixel.com/640/480/?30480',0),(12,'Keeling Group','5627 Thora Causeway Suite 443\nKingport, VT 55060','5554','elinor69@moore.com','47','https://lorempixel.com/640/480/?67576',1),(13,'Halvorson and Sons','941 Halie Station Suite 476\nEast Lucious, OR 68021','53','nichole69@damore.biz','628039','https://lorempixel.com/640/480/?33217',0),(14,'Bergnaum PLC','38151 Orville Rapid\nPhoebefurt, PA 13972-9863','7997','bethel.toy@bradtke.net','8979609','https://lorempixel.com/640/480/?90489',0),(15,'Metz, Bruen and Bashirian','49852 Pansy Prairie Apt. 498\nFrancismouth, MI 74476','60961455','antonia.marks@wolff.org','595','https://lorempixel.com/640/480/?67775',0),(16,'Mraz, Jenkins and Stokes','76831 Koepp Motorway Suite 251\nMertzmouth, CT 00653','204483','buckridge.bethel@altenwerth.biz','505','https://lorempixel.com/640/480/?72125',1),(17,'Rice, Lockman and Gulgowski','356 Keeling Cove Apt. 388\nWest Jaydon, LA 83911-0024','4793454','robel.sarai@waters.com','350','https://lorempixel.com/640/480/?30211',0),(18,'Sipes, Nolan and Eichmann','5779 Jazmin Springs Suite 674\nSouth Madisenchester, KS 94999-5144','450946','xavier49@kris.com','79650049','https://lorempixel.com/640/480/?83627',0),(19,'McCullough-Rowe','438 Ollie Inlet\nWestshire, DE 61219','364323152','torp.jermaine@miller.biz','5864','https://lorempixel.com/640/480/?74116',1),(20,'Tromp Group','407 Roel Via\nCartwrightshire, CO 27821','7','tierra.schulist@kiehn.com','4114','https://lorempixel.com/640/480/?49629',1);
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
INSERT INTO `nhan_xets` VALUES (1,13,5,'Reiciendis accusamus non cum ut laboriosam ut perferendis. Cupiditate sit dolor ut dolor eum voluptatem. Earum sit maxime adipisci laborum. Repellendus iusto earum nulla deleniti sunt.',0),(2,1,18,'Illo at officia facilis nam pariatur vitae alias. Similique sapiente maiores fuga suscipit accusamus. Aliquid nam quae facere quia. Voluptatem voluptate quo numquam tempore.',1),(3,18,2,'Et est quam deserunt voluptatem quia consectetur dolores. Ut dolorum iste consequatur minima exercitationem sint eius.',0),(4,19,7,'Assumenda rerum blanditiis veritatis et et magnam. Et dolores ea et quia. Distinctio velit cumque voluptate repellat nihil. Accusantium numquam quo praesentium sit.',0),(5,3,18,'Officiis blanditiis quam ipsum animi quis. Ea et debitis fugiat neque aliquam. Repudiandae tempore velit dolorem et.',0),(6,12,5,'Totam harum facere nobis quisquam. Deserunt minima et magnam architecto possimus quo cupiditate in. Dolorem et vitae assumenda aperiam enim. In accusantium rerum ullam aperiam et.',0),(7,9,1,'Ut atque ducimus amet est. Quae rem doloribus ducimus consequatur. Et non est hic nulla ex veritatis. Rem dolores omnis fuga aut omnis aperiam.',0),(8,19,5,'Voluptas veritatis accusamus ipsa dolores repellat aut consequatur. Maxime ex eum officiis qui aut itaque animi qui. Enim repellat eos delectus quos sed porro praesentium. Sed provident non aliquid.',1),(9,16,1,'Unde iusto possimus perferendis et non. Sit suscipit a consequatur cum pariatur laboriosam. Dolorem sint tempore vero quidem laboriosam. Et molestias voluptatibus error eius ea blanditiis aut dolor.',0),(10,12,5,'Et eius porro sit aut nobis qui aut ad. In debitis alias sequi natus maxime ut doloremque. Enim dolores aut molestiae architecto.',1),(11,8,11,'Vel aliquid qui quo consequuntur eum. Totam nostrum inventore enim tempora totam sit sit. Temporibus dolorem error quod necessitatibus magnam. Beatae occaecati asperiores modi.',0),(12,18,18,'Recusandae officiis qui veniam ut cum nobis. Nostrum nemo et est voluptatem qui voluptatem. Consequatur fugit iste ad deleniti explicabo nam. Excepturi ipsam qui nam officia aut.',0),(13,10,11,'Hic rerum eum facere voluptates dolore at. Molestiae est officiis eius autem consequatur porro in. Nostrum id eius ut est. Ab aut et ea vitae et.',0),(14,18,10,'Ut voluptas ea iure odit ut sit possimus ipsa. Aut et magnam aut et placeat eum harum. Voluptatibus dolorum vel tempore qui dolores.',0),(15,5,1,'Reprehenderit vel id ab quo veritatis ut. Illo dolorum omnis necessitatibus alias. Exercitationem eligendi sit quis ducimus quis hic at.',0),(16,13,5,'Quia corrupti dolor doloribus id alias hic. Unde quo ut odit expedita non. Reiciendis dicta exercitationem dolorem. Repudiandae praesentium voluptatem earum vel.',0),(17,11,1,'Assumenda iusto culpa et. Et ratione officiis odit possimus consectetur ea ullam ut. Ad tenetur sequi modi amet voluptates quae quas. Officia deleniti suscipit hic voluptate et rerum id ab.',1),(18,7,3,'Quis quibusdam voluptatem delectus rerum inventore. Occaecati tenetur dolorem et repudiandae cumque magni. Laudantium debitis non corrupti soluta asperiores. Ut aut iste deserunt iste.',1),(19,15,18,'Eos quo praesentium nihil minus id voluptatibus. Sequi corporis facere modi nemo aut sed atque. In et et voluptas ratione sapiente. Nihil laborum voluptas saepe ut eligendi sit consequatur.',0),(20,3,18,'Animi ut et quod tenetur tempora earum sit. Aliquid a asperiores id dolor nisi odit mollitia. Autem qui ut eum eius culpa.',1);
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
INSERT INTO `oauth_access_tokens` VALUES ('2f34d9a01ce4f6106a56783f16ebb5ee3a8483c1077ffdfc02d8ea6eb5fd076a98e22fc0fbde931e',23,1,'WebsiteBanGiayPHP','[]',0,'2020-10-27 14:30:34','2020-10-27 14:30:34','2021-10-27 21:30:34'),('c2699a6c6975c119df474799280733b52bda34c158b9418d410c1a7e5669e950a36611836eeea9bc',25,1,'WebsiteBanGiayPHP','[]',0,'2020-10-27 14:33:05','2020-10-27 14:33:05','2021-10-27 21:33:05');
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
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','sumqYtRNE0tDRKb6gsJAXUSJwIx0IOiY5itM667L',NULL,'http://localhost',1,0,0,'2020-10-27 07:29:49','2020-10-27 07:29:49'),(2,NULL,'Laravel Password Grant Client','TQ6nlda44ehwXYfrFjvoBcrTpzWshQ5ikBSZG1Cp','users','http://localhost',0,1,0,'2020-10-27 07:29:49','2020-10-27 07:29:49');
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
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2020-10-27 07:29:49','2020-10-27 07:29:49');
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
  `ngay_nhap` date NOT NULL DEFAULT '2020-10-27',
  `tong_tien` double(15,2) NOT NULL DEFAULT '0.00',
  `ghi_chu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ma_phieu_nhap`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieu_nhaps`
--

LOCK TABLES `phieu_nhaps` WRITE;
/*!40000 ALTER TABLE `phieu_nhaps` DISABLE KEYS */;
INSERT INTO `phieu_nhaps` VALUES (1,9,8,'0000-00-00',0.00,'',0),(2,12,1,'0000-00-00',0.00,'',0),(3,15,6,'0000-00-00',0.00,'',0),(4,15,3,'0000-00-00',0.00,'',1),(5,12,10,'0000-00-00',0.00,'',0),(6,9,13,'0000-00-00',0.00,'',1),(7,9,19,'0000-00-00',0.00,'',0),(8,12,8,'0000-00-00',0.00,'',1),(9,15,14,'0000-00-00',0.00,'',0),(10,12,9,'0000-00-00',0.00,'',0),(11,9,11,'0000-00-00',0.00,'',0),(12,15,2,'0000-00-00',0.00,'',0),(13,15,13,'0000-00-00',0.00,'',1),(14,15,19,'0000-00-00',0.00,'',1),(15,9,20,'0000-00-00',0.00,'',1),(16,15,2,'0000-00-00',0.00,'',1),(17,12,9,'0000-00-00',0.00,'',0),(18,9,13,'0000-00-00',0.00,'',1),(19,12,7,'0000-00-00',0.00,'',1),(20,9,1,'0000-00-00',0.00,'',1);
/*!40000 ALTER TABLE `phieu_nhaps` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_coupon_delete` AFTER UPDATE ON `phieu_nhaps` FOR EACH ROW begin
	declare isActive tinyint(1); 
    declare mapn int(11);
    set mapn = NEW.ma_phieu_nhap;
    set isActive = NEW.isActive;
    update webbangiayphp.chi_tiet_phieu_nhaps set webbangiayphp.chi_tiet_phieu_nhaps.isActive = 0
    where webbangiayphp.chi_tiet_phieu_nhaps.ma_phieu_nhap = mapn;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  `so_luong` int(11) NOT NULL DEFAULT '0',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ma_san_pham`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `san_phams`
--

LOCK TABLES `san_phams` WRITE;
/*!40000 ALTER TABLE `san_phams` DISABLE KEYS */;
INSERT INTO `san_phams` VALUES (1,10,12,'Dr. Nolan Krajcik',10725.00,4032572,1),(2,1,1,'Theodore Hyatt',5508400.00,387696,0),(3,18,7,'Kaley Mante',713938287.00,14151,1),(4,17,10,'Khalid Hartmann PhD',763.00,4076,0),(5,8,14,'Mrs. Isabelle Schuster',47321427.00,804,1),(6,2,14,'Otha Lockman',34638419.00,14570,0),(7,20,14,'Jennifer Windler',2074182.00,2672080,1),(8,3,6,'Miss Ava Friesen I',57191.00,9421032,0),(9,8,16,'Thora Skiles',45014.00,6,1),(10,7,6,'Dr. Bernita Raynor IV',6.00,6,0),(11,12,12,'Prof. Diana O\'Connell',2.00,962,0),(12,14,3,'Morris Halvorson',1493.00,414,0),(13,13,20,'Chaim Emard MD',69378307.00,6,1),(14,2,2,'Gene Hermann DVM',78067134.00,15292635,1),(15,11,20,'Maryjane Feil',26.00,577,0),(16,15,5,'Felicita Stamm',56077.00,8234,1),(17,9,5,'Milton Kling',46008.00,996952,1),(18,16,6,'Dr. Daisy Orn V',5.00,9267,0),(19,3,5,'Maximilian Kuhic V',665632.00,11924,0),(20,20,3,'Una Pacocha',559523390.00,5258170,1);
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
  `email_verified_at` timestamp NOT NULL DEFAULT '2020-10-27 06:24:20',
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tai_khoans`
--

LOCK TABLES `tai_khoans` WRITE;
/*!40000 ALTER TABLE `tai_khoans` DISABLE KEYS */;
INSERT INTO `tai_khoans` VALUES (1,'magdalena.raynor@hotmail.com','2020-10-27 06:24:23',']3EQcyi&=^`oD\"I=~\"','Maiya Lakin','75740 Quitzon Lakes Suite 617\nColliermouth, IA 49796-4055','3673','https://lorempixel.com/640/480/?30243','KH',0,NULL,NULL,NULL),(2,'pollich.elyssa@yost.org','2020-10-27 06:24:23','1Aovjg^ved#q*sL}','Prof. Paula Ebert MD','3694 Gutmann Via Apt. 251\nAnikahaven, PA 10127-8254','66','https://lorempixel.com/640/480/?71754','KH',1,NULL,NULL,NULL),(3,'winnifred.gulgowski@goyette.biz','2020-10-27 06:24:23','wSLBr8<;U:|8\"bAp','Leora Abernathy','1701 Myrtis Plains Suite 628\nNew Orrinborough, HI 46193-2249','107','https://lorempixel.com/640/480/?53385','KH',1,NULL,NULL,NULL),(4,'mcclure.vladimir@hotmail.com','2020-10-27 06:24:23','5m1/\\Mu0G0wZI{9xr','Emelia Franecki','741 Pietro Hills Suite 872\nLake Jeramy, IL 14990','225268928','https://lorempixel.com/640/480/?65802','NV',0,NULL,NULL,NULL),(5,'sage.sawayn@gmail.com','2020-10-27 06:24:23','#&=/-V8#YTO5-IDxQkI','Emmett Price MD','157 Bella Creek Apt. 164\nRitchiechester, IA 20802','63720828','https://lorempixel.com/640/480/?72772','KH',0,NULL,NULL,NULL),(6,'jerrell60@yahoo.com','2020-10-27 06:24:23','GRS%}[D>6u4','Lonny Bauch MD','5375 Bechtelar Divide Apt. 768\nMayertshire, LA 33298-3272','536255082','https://lorempixel.com/640/480/?29389','NV',1,NULL,NULL,NULL),(7,'rdeckow@zulauf.biz','2020-10-27 06:24:23','U4;U\\S=Y^tNUl*|:dlA5','Mrs. Michelle Crona','5551 Labadie Creek Apt. 715\nJaydonport, NY 81364','11317','https://lorempixel.com/640/480/?22504','KH',1,NULL,NULL,NULL),(8,'guido41@yahoo.com','2020-10-27 06:24:23','ecCgy3c&','Lizeth Zulauf','8226 Mohr Place Suite 847\nDestinyview, MA 35701-0829','573','https://lorempixel.com/640/480/?69670','NV',1,NULL,NULL,NULL),(9,'mallie42@kreiger.com','2020-10-27 06:24:23','_$R?KX$Dv<Umr!','Queenie Williamson','797 McCullough Expressway Suite 565\nMollymouth, KY 07917-3065','5','https://lorempixel.com/640/480/?73576','QT',1,NULL,NULL,NULL),(10,'theodora.barrows@lueilwitz.com','2020-10-27 06:24:23','UiD6u)]wV+J+c','Fredrick Bins','553 Emmerich Points\nJeaniestad, MN 64807-2584','16','https://lorempixel.com/640/480/?45354','KH',1,NULL,NULL,NULL),(11,'phoebe33@durgan.biz','2020-10-27 06:24:24','!>~$s-tmv0bs8oXw','Roman Gusikowski','4760 Rey Turnpike Suite 465\nSouth Gerard, DC 60075','270188','https://lorempixel.com/640/480/?45796','KH',0,NULL,NULL,NULL),(12,'jgrady@yahoo.com','2020-10-27 06:24:24','f^,WF@.$.7r^Uk','Percy Lemke','57204 Asha Terrace\nNorth Wilhelmshire, VT 23009-8529','144301508','https://lorempixel.com/640/480/?42834','QT',1,NULL,NULL,NULL),(13,'arianna.crona@hotmail.com','2020-10-27 06:24:24','_k:Q2]wC5_4M[%E.MM','Felton Hintz','1307 Heller Gardens Apt. 675\nEffertzberg, IL 53248-5531','4166839','https://lorempixel.com/640/480/?43065','NV',0,NULL,NULL,NULL),(14,'satterfield.emelia@crooks.info','2020-10-27 06:24:24','Kf_ZlXH|}z\'JIhIe#Vas','Adan O\'Reilly','39463 Sheldon Curve Apt. 698\nRonnyside, AK 30609-4977','20356483','https://lorempixel.com/640/480/?96420','NV',1,NULL,NULL,NULL),(15,'timothy79@fadel.com','2020-10-27 06:24:24','-!Vqo2L2~~p:GvN(#^l_','Fredy Hahn','4907 Lynch Way\nWest Kiel, CO 32605-8050','384','https://lorempixel.com/640/480/?63895','QT',0,NULL,NULL,NULL),(16,'hlynch@hotmail.com','2020-10-27 06:24:24','22I0]U\\UEA&T/pE','Watson King','897 Bernhard Shoal Suite 272\nLake Eltaview, MS 07983-6610','89760829','https://lorempixel.com/640/480/?76015','NV',1,NULL,NULL,NULL),(17,'florence71@yahoo.com','2020-10-27 06:24:24','MUF.DexMO2c`q@D7Y\"','Dr. Lisandro McCullough','3834 Emmie Lights Apt. 154\nPort Loyce, NM 67114','85156199','https://lorempixel.com/640/480/?41380','NV',1,NULL,NULL,NULL),(18,'collins.lexus@hotmail.com','2020-10-27 06:24:24','qY,q\\N|0{nU2@%I%S1','Mr. Aric Hand V','5651 Orin Centers Suite 084\nShanelberg, ME 84481-9383','5','https://lorempixel.com/640/480/?59791','KH',0,NULL,NULL,NULL),(19,'alayna15@dietrich.biz','2020-10-27 06:24:24','l@rNJ_&jv','Guy Hermann','2371 Rusty Roads\nNorth Leila, TX 60188','2','https://lorempixel.com/640/480/?91091','NV',1,NULL,NULL,NULL),(20,'ylehner@gmail.com','2020-10-27 06:24:24','be(!4+YCns','Dr. Brenna Krajcik','192 Vito Meadows\nEast Corineland, KS 06351-8120','861907','https://lorempixel.com/640/480/?12945','NV',1,NULL,NULL,NULL),(21,'admin2@gmail.com','0000-00-00 00:00:00','$2y$10$UzS5vJ2bhWeLfTTS27w.Uuhjx0R5QjOW3H4Budn0nGQW5E/px5Pnu','VanNam212','TP Hà Nội','0345164784','','KH',1,NULL,NULL,NULL),(25,'admin@gmail.com','0000-00-00 00:00:00','$2y$10$GRrTI91BcUXH2tCiXr5Gx.lMYq3k1aG2h4xR4iGzK.0yu5R1glrW.','VanNam212','TP Hà Nội','0345164784','','QT',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tai_khoans` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_account_create` AFTER INSERT ON `tai_khoans` FOR EACH ROW begin
    declare makh bigint(20);
    declare loaitk varchar(255);
    set makh = NEW.ma_tai_khoan;
    set loaitk = NEW.loai_tai_khoan;
    if loaitk = 'KH' then
		insert into webbangiayphp.vouchers (ma_khach_hang, muc_voucher) values (makh, 50);
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
INSERT INTO `thuong_hieus` VALUES (1,'Kuhlman, Langworth and Crist',1),(2,'Kling-Hansen',1),(3,'Stiedemann Ltd',1),(4,'Heller, Krajcik and Becker',1),(5,'Luettgen PLC',0),(6,'Mitchell-Jones',0),(7,'Marks, Thompson and Weissnat',0),(8,'Herman, Wunsch and Braun',0),(9,'Smitham, Bartoletti and Hettinger',0),(10,'Rowe, Pfannerstill and Bauch',0),(11,'Hudson and Sons',1),(12,'Mayer LLC',0),(13,'Grady, Gaylord and Wyman',1),(14,'Reichel-Rutherford',0),(15,'Walker-Pollich',1),(16,'Schulist Group',0),(17,'Erdman LLC',1),(18,'Grady-Boyer',0),(19,'Zieme, Kovacek and Lang',1),(20,'Ratke-Hauck',1);
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
  `ngay_dang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '27-10-2020',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tin_tucs`
--

LOCK TABLES `tin_tucs` WRITE;
/*!40000 ALTER TABLE `tin_tucs` DISABLE KEYS */;
INSERT INTO `tin_tucs` VALUES (1,'Mr.','Est non suscipit aut. Et qui vitae nulla vel voluptatem. Aperiam eum velit error. Voluptatem id voluptate fugit eos est.','PROF.','https://kulas.com/quia-ducimus-pariatur-non-illo-tempora-deleniti-quia.html','https://lorempixel.com/640/480/?28738','27-10-2020',1),(2,'Ms.','Non quas soluta animi mollitia delectus nihil nihil. Non veritatis est ut. Facilis libero minus odit nihil. Neque voluptas molestiae consectetur tempore voluptatem eum.','DR.','https://ebert.com/repellendus-commodi-placeat-impedit-aliquam.html','https://lorempixel.com/640/480/?63935','27-10-2020',1),(3,'Prof.','Qui vel tempore quibusdam ut exercitationem. Dolores dicta quis ullam eaque. Dolor rem sed ipsa alias dicta.','PROF.','https://www.kertzmann.com/exercitationem-sed-dolores-dicta-ut-repellendus','https://lorempixel.com/640/480/?36942','27-10-2020',0),(4,'Prof.','Est quae dolores assumenda et animi dolore. Est quibusdam optio iste nisi error vitae. Aut vel sunt recusandae eum voluptatibus sed cum.','MS.','http://www.effertz.com/','https://lorempixel.com/640/480/?93174','27-10-2020',1),(5,'Mr.','Eligendi similique et provident voluptate labore nostrum. Esse cumque ipsum libero placeat facilis. Id quia est molestiae quibusdam quis facilis. Illum modi enim nostrum et est quis aut.','MS.','http://www.nader.com/repellendus-et-soluta-atque-dolorum-nesciunt-ab-ipsum.html','https://lorempixel.com/640/480/?76007','27-10-2020',1),(6,'Dr.','Adipisci sint non hic dignissimos ea minus. Enim consequatur iure incidunt deserunt assumenda atque. Ea soluta numquam in ipsa error.','DR.','http://mante.com/molestiae-sint-sequi-ut-fuga-sint-voluptatem','https://lorempixel.com/640/480/?30101','27-10-2020',0),(7,'Prof.','Sint fuga nam possimus unde eos. Est tempore accusantium et et facilis quo voluptates. Quis accusantium vitae repellat sed. Quisquam eligendi est quidem omnis necessitatibus.','MRS.','http://www.wilderman.com/sunt-quasi-soluta-nam-pariatur-commodi-adipisci-nostrum','https://lorempixel.com/640/480/?39592','27-10-2020',0),(8,'Dr.','Non fugiat maxime est non minus dignissimos quod. Natus dolores maiores cumque harum error. Et voluptatum debitis velit rerum at sit. Est aut ab maxime beatae.','MISS','http://greenfelder.com/qui-suscipit-quaerat-est-ratione','https://lorempixel.com/640/480/?88544','27-10-2020',1),(9,'Prof.','Doloribus consectetur sit eos ut est aut harum rem. A eaque dolores quo quam sit. Eum similique impedit commodi eos porro rerum. Ut animi voluptatem tempore voluptas.','MS.','http://kub.com/','https://lorempixel.com/640/480/?43254','27-10-2020',1),(10,'Mr.','Ut libero distinctio tenetur excepturi. Est ut suscipit quisquam aut sint ab. Repellat consectetur itaque doloremque dolor. Rem magni eveniet accusamus neque modi ea totam.','PROF.','http://batz.com/iure-autem-velit-modi-consequuntur-est-aliquam-facilis-consequuntur','https://lorempixel.com/640/480/?11611','27-10-2020',1),(11,'Mrs.','Aperiam doloremque et corrupti recusandae et dicta. Distinctio cumque quia sunt reiciendis iure. Eos laborum nostrum et eos veniam est.','PROF.','http://king.com/vitae-sunt-id-deleniti','https://lorempixel.com/640/480/?37740','27-10-2020',0),(12,'Mrs.','Ea sed quia et voluptatum in earum est. Dolor eos veniam ipsum corrupti aut. Optio et dolor aliquid doloremque incidunt.','MR.','https://sporer.com/rerum-possimus-totam-nobis-fugiat-exercitationem-qui-exercitationem.html','https://lorempixel.com/640/480/?65097','27-10-2020',1),(13,'Dr.','Maiores id alias sed. Quasi voluptas iste et. Ipsum deleniti est officiis amet quam aut. Id perspiciatis doloribus dolorem ipsa dolorum delectus ut.','MS.','http://www.durgan.com/quia-velit-impedit-ducimus','https://lorempixel.com/640/480/?69993','27-10-2020',0),(14,'Mr.','Modi voluptas praesentium et harum iste. Qui pariatur laborum minima ullam perspiciatis iusto impedit.','MR.','http://www.cremin.info/dignissimos-quos-ipsa-est-possimus','https://lorempixel.com/640/480/?51228','27-10-2020',0),(15,'Miss','Non deserunt quod quos ex sint incidunt non. Reiciendis nam soluta quia et possimus et. Ipsum debitis fugiat aspernatur cumque qui ut et. Minima assumenda molestias et voluptates voluptatum.','DR.','http://daniel.com/','https://lorempixel.com/640/480/?15801','27-10-2020',1),(16,'Mr.','Repellat rem quod ut quidem provident. Eaque quia repudiandae est voluptatum officia. Ut vero ab possimus incidunt corrupti dolor et.','MR.','http://smith.com/suscipit-excepturi-quas-ad-laborum-ut-adipisci-voluptatum','https://lorempixel.com/640/480/?65555','27-10-2020',1),(17,'Ms.','Quibusdam rerum laudantium sit amet nobis ut et. Quos sint et non et est molestiae. Placeat veniam molestias quibusdam vero. Iusto recusandae quam totam deleniti quia aliquid inventore est.','PROF.','https://dickinson.biz/aspernatur-id-in-voluptatum-quis.html','https://lorempixel.com/640/480/?92631','27-10-2020',0),(18,'Mr.','At incidunt quos beatae tempora non et. Ut qui beatae nihil et. Nemo magni aliquid atque. Iusto autem voluptas voluptatem nulla mollitia odio sit beatae.','DR.','http://dooley.biz/aut-veritatis-aut-quas-eos-tempora-voluptatibus-repudiandae-qui','https://lorempixel.com/640/480/?79692','27-10-2020',1),(19,'Mr.','Dolor sunt ut neque harum velit. Non quaerat est quod quo nostrum quibusdam voluptatem. At aut reiciendis tempore facere in debitis et. Natus odio numquam omnis non.','PROF.','http://www.ratke.com/','https://lorempixel.com/640/480/?85629','27-10-2020',0),(20,'Mr.','Fugit veniam eligendi ut mollitia distinctio aut culpa. Velit harum aliquam eveniet. Quas amet enim dolorem. At magnam voluptatem dolores est ex adipisci et rerum.','MR.','http://klocko.com/','https://lorempixel.com/640/480/?19121','27-10-2020',1);
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
  `ma_khach_hang` int(11) NOT NULL,
  `muc_voucher` int(11) NOT NULL DEFAULT '0',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ma_voucher`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vouchers`
--

LOCK TABLES `vouchers` WRITE;
/*!40000 ALTER TABLE `vouchers` DISABLE KEYS */;
INSERT INTO `vouchers` VALUES (1,7,43,0),(2,7,31,0),(3,10,45,1),(4,1,45,1),(5,7,45,0),(6,5,52,1),(7,5,63,1),(8,1,72,1),(9,18,72,1),(10,1,34,1),(11,5,77,0),(12,2,99,1),(13,2,87,0),(14,2,84,0),(15,11,81,0),(16,11,37,1),(17,11,78,0),(18,10,98,0),(19,2,13,1),(20,2,45,0),(21,21,50,1),(22,23,50,1);
/*!40000 ALTER TABLE `vouchers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-27 21:36:33
