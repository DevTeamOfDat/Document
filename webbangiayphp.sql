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
INSERT INTO `chi_tiet_hoa_dons` VALUES (1,20,5,72.00,79419,0),(2,8,18,92872.00,90690,1),(3,10,20,235456.00,293497,1),(4,20,20,35.00,274193178,1),(5,3,19,446.00,385,1),(6,15,8,612836.00,667689,1),(7,20,11,2.00,30241418,1),(8,9,8,2038368.00,0,0),(9,16,18,541.00,2881,1),(10,3,12,86.00,848,0),(11,18,18,79513116.00,9034,1),(12,7,12,9515474.00,2897,1),(13,18,16,138577.00,781686,0),(14,18,13,71.00,7972677,1),(15,16,18,831597.00,247,1),(16,10,10,836280485.00,849344689,1),(17,14,20,15.00,8,1),(18,6,7,3501.00,135978219,0),(19,10,7,66824352.00,33,0),(20,20,11,659.00,156814,1);
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
INSERT INTO `chi_tiet_phieu_nhaps` VALUES (1,15,6,420867.00,51770467,0),(2,14,7,706755.00,5708746,1),(3,10,14,9684.00,6888890,0),(4,17,12,97556747.00,860811897,0),(5,17,6,2357399.00,9,0),(6,6,14,7654938.00,3,0),(7,2,2,343009.00,284027604,0),(8,1,2,5.00,327,1),(9,18,7,4682691.00,67,0),(10,1,4,6.00,3,0),(11,12,19,1.00,183,1),(12,8,6,3074905.00,356428664,0),(13,5,6,92.00,88622,1),(14,2,16,4087.00,58,1),(15,17,15,9928.00,607546,0),(16,1,2,8889.00,2480071,1),(17,18,2,3.00,6260515,0),(18,7,8,197.00,5,1),(19,15,5,49.00,23870038,1),(20,10,18,5276433.00,7303466,0);
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
INSERT INTO `dac_trung_san_phams` VALUES (1,8,15,1),(2,12,8,0),(3,16,16,1),(4,1,3,0),(5,3,7,0),(6,2,19,1),(7,6,16,0),(8,13,13,0),(9,1,13,0),(10,10,5,1),(11,6,5,1),(12,1,1,1),(13,10,11,0),(14,18,16,1),(15,10,9,0),(16,12,2,1),(17,16,18,1),(18,14,9,0),(19,16,15,0),(20,14,12,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dac_trungs`
--

LOCK TABLES `dac_trungs` WRITE;
/*!40000 ALTER TABLE `dac_trungs` DISABLE KEYS */;
INSERT INTO `dac_trungs` VALUES (1,'Miss Araceli Turner','At eum aut sint rerum facilis est quis. Dolorem dolor sed ullam enim est dolore eos exercitationem. Id rerum qui ea et libero fugiat nam. Reprehenderit recusandae omnis quae.',0),(2,'Erin Mills','Est est ea laboriosam est ipsa nulla. Temporibus architecto totam incidunt reiciendis. Sit delectus tenetur ut sed quasi rerum accusantium. Harum ex et eum itaque excepturi vel.',1),(3,'Nickolas O\'Hara II','Et quia sed nostrum et maiores quod. Sequi minima voluptatem nihil culpa magnam. Molestiae molestiae et id rerum.',0),(4,'Mr. Emmanuel Smith DDS','Provident natus aliquam facilis commodi praesentium asperiores est. Laborum incidunt consequatur et eius sed occaecati amet. Eius esse et deserunt cupiditate sunt aut. Optio eum vel et tenetur.',0),(5,'Dr. Flavio Heller DVM','Voluptates aperiam earum occaecati. Cumque quia ut vero sit fugiat id voluptas. Ipsum aut velit voluptatem accusamus aliquid nihil officiis.',0),(6,'Floyd Watsica','Iste laborum magni consectetur. Inventore voluptas voluptatem nihil molestias sapiente. Nihil voluptas qui autem officiis est repellat perferendis.',0),(7,'Arthur Ankunding','Harum magnam qui inventore doloremque consequuntur. Quos velit omnis rerum est saepe. Dolor consequatur occaecati quam nihil est voluptatibus.',0),(8,'Creola Hudson','Voluptatem doloribus a et aut iure autem architecto qui. Sed soluta maiores aut illo. Porro illo adipisci rem distinctio deleniti.',0),(9,'Daphnee Pagac','Dolor et dolor sint et. Ipsum voluptatem consequatur incidunt soluta. Totam incidunt ut eligendi ipsam sunt accusamus reiciendis consequatur. Labore aperiam quam et nemo quo.',0),(10,'Kaela Lebsack','Modi facilis et sunt qui alias nihil laborum. Accusamus laborum deserunt porro voluptas deleniti. Nobis consectetur voluptatem consequatur aliquam harum sint maxime ex.',1),(11,'Dr. Samantha Wolf IV','Est voluptas molestiae ad a ut enim numquam. Doloribus voluptas expedita exercitationem laudantium voluptas aliquid. At veniam et dolor et iure non.',1),(12,'Brisa Wyman','Ipsam deleniti qui impedit eos. Culpa quaerat sint et quis. Placeat iste autem occaecati ducimus delectus ea asperiores. Omnis velit qui perspiciatis maiores laboriosam et ipsum eveniet.',1),(13,'Dr. Santa Bernier DDS','Inventore ut consequatur aut quia. Saepe eos omnis quaerat delectus quia molestiae sed. Et rerum non id dolorem ratione doloremque illo. Sequi nisi commodi quia iusto eos ut.',1),(14,'Erik Rosenbaum','A alias quia minus. Vitae consequatur voluptas est debitis.',1),(15,'Shana McGlynn','Laboriosam iusto vero eum sunt neque. Ea est eveniet facilis sit atque in corrupti. Dolorem et qui amet illo quia soluta labore. Nisi voluptatem ipsum sequi minus eligendi.',1),(16,'Jaren Wolf Sr.','Voluptatibus non nam quis soluta sunt quam vero. Repudiandae dicta tempore neque aut asperiores eveniet quia aut. Consequatur enim cum quasi rerum. Aut corrupti aut dignissimos adipisci.',0),(17,'Jake Weissnat','Eligendi adipisci ut quia et quibusdam ex rerum. Ullam accusamus ipsam enim a quam.',1),(18,'Mr. Eleazar Macejkovic','Alias est fugiat accusamus vel temporibus voluptatem. Et nulla necessitatibus consectetur consequatur consequatur. Et deleniti sed unde et quas inventore commodi. Nam dicta nesciunt quasi hic.',0),(19,'Kendrick Schuppe','Quod distinctio sed aliquam consectetur est molestiae. Itaque totam consequatur cumque. Minus est fugit nesciunt est quidem. Laboriosam saepe vero sequi corporis reiciendis.',0),(20,'Harry Marquardt','Sed tempore et qui quis. Molestias ducimus tenetur consequatur atque. Velit eos eos quam unde ullam. Beatae vel est aliquid.',1);
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
INSERT INTO `hinh_anh_san_phams` VALUES (1,2,'https://lorempixel.com/640/480/?93413',1),(2,3,'https://lorempixel.com/640/480/?73131',0),(3,1,'https://lorempixel.com/640/480/?10692',0),(4,12,'https://lorempixel.com/640/480/?78817',1),(5,8,'https://lorempixel.com/640/480/?60484',1),(6,1,'https://lorempixel.com/640/480/?61821',0),(7,17,'https://lorempixel.com/640/480/?70457',0),(8,16,'https://lorempixel.com/640/480/?73340',1),(9,15,'https://lorempixel.com/640/480/?91343',1),(10,7,'https://lorempixel.com/640/480/?88651',0),(11,12,'https://lorempixel.com/640/480/?61388',1),(12,14,'https://lorempixel.com/640/480/?85962',1),(13,5,'https://lorempixel.com/640/480/?14597',1),(14,19,'https://lorempixel.com/640/480/?66510',0),(15,4,'https://lorempixel.com/640/480/?63142',0),(16,4,'https://lorempixel.com/640/480/?26454',0),(17,7,'https://lorempixel.com/640/480/?52150',1),(18,10,'https://lorempixel.com/640/480/?14366',1),(19,11,'https://lorempixel.com/640/480/?27825',0),(20,4,'https://lorempixel.com/640/480/?62275',0);
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
INSERT INTO `hoa_dons` VALUES (1,6,7,NULL,'2003-06-04',0,1,0.00,0.00,1),(2,4,7,NULL,'1997-11-15',1,1,0.00,0.00,0),(3,19,13,NULL,'1989-07-30',0,0,0.00,0.00,1),(4,4,17,NULL,'2007-03-20',0,0,0.00,0.00,0),(5,19,9,NULL,'2009-06-21',1,0,0.00,0.00,0),(6,3,9,NULL,'2007-12-03',1,0,0.00,0.00,1),(7,10,13,NULL,'2010-07-09',1,1,0.00,0.00,0),(8,6,17,NULL,'2016-11-09',0,0,0.00,0.00,0),(9,6,12,NULL,'2014-11-06',1,1,0.00,0.00,1),(10,19,12,NULL,'2008-02-26',0,0,0.00,0.00,0),(11,11,8,NULL,'1985-10-07',1,0,0.00,0.00,1),(12,4,16,NULL,'1980-11-25',0,1,0.00,0.00,0),(13,10,9,NULL,'2006-08-17',1,1,0.00,0.00,1),(14,10,16,NULL,'1973-11-09',0,0,0.00,0.00,0),(15,10,5,NULL,'1994-04-23',0,0,0.00,0.00,1),(16,11,9,NULL,'2004-03-20',1,1,0.00,0.00,1),(17,19,9,NULL,'2008-11-23',1,1,0.00,0.00,0),(18,6,5,NULL,'1996-04-15',1,0,0.00,0.00,0),(19,19,16,NULL,'2003-10-21',1,1,0.00,0.00,1),(20,19,9,NULL,'2019-03-24',0,1,0.00,0.00,0);
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
INSERT INTO `khuyen_mai_san_phams` VALUES (1,11,11,57,0),(2,6,14,83,0),(3,4,9,57,1),(4,13,12,20,0),(5,11,19,22,1),(6,11,1,27,1),(7,17,14,8,1),(8,7,20,97,1),(9,1,11,69,0),(10,6,12,1,1),(11,18,13,25,1),(12,17,12,52,1),(13,18,6,63,0),(14,13,19,9,0),(15,3,20,8,1),(16,17,6,55,1),(17,19,10,34,0),(18,18,12,89,1),(19,7,18,90,1),(20,20,11,60,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai_san_phams`
--

LOCK TABLES `loai_san_phams` WRITE;
/*!40000 ALTER TABLE `loai_san_phams` DISABLE KEYS */;
INSERT INTO `loai_san_phams` VALUES (1,'Prof. Alaina Gorczany MD','Iusto qui in ea et qui quaerat. Quam est consequatur expedita et dolor enim suscipit quas. Culpa omnis quis qui maiores possimus ea.',1),(2,'Major Hoeger','Architecto occaecati tenetur ad beatae ea quisquam fugit. Itaque animi modi impedit nesciunt vel veritatis quibusdam. A a explicabo et sed natus delectus esse modi.',1),(3,'Cordell Brown','Repellendus esse facere quidem voluptatibus quos soluta saepe modi. Quam voluptates nostrum et ut id nesciunt. Perspiciatis explicabo et et neque quae. Molestiae libero sed voluptatem in harum.',1),(4,'Dr. Rogelio Wuckert II','Et ipsam repudiandae neque atque dolor quia rerum. Est cumque a sed. Et velit maiores laudantium nulla architecto.',1),(5,'Francisco Barton','Facere ipsum nesciunt quia ad ut. Aut eius saepe harum. Dolor illum expedita repudiandae ratione placeat in at. Hic aperiam voluptas ex laboriosam sint maxime.',1),(6,'Miss Cathy Hessel','Assumenda dolores nulla eum qui impedit. Illum omnis omnis dicta dolor. Sint nostrum est impedit sint eaque. Adipisci consequatur explicabo iste accusamus.',1),(7,'Mr. Harmon Deckow','Numquam architecto iure itaque excepturi. Aperiam porro explicabo quod architecto dicta incidunt omnis. Dolores aspernatur quaerat veritatis a quis. Numquam ut vel ex eum.',0),(8,'Dr. Green Schamberger I','Eligendi perspiciatis soluta exercitationem id est enim. Ut labore impedit nihil qui et ipsum. Sint atque necessitatibus numquam ipsa sint excepturi hic at. Optio praesentium aut ut illum.',0),(9,'Lauren Hegmann','Blanditiis quia modi laborum culpa voluptas non quia. Animi vel tenetur possimus eveniet. Voluptas qui porro amet reiciendis at dolor facilis. Eos soluta minus inventore libero.',1),(10,'Mariam Hettinger','Laudantium et nihil odit doloremque saepe tenetur eius. Maxime aut et accusantium dolorem dicta labore recusandae. Et et quasi tempora est. Illum consequatur voluptatem magnam.',0),(11,'Arturo Reichert','Aut earum quia dignissimos occaecati nihil delectus. Sequi modi quidem doloremque et molestiae quisquam voluptatem.',1),(12,'Nels McLaughlin','Excepturi et iusto maxime qui cupiditate perspiciatis inventore. Quia voluptatum asperiores quis ea. Repellat explicabo adipisci aliquam quis ut.',1),(13,'Agustina Schmeler','Enim reiciendis possimus et similique. Qui nemo et facere vel rem accusantium.',1),(14,'Meta Murray','Mollitia sequi illum labore quam alias. Repudiandae quis incidunt vel voluptatem aliquam quaerat ipsum fugit. Consequuntur voluptas odio aut dolores ut quos autem. Sint illum voluptas rerum animi.',1),(15,'Ms. Libbie Hilpert III','Quaerat accusantium aliquid quo natus. Ea et aut accusamus omnis pariatur.',0),(16,'Petra Wiegand','Adipisci saepe quia possimus. Est dignissimos laborum non qui. Cumque deleniti et vel illo.',1),(17,'Cassie Bogan','Id sequi quia qui explicabo sit voluptatum. Delectus nihil blanditiis sequi at. Iste sunt iusto voluptatibus.',0),(18,'Amy Rath','Esse possimus velit quia aliquam ut. Molestias dolores consectetur velit dolorem eaque error. At placeat corporis porro sit maxime. Dolor aut itaque aut nobis.',1),(19,'Myrtle Wyman','Corporis qui et ut quaerat voluptas sint illo. Veritatis numquam aspernatur est. Sequi id qui voluptas perferendis.',1),(20,'Terrence O\'Keefe MD','Quo dolor earum delectus et accusamus deleniti delectus. Maiores eaque labore qui accusamus labore natus. Reiciendis quibusdam asperiores ex qui voluptatem aliquam aut.',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (29,'2014_10_12_000000_create_tai_khoans_table',1),(30,'2014_10_12_100000_create_password_resets_table',1),(31,'2016_06_01_000001_create_oauth_auth_codes_table',1),(32,'2016_06_01_000002_create_oauth_access_tokens_table',1),(33,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(34,'2016_06_01_000004_create_oauth_clients_table',1),(35,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(36,'2019_08_19_000000_create_failed_jobs_table',1),(37,'2020_10_14_004211_create_nha_cung_caps_table',1),(38,'2020_10_14_014912_create_phieu_nhaps_table',1),(39,'2020_10_14_162121_create_hoa_dons_table',1),(40,'2020_10_14_163956_create_thuong_hieus_table',1),(41,'2020_10_14_164434_create_loai_san_phams_table',2),(42,'2020_10_14_165345_create_dac_trungs_table',3),(43,'2020_10_14_165414_create_san_phams_table',3),(44,'2020_10_14_165443_create_nhan_xets_table',4),(45,'2020_10_14_165509_create_dac_trung_san_phams_table',4),(46,'2020_10_14_172357_create_loai_tai_khoans_table',4),(47,'2020_10_14_172842_create_trang_thais_table',4),(48,'2020_10_14_173319_create_loai_dons_table',4),(49,'2020_10_15_060930_create_ngay_khuyen_mais_table',4),(50,'2020_10_15_061300_create_vouchers_table',4),(51,'2020_10_15_144412_create_hinh_anh_san_phams_table',4),(52,'2020_10_15_160006_create_chi_tiet_hoa_dons_table',4),(53,'2020_10_15_160024_create_chi_tiet_phieu_nhaps_table',4),(54,'2020_10_16_013408_create_tin_tucs_table',4),(55,'2020_10_27_013014_create_khuyen_mai_san_phams_table',4);
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
INSERT INTO `ngay_khuyen_mais` VALUES (1,'2005-07-27',1),(2,'1985-03-30',1),(3,'2001-03-30',1),(4,'1996-04-03',0),(5,'2020-07-19',0),(6,'1974-01-22',0),(7,'1983-11-22',0),(8,'1996-01-12',1),(9,'2016-10-02',0),(10,'2012-08-09',0),(11,'2003-03-21',0),(12,'1972-10-01',1),(13,'1993-04-13',0),(14,'1973-11-01',1),(15,'1990-04-07',0),(16,'2003-12-28',0),(17,'1977-08-29',0),(18,'1978-07-06',0),(19,'1979-07-21',1),(20,'1989-11-15',1);
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
INSERT INTO `nha_cung_caps` VALUES (1,'Bins, Heidenreich and Rempel','521 Schiller Key Suite 391\nElsemouth, MO 95967','41577447','hipolito16@trantow.com','3','https://lorempixel.com/640/480/?38898',1),(2,'Mayer-Reichel','6881 Sibyl Vista\nSouth Teresaville, AR 45864','973888','barrett81@abernathy.com','9827142','https://lorempixel.com/640/480/?11585',0),(3,'O\'Reilly Group','654 Rose Rapid\nLake Arelyton, UT 00906','512','rodriguez.kiarra@bashirian.com','768','https://lorempixel.com/640/480/?24418',0),(4,'Ullrich Inc','126 O\'Conner Flats Apt. 581\nLake Olga, AR 55650-4503','8054','kiel.ferry@bogisich.com','565618605','https://lorempixel.com/640/480/?18874',0),(5,'Berge-Wisozk','395 Wehner Forge\nRauhaven, LA 11422-2501','663','lazaro.nader@muller.com','5514375','https://lorempixel.com/640/480/?88376',0),(6,'Konopelski, Cruickshank and Stehr','487 Berta Spurs\nNew Opalton, WY 13475','8','bud.haley@kovacek.org','62217220','https://lorempixel.com/640/480/?95041',1),(7,'Terry-O\'Reilly','10861 Schultz Ford Apt. 958\nOrlandoton, WV 19762-5403','411543','tony.mclaughlin@volkman.com','94622739','https://lorempixel.com/640/480/?78408',0),(8,'Friesen, Metz and Hane','56853 Murray Roads Apt. 376\nWeissnatville, NH 63530-1535','5','dubuque.megane@mccullough.org','932123','https://lorempixel.com/640/480/?83878',1),(9,'Botsford-Kovacek','7963 Scotty Bypass\nJenkinshaven, DC 26254-2488','72','marge.schuppe@robel.com','52256491','https://lorempixel.com/640/480/?33650',0),(10,'Hackett-Roberts','19108 Schaefer Springs Apt. 516\nCarrollport, AZ 42775-2960','94787','sabina.conroy@kerluke.com','362408','https://lorempixel.com/640/480/?10243',1),(11,'Wyman LLC','6940 Brionna Spring Suite 638\nSouth Leonstad, CO 16044','871770','princess77@oreilly.org','0','https://lorempixel.com/640/480/?93773',1),(12,'Bruen, Ebert and Gaylord','461 Tony Islands\nEast Milanfurt, VT 46187','918593','brohan@gaylord.biz','88485','https://lorempixel.com/640/480/?42198',0),(13,'Turcotte LLC','9608 Heaney Squares Apt. 598\nKyleeland, TX 57968-2311','517','unolan@mueller.com','6','https://lorempixel.com/640/480/?38638',1),(14,'Bins, Witting and Stehr','66105 Franecki Courts Apt. 897\nPaulshire, CT 92844-0141','1720990','tito.howell@langosh.com','4','https://lorempixel.com/640/480/?46870',1),(15,'Torp-Emard','984 Wilderman Plains Apt. 416\nMadisenberg, MI 52105','1127394','steuber.isidro@flatley.org','2','https://lorempixel.com/640/480/?78231',1),(16,'Hane-Erdman','661 Hollis Mission\nWest Abelardomouth, WV 42006','89234563','beverly.cummerata@reynolds.com','2379','https://lorempixel.com/640/480/?60342',1),(17,'Dooley-Watsica','618 O\'Reilly Summit\nLillyhaven, MT 97348-7182','3224491','yhintz@parisian.com','8235708','https://lorempixel.com/640/480/?29782',1),(18,'Bartoletti-Herman','3292 Myrtle Ports Apt. 025\nNorth Laurel, RI 27121-3834','8296632','kuhn.rod@watsica.com','2','https://lorempixel.com/640/480/?41179',1),(19,'Franecki-Harber','26330 Eldon Cove\nJohnpaulmouth, OK 73741','1182','lowe.vinnie@welch.biz','225540','https://lorempixel.com/640/480/?81177',1),(20,'Durgan and Sons','1683 Curtis Fork Apt. 772\nCormiertown, VT 51015','369','dare.rosalyn@krajcik.com','6','https://lorempixel.com/640/480/?88692',1);
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
INSERT INTO `nhan_xets` VALUES (1,2,12,'Et blanditiis delectus itaque pariatur et rerum nesciunt. Nisi tempora ut sed iure officiis placeat quia. Animi maiores neque sed ut beatae. Sequi iste doloremque a omnis qui ut iste iste.',0),(2,11,9,'Et vitae molestiae rem nihil. Error voluptatem cupiditate quia. Laudantium neque iure repellat sit nisi est deserunt. Error sequi itaque aut sit quia facilis.',1),(3,4,5,'Quis labore qui nulla. Eos velit aut hic maiores fugiat inventore perspiciatis.',0),(4,4,9,'Commodi quis excepturi facilis. Nemo fugit similique odit expedita natus. Temporibus totam quos vitae praesentium id distinctio repudiandae. Pariatur delectus ut porro distinctio.',1),(5,5,9,'Nemo eligendi alias ad. Quia architecto rem velit. Esse voluptatem asperiores eveniet facere quo. Est ea et quisquam asperiores quod dignissimos ut.',1),(6,2,9,'Veritatis eum alias totam tenetur nesciunt corporis qui. Deleniti cupiditate rerum laboriosam est. Enim labore corrupti autem. Qui dolor ducimus nesciunt quia.',1),(7,9,12,'Suscipit ratione quibusdam ut impedit ducimus dolorem impedit sed. Tenetur aperiam earum ut dolorem. Vitae dolore beatae est sunt sit sit voluptatibus modi. Voluptatem aut ut qui.',0),(8,6,8,'Enim eveniet et voluptas at laboriosam corrupti rerum. Voluptas est veniam magni dolor facilis pariatur neque. Enim omnis sit unde et illum ipsa voluptatem.',0),(9,6,12,'Similique quia quos consequatur et. Quos culpa quia accusantium ratione incidunt saepe. Consequatur nulla voluptas sit est aut non provident odio. Laudantium voluptas ut necessitatibus aspernatur ut.',0),(10,13,5,'Repudiandae sit provident non itaque consectetur quibusdam et. Cum odit aliquam placeat. Repellat aliquam rerum nihil dicta ab corporis corrupti.',0),(11,19,2,'Sint alias libero aut voluptas. Ab reiciendis ea adipisci porro. Eos illo libero voluptates eos ipsa perferendis repudiandae non.',0),(12,19,7,'Eos id dolorem officiis tenetur. Animi sapiente ipsam est non. Saepe placeat aliquid aut corrupti odit repudiandae.',1),(13,9,13,'Nisi reiciendis ut iste in. Eum dolorum repellendus velit maiores rerum. Quia expedita dolorum quam fugit totam qui.',1),(14,3,16,'Consectetur nobis rerum libero molestiae. Possimus unde est expedita sint perferendis optio ad. Quaerat saepe ipsum qui quis eum in velit. Atque et placeat iste amet qui.',0),(15,10,5,'Ut rerum blanditiis esse vel et qui. Debitis nihil quia natus provident harum reiciendis qui. Veritatis est quam sint nobis ad culpa.',1),(16,3,9,'Doloribus porro velit quidem saepe earum. Id quas natus qui eligendi. Sint ut sint mollitia. Et nihil eum ipsum beatae odit.',1),(17,9,5,'Neque labore cupiditate a quia et libero. Iste aut nam eaque cumque illum laboriosam culpa. Quia et enim possimus aut dolor id nulla.',1),(18,15,17,'Quisquam debitis ea aut sed. Est perspiciatis eos nulla et. Qui provident impedit sit laudantium molestias repellat quisquam. Exercitationem commodi odio sunt autem.',0),(19,12,7,'Fuga nobis temporibus reprehenderit assumenda eum. Molestias tempora maxime aliquid ut odio nisi. Qui dignissimos eveniet exercitationem minima.',0),(20,10,7,'Ut voluptatem qui reiciendis esse omnis repellendus. Fugiat sed sit omnis vel voluptatum. Animi veniam omnis magnam aspernatur amet et aut. Consequatur vel eos incidunt in est eveniet in.',0);
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
INSERT INTO `oauth_access_tokens` VALUES ('64c6a16d910931e5e6c8fd7716eb48652bd370c98c2d4dc76977fe45d4fc6d4fcc992caeb8c50216',21,1,'WebsiteBanGiayPHP','[]',0,'2020-10-27 15:06:44','2020-10-27 15:06:44','2021-10-27 22:06:44'),('c589def597a4d99f8f4b0398bcd4f295044fa3c87b0c5b3f76aaa0ea6de5343fd4df89dd82beb2f3',22,1,'WebsiteBanGiayPHP','[]',0,'2020-10-27 15:07:07','2020-10-27 15:07:07','2021-10-27 22:07:07');
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
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','H23YEveMSbfdU2QETfE9YSlaCIyDmseBUBkCCUe3',NULL,'http://localhost',1,0,0,'2020-10-27 08:05:56','2020-10-27 08:05:56'),(2,NULL,'Laravel Password Grant Client','HBLXns7ls6dA7j3WC2vHtNyVbju2GRpmHRMYEHaE','users','http://localhost',0,1,0,'2020-10-27 08:05:56','2020-10-27 08:05:56');
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
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2020-10-27 08:05:56','2020-10-27 08:05:56');
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
INSERT INTO `phieu_nhaps` VALUES (1,15,8,'1970-03-28',0.00,'',0),(2,1,20,'2011-02-15',0.00,'',1),(3,1,1,'2000-01-22',0.00,'',1),(4,15,2,'2003-05-16',0.00,'',0),(5,20,5,'1995-06-21',0.00,'',1),(6,18,7,'2018-03-27',0.00,'',1),(7,18,2,'1999-09-15',0.00,'',1),(8,1,1,'1986-12-12',0.00,'',0),(9,1,9,'1972-02-21',0.00,'',0),(10,1,8,'1975-08-19',0.00,'',0),(11,1,8,'1990-05-21',0.00,'',0),(12,15,9,'1983-06-24',0.00,'',0),(13,15,9,'2007-05-09',0.00,'',1),(14,1,5,'1985-07-29',0.00,'',0),(15,15,7,'1972-06-12',0.00,'',0),(16,18,12,'1992-10-06',0.00,'',1),(17,14,2,'1977-12-07',0.00,'',0),(18,14,11,'1990-04-21',0.00,'',0),(19,15,2,'1970-04-26',0.00,'',1),(20,1,14,'2007-01-12',0.00,'',0);
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
INSERT INTO `san_phams` VALUES (1,17,20,'Sidney Torphy',9.00,1341938,1),(2,7,6,'Ethelyn Jacobi',70.00,0,0),(3,20,17,'Wellington Turcotte I',974531288.00,87,1),(4,10,19,'Jensen Weissnat',6524.00,7,0),(5,14,13,'Mr. Kurt Ferry',120895014.00,34949686,1),(6,1,1,'Don Koch III',3945.00,21807,0),(7,18,5,'Itzel Wehner',21204.00,708305608,1),(8,7,6,'Prof. Vida Becker',80628.00,83888,0),(9,17,11,'Kenton Daugherty III',649.00,800,0),(10,20,16,'Miss Jaqueline Becker',4857283.00,878864222,1),(11,18,13,'Raoul Walter',3378048.00,2,1),(12,4,11,'Danny Kemmer',2.00,707618972,0),(13,20,15,'Emmanuelle Hermann',7672.00,1,1),(14,4,20,'Vinnie Strosin I',11940904.00,9395,1),(15,7,15,'Dr. Hilario Balistreri V',19932.00,9,1),(16,8,19,'Bradly Kris',369646.00,322687513,0),(17,2,1,'Ottilie Murray',9444591.00,6500630,1),(18,15,6,'Louvenia Reichel I',628.00,92298,0),(19,16,19,'Prof. Freida Cruickshank DDS',37.00,733545,1),(20,20,19,'Nolan Hermann',2888586.00,701,1);
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
  `email_verified_at` timestamp NOT NULL DEFAULT '2020-10-27 08:02:48',
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tai_khoans`
--

LOCK TABLES `tai_khoans` WRITE;
/*!40000 ALTER TABLE `tai_khoans` DISABLE KEYS */;
INSERT INTO `tai_khoans` VALUES (1,'smitham.modesta@fay.com','2020-10-27 08:02:50','>/1}lrA?n','Reanna Zboncak','5719 Wintheiser Neck\nPort Major, MD 65055-2793','20','https://lorempixel.com/640/480/?41053','QT',1,NULL,NULL,NULL),(2,'dare.osborne@olson.com','2020-10-27 08:02:51','<PznvE}`l&-N','Annette Bauch','72438 Teresa Row Suite 686\nUriahhaven, FL 06418','28122642','https://lorempixel.com/640/480/?72258','KH',0,NULL,NULL,NULL),(3,'zjacobs@lang.com','2020-10-27 08:02:51','rbD{zY&!X}f4?Hp','Berry Raynor','294 Brenden Village\nSouth Jacey, VA 25944','79748','https://lorempixel.com/640/480/?68701','NV',1,NULL,NULL,NULL),(4,'muhammad.weissnat@boyle.com','2020-10-27 08:02:51','Ci(>7ayZk<LlT','Dr. Kenyon Smitham','10946 Wuckert Drive Suite 312\nKeelingport, WI 18411','284797496','https://lorempixel.com/640/480/?12133','NV',0,NULL,NULL,NULL),(5,'bschimmel@gmail.com','2020-10-27 08:02:51','tkL\\fF)}\"gEf(','Prof. Eloisa Boyer','9085 Natalia Plaza Apt. 560\nWest Soledad, NJ 86436-9928','4066','https://lorempixel.com/640/480/?30471','KH',1,NULL,NULL,NULL),(6,'monica83@okon.com','2020-10-27 08:02:51','8r(A;?w^[Q@Sx','Mr. Bernhard Kub','30408 Wiza Pass Apt. 067\nNew Lennabury, PA 24845-2975','403351','https://lorempixel.com/640/480/?69535','NV',1,NULL,NULL,NULL),(7,'felicia93@yahoo.com','2020-10-27 08:02:51','#=#)\\Ng_],cx28G','Mr. Alexzander Beier PhD','5899 Darrell Lakes Apt. 087\nEast Judge, OR 40442','23545','https://lorempixel.com/640/480/?17050','KH',0,NULL,NULL,NULL),(8,'lynch.omari@fritsch.com','2020-10-27 08:02:51','5Zlw(=?FU1]}@cJ:','Irving Hudson II','32372 Schneider Union Apt. 001\nNoemieborough, KS 73237','26','https://lorempixel.com/640/480/?79694','KH',1,NULL,NULL,NULL),(9,'daniela.boyle@luettgen.com','2020-10-27 08:02:51','uR.KV.YQrBO3BJ','Filomena Morar','2658 Aditya Loop Suite 133\nHollyton, HI 42250-7750','5223880','https://lorempixel.com/640/480/?16228','KH',1,NULL,NULL,NULL),(10,'anderson.federico@senger.com','2020-10-27 08:02:51','L,{k*5\\^)nZ\\FX>','Mrs. Phyllis Stark III','76046 O\'Kon Meadow\nEast Vicente, TN 68858-8591','9475834','https://lorempixel.com/640/480/?87046','NV',1,NULL,NULL,NULL),(11,'wiegand.german@waters.org','2020-10-27 08:02:52','3^K\']jgslIO$+Yu,1','Noemi Lakin','27184 Alexander Summit\nWest Saulchester, MO 74682','1308','https://lorempixel.com/640/480/?99865','NV',1,NULL,NULL,NULL),(12,'verla06@hodkiewicz.net','2020-10-27 08:02:52','$K/^*5Fb\\0FfTj`R(','Murray Greenfelder','1850 Raynor Crossing\nSerenaborough, VT 56704','54971830','https://lorempixel.com/640/480/?42633','KH',1,NULL,NULL,NULL),(13,'wbeier@gmail.com','2020-10-27 08:02:52','}|cCn_6[','Prof. Leonora Leannon','7550 McKenzie Estate\nSouth Joy, DC 56431','8','https://lorempixel.com/640/480/?13701','KH',0,NULL,NULL,NULL),(14,'gabriel07@hotmail.com','2020-10-27 08:02:52','2D$M&9<ZU1','Dr. Jasmin Deckow MD','24309 Derick Pines\nNew Luis, KS 65147-7740','463','https://lorempixel.com/640/480/?69820','QT',1,NULL,NULL,NULL),(15,'feest.abbey@gmail.com','2020-10-27 08:02:52','RpT%b:n>^&hU@tLgZ$h','Rosina Casper','3038 Ansel Plain Suite 842\nNew Everardo, AL 03068-5769','283','https://lorempixel.com/640/480/?86634','QT',0,NULL,NULL,NULL),(16,'jeromy43@champlin.com','2020-10-27 08:02:52','-5o\\Iit!g306Vz','Kayla Hagenes DVM','91047 John Island\nPort Eulalia, WV 73060-7768','338674640','https://lorempixel.com/640/480/?38819','KH',0,NULL,NULL,NULL),(17,'brittany93@hill.info','2020-10-27 08:02:52','H~HK7!.^yxT6lZ','Prof. Lyric Hoeger','281 Hagenes Turnpike\nNorth Laurianneville, TX 24799-8680','398979','https://lorempixel.com/640/480/?31709','KH',0,NULL,NULL,NULL),(18,'grant.molly@hotmail.com','2020-10-27 08:02:52','CTKLb~5jj1SPF','Corine Harris','2019 Pinkie Cliff\nGabrielleborough, ME 81050-7884','7564235','https://lorempixel.com/640/480/?13191','QT',0,NULL,NULL,NULL),(19,'kzulauf@lehner.com','2020-10-27 08:02:52','XB}P2{S\"3(=}Z<o','Carolyn O\'Kon','656 Padberg Streets Apt. 324\nBoylefurt, CO 42275','386908','https://lorempixel.com/640/480/?36214','NV',1,NULL,NULL,NULL),(20,'tyshawn38@gmail.com','2020-10-27 08:02:52',';+g=BV!C1rV','Mrs. Briana Harris Sr.','3992 Kris Glens\nMohrmouth, UT 22866','38089','https://lorempixel.com/640/480/?87941','QT',1,NULL,NULL,NULL),(21,'admin@gmail.com','2020-10-26 17:00:00','$2y$10$RWe0gLVWLBBShomftlrAGOqqPOMPenjU/YQzOzwYKLpKHRLoqrz8G','VanNam212','TP Hà Nội','0345164784','','QT',1,NULL,NULL,NULL),(22,'admin2@gmail.com','2020-10-26 17:00:00','$2y$10$6xUaNeWd4TbuV/s2xMQgaOdCajfEilt8eId/ZcBJ7qwdRESViF8mK','VanNam212','TP Hà Nội','0345164784','','KH',1,NULL,NULL,NULL);
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
INSERT INTO `thuong_hieus` VALUES (1,'Mante-Little',1),(2,'Howe PLC',0),(3,'Graham, Davis and Smith',0),(4,'Mann LLC',0),(5,'Okuneva-Friesen',1),(6,'Hoeger, Hoeger and Runolfsson',0),(7,'Witting, Pfeffer and Kovacek',1),(8,'Frami, Barton and Reinger',1),(9,'Beer-Price',1),(10,'Kuhic, Prohaska and Walker',1),(11,'Nicolas-Dickinson',0),(12,'Johnson, Altenwerth and Hill',0),(13,'Gerhold PLC',0),(14,'Brekke-Rice',1),(15,'Cole, Fay and Hodkiewicz',1),(16,'Fritsch-Bernier',1),(17,'Murray-Larson',1),(18,'Harvey and Sons',1),(19,'Cremin Inc',0),(20,'Schaden PLC',1);
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
  `ngay_dang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2020-10-27',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tin_tucs`
--

LOCK TABLES `tin_tucs` WRITE;
/*!40000 ALTER TABLE `tin_tucs` DISABLE KEYS */;
INSERT INTO `tin_tucs` VALUES (1,'Mrs.','Dicta eaque velit omnis repellat repellendus maxime nobis. Eveniet eos velit dolores quia. Esse ea nobis beatae. Error pariatur consequuntur quod doloribus qui ut.','DR.','http://www.carter.com/','https://lorempixel.com/640/480/?66621','2020-10-27',0),(2,'Dr.','Reiciendis provident sed et impedit autem quo. Explicabo suscipit dolore aut non. Soluta sunt et provident amet corporis odio esse.','MR.','http://www.upton.com/id-molestiae-sunt-totam','https://lorempixel.com/640/480/?46151','2020-10-27',0),(3,'Miss','Consectetur cupiditate rem repellat facere. Debitis quis eveniet praesentium est quasi quae. Delectus corrupti accusantium nemo dignissimos doloribus eos dolorem. Adipisci tempore esse est.','MISS','http://leffler.com/expedita-provident-et-deserunt','https://lorempixel.com/640/480/?60024','2020-10-27',0),(4,'Mrs.','Aut animi minima voluptate quas doloribus omnis. Et ipsum et ex. Autem impedit laudantium laudantium officiis nihil minima.','PROF.','https://www.gaylord.info/velit-eum-sunt-ut-similique','https://lorempixel.com/640/480/?67491','2020-10-27',1),(5,'Dr.','Aspernatur id blanditiis voluptatem aspernatur praesentium. Molestiae consectetur eveniet in iusto et animi. Dolores ex id tempora.','DR.','http://www.friesen.biz/perspiciatis-omnis-quaerat-aspernatur-ipsam-mollitia.html','https://lorempixel.com/640/480/?66021','2020-10-27',1),(6,'Miss','Sit vel et non rerum. Aliquam accusamus aut cum occaecati. Pariatur adipisci quisquam et quasi dolor porro. Quia quia velit est voluptas minima in illo laudantium.','PROF.','https://www.mann.info/velit-sit-architecto-ipsam-earum-et-nobis-doloribus-aut','https://lorempixel.com/640/480/?58322','2020-10-27',1),(7,'Dr.','Nisi dolores autem velit dolores quas est impedit. Suscipit in sit est qui dolor vero. Maiores tenetur quasi ducimus eligendi est. Aut perferendis aut qui.','MS.','http://www.dickinson.com/sed-exercitationem-consequatur-voluptas-fugit-ut-odio-eum','https://lorempixel.com/640/480/?57204','2020-10-27',0),(8,'Dr.','Enim ab dolorum ipsum minima et. Dicta autem dolorem earum sequi eum in error dolores. Veniam vel sit a molestiae quos ratione est.','DR.','http://www.ferry.org/aut-quam-voluptatem-blanditiis-et-eaque-numquam-doloremque','https://lorempixel.com/640/480/?45896','2020-10-27',1),(9,'Mr.','Deserunt fugit pariatur inventore vel dolorem. Repellat quas et nam dolore. Praesentium excepturi libero quisquam reiciendis fuga. Et nemo ut incidunt similique sint esse non.','MR.','https://www.kreiger.net/reiciendis-aliquam-similique-nostrum-magnam-dolor-quaerat-quia','https://lorempixel.com/640/480/?82927','2020-10-27',1),(10,'Dr.','Quod natus dicta molestiae tenetur cupiditate illum. Accusantium quis officia ut laboriosam est praesentium odio earum. A aut et debitis et et.','MISS','http://leffler.com/atque-ullam-cumque-cum-et-in-adipisci-expedita','https://lorempixel.com/640/480/?16090','2020-10-27',0),(11,'Prof.','Nobis ut ex et blanditiis nihil. Natus adipisci enim reiciendis dolorem hic. Voluptas amet in est id non dolorum.','MISS','http://swift.com/expedita-dolorem-expedita-molestiae-deleniti-dolorum-vero-rerum-quo','https://lorempixel.com/640/480/?36475','2020-10-27',0),(12,'Dr.','Aspernatur ratione debitis aut expedita quae qui. Voluptas optio voluptas ducimus facilis autem et nihil. Consectetur est saepe est saepe occaecati omnis voluptas corporis.','MS.','http://www.olson.com/sit-qui-velit-aut-omnis-ut','https://lorempixel.com/640/480/?82573','2020-10-27',0),(13,'Dr.','Dicta incidunt blanditiis voluptatem est et. Accusantium ut dolor architecto rerum totam qui eaque eius. Et quia dolores est nihil. Consequatur quam eum at necessitatibus ut beatae doloremque.','DR.','https://www.fay.com/eius-et-laborum-corrupti-corrupti-occaecati-ratione','https://lorempixel.com/640/480/?67630','2020-10-27',1),(14,'Ms.','Et ipsam non similique ut blanditiis omnis repellendus. Dolores ullam ullam non maiores. Ut quia accusamus accusantium illo quia recusandae. Sed perspiciatis nulla error accusantium.','MISS','http://heathcote.org/aut-autem-voluptatibus-sed-minima-officiis','https://lorempixel.com/640/480/?78476','2020-10-27',0),(15,'Dr.','Sapiente eos quia alias est. Recusandae modi corporis eum commodi voluptatum omnis fugiat. Autem et perspiciatis provident ut quos voluptatem. Nihil quaerat dicta fugiat illum ducimus deserunt.','MR.','http://www.metz.com/aliquam-reprehenderit-inventore-incidunt-laudantium','https://lorempixel.com/640/480/?37319','2020-10-27',1),(16,'Mr.','Fugiat nihil quia voluptatem impedit. Aut qui ut tempore voluptas autem id nemo. Qui est voluptatibus facere et incidunt et totam. Et odio sequi sapiente eligendi a quas.','MR.','http://gutkowski.com/non-doloribus-debitis-at-et-voluptates.html','https://lorempixel.com/640/480/?89676','2020-10-27',1),(17,'Prof.','Quia qui voluptatem quisquam sint porro. Laboriosam sit eveniet ipsa eligendi iste repellendus veritatis. Maxime quo delectus labore. Sunt laborum dolor rerum alias nihil.','DR.','http://hyatt.net/eos-beatae-tenetur-tempora-mollitia-minus-odit','https://lorempixel.com/640/480/?20861','2020-10-27',0),(18,'Mr.','Laboriosam beatae modi id. Ut sint omnis labore dicta sapiente quos. A veniam distinctio et voluptatem et sunt.','PROF.','http://www.quitzon.org/sed-ut-temporibus-praesentium-ut-modi-quaerat','https://lorempixel.com/640/480/?26980','2020-10-27',1),(19,'Dr.','Temporibus inventore sunt illum architecto ullam. Libero suscipit dolores voluptate non facere occaecati. Perspiciatis iusto asperiores rerum. Aperiam fuga repudiandae modi incidunt aperiam et.','PROF.','http://reinger.biz/incidunt-dolor-maiores-alias-porro.html','https://lorempixel.com/640/480/?46320','2020-10-27',1),(20,'Mr.','Blanditiis soluta perferendis omnis sed amet minus ad. Sit minus consequatur odio quis magni. Deserunt sed laborum sed in in architecto quam.','MR.','https://www.glover.com/sunt-est-laborum-possimus-sint-qui-eligendi-eum','https://lorempixel.com/640/480/?20763','2020-10-27',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vouchers`
--

LOCK TABLES `vouchers` WRITE;
/*!40000 ALTER TABLE `vouchers` DISABLE KEYS */;
INSERT INTO `vouchers` VALUES (1,2,89,1),(2,17,62,0),(3,2,15,0),(4,12,70,0),(5,16,53,1),(6,7,37,1),(7,13,81,0),(8,12,30,1),(9,2,65,1),(10,7,69,1),(11,2,14,0),(12,13,36,0),(13,9,63,0),(14,9,61,0),(15,13,90,1),(16,16,65,1),(17,2,73,0),(18,12,40,1),(19,13,1,0),(20,13,64,0);
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

-- Dump completed on 2020-10-27 22:09:34
