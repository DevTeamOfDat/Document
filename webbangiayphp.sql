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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_hoa_dons`
--

LOCK TABLES `chi_tiet_hoa_dons` WRITE;
/*!40000 ALTER TABLE `chi_tiet_hoa_dons` DISABLE KEYS */;
INSERT INTO `chi_tiet_hoa_dons` VALUES (5,1,1,'[16,2]',2200000.00,2,1),(6,1,3,'[11,3]',1980000.00,3,1),(7,2,9,'[13,1]',1430000.00,3,1),(8,2,11,'[16,2]',2000000.00,1,1),(9,3,23,'[15,6]',1800000.00,1,1),(10,3,1,'[16,1]',2200000.00,2,1),(11,4,7,'[15,3]',1900000.00,2,1),(12,4,16,'[13,5]',2100000.00,2,1),(13,4,13,'[12,2]',2200000.00,1,1),(14,5,2,'[16,4]',2100000.00,1,1),(15,5,7,'[15,4]',1900000.00,2,1),(16,5,13,'[12,2]',2200000.00,2,1),(17,6,6,'[16,2]',1900000.00,2,1),(18,6,9,'[13,2]',1450000.00,1,1),(19,6,11,'[16,2]',2000000.00,1,1),(20,6,16,'[13,5]',2100000.00,1,1),(21,7,1,'[16,2]',2200000.00,2,1),(22,7,23,'[15,6]',1750000.00,2,1),(23,7,9,'[13,1]',1450000.00,2,1),(25,8,3,'[11,1]',2000000.00,2,1),(26,8,6,'[16,1]',1900000.00,3,1),(27,8,11,'[16,1]',2000000.00,2,1),(28,9,12,'[15,5]',1900000.00,3,1),(29,9,10,'[15,4]',1450000.00,1,1),(30,9,8,'[16,3]',1450000.00,1,1),(31,10,10,'[15,4]',1450000.00,2,1),(32,10,5,'[20,5]',2000000.00,2,1),(33,10,1,'[16,4]',2200000.00,2,1);
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
    declare mahd bigint(20);
    declare ds_ldt varchar(255);
    declare slhd int(11) default 0;
    declare slsp int(11) default 0;
    declare sldtsp int(11) default -1;
    declare gia_ban_moi double(15,2) default 0;
    declare tong_tien_hd double(15,2) default 0.00;
    declare tt double(15,2) default 0.00;
    declare ma_voucher_hd bigint(20);
    declare muc_voucher_hd int(11) default 0;
    
    set mahd = NEW.ma_hoa_don;
	set masp = NEW.ma_san_pham;    
    set ds_ldt = NEW.danh_sach_loai_dac_trung;
    set gia_ban_moi = NEW.gia_ban;
    set slhd = NEW.so_luong;
    set sldtsp = (select so_luong from webbangiayphp.dac_trung_san_phams where dac_trung_san_phams.danh_sach_loai_dac_trung = ds_ldt and dac_trung_san_phams.ma_san_pham = masp);
    
    set tong_tien_hd = (select tong_tien from webbangiayphp.hoa_dons where hoa_dons.ma_hoa_don = mahd);
    set ma_voucher_hd = (select ma_voucher from webbangiayphp.hoa_dons where hoa_dons.ma_hoa_don = mahd);
    set slsp = (select so_luong from webbangiayphp.san_phams where san_phams.ma_san_pham = masp);
    
    if ma_voucher_hd is not null then
		set muc_voucher_hd = (select muc_voucher from webbangiayphp.vouchers where vouchers.ma_voucher = ma_voucher_hd);
    end if;
    
    if slsp >= slhd then
		set tt = (tong_tien_hd + gia_ban_moi*slhd);
		update san_phams set san_phams.so_luong = (slsp-slhd) where san_phams.ma_san_pham = masp;
        if muc_voucher_hd > 0 then
			update hoa_dons set hoa_dons.thanh_tien = tt*(1-muc_voucher_hd/100) where hoa_dons.ma_hoa_don = mahd;
			update hoa_dons set hoa_dons.tong_tien = tt where hoa_dons.ma_hoa_don = mahd;
			
			update vouchers set vouchers.isActive = 0 where vouchers.ma_voucher = ma_voucher_hd;
		else 
			update hoa_dons set hoa_dons.thanh_tien = tt where hoa_dons.ma_hoa_don = mahd;
			update hoa_dons set hoa_dons.tong_tien = tt where hoa_dons.ma_hoa_don = mahd;
		end if;
        if sldtsp>=slhd then
			update dac_trung_san_phams set dac_trung_san_phams.so_luong = sldtsp - slhd where dac_trung_san_phams.danh_sach_loai_dac_trung = ds_ldt and dac_trung_san_phams.ma_san_pham = masp;
		end if;
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
    declare mahd bigint(20);
    declare ds_ldt varchar(255);
    declare slhd int(11) default 0;
    declare slsp int(11) default 0;
    declare sldtsp int(11) default -1;
    declare gia_ban_moi double(15,2) default 0;
    declare tong_tien_hd double(15,2) default 0.00;
    declare tt double(15,2) default 0.00;
    declare ma_voucher_hd bigint(20);
    declare muc_voucher_hd int(11) default 0;
    declare isactive tinyint(1);
    
    set mahd = NEW.ma_hoa_don;
	set masp = NEW.ma_san_pham;    
    set ds_ldt = NEW.danh_sach_loai_dac_trung;
    set gia_ban_moi = NEW.gia_ban;
    set slhd = NEW.so_luong;
    set sldtsp = (select so_luong from webbangiayphp.dac_trung_san_phams where dac_trung_san_phams.danh_sach_loai_dac_trung = ds_ldt and dac_trung_san_phams.ma_san_pham = masp);
    set isactive = NEW.isActive;
    
    set tong_tien_hd = (select tong_tien from webbangiayphp.hoa_dons where hoa_dons.ma_hoa_don = mahd);
    set ma_voucher_hd = (select ma_voucher from webbangiayphp.hoa_dons where hoa_dons.ma_hoa_don = mahd);
    set slsp = (select so_luong from webbangiayphp.san_phams where san_phams.ma_san_pham = masp);
    
    if ma_voucher_hd is not null then
		set muc_voucher_hd = (select muc_voucher from webbangiayphp.vouchers where vouchers.ma_voucher = ma_voucher_hd);
    end if;
    
    if isactive = 0 then
		set tt = (tong_tien_hd - gia_ban_moi*slhd);
		update san_phams set san_phams.so_luong = (slsp+slhd) where san_phams.ma_san_pham = masp;
        if muc_voucher_hd > 0 then
			update hoa_dons set hoa_dons.thanh_tien = tt*(1-muc_voucher_hd/100) where hoa_dons.ma_hoa_don = mahd;
			update hoa_dons set hoa_dons.tong_tien = tt where hoa_dons.ma_hoa_don = mahd;
			
		else 
			update hoa_dons set hoa_dons.thanh_tien = tt where hoa_dons.ma_hoa_don = mahd;
			update hoa_dons set hoa_dons.tong_tien = tt where hoa_dons.ma_hoa_don = mahd;
		end if;
        update dac_trung_san_phams set dac_trung_san_phams.so_luong = sldtsp + slhd where dac_trung_san_phams.danh_sach_loai_dac_trung = ds_ldt and dac_trung_san_phams.ma_san_pham = masp;
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
  `ma_phieu_nhap` bigint(20) NOT NULL,
  `ma_san_pham` bigint(20) NOT NULL,
  `danh_sach_loai_dac_trung` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gia_nhap` double(15,2) NOT NULL DEFAULT '0.00',
  `so_luong` int(11) NOT NULL DEFAULT '0',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_phieu_nhaps`
--

LOCK TABLES `chi_tiet_phieu_nhaps` WRITE;
/*!40000 ALTER TABLE `chi_tiet_phieu_nhaps` DISABLE KEYS */;
INSERT INTO `chi_tiet_phieu_nhaps` VALUES (1,1,1,'[16,1]',2000000.00,100,1),(2,1,1,'[16,2]',2000000.00,200,1),(3,1,2,'[16,3]',1900000.00,50,1),(4,1,2,'[16,4]',1900000.00,150,1),(5,2,3,'[11,1]',1800000.00,200,1),(6,2,3,'[11,3]',1800000.00,100,1),(7,2,6,'[16,1]',1700000.00,500,1),(8,2,6,'[16,2]',1700000.00,400,1),(9,3,7,'[15,3]',1700000.00,200,1),(10,3,7,'[15,4]',1700000.00,200,1),(11,3,9,'[13,1]',1300000.00,100,1),(12,3,9,'[13,2]',1300000.00,75,1),(13,3,11,'[16,1]',1800000.00,500,1),(14,3,11,'[16,2]',1800000.00,400,1),(15,3,13,'[12,1]',2000000.00,200,1),(16,3,13,'[12,2]',2000000.00,300,1),(17,4,16,'[13,5]',1900000.00,200,1),(18,4,16,'[13,6]',1900000.00,300,1),(19,4,23,'[15,5]',1600000.00,300,1),(20,4,23,'[15,6]',1600000.00,200,1),(21,5,1,'[16,3]',2000000.00,100,1),(22,5,1,'[16,4]',2000000.00,150,1),(23,5,2,'[16,1]',1900000.00,100,1),(24,5,2,'[16,2]',1900000.00,100,1),(25,6,3,'[11,2]',1800000.00,125,1),(26,6,3,'[11,4]',1800000.00,200,1),(27,6,4,'[11,3]',1700000.00,100,1),(28,6,4,'[11,4]',1700000.00,100,1),(29,6,4,'[11,5]',1700000.00,100,1),(30,6,4,'[11,6]',1700000.00,100,1),(31,7,5,'[20,5]',1800000.00,200,1),(32,7,5,'[20,6]',1800000.00,200,1),(33,7,5,'[20,7]',1800000.00,200,1),(34,7,5,'[20,6]',1800000.00,200,1),(35,8,8,'[16,1]',1300000.00,100,1),(36,8,8,'[16,2]',1300000.00,100,1),(37,8,8,'[16,3]',1300000.00,100,1),(38,8,8,'[16,4]',1300000.00,100,1),(39,9,10,'[15,2]',1300000.00,100,1),(40,9,10,'[15,3]',1300000.00,100,1),(41,9,10,'[15,4]',1300000.00,100,1),(42,9,10,'[15,5]',1300000.00,150,1),(43,10,12,'[15,2]',1700000.00,100,1),(44,10,12,'[15,3]',1700000.00,100,1),(45,10,12,'[15,4]',1700000.00,100,1),(46,10,12,'[15,5]',1700000.00,100,1);
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
	declare muc1 double(15,2) default 500000.00;
    declare muc2 double(15,2) default 2000000.00;
    declare muc3 double(15,2) default 10000000.00;
    declare muc4 double(15,2) default 20000000.00;
    declare muc5 double(15,2) default 50000000.00;
    declare muc6 double(15,2) default 100000000.00;
	declare masp bigint(20);
    declare mapn bigint(20);
    declare ds_ldt varchar(255);
    declare slpn int(11) default 0;
    declare slsp int(11) default 0;
    declare sldtsp int(11) default -1;
    declare gia_nhap_sp double(15,2) default 0.00;
    declare gia_ban_sp double(15,2) default 0.00;
    declare tong_tien_pn double(15,2) default 0.00;
    
    set mapn = NEW.ma_phieu_nhap;
	set masp = NEW.ma_san_pham;
    set ds_ldt = NEW.danh_sach_loai_dac_trung;
    set slpn = NEW.so_luong;
    set gia_nhap_sp = NEW.gia_nhap;
    set slsp = (select so_luong from webbangiayphp.san_phams where san_phams.ma_san_pham = masp);
    set tong_tien_pn = (select tong_tien from webbangiayphp.phieu_nhaps where phieu_nhaps.ma_phieu_nhap = mapn);
	case gia_nhap_sp 
		when gia_nhap_sp<=muc1 then set gia_ban_sp = (gia_nhap_sp*1.2);
		when gia_nhap_sp>muc1 and gia_nhap_sp<=muc2 then set gia_ban_sp = (gia_nhap_sp*1.15);
		when gia_nhap_sp>muc2 and gia_nhap_sp<=muc3 then set gia_ban_sp = (gia_nhap_sp*1.1);
		when gia_nhap_sp>muc3 and gia_nhap_sp<=muc4 then set gia_ban_sp = (gia_nhap_sp*1.08);
		when gia_nhap_sp>muc4 and gia_nhap_sp<=muc5 then set gia_ban_sp = (gia_nhap_sp*1.04);
		when gia_nhap_sp>muc5 and gia_nhap_sp<=muc6 then set gia_ban_sp = (gia_nhap_sp*1.02);
		else set gia_ban_sp = (gia_nhap_sp*1.01);
	end case;
    set sldtsp = (select so_luong from webbangiayphp.dac_trung_san_phams where dac_trung_san_phams.danh_sach_loai_dac_trung = ds_ldt and dac_trung_san_phams.ma_san_pham = masp);
    if sldtsp>=0 then
		update dac_trung_san_phams set dac_trung_san_phams.so_luong = sldtsp + slpn where dac_trung_san_phams.danh_sach_loai_dac_trung = ds_ldt and dac_trung_san_phams.ma_san_pham = masp;
	else
		insert into dac_trung_san_phams (danh_sach_loai_dac_trung, ma_san_pham, so_luong, isActive) values (ds_ldt, masp, slpn, 1);
    end if;
    update webbangiayphp.phieu_nhaps set webbangiayphp.phieu_nhaps.tong_tien = (tong_tien_pn + slpn*gia_nhap_sp)
	where webbangiayphp.phieu_nhaps.ma_phieu_nhap = mapn;
    update webbangiayphp.san_phams set webbangiayphp.san_phams.so_luong = (slsp+slpn) where webbangiayphp.san_phams.ma_san_pham = masp;
    update webbangiayphp.san_phams set webbangiayphp.san_phams.gia_ban = gia_ban_sp where webbangiayphp.san_phams.ma_san_pham = masp;
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
    declare mapn bigint(20);
    declare ds_ldt varchar(255);
    declare slpn int(11) default 0;
    declare slsp int(11) default 0;
    declare sldtsp int(11) default -1;
    declare isActive tinyint(1);
    declare gia_nhap_sp double(15,2);
    declare tong_tien_pn double(15,2);
    
    set masp = NEW.ma_san_pham;
    set mapn = NEW.ma_phieu_nhap;
    set ds_ldt = NEW.danh_sach_loai_dac_trung;
    set slpn = NEW.so_luong;
    set isActive = NEW.isActive;
    set gia_nhap_sp = NEW.gia_nhap;
    
    set tong_tien_pn = (select tong_tien from webbangiayphp.phieu_nhaps where phieu_nhaps.ma_phieu_nhap = mapn);
    set slsp = (select so_luong from webbangiayphp.san_phams where san_phams.ma_san_pham = masp);    
    set sldtsp = (select so_luong from webbangiayphp.dac_trung_san_phams where dac_trung_san_phams.danh_sach_loai_dac_trung = ds_ldt and dac_trung_san_phams.ma_san_pham = masp);
    
    if isActive = 0 then
		update webbangiayphp.san_phams set webbangiayphp.san_phams.so_luong = (slsp-slpn) 
		where webbangiayphp.san_phams.ma_san_pham = masp;
        update webbangiayphp.phieu_nhaps set webbangiayphp.phieu_nhaps.tong_tien = (tong_tien - slpn*gia_nhap_sp) 
		where webbangiayphp.phieu_nhaps.ma_phieu_nhap = mapn;
        if sldtsp>=slpn then
			update dac_trung_san_phams set dac_trung_san_phams.so_luong = sldtsp - slpn where dac_trung_san_phams.danh_sach_loai_dac_trung = ds_ldt and dac_trung_san_phams.ma_san_pham = masp;
		end if;
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
  `danh_sach_loai_dac_trung` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ma_san_pham` bigint(20) NOT NULL,
  `so_luong` int(11) NOT NULL DEFAULT '0',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dac_trung_san_phams`
--

LOCK TABLES `dac_trung_san_phams` WRITE;
/*!40000 ALTER TABLE `dac_trung_san_phams` DISABLE KEYS */;
INSERT INTO `dac_trung_san_phams` VALUES (1,'[16,1]',1,97,1),(2,'[16,2]',1,196,1),(3,'[16,3]',1,100,1),(4,'[16,4]',1,148,1),(5,'[16,1]',2,100,1),(6,'[16,2]',2,100,1),(7,'[16,3]',2,48,1),(8,'[16,4]',2,149,1),(9,'[11,1]',3,200,1),(10,'[11,2]',3,125,1),(11,'[11,3]',3,97,1),(12,'[11,4]',3,200,1),(13,'[11,3]',4,100,1),(14,'[11,4]',4,100,1),(15,'[11,5]',4,100,1),(16,'[11,6]',4,100,1),(17,'[20,5]',5,198,1),(18,'[20,6]',5,400,1),(19,'[20,7]',5,200,1),(20,'[20,8]',5,0,1),(21,'[16,1]',6,497,1),(22,'[16,2]',6,398,1),(23,'[16,3]',6,0,1),(24,'[16,4]',6,0,1),(25,'[15,3]',7,198,1),(26,'[15,4]',7,198,1),(27,'[15,5]',7,0,1),(28,'[15,6]',7,0,1),(29,'[16,1]',8,100,1),(30,'[16,2]',8,100,1),(31,'[16,3]',8,100,1),(32,'[16,4]',8,100,1),(33,'[13,1]',9,89,1),(34,'[13,2]',9,74,1),(35,'[13,3]',9,0,1),(36,'[13,4]',9,0,1),(37,'[15,2]',10,100,1),(38,'[15,3]',10,100,1),(39,'[15,4]',10,97,1),(40,'[15,5]',10,150,1),(41,'[16,1]',11,498,1),(42,'[16,3]',11,0,1),(43,'[16,5]',11,0,1),(44,'[16,7]',11,0,1),(45,'[15,2]',12,100,1),(46,'[15,4]',12,100,1),(47,'[15,6]',12,0,1),(48,'[15,8]',12,0,1),(49,'[12,1]',13,200,1),(50,'[12,2]',13,297,1),(51,'[12,3]',13,0,1),(52,'[12,4]',13,0,1),(53,'[15,5]',14,0,1),(54,'[15,6]',14,0,1),(55,'[15,7]',14,0,1),(56,'[15,8]',14,0,1),(57,'[16,3]',15,0,1),(58,'[16,4]',15,0,1),(59,'[16,5]',15,0,1),(60,'[16,6]',15,0,1),(61,'[13,5]',16,197,1),(62,'[13,6]',16,300,1),(63,'[13,7]',16,0,1),(64,'[13,8]',16,0,1),(65,'[21,3]',17,0,1),(66,'[21,4]',17,0,1),(67,'[21,5]',17,0,1),(68,'[21,6]',17,0,1),(69,'[15,5]',18,0,1),(70,'[15,6]',18,0,1),(71,'[15,7]',18,0,1),(72,'[15,8]',18,0,1),(73,'[10,1]',19,0,1),(74,'[10,2]',19,0,1),(75,'[10,3]',19,0,1),(76,'[10,4]',19,0,1),(77,'[22,1]',20,0,1),(78,'[22,3]',20,0,1),(79,'[22,5]',20,0,1),(80,'[22,7]',20,0,1),(81,'[10,1]',21,0,1),(82,'[10,2]',21,0,1),(83,'[10,3]',21,0,1),(84,'[10,4]',21,0,1),(85,'[16,2]',22,0,1),(86,'[16,4]',22,0,1),(87,'[16,6]',22,0,1),(88,'[16,8]',22,0,1),(89,'[15,5]',23,300,1),(90,'[15,6]',23,197,1),(91,'[15,7]',23,0,1),(92,'[15,8]',23,0,1),(93,'[15,1]',24,0,1),(94,'[15,2]',24,0,1),(95,'[15,3]',24,0,1),(96,'[15,4]',24,0,1),(97,'[10,1]',25,0,1),(98,'[10,2]',25,0,1),(99,'[10,3]',25,0,1),(100,'[10,4]',25,0,1),(101,'[16,2]',11,398,1),(102,'[15,3]',12,100,1),(103,'[15,5]',12,97,1);
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
  `mo_ta` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`loai_dac_trung`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dac_trungs`
--

LOCK TABLES `dac_trungs` WRITE;
/*!40000 ALTER TABLE `dac_trungs` DISABLE KEYS */;
INSERT INTO `dac_trungs` VALUES (1,'Size 36','size',1),(2,'Size 37','size',1),(3,'Size 38','size',1),(4,'Size 39','size',1),(5,'Size 40','size',1),(6,'Size 41','size',1),(7,'Size 42','size',1),(8,'Size 43','size',1),(9,'Đỏ','màu',1),(10,'Xanh nước biển','màu',1),(11,'Xanh Lá','màu',1),(12,'Nâu','màu',1),(13,'Vàng','màu',1),(14,'Tím','màu',1),(15,'Đen','màu',1),(16,'Trắng','màu',1),(17,'Cam ','màu',1),(18,'Xanh lá mạ','màu',1),(19,'Xanh da trời','màu',1),(20,'Khaki','màu',1),(21,'Camo','màu',1),(22,'Đỏ Đậm','màu',1);
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
  `hinh_anh` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hinh_anh_san_phams`
--

LOCK TABLES `hinh_anh_san_phams` WRITE;
/*!40000 ALTER TABLE `hinh_anh_san_phams` DISABLE KEYS */;
INSERT INTO `hinh_anh_san_phams` VALUES (1,1,'',1),(2,1,'',1),(3,1,'',1),(4,2,'',1),(5,2,'',1),(6,2,'',1),(7,3,'',1),(8,3,'',1),(9,3,'',1),(10,4,'',1),(11,4,'',1),(12,4,'',1),(13,5,'',1),(14,5,'',1),(15,5,'',1),(16,6,'',1),(17,6,'',1),(18,6,'',1),(19,7,'',1),(20,7,'',1),(21,7,'',1),(22,8,'',1),(23,8,'',1),(24,8,'',1),(25,9,'',1),(26,9,'',1),(27,9,'',1),(28,10,'',1),(29,10,'',1),(30,10,'',1),(31,11,'',1),(32,11,'',1),(33,11,'',1),(34,12,'',1),(35,12,'',1),(36,12,'',1),(37,13,'',1),(38,13,'',1),(39,13,'',1),(40,14,'',1),(41,14,'',1),(42,14,'',1),(43,15,'',1),(44,15,'',1),(45,15,'',1),(46,16,'',1),(47,16,'',1),(48,16,'',1),(49,17,'',1),(50,17,'',1),(51,17,'',1),(52,18,'',1),(53,18,'',1),(54,18,'',1),(55,19,'',1),(56,19,'',1),(57,19,'',1),(58,20,'',1),(59,20,'',1),(60,20,'',1),(61,21,'',1),(62,21,'',1),(63,21,'',1);
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
  `ngay_lap` date DEFAULT NULL,
  `loai_don` tinyint(1) NOT NULL DEFAULT '1',
  `trang_thai` tinyint(1) NOT NULL DEFAULT '1',
  `tong_tien` double(15,2) NOT NULL DEFAULT '0.00',
  `thanh_tien` double(15,2) NOT NULL DEFAULT '0.00',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ma_hoa_don`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoa_dons`
--

LOCK TABLES `hoa_dons` WRITE;
/*!40000 ALTER TABLE `hoa_dons` DISABLE KEYS */;
INSERT INTO `hoa_dons` VALUES (1,1,2,NULL,'2020-11-07',1,1,10340000.00,10340000.00,1),(2,1,3,NULL,'2020-11-07',1,1,6290000.00,6290000.00,1),(3,1,2,NULL,'2020-11-07',1,1,6200000.00,6200000.00,1),(4,5,3,NULL,'2020-11-07',1,1,10200000.00,10200000.00,1),(5,5,4,NULL,'2020-11-07',1,1,10300000.00,10300000.00,1),(6,1,3,NULL,'2020-11-07',1,1,9350000.00,9350000.00,1),(7,5,3,NULL,'2020-11-07',1,1,10800000.00,10800000.00,1),(8,1,2,NULL,'2020-11-07',1,1,13700000.00,13700000.00,1),(9,5,2,NULL,'2020-11-07',1,1,8600000.00,8600000.00,1),(10,1,4,NULL,'2020-11-07',1,1,11300000.00,11300000.00,1);
/*!40000 ALTER TABLE `hoa_dons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `inventoryproducts`
--

DROP TABLE IF EXISTS `inventoryproducts`;
/*!50001 DROP VIEW IF EXISTS `inventoryproducts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `inventoryproducts` AS SELECT 
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
-- Table structure for table `khuyen_mai_san_phams`
--

DROP TABLE IF EXISTS `khuyen_mai_san_phams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `khuyen_mai_san_phams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ma_san_pham` bigint(20) NOT NULL,
  `ma_ngay_khuyen_mai` bigint(20) NOT NULL,
  `muc_khuyen_mai` int(11) NOT NULL DEFAULT '0' COMMENT '%',
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
  `mo_ta` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `mo_ta` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ma_loai_san_pham`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai_san_phams`
--

LOCK TABLES `loai_san_phams` WRITE;
/*!40000 ALTER TABLE `loai_san_phams` DISABLE KEYS */;
INSERT INTO `loai_san_phams` VALUES (1,'Giày cao cổ','',1),(2,'Giày thể thao','',1),(3,'Giày Sneaker','',1),(4,'Giày lười','',1),(5,'Giày có khóa','',1),(6,'Giày họa tiết','',1),(7,'Giày sự kiện','',1),(8,'Giày có dây','',1);
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
  `mo_ta` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=461 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (434,'2014_10_12_000000_create_tai_khoans_table',1),(435,'2014_10_12_100000_create_password_resets_table',1),(436,'2016_06_01_000001_create_oauth_auth_codes_table',1),(437,'2016_06_01_000002_create_oauth_access_tokens_table',1),(438,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(439,'2016_06_01_000004_create_oauth_clients_table',1),(440,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(441,'2019_08_19_000000_create_failed_jobs_table',1),(442,'2020_10_14_004211_create_nha_cung_caps_table',1),(443,'2020_10_14_014912_create_phieu_nhaps_table',1),(444,'2020_10_14_162121_create_hoa_dons_table',1),(445,'2020_10_14_163956_create_thuong_hieus_table',1),(446,'2020_10_14_164434_create_loai_san_phams_table',1),(447,'2020_10_14_165345_create_dac_trungs_table',1),(448,'2020_10_14_165414_create_san_phams_table',1),(449,'2020_10_14_165443_create_nhan_xets_table',1),(450,'2020_10_14_165509_create_dac_trung_san_phams_table',1),(451,'2020_10_14_172357_create_loai_tai_khoans_table',1),(452,'2020_10_14_172842_create_trang_thais_table',1),(453,'2020_10_14_173319_create_loai_dons_table',1),(454,'2020_10_15_060930_create_ngay_khuyen_mais_table',1),(455,'2020_10_15_061300_create_vouchers_table',1),(456,'2020_10_15_144412_create_hinh_anh_san_phams_table',1),(457,'2020_10_15_160006_create_chi_tiet_hoa_dons_table',1),(458,'2020_10_15_160024_create_chi_tiet_phieu_nhaps_table',1),(459,'2020_10_16_013408_create_tin_tucs_table',1),(460,'2020_10_27_013014_create_khuyen_mai_san_phams_table',1);
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
  `dia_chi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hot_line` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `so_dien_thoai` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hinh_anh` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ma_nha_cung_cap`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nha_cung_caps`
--

LOCK TABLES `nha_cung_caps` WRITE;
/*!40000 ALTER TABLE `nha_cung_caps` DISABLE KEYS */;
INSERT INTO `nha_cung_caps` VALUES (1,'CÔNG TY TNHH THƯƠNG MẠI SẢN XUẤT GIÀY QUỐC ĐỊNH','9/38 & 9/42 Thống Nhất, Phường 15, Quận Gò Vấp, TP.HCM','0902693311','giayluxery@gmail.com','0902693311','',1),(2,'Công ty CP thời trang Evashoes','26 Nguyễn Phong Sắc, Cầu Giấy, Hà Nội','1900565683','Info@evashoes.com.vn','0343793857','',1),(3,'Aba Footwear','số 72 đường Lê Thánh Tôn ,Phuòng Bến Nghé, Quận 1, Thành Phố Hồ Chí Minh','','info@abafootwear.com','0989359435','',1),(4,'Xưởng Giày VIT','Tầng 3- 4-5-6 Số 12 Ngõ 12 Phạm Tuấn Tài - Cầu Giấy - Hà Nội','0984 716 290','xuongiayvit.com@gmail.com','092621972','',1),(5,'DOANH NGHIỆP SẢN XUẤT & TM GIÀY DÉP SAO VIỆT','213/38b Liên Khu 4 -5, P. Bình Hưng Hòa B, Q. Bình Tân, TP.HCM','0966865121','iaydepsaoviet@gmail.com','0933550880','',1),(6,'CÔNG TY TNHH TUẤN KIỆT XUÂN CẦU','Làng nghề Minh Khai, Thị Trấn Như Quỳnh, Huyện Văn Lâm, Tỉnh Hưng Yên','','quynhquyen368@gmail.com','0366361136','',1),(7,'CÔNG TY TNHH HUY HOANG VN','43/34 Đường Vườn Lài, Q12 HCM','0909 917 959','dephuyhoangvn@gmail.com','08 3719773','',1),(8,'Thuong Dinh Footwear','Số 277, đường Nguyễn Trãi, Phường Thanh Xuân Trung, Quận Thanh Xuân, Thành phố Hà Nội, Việt Nam','( +84 ) 243 854 1262','thuongdinhfootwear@gmail.com','0324624828','',1);
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
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','QCnjiVFKdvxIgYQeATrBkHEWEi5qUSRoBWKBVYrV',NULL,'http://localhost',1,0,0,'2020-11-21 03:22:45','2020-11-21 03:22:45'),(2,NULL,'Laravel Password Grant Client','58DD4kUjGlPaaXYOgcWsmkjwfLVLP5tCJ8XeTjMC','users','http://localhost',0,1,0,'2020-11-21 03:22:46','2020-11-21 03:22:46');
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
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2020-11-21 03:22:46','2020-11-21 03:22:46');
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
  `ngay_nhap` date DEFAULT NULL,
  `tong_tien` double(15,2) NOT NULL DEFAULT '0.00',
  `ghi_chu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ma_phieu_nhap`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieu_nhaps`
--

LOCK TABLES `phieu_nhaps` WRITE;
/*!40000 ALTER TABLE `phieu_nhaps` DISABLE KEYS */;
INSERT INTO `phieu_nhaps` VALUES (1,1,2,'2020-11-07',980000000.00,'',1),(2,1,4,'2020-11-07',2070000000.00,'',1),(3,1,1,'2020-11-07',3527500000.00,'',1),(4,1,5,'2020-11-07',1750000000.00,'',1),(5,5,3,'2020-11-07',880000000.00,'',1),(6,5,6,'2020-11-07',1265000000.00,'',1),(7,1,1,'2020-11-07',1440000000.00,'',1),(8,5,3,'2020-11-07',520000000.00,'',1),(9,5,2,'2020-11-07',585000000.00,'',1),(10,1,3,'2020-11-07',680000000.00,'',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `san_phams`
--

LOCK TABLES `san_phams` WRITE;
/*!40000 ALTER TABLE `san_phams` DISABLE KEYS */;
INSERT INTO `san_phams` VALUES (1,1,1,'Converse Chuck Taylor All Star 1970s Rivals',2020000.00,541,1),(2,1,8,'Converse Chuck Taylor All Star 1970s Rivals ',1919000.00,397,1),(3,1,1,'Converse Chuck Taylor All Star 1970s Midnight Clover ',1818000.00,620,1),(4,1,8,'Converse Chuck Taylor All Star 1970s Midnight Clover ',1717000.00,400,1),(5,1,1,'Converse Chuck Taylor All Star 1970s Colors Vintage Canvas ',1818000.00,798,1),(6,2,1,'Vans UA SK8-Hi Tapered DIY ',1717000.00,895,1),(7,2,1,'Vans UA SK8-Hi Tapered DIY ',1717000.00,391,1),(8,2,4,'Vans UA Authentic HC DIY',1313000.00,399,1),(9,2,4,'Vans UA Authentic HC DIY',1313000.00,163,1),(10,2,8,'Vans UA Authentic HC DIY ',1313000.00,447,1),(11,3,1,'Palladium Pampa Hi Dare',1818000.00,896,1),(12,3,1,'Palladium Pampa Hi Dare',1717000.00,397,1),(13,3,1,'Palladium Pampa Hi Future ',2020000.00,497,1),(14,3,1,'Palladium Pampa Hi Future',0.00,0,1),(15,3,1,'Palladium Pampa Hi Future ',0.00,0,1),(16,4,1,'Supra Aluminum',1919000.00,497,1),(17,4,2,'Supra Flow',0.00,0,1),(18,4,1,'Supra Breaker ',0.00,0,1),(19,4,8,'Supra Lizard ',0.00,0,1),(20,4,1,'Supra Vaider ',0.00,0,1),(21,5,2,'K-Swiss Court Lite Spellout S',0.00,0,1),(22,5,2,'K-Swiss Court Lite Spellout S ',0.00,0,1),(23,5,2,'K-Swiss Court Lite Spellout S Black',1616000.00,497,1),(24,5,2,'K-Swiss Si-Defier 7.0',0.00,0,1),(25,5,2,'K-Swiss Si-Defier 7.0',0.00,0,1);
/*!40000 ALTER TABLE `san_phams` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_product_insert` AFTER INSERT ON `san_phams` FOR EACH ROW begin
    declare makh bigint(20);
    
    declare list_makh cursor for (select ma_tai_khoan from webbangiayphp.tai_khoans where tai_khoans.loai_tai_khoan = 'KH');
    open list_makh;
	fetch list_makh into makh;
        insert into vouchers (ma_khach_hang, muc_voucher) values (makh, 20); 
    close list_makh;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_product_delete` AFTER UPDATE ON `san_phams` FOR EACH ROW begin
    declare masp bigint(20);
    declare isactive tinyint(1);
    
    set masp = NEW.ma_san_pham;
    set isactive = NEW.isActive;
    if isactive = 0 then
		update khuyen_mai_san_phams set khuyen_mai_san_phams.isActive = 0 where khuyen_mai_san_phams.ma_san_pham = masp;
        update hinh_anh_san_phams set hinh_anh_san_phams.isActive = 0 where hinh_anh_san_phams.ma_san_pham = masp;
        update dac_trung_san_phams set dac_trung_san_phams.isActive = 0 where dac_trung_san_phams.ma_san_pham = masp;
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tai_khoans`
--

DROP TABLE IF EXISTS `tai_khoans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tai_khoans` (
  `ma_tai_khoan` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `mat_khau` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ho_ten` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dia_chi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `so_dien_thoai` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hinh_anh` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loai_tai_khoan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'KH',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ma_tai_khoan`),
  UNIQUE KEY `tai_khoans_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tai_khoans`
--

LOCK TABLES `tai_khoans` WRITE;
/*!40000 ALTER TABLE `tai_khoans` DISABLE KEYS */;
INSERT INTO `tai_khoans` VALUES (1,'admin@gmail.com','2020-11-06 10:00:00','$2y$10$VuF8fR4o841h47QMGHSvP.ochTgFo4fdCwWnaaY1CO65CmmxiqND2','VanNam212','TP Hà Nội','0345164784','','QT',1,NULL,NULL,NULL),(2,'user@gmail.com','2020-11-06 10:00:00','$2y$10$n49lVnIUs.rlxR74KNLweO.qKWPutAmDb6U.E0oqWpQpBERO0NHYq','Nguyen Van Nam','TP Hà Nội','0345164784','','KH',1,NULL,NULL,NULL),(3,'ThayHaidepzainhatxom@gmail.com','2020-11-07 00:04:16','hailit123','Trần Thanh hải','Thái Nguyên','0989359435','','KH',1,NULL,NULL,NULL),(4,'Nam7love@gmail.com','2020-11-07 00:04:16','vannam212','Nguyễn Cao Nam','Bắc Từ Liêm, Hà Nội','0964253158','','KH',1,NULL,NULL,NULL),(5,'GD@gmail.com','2020-11-07 00:04:16','vannam212','Do Duong','Ha Noi','0235655218','','NV',1,NULL,NULL,NULL);
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
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_account_delete` AFTER UPDATE ON `tai_khoans` FOR EACH ROW begin
    declare makh bigint(20);
    declare loaitk varchar(255);
    declare isactive tinyint(1);
    
    set makh = NEW.ma_tai_khoan;
    set loaitk = NEW.loai_tai_khoan;
    set isactive = NEW.isActive;
    if loaitk = 'KH' and isactive = 0 then
		update vouchers set vouchers.isActive = 0 where vouchers.ma_khach_hang = makh;
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
  `hinh_anh` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ma_thuong_hieu`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thuong_hieus`
--

LOCK TABLES `thuong_hieus` WRITE;
/*!40000 ALTER TABLE `thuong_hieus` DISABLE KEYS */;
INSERT INTO `thuong_hieus` VALUES (1,'Converse','',1),(2,'Vans','',1),(3,'Palladium','',1),(4,'Supra','',1),(5,'K-Swiss','',1);
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
  `ngay_dang` date DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tin_tucs`
--

LOCK TABLES `tin_tucs` WRITE;
/*!40000 ALTER TABLE `tin_tucs` DISABLE KEYS */;
INSERT INTO `tin_tucs` VALUES (1,'Mướt mắt với loạt giày Vans Xanh Ngọc đậm chất cool','Đã bao giờ bạn cảm thấy thích thú khi ngắm nhìn những item màu xanh ngọc thật “xinh xẻo” chưa nào? Gam màu này trông có vẻ kén người sử dụng và không mấy phổ biến, thế nhưng lại vô cùng hút mắt và tạo nên phong cách cực kỳ độc đáo. Xu hướng thời trang hiện đại đã phá vỡ định kiến về màu xanh ngọc và ngày càng có nhiều vật dụng được khoác lên mình màu sắc tươi mới này. Đó là lý do vì sao hãng giày đình đám Vans lại quyết định cho ra mắt loạt giày màu xanh ngọc cực hút mắt, hứa hẹn sẽ làm nức lòng các fan. Cùng ngắm nhìn những mẫu giày Vans Xanh Ngọc thật lung linh và đỏm dáng ngay sau đây nhé.','','','https://drake.vn/giay-vans-xanh-ngoc','2020-11-07',1),(2,' Điểm lại một số thông tin về giày Vans Classic Black And White','Được mệnh danh là “ông vua” của làng giày trượt ván, Vans luôn cố gắng chứng tỏ bản thân mình bằng những sản phẩm chất lượng, đáp ứng nhu cầu ngày một khắt khe của người tiêu dùng. Bên cạnh những BST mới được ra mắt theo mùa, các dòng Classic vẫn có chỗ đứng riêng trong lòng các Vanslover. Là những đầu giày best-seller của hãng, giày Vans Classic Black And White luôn được restock liên tục trên thị trường quốc tế nhưng vẫn không tránh khỏi tình trạng cháy hàng tại nhiều khu vực. Chỉ chừng đó đã đủ thấy sức hút khó cưỡng lại của những dòng giày cổ điển quen thuộc. Ngay sau đây, chúng ta sẽ cùng điểm qua một số mẫu giày Vans Classic Black And White mà có thể bạn đã hoặc chưa biết nhưng vẫn đang tiếp tục làm mưa làm gió từng ngày trên kệ hàng của Vans.','','','https://drake.vn/vans-classic-black-and-wihte','2020-11-07',1),(3,' Xinh tươi hơn trong nhưng đôi giày Converse Classic Trắng','Kiểu dáng giày Converse Chuck Taylor All Star Classic đã gắn liền với sự phát triển của hãng giày đình đám Converse trong nhiều thập kỷ qua. Mạnh mẽ trường tồn qua năm tháng, những đôi giày Classic luôn chứng tỏ sức hút và có mặt trong danh mục best-seller của Converse, ngay cả khi ngày càng có nhiều dòng giày mới hiện đại hơn được ra đời. Trong số đó, phải kể đến mẫu giày Converse Classic Trắng với thiết kế vô cùng đơn giản nhưng lại cực kỳ bắt mắt, tạo nên điểm nhấn không thể bỏ qua cho outfit của bạn. Để hiểu rõ hơn cũng như có một cái nhìn cận cảnh, mời bạn cùng theo dõi bài viết sau và cập nhật một số thông tin hữu ích về mẫu giày Converse Classic Trắng nhé.','','','https://drake.vn/giay-converse-classic-trang','2020-11-07',1),(4,'Tìm hiểu ngay những đầu giày Vans Classic trường tồn với thời gian','Cứ mỗi ngày trôi qua, làng thời trang lại chứng kiến những cơn sốt của những BST mới, những sản phẩm mới được ra mắt, gây xôn xao dư luận. “Sóng sau xô sóng trước”, những thiết kế đã cũ sẽ nhường ngôi lại cho những thiết kế mới hiện đại hơn, phù hợp với thị hiếu ngày một thay đổi của người tiêu dùng. Tuy nhiên, vẫn có những giá trị làm nên tên tuổi của thương hiệu, dù tồn tại qua bao nhiêu thập kỷ, vẫn duy trì nguyên vẹn độ hot và không ngừng chinh phục trái tim của biết bao bạn trẻ. Drake đang muốn đề cập đến những đôi giày Vans Classic gắn liền với sự phát triển của nhà giày ván trượt Vans. Dù được ra đời cách đây khá lâu, song đến nay, dòng giày Vans Classic vẫn giữ nguyên sức hấp dẫn đối với công chúng và đặc biệt là giới trẻ. Vậy những mẫu giày này có điểm gì thu hút mà lại có thể trường tồn qua thời gian như vậy? Hãy cũng Drake đi tìm lời giải cho thắc mắc này ngay trong bài viết dưới đây nhé.','','','https://drake.vn/nhung-dau-giay-vans-classic','2020-11-07',1),(5,'Converse Chuck 70 Rivals – Thiết kế mạnh mẽ chứng tỏ đẳng cấp','Bước sang những tháng cuối cùng trong năm, làng thời trang lại rộn ràng với những thiết kế ấn tượng được trình làng. Hòa nhịp cùng chặng đua nước rút này, phải kể đến những hãng giày “năng suất” như Converse. “Ông lớn” trong làng giày bóng rổ vừa cho ra mắt BST Converse Chuck 70 Rivals với những đường nét đẹp tuyệt mỹ, mang phong thái mạnh mẽ cùng những sự phá cách ít ai ngờ tới. Nói không ngoa khi đây thực sự là thiết kế chứng tỏ đẳng cấp đỉnh cao của nhà Converse sau bao năm tháng. Cùng Drake khám phá ngay mẫu giày đã làm các tín đồ trên toàn thế giới phải điêu đứng nhé.','','','https://drake.vn/converse-chuck-70-rivals','2020-11-07',1);
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
  `mo_ta` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trang_thais`
--

LOCK TABLES `trang_thais` WRITE;
/*!40000 ALTER TABLE `trang_thais` DISABLE KEYS */;
INSERT INTO `trang_thais` VALUES (1,'true','Hoàn thành',1),(2,'false','Đang giao hàng',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vouchers`
--

LOCK TABLES `vouchers` WRITE;
/*!40000 ALTER TABLE `vouchers` DISABLE KEYS */;
INSERT INTO `vouchers` VALUES (1,2,20,1),(2,2,20,1),(3,2,20,1),(4,2,20,1),(5,2,20,1),(6,2,20,1),(7,2,20,1),(8,2,20,1),(9,2,20,1),(10,2,20,1),(11,2,20,1),(12,2,20,1),(13,2,20,1),(14,2,20,1),(15,2,20,1),(16,2,20,1),(17,2,20,1),(18,2,20,1),(19,2,20,1),(20,2,20,1),(21,2,20,1),(22,2,20,1),(23,2,20,1),(24,2,20,1),(25,2,20,1),(26,3,50,1),(27,4,50,1);
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
-- Final view structure for view `inventoryproducts`
--

/*!50001 DROP VIEW IF EXISTS `inventoryproducts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `inventoryproducts` AS select `san_phams`.`ma_san_pham` AS `ma_san_pham`,`san_phams`.`ma_thuong_hieu` AS `ma_thuong_hieu`,`san_phams`.`ma_loai_san_pham` AS `ma_loai_san_pham`,`san_phams`.`ten_san_pham` AS `ten_san_pham`,`san_phams`.`gia_ban` AS `gia_ban`,`san_phams`.`so_luong` AS `so_luong`,`san_phams`.`isActive` AS `isActive`,`thuong_hieus`.`ten_thuong_hieu` AS `ten_thuong_hieu`,`loai_san_phams`.`ten_loai_san_pham` AS `ten_loai_san_pham`,(select `hinh_anh_san_phams`.`hinh_anh` from `hinh_anh_san_phams` where ((`hinh_anh_san_phams`.`ma_san_pham` = `san_phams`.`ma_san_pham`) and (`hinh_anh_san_phams`.`hinh_anh` is not null) and (`hinh_anh_san_phams`.`isActive` = 1)) limit 1) AS `image` from ((`san_phams` join `thuong_hieus`) join `loai_san_phams`) where ((`san_phams`.`ma_loai_san_pham` = `loai_san_phams`.`ma_loai_san_pham`) and (`san_phams`.`isActive` = 1) and (`san_phams`.`ma_thuong_hieu` = `thuong_hieus`.`ma_thuong_hieu`) and (`san_phams`.`so_luong` > 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

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

-- Dump completed on 2020-11-21 17:59:39
