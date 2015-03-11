CREATE DATABASE  IF NOT EXISTS `mwl_security` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mwl_security`;
-- MySQL dump 10.13  Distrib 5.6.17, for osx10.6 (i386)
--
-- Host: sensenrespond.com    Database: mwl_security
-- ------------------------------------------------------
-- Server version	5.6.19

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
-- Table structure for table `app_page_group`
--

DROP TABLE IF EXISTS `app_page_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_page_group` (
  `ID` varchar(36) NOT NULL,
  `GROUP_NM` varchar(45) DEFAULT NULL,
  `DESCRIPTION` varchar(999) DEFAULT NULL,
  `EXPIRY_DT` datetime DEFAULT NULL,
  `PARENT_APG__ID` varchar(36) DEFAULT NULL,
  `SEQUENCE_NUMBER` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_page_group`
--

LOCK TABLES `app_page_group` WRITE;
/*!40000 ALTER TABLE `app_page_group` DISABLE KEYS */;
INSERT INTO `app_page_group` (`ID`, `GROUP_NM`, `DESCRIPTION`, `EXPIRY_DT`, `PARENT_APG__ID`, `SEQUENCE_NUMBER`) VALUES ('1','Products','',NULL,'',1),('2','Claims','',NULL,'',2),('2015-02-06 18:39:15','Authentication','',NULL,'',0),('3','Calendar','',NULL,'',3),('4','Product Details Landing','',NULL,'1',1);
/*!40000 ALTER TABLE `app_page_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_pages`
--

DROP TABLE IF EXISTS `app_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_pages` (
  `ID` varchar(36) NOT NULL,
  `PAGE_NM` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(999) DEFAULT NULL,
  `PAGE_PATH` varchar(999) DEFAULT NULL,
  `APP_PAGE_GROUP__ID` varchar(36) DEFAULT NULL,
  `PAGE_CD` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_APG_AP_idx` (`APP_PAGE_GROUP__ID`),
  CONSTRAINT `FK_APG_AP` FOREIGN KEY (`APP_PAGE_GROUP__ID`) REFERENCES `app_page_group` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_pages`
--

LOCK TABLES `app_pages` WRITE;
/*!40000 ALTER TABLE `app_pages` DISABLE KEYS */;
INSERT INTO `app_pages` (`ID`, `PAGE_NM`, `DESCRIPTION`, `PAGE_PATH`, `APP_PAGE_GROUP__ID`, `PAGE_CD`) VALUES ('1','Product List','','','1','PROD_LST'),('2','Product Details','','','1','PROD_D'),('3','Product-Product Specs','','','4','PROD_D_SPEC'),('4','Product-Documents','','','4','PROD_D_DOC'),('5','Product-Claims','','','4','PROD_D_CMS'),('6','Login','','','2015-02-06 18:39:15','AUTH_LGN'),('7','Forgot Password','','','2015-02-06 18:39:15','AUTH_FRGT_PWD'),('8','New Registration','','','2015-02-06 18:39:15','AUTH_NEW_REG');
/*!40000 ALTER TABLE `app_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_roles`
--

DROP TABLE IF EXISTS `app_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_roles` (
  `ID` varchar(36) NOT NULL,
  `ROLE_NM` varchar(99) DEFAULT NULL,
  `DESCRIPTION` varchar(999) DEFAULT NULL,
  `ROLE_DISPLAY_NM` varchar(99) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_roles`
--

LOCK TABLES `app_roles` WRITE;
/*!40000 ALTER TABLE `app_roles` DISABLE KEYS */;
INSERT INTO `app_roles` (`ID`, `ROLE_NM`, `DESCRIPTION`, `ROLE_DISPLAY_NM`) VALUES ('1','CAN_EMAIL','','Can Email'),('2','CAN_PRINT','','Can Print'),('3','CAN_SAVE','','Can Save'),('4','CAN_REQUEST_FOR_CHANGE','','Can Request for a change'),('5','CAN_PL_ADD_NEW_PRODUCT','','Can Add New Product'),('6','CAN_PL_ACTION_CREATE_CLAIM','','Can create Claim'),('7','CAN_PL_ACTION_DELETE_PRODUCT','','Can delete product'),('8','CAN_PL_ACTION_VIEW_PRODUCT',NULL,'Can View Product Details'),('9','CAN_PL_REQ_DELETE_PRODUCT',NULL,'Can request to delete a product');
/*!40000 ALTER TABLE `app_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `available_app_page_x_app_role`
--

DROP TABLE IF EXISTS `available_app_page_x_app_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `available_app_page_x_app_role` (
  `ID` varchar(36) NOT NULL,
  `APP_PAGE__ID` varchar(36) DEFAULT NULL,
  `APP_ROLE__ID` varchar(36) DEFAULT NULL,
  `CREATION_DT` datetime DEFAULT NULL,
  `EXPIRY_DT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_AP_AAPXAR_idx` (`APP_PAGE__ID`),
  KEY `FK_AR_AAPXAR_idx` (`APP_ROLE__ID`),
  CONSTRAINT `FK_AR_AAPXAR` FOREIGN KEY (`APP_ROLE__ID`) REFERENCES `app_roles` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_AP_AAPXAR` FOREIGN KEY (`APP_PAGE__ID`) REFERENCES `app_pages` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `available_app_page_x_app_role`
--

LOCK TABLES `available_app_page_x_app_role` WRITE;
/*!40000 ALTER TABLE `available_app_page_x_app_role` DISABLE KEYS */;
INSERT INTO `available_app_page_x_app_role` (`ID`, `APP_PAGE__ID`, `APP_ROLE__ID`, `CREATION_DT`, `EXPIRY_DT`) VALUES ('1','1','7',NULL,NULL),('10','3','2',NULL,NULL),('11','3','5',NULL,NULL),('12','3','7',NULL,NULL),('13','3','6',NULL,NULL),('2','3','4',NULL,NULL),('2015-02-09 11:46:31','1','5',NULL,NULL),('2015-02-09 11:46:40','1','6',NULL,NULL),('2015-02-09 11:46:50','1','8',NULL,NULL),('3','1','1',NULL,NULL),('4','1','2',NULL,NULL),('5','2','1',NULL,NULL),('6','2','2',NULL,NULL),('7','2','7',NULL,NULL),('9','3','1',NULL,NULL);
/*!40000 ALTER TABLE `available_app_page_x_app_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `available_page_roles`
--

DROP TABLE IF EXISTS `available_page_roles`;
/*!50001 DROP VIEW IF EXISTS `available_page_roles`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `available_page_roles` (
  `available_app_page_x_app_role_id` tinyint NOT NULL,
  `page_nm` tinyint NOT NULL,
  `page_cd` tinyint NOT NULL,
  `role_nm` tinyint NOT NULL,
  `concat_R` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `client_access_x_avail_page_grp`
--

DROP TABLE IF EXISTS `client_access_x_avail_page_grp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_access_x_avail_page_grp` (
  `ID` varchar(36) NOT NULL,
  `CLIENT__ID` varchar(36) DEFAULT NULL,
  `APP_PAGE_GROUP__ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_APG_CA_idx` (`APP_PAGE_GROUP__ID`),
  CONSTRAINT `FK_APG_CA` FOREIGN KEY (`APP_PAGE_GROUP__ID`) REFERENCES `app_page_group` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_access_x_avail_page_grp`
--

LOCK TABLES `client_access_x_avail_page_grp` WRITE;
/*!40000 ALTER TABLE `client_access_x_avail_page_grp` DISABLE KEYS */;
INSERT INTO `client_access_x_avail_page_grp` (`ID`, `CLIENT__ID`, `APP_PAGE_GROUP__ID`) VALUES ('1','1','1'),('2','1','2'),('2015-02-11 10:26:32','3','1'),('2015-02-11 10:26:38','3','2'),('2015-02-11 10:26:44','3','2015-02-06 18:39:15'),('2015-02-11 10:27:09','3','4'),('3','1','3'),('4','2','1'),('5','2','2'),('6','2','3');
/*!40000 ALTER TABLE `client_access_x_avail_page_grp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_roles`
--

DROP TABLE IF EXISTS `client_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_roles` (
  `ID` varchar(36) NOT NULL,
  `CLIENT__ID` varchar(36) DEFAULT NULL,
  `ROLE_NM` varchar(45) DEFAULT NULL,
  `DESCRIPTION` varchar(999) DEFAULT NULL,
  `CREATION_DT` datetime DEFAULT NULL,
  `EXPIRY_DT` datetime DEFAULT NULL,
  `SEQUENCE_NUMBER` int(11) DEFAULT NULL,
  `SUPERIORITY_LEVEL` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_roles`
--

LOCK TABLES `client_roles` WRITE;
/*!40000 ALTER TABLE `client_roles` DISABLE KEYS */;
INSERT INTO `client_roles` (`ID`, `CLIENT__ID`, `ROLE_NM`, `DESCRIPTION`, `CREATION_DT`, `EXPIRY_DT`, `SEQUENCE_NUMBER`, `SUPERIORITY_LEVEL`) VALUES ('1','2','ASWNI-Super Admins','',NULL,NULL,1,NULL),('2','2','ASWNI-Administrator','',NULL,NULL,2,NULL),('2015-02-09 11:57:38','2','ASWNI-Customer','',NULL,NULL,NULL,NULL),('2015-02-11 10:04:47','3','Thermax-Customer','',NULL,NULL,NULL,NULL),('2015-02-11 10:05:01','3','Thermax-Manager','',NULL,NULL,NULL,NULL),('3','2','ASWNI-Manager','',NULL,NULL,3,NULL),('4','2','ASWNI-Customer Service Agent','',NULL,NULL,4,NULL),('5','1','Customer','',NULL,NULL,NULL,NULL),('6','1','Super Admins','',NULL,NULL,NULL,NULL),('7','1','Administrator','',NULL,NULL,NULL,NULL),('8','1','Customer Service Agent','',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `client_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_roles_x_aval_page_roles`
--

DROP TABLE IF EXISTS `client_roles_x_aval_page_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_roles_x_aval_page_roles` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ROLE__ID` varchar(36) DEFAULT NULL,
  `AAPGXAROLE__ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CG_CGXAAPAR_idx` (`CLIENT_ROLE__ID`),
  KEY `FK_AAPXAR_CGXAAPAR_idx` (`AAPGXAROLE__ID`),
  CONSTRAINT `FK_CR_CGXAAPAR` FOREIGN KEY (`CLIENT_ROLE__ID`) REFERENCES `client_roles` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_AAPXAR_CGXAAPAR` FOREIGN KEY (`AAPGXAROLE__ID`) REFERENCES `available_app_page_x_app_role` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_roles_x_aval_page_roles`
--

LOCK TABLES `client_roles_x_aval_page_roles` WRITE;
/*!40000 ALTER TABLE `client_roles_x_aval_page_roles` DISABLE KEYS */;
INSERT INTO `client_roles_x_aval_page_roles` (`ID`, `CLIENT_ROLE__ID`, `AAPGXAROLE__ID`) VALUES ('1','2015-02-09 11:57:38','3'),('10','2015-02-11 10:04:47','1'),('11','2015-02-11 10:04:47','2015-02-09 11:46:40'),('12','2015-02-11 10:04:47','2015-02-09 11:46:50'),('2','2015-02-09 11:57:38','4'),('2015-02-04 16:08:32','2015-02-09 11:57:38','1'),('6','2015-02-09 11:57:38','2015-02-09 11:46:40'),('7','2015-02-09 11:57:38','2015-02-09 11:46:50'),('8','5','2015-02-09 11:46:31'),('9','2015-02-11 10:04:47','4');
/*!40000 ALTER TABLE `client_roles_x_aval_page_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_x_client_role`
--

DROP TABLE IF EXISTS `customer_x_client_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_x_client_role` (
  `id` varchar(36) NOT NULL,
  `CUSTOMER__ID` varchar(36) DEFAULT NULL,
  `CLIENT_role__ID` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CG_CCG_idx` (`CLIENT_role__ID`),
  CONSTRAINT `FK_CG_CCG` FOREIGN KEY (`CLIENT_role__ID`) REFERENCES `client_roles` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_x_client_role`
--

LOCK TABLES `customer_x_client_role` WRITE;
/*!40000 ALTER TABLE `customer_x_client_role` DISABLE KEYS */;
INSERT INTO `customer_x_client_role` (`id`, `CUSTOMER__ID`, `CLIENT_role__ID`) VALUES ('1','1','2015-02-09 11:57:38'),('2','1','5'),('2015-02-11 10:52:55','1','2015-02-11 10:04:47');
/*!40000 ALTER TABLE `customer_x_client_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `available_page_roles`
--

/*!50001 DROP TABLE IF EXISTS `available_page_roles`*/;
/*!50001 DROP VIEW IF EXISTS `available_page_roles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mpfb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `available_page_roles` AS select distinct `available_app_page_x_app_role`.`ID` AS `available_app_page_x_app_role_id`,`app_pages`.`PAGE_NM` AS `page_nm`,`app_pages`.`PAGE_CD` AS `page_cd`,`app_roles`.`ROLE_NM` AS `role_nm`,concat(`app_pages`.`PAGE_CD`,' ',`app_roles`.`ROLE_NM`) AS `concat_R` from ((`app_pages` join `app_roles`) join `available_app_page_x_app_role`) where ((`app_pages`.`ID` = `available_app_page_x_app_role`.`APP_PAGE__ID`) and (`app_roles`.`ID` = `available_app_page_x_app_role`.`APP_ROLE__ID`)) order by `app_pages`.`PAGE_NM` */;
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

-- Dump completed on 2015-02-16 16:18:50
CREATE DATABASE  IF NOT EXISTS `mwl` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mwl`;
-- MySQL dump 10.13  Distrib 5.6.17, for osx10.6 (i386)
--
-- Host: sensenrespond.com    Database: mwl
-- ------------------------------------------------------
-- Server version	5.6.19

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
-- Table structure for table `actual_product`
--

DROP TABLE IF EXISTS `actual_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actual_product` (
  `ID` varchar(36) NOT NULL,
  `DISP_NM` varchar(60) DEFAULT NULL,
  `RECORD_SRC` varchar(6) DEFAULT NULL,
  `CLIENT__ID` varchar(36) DEFAULT NULL,
  `LANGUAGE__ID` varchar(36) DEFAULT NULL,
  `ACTUAL_PRODUCT_TYPE__ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CLNT_AP_idx` (`CLIENT__ID`),
  KEY `FK_LANG_AP_idx` (`ACTUAL_PRODUCT_TYPE__ID`),
  CONSTRAINT `FK_APT_AP` FOREIGN KEY (`ACTUAL_PRODUCT_TYPE__ID`) REFERENCES `actual_product_type` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CLNT_AP` FOREIGN KEY (`CLIENT__ID`) REFERENCES `client` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actual_product`
--

LOCK TABLES `actual_product` WRITE;
/*!40000 ALTER TABLE `actual_product` DISABLE KEYS */;
INSERT INTO `actual_product` (`ID`, `DISP_NM`, `RECORD_SRC`, `CLIENT__ID`, `LANGUAGE__ID`, `ACTUAL_PRODUCT_TYPE__ID`) VALUES ('05e0a6ff-8386-47b8-93b5-88c9590aefa3',NULL,'CUST',NULL,NULL,NULL),('0b7092d6-8b0a-4600-aeeb-72276c8cfd63',NULL,'CUST',NULL,NULL,NULL),('0bed7dbe-7b32-4234-8ec5-5c49f62f1078',NULL,'CUST',NULL,NULL,NULL),('0ca1308e-b2de-4e6a-b51c-4e7576f7bdf2',NULL,'CUST',NULL,NULL,NULL),('1','Refreigrator','CUST',NULL,NULL,NULL),('10edda72-6426-477d-a62b-86bf9cdbdf82',NULL,'CUST',NULL,NULL,NULL),('132587bc-bfea-445e-afd5-e1bfbdb98880',NULL,'CUST',NULL,NULL,NULL),('1487e358-e512-4904-821b-b88586e71d8b',NULL,'CUST',NULL,NULL,NULL),('16fea6b4-6ed3-4eb5-9c0d-c38218f7db49',NULL,'CUST',NULL,NULL,NULL),('194fd82b-9899-4f04-adb6-84c66bdd1e06',NULL,'CUST',NULL,NULL,NULL),('1c2118fb-6b93-4522-8fec-2e4c809d0962',NULL,'CUST',NULL,NULL,NULL),('1d69346e-1087-47c9-a0f3-e5647856f241',NULL,'CUST',NULL,NULL,NULL),('2','Dish Washer','CUST',NULL,NULL,NULL),('2015-01-29 20:47:32','Computer i7 Core/16GB RAM/1TB','CLNT','2','2','1'),('2015-01-29 20:48:19','Computer i5 Core/12GB RAM/2TB','CLNT','2','2','1'),('2015-01-29 20:52:28','Hard Drive-1TB-Toshiba','CLNT','2','2','2'),('2015-01-29 20:53:36','Dell Monitor 17\'\'','CLNT','2','2','3'),('2015-01-29 20:54:58','Samsung Monitor 17\'\'','CLNT','2','2','3'),('2015-01-29 20:55:31','Laptop-ASUS-01234 ','CLNT','2','2','1'),('2015-01-29 20:56:02','Laptop-Sony-SN012','CLNT','2','2','1'),('242d648b-3abc-4117-bc2f-ed27b3b2cd1c',NULL,'CUST',NULL,NULL,NULL),('262b38fc-92b1-41c0-8a0d-f7db25fbab63',NULL,'CUST',NULL,NULL,NULL),('2a7bd5b0-b16b-40ad-9677-96896544a432',NULL,'CUST',NULL,NULL,NULL),('3','Computer','CUST',NULL,NULL,NULL),('30061d15-3c3f-4492-b3c0-ec924c66997c',NULL,'CUST',NULL,NULL,NULL),('33b5ac01-26c3-419d-94b8-ae27503ce436',NULL,'CUST',NULL,NULL,NULL),('34616e9d-65fe-4fc4-a0ab-4b7eaa125b42',NULL,'CUST',NULL,NULL,NULL),('351e5f21-a8ee-4a3f-a0f4-ff7f20110f76',NULL,'CUST',NULL,NULL,NULL),('3ba2d7ff-58b4-4a08-a6ee-e4ca183df076',NULL,'CUST',NULL,NULL,NULL),('4e33516b-315a-4ebd-9577-0d9d45473de8',NULL,'CUST',NULL,NULL,NULL),('4f40c999-92fb-47bd-b0bf-06eee59b1e3c',NULL,'CUST',NULL,NULL,NULL),('4f666eeb-f0f8-4408-985d-d924cdd96df5',NULL,'CUST',NULL,NULL,NULL),('5632d0db-2eb7-40f6-bdc1-4389382a279b',NULL,'CUST',NULL,NULL,NULL),('597431bd-1a79-4de0-aa59-0640f9b2b7eb',NULL,'CUST',NULL,NULL,NULL),('5fc34cc1-f668-470c-a819-4fbd93b9455d',NULL,'CUST',NULL,NULL,NULL),('60f7093e-ca5b-45a4-bdab-e53b18ae0a3a',NULL,'CUST',NULL,NULL,NULL),('61fc2142-2734-42b1-b1ff-3d59ccdc1d31',NULL,'CUST',NULL,NULL,NULL),('63a38649-53a0-4d4a-8f86-17529a2b9103',NULL,'CUST',NULL,NULL,NULL),('63de557a-58db-4f8f-bc7f-129d42aa924c',NULL,'CUST',NULL,NULL,NULL),('64edd3f2-c17b-420f-a0a6-6e725ddfa216',NULL,'CUST',NULL,NULL,NULL),('674fc0cb-d036-4c63-8d5b-e3f3d3e837ca',NULL,'CUST',NULL,NULL,NULL),('68a18da9-06ff-49ba-8bd5-480b02fe292a',NULL,'CUST',NULL,NULL,NULL),('6fe06c17-e070-41a6-accb-7215b01b295e',NULL,'CUST',NULL,NULL,NULL),('772314c6-3fa8-4988-974b-c67555206675',NULL,'CUST',NULL,NULL,NULL),('79800c18-851b-40e7-a9aa-bcd34252c805',NULL,'CUST',NULL,NULL,NULL),('7c394dab-9ddd-4bfd-b017-80240c5a75aa',NULL,'CUST',NULL,NULL,NULL),('7c497a02-57c6-44e3-97ee-2d911b80ec07',NULL,'CUST',NULL,NULL,NULL),('7d1573ed-f91f-4886-8f81-96817c0e120b',NULL,'CUST',NULL,NULL,NULL),('7e1ec7bc-81d7-495d-841e-36a74a4c7d46',NULL,'CUST',NULL,NULL,NULL),('887afda2-89af-4d71-b272-9b62865a8e8f',NULL,'CUST',NULL,NULL,NULL),('8b3cb122-57bd-44a5-91aa-ed59e99cd584',NULL,'CUST',NULL,NULL,NULL),('8c68beda-91c0-4563-be2f-dfc3f079a140',NULL,'CUST',NULL,NULL,NULL),('8e56ef40-e21c-44d6-8e25-1c31529f80bc',NULL,'CUST',NULL,NULL,NULL),('8f3630ed-97ce-4b99-a832-3b85e733a664',NULL,'CUST',NULL,NULL,NULL),('913aff8b-3bc6-4b91-98aa-19b433579ac0',NULL,'CUST',NULL,NULL,NULL),('9198d708-ae43-4a72-a98b-c1af547cf084',NULL,'CUST',NULL,NULL,NULL),('91c9e389-29b2-4985-a2eb-7ab1a14743a5',NULL,'CUST',NULL,NULL,NULL),('94bfa0c5-f1d3-40a6-9961-f55ce7511d76',NULL,'CUST',NULL,NULL,NULL),('958cea34-0804-4e20-9c5b-7bd07162337a',NULL,'CUST',NULL,NULL,NULL),('9a1d79a9-a6d6-4c16-af2d-10327c335e07',NULL,'CUST',NULL,NULL,NULL),('9dd37235-bd64-457c-9128-dc6b1b253df0',NULL,'CUST',NULL,NULL,NULL),('a5863659-67db-4255-a2a2-6d07aa8a1708','Home AC unit','CUST','3','4','1'),('a8282015-3ccf-4f34-9848-029328dc18df',NULL,'CUST',NULL,NULL,NULL),('a940b888-12f4-4589-a0ce-2132c5caa9d8',NULL,'CUST',NULL,NULL,NULL),('adce6c55-65bf-46be-b72d-faf67875da1a',NULL,'CUST',NULL,NULL,NULL),('af3bda72-2574-4649-b3b8-06c36961f37f',NULL,'CUST',NULL,NULL,NULL),('afe5c008-02c8-4b1b-856d-ee9ccefb4ed0',NULL,'CUST',NULL,NULL,NULL),('b52b1d8a-8889-4eb6-8ed7-1fe0b31d03a2',NULL,'CUST',NULL,NULL,NULL),('b5348051-dabf-42da-b6ec-5f1e15e8920e',NULL,'CUST',NULL,NULL,NULL),('b86bfb5e-3a3f-480c-bc5a-3beec7f3650b',NULL,'CUST',NULL,NULL,NULL),('b8a07969-ec8d-409b-9464-df31345c7bb7',NULL,'CUST',NULL,NULL,NULL),('ba36fe83-9f96-4cde-bb07-90d5d93d29af',NULL,'CUST',NULL,NULL,NULL),('ba752971-b131-4fe1-aba3-aa77d05548f3',NULL,'CUST',NULL,NULL,NULL),('bd6c0894-bfbb-45f5-bc9e-e614cdb9044b',NULL,'CUST',NULL,NULL,NULL),('c19fda48-b434-4c18-b885-0bd5257c4ede',NULL,'CUST',NULL,NULL,NULL),('cd01e60b-91fe-4881-935d-0913c54891c3',NULL,'CUST',NULL,NULL,NULL),('d34df074-a723-433b-86d5-e0f3b2d3b7da',NULL,'CUST',NULL,NULL,NULL),('d4a828bf-5e34-44ad-a053-d1908704eb6a',NULL,'CUST',NULL,NULL,NULL),('dc48a349-e322-4c10-b1a8-99b2c7ee724f',NULL,'CUST',NULL,NULL,NULL),('ded4d49b-c3ce-42ff-aa72-3b9ac2c8be3a',NULL,'CUST',NULL,NULL,NULL),('e804f22b-5126-4be4-bec9-ef7e7e90620b',NULL,'CUST',NULL,NULL,NULL),('ee36e814-b7e1-4256-9e0e-7c45214f61d9',NULL,'CUST',NULL,NULL,NULL),('f0450e8d-9153-412f-b61a-b10df93332e9',NULL,'CUST',NULL,NULL,NULL),('f55ec9e9-c260-45eb-a57b-ba615ba6316a',NULL,'CUST',NULL,NULL,NULL),('fa88bb4a-253c-4b65-b6e2-316186ef0567',NULL,'CUST',NULL,NULL,NULL),('fc22f2ae-7d1d-4358-ab68-9d0a27ff30fc',NULL,'CUST',NULL,NULL,NULL),('fca1644a-fbf1-40f7-bd29-4d43ba2adc0b',NULL,'CUST',NULL,NULL,NULL);
/*!40000 ALTER TABLE `actual_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actual_product_documents`
--

DROP TABLE IF EXISTS `actual_product_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actual_product_documents` (
  `ID` varchar(36) NOT NULL,
  `ACTUAL_PRODUCT__ID` varchar(36) DEFAULT NULL,
  `DOCUMENT_MATERIAL_TYPE__CD` varchar(36) DEFAULT NULL,
  `MATERIAL_URL` varchar(999) DEFAULT NULL,
  `IS_DEFAULT` char(1) DEFAULT NULL,
  `SEQUENCE_NUMBER` int(11) DEFAULT NULL,
  `DOCUMENT_CATEGORY__CD` varchar(36) DEFAULT NULL,
  `DOCUMENT_NM` varchar(45) DEFAULT NULL,
  `CREATION_DT` datetime DEFAULT NULL,
  `EXPIRY_DT` datetime DEFAULT NULL,
  `VERSION_NUMBER` varchar(45) DEFAULT NULL,
  `LANGUAGE__ID` varchar(36) DEFAULT NULL,
  `DOCUMENT_ID` varchar(45) DEFAULT NULL,
  `DOCUMENT_NUMBER` varchar(45) DEFAULT NULL,
  `DOCUMENT_DESCR` varchar(99) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_APM_AP_idx` (`ACTUAL_PRODUCT__ID`),
  KEY `FK_DOC_CATGRY_APD_idx` (`DOCUMENT_CATEGORY__CD`),
  KEY `FK_DOC_MATR_APD_idx` (`DOCUMENT_MATERIAL_TYPE__CD`),
  KEY `FK_LANG_APD_idx` (`LANGUAGE__ID`),
  CONSTRAINT `FK_APD_MDT` FOREIGN KEY (`DOCUMENT_MATERIAL_TYPE__CD`) REFERENCES `mstr_document_material_type` (`TYPE_CD`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_APD_MDCT` FOREIGN KEY (`DOCUMENT_CATEGORY__CD`) REFERENCES `mstr_document_category` (`DOCUMENT_CATEGORY_CD`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_APM_AP` FOREIGN KEY (`ACTUAL_PRODUCT__ID`) REFERENCES `actual_product` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_LANG_APD` FOREIGN KEY (`LANGUAGE__ID`) REFERENCES `client_supported_languages` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actual_product_documents`
--

LOCK TABLES `actual_product_documents` WRITE;
/*!40000 ALTER TABLE `actual_product_documents` DISABLE KEYS */;
INSERT INTO `actual_product_documents` (`ID`, `ACTUAL_PRODUCT__ID`, `DOCUMENT_MATERIAL_TYPE__CD`, `MATERIAL_URL`, `IS_DEFAULT`, `SEQUENCE_NUMBER`, `DOCUMENT_CATEGORY__CD`, `DOCUMENT_NM`, `CREATION_DT`, `EXPIRY_DT`, `VERSION_NUMBER`, `LANGUAGE__ID`, `DOCUMENT_ID`, `DOCUMENT_NUMBER`, `DOCUMENT_DESCR`) VALUES ('1','1',NULL,'http://placehold.it/250/ffffff/000000','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2','8c68beda-91c0-4563-be2f-dfc3f079a140',NULL,'http://placehold.it/250/ffffff/000000','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2015-01-29 20:56:42','2015-01-29 20:47:32',NULL,'http://www.tinaja.com/glib/pdflink.pdf','1',1,NULL,'Computer Manual','2015-01-30 00:00:00',NULL,'1.0.0','2',NULL,NULL,NULL),('2015-01-29 20:57:37','2015-01-29 20:47:32',NULL,'http://www.wave.org.au/jupgrade/images/sample.pdf','0',2,NULL,'Computer Purchase Bill','2015-01-30 00:00:00',NULL,'1.0.0','2',NULL,NULL,NULL),('2015-01-29 21:09:41','2015-01-29 20:47:32',NULL,'http://desportoescolar.dge.mec.pt/sites/default/files/newsletters/newsletter1.pdf','0',1,NULL,'Warranty Document','2015-01-30 00:00:00',NULL,'1.0.0','2',NULL,NULL,NULL),('2015-01-29 21:10:23','2015-01-29 20:48:19',NULL,'http://desportoescolar.dge.mec.pt/sites/default/files/newsletters/newsletter1.pdf','1',1,NULL,'Payment Receipt','2015-01-30 00:00:00',NULL,'1.0.0','2',NULL,NULL,NULL),('2015-01-29 21:11:15','2015-01-29 20:48:19',NULL,'http://desportoescolar.dge.mec.pt/sites/default/files/newsletters/newsletter1.pdf','0',2,NULL,'Manual','2015-01-30 00:00:00',NULL,'','2',NULL,NULL,NULL),('2015-01-29 21:11:41','2015-01-29 20:48:19',NULL,'','0',NULL,NULL,'Warranty information','2015-01-30 00:00:00',NULL,'','2',NULL,NULL,NULL),('2015-01-29 21:12:01','2015-01-29 20:52:28',NULL,'http://desportoescolar.dge.mec.pt/sites/default/files/newsletters/newsletter1.pdf','1',1,NULL,'Warranty Details','2015-01-30 00:00:00',NULL,'1.0','2',NULL,NULL,NULL),('2015-01-29 21:12:33','2015-01-29 20:53:36',NULL,'http://desportoescolar.dge.mec.pt/sites/default/files/newsletters/newsletter1.pdf','0',1,NULL,'Monitor Manual','2015-01-30 00:00:00',NULL,'','2',NULL,NULL,NULL),('2015-01-29 21:13:00','2015-01-29 20:53:36',NULL,'','0',NULL,NULL,'Payment Receipt','2015-01-30 00:00:00',NULL,'','2',NULL,NULL,NULL);
/*!40000 ALTER TABLE `actual_product_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actual_product_property`
--

DROP TABLE IF EXISTS `actual_product_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actual_product_property` (
  `ID` varchar(36) NOT NULL,
  `DISPLAY_NM` varchar(45) DEFAULT NULL,
  `LANGUAGE__ID` varchar(36) DEFAULT NULL,
  `SEQUENCE_NUMBER` int(11) DEFAULT NULL,
  `ACTUAL_PRODUCT_TYPE__ID` varchar(36) DEFAULT NULL,
  `MSTR_PRODUCT_PROPERTY__ID` varchar(36) DEFAULT NULL,
  `MSTR_PRODUCT_PROPERTY_VAL_TYP__ID` varchar(36) DEFAULT NULL,
  `DEFAULT_VALUE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_MPPVT_APP_idx` (`MSTR_PRODUCT_PROPERTY_VAL_TYP__ID`),
  KEY `FK_APT_APP_idx` (`ACTUAL_PRODUCT_TYPE__ID`),
  KEY `FK_MPP_APP_idx` (`MSTR_PRODUCT_PROPERTY__ID`),
  KEY `FK_LANG_APP_idx` (`LANGUAGE__ID`),
  CONSTRAINT `FK_LANG_APP` FOREIGN KEY (`LANGUAGE__ID`) REFERENCES `client_supported_languages` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_APT_APP` FOREIGN KEY (`ACTUAL_PRODUCT_TYPE__ID`) REFERENCES `actual_product_type` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_MPPVT_APP` FOREIGN KEY (`MSTR_PRODUCT_PROPERTY_VAL_TYP__ID`) REFERENCES `mstr_property_value_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_MPP_APP` FOREIGN KEY (`MSTR_PRODUCT_PROPERTY__ID`) REFERENCES `mstr_product_property` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actual_product_property`
--

LOCK TABLES `actual_product_property` WRITE;
/*!40000 ALTER TABLE `actual_product_property` DISABLE KEYS */;
INSERT INTO `actual_product_property` (`ID`, `DISPLAY_NM`, `LANGUAGE__ID`, `SEQUENCE_NUMBER`, `ACTUAL_PRODUCT_TYPE__ID`, `MSTR_PRODUCT_PROPERTY__ID`, `MSTR_PRODUCT_PROPERTY_VAL_TYP__ID`, `DEFAULT_VALUE`) VALUES ('111','Computer Type','2',2,'1','4','2','Desktop'),('2015-01-29 21:22:05','Computer Make','2',1,'1','1','1','Enter Computer Make'),('2015-01-29 21:22:49','Hard Drive Capacity','2',2,'1','2','2',''),('2015-01-29 21:23:22','RAM','2',3,'1','3','2','');
/*!40000 ALTER TABLE `actual_product_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actual_product_property_section`
--

DROP TABLE IF EXISTS `actual_product_property_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actual_product_property_section` (
  `ID` varchar(36) NOT NULL,
  `SECTION_NM` varchar(45) DEFAULT NULL,
  `CLIENT__ID` varchar(36) DEFAULT NULL,
  `MSTR_PRODUCT_DISP_SECTION__ID` varchar(36) NOT NULL,
  `SEQUENCE_NUMBER` int(11) DEFAULT NULL,
  `LANGUAGE__ID` varchar(36) DEFAULT NULL,
  `ACTUAL_PRODUCT_TYPE__ID` varchar(36) DEFAULT NULL,
  `IS_SECTION_NAME_VISIBLE` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_LANG_APPG_idx` (`LANGUAGE__ID`),
  KEY `FK_CLNT_APPG_idx` (`CLIENT__ID`),
  KEY `FK_APT_APPS_idx` (`ACTUAL_PRODUCT_TYPE__ID`),
  CONSTRAINT `FK_APT_APPS` FOREIGN KEY (`ACTUAL_PRODUCT_TYPE__ID`) REFERENCES `actual_product_type` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CLNT_APPG` FOREIGN KEY (`CLIENT__ID`) REFERENCES `client` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_LANG_APPG` FOREIGN KEY (`LANGUAGE__ID`) REFERENCES `client_supported_languages` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actual_product_property_section`
--

LOCK TABLES `actual_product_property_section` WRITE;
/*!40000 ALTER TABLE `actual_product_property_section` DISABLE KEYS */;
INSERT INTO `actual_product_property_section` (`ID`, `SECTION_NM`, `CLIENT__ID`, `MSTR_PRODUCT_DISP_SECTION__ID`, `SEQUENCE_NUMBER`, `LANGUAGE__ID`, `ACTUAL_PRODUCT_TYPE__ID`, `IS_SECTION_NAME_VISIBLE`) VALUES ('2015-02-01 21:00:19','Computer information','2','SEC001',1,'2','1',NULL);
/*!40000 ALTER TABLE `actual_product_property_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actual_product_property_value`
--

DROP TABLE IF EXISTS `actual_product_property_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actual_product_property_value` (
  `ID` varchar(36) NOT NULL,
  `ACTUAL_PRODUCT_PROPERTY__ID` varchar(36) DEFAULT NULL,
  `THE_VALUE` varchar(99) DEFAULT NULL,
  `ACTUAL_PRODUCT__ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PRP_APPV_idx` (`ACTUAL_PRODUCT_PROPERTY__ID`),
  KEY `FK_APP_APPV_idx` (`ACTUAL_PRODUCT__ID`),
  CONSTRAINT `FK_APP_APPV` FOREIGN KEY (`ACTUAL_PRODUCT__ID`) REFERENCES `actual_product` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_PRP_APPV` FOREIGN KEY (`ACTUAL_PRODUCT_PROPERTY__ID`) REFERENCES `actual_product_property` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actual_product_property_value`
--

LOCK TABLES `actual_product_property_value` WRITE;
/*!40000 ALTER TABLE `actual_product_property_value` DISABLE KEYS */;
INSERT INTO `actual_product_property_value` (`ID`, `ACTUAL_PRODUCT_PROPERTY__ID`, `THE_VALUE`, `ACTUAL_PRODUCT__ID`) VALUES ('1','111','Laptop','2015-01-29 20:47:32'),('2','2015-01-29 21:22:05','HP','2015-01-29 20:47:32'),('3','2015-01-29 21:22:49','2TB','2015-01-29 20:47:32'),('4','2015-01-29 21:23:22','12GB','2015-01-29 20:47:32');
/*!40000 ALTER TABLE `actual_product_property_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actual_product_property_value_md`
--

DROP TABLE IF EXISTS `actual_product_property_value_md`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actual_product_property_value_md` (
  `ID` varchar(36) NOT NULL,
  `ACTUAL_PRODUCT_PROPERTY__ID` varchar(36) DEFAULT NULL,
  `LANGUAGE__ID` varchar(36) DEFAULT NULL,
  `SEQUENCE_NUMBER` int(11) DEFAULT NULL,
  `IS_SELECTED` char(1) DEFAULT NULL,
  `THE_VALUE` varchar(99) DEFAULT NULL,
  `EXPIRY_DT` datetime DEFAULT NULL,
  `THE_DISPLAY_VALUE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_APP_APPVM_idx` (`ACTUAL_PRODUCT_PROPERTY__ID`),
  KEY `FK_LANG_APPVM_idx` (`LANGUAGE__ID`),
  CONSTRAINT `FK_APP_APPVM` FOREIGN KEY (`ACTUAL_PRODUCT_PROPERTY__ID`) REFERENCES `actual_product_property` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_LANG_APPVM` FOREIGN KEY (`LANGUAGE__ID`) REFERENCES `client_supported_languages` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actual_product_property_value_md`
--

LOCK TABLES `actual_product_property_value_md` WRITE;
/*!40000 ALTER TABLE `actual_product_property_value_md` DISABLE KEYS */;
INSERT INTO `actual_product_property_value_md` (`ID`, `ACTUAL_PRODUCT_PROPERTY__ID`, `LANGUAGE__ID`, `SEQUENCE_NUMBER`, `IS_SELECTED`, `THE_VALUE`, `EXPIRY_DT`, `THE_DISPLAY_VALUE`) VALUES ('2015-02-01 21:31:14','2015-01-29 21:22:49','2',1,'1','1 TB',NULL,NULL),('2015-02-01 21:32:09','2015-01-29 21:22:49','2',2,'0','2 TB',NULL,NULL),('2015-02-01 21:32:22','2015-01-29 21:22:49','2',3,'0','3 TB',NULL,NULL),('2015-02-01 21:32:35','2015-01-29 21:22:49','2',4,'0','500GB',NULL,NULL),('2015-02-01 21:32:53','2015-01-29 21:22:49','2',5,'0','250GB',NULL,NULL),('2015-02-01 21:33:24','2015-01-29 21:23:22','2',1,'1','6GB',NULL,NULL),('2015-02-01 21:33:36','2015-01-29 21:23:22','2',2,'0','8GB',NULL,NULL),('2015-02-01 21:33:49','2015-01-29 21:23:22','2',3,'0','12GB',NULL,NULL),('2015-02-01 21:34:01','2015-01-29 21:23:22','2',4,'0','16GB',NULL,NULL),('2015-02-01 21:34:11','111','2',1,NULL,'Desktop',NULL,NULL),('2015-02-01 21:34:12','111','2',2,NULL,'Laptop',NULL,NULL);
/*!40000 ALTER TABLE `actual_product_property_value_md` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actual_product_type`
--

DROP TABLE IF EXISTS `actual_product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actual_product_type` (
  `ID` varchar(36) NOT NULL,
  `DISPLAY_NM` varchar(45) DEFAULT NULL,
  `CLIENT__ID` varchar(36) DEFAULT NULL,
  `EXPIRY_DT` datetime DEFAULT NULL,
  `CREATION_DT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CLNT_APT_idx` (`CLIENT__ID`),
  CONSTRAINT `FK_CLNT_APT` FOREIGN KEY (`CLIENT__ID`) REFERENCES `client` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actual_product_type`
--

LOCK TABLES `actual_product_type` WRITE;
/*!40000 ALTER TABLE `actual_product_type` DISABLE KEYS */;
INSERT INTO `actual_product_type` (`ID`, `DISPLAY_NM`, `CLIENT__ID`, `EXPIRY_DT`, `CREATION_DT`) VALUES ('1','Computer','2',NULL,NULL),('2','Hard Drive','2',NULL,NULL),('3','Computer Monitor','2',NULL,NULL);
/*!40000 ALTER TABLE `actual_product_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `ID` varchar(36) NOT NULL,
  `DISPLAY_NM` varchar(45) DEFAULT NULL,
  `LOGO_URL` varchar(999) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` (`ID`, `DISPLAY_NM`, `LOGO_URL`) VALUES ('1','Base Client',NULL),('2','Ashwini-Computers',NULL),('3','Thermax',NULL),('4','Courtland Homes',NULL);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_supported_languages`
--

DROP TABLE IF EXISTS `client_supported_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_supported_languages` (
  `ID` varchar(36) NOT NULL,
  `DISPLAY_NM` varchar(45) DEFAULT NULL,
  `EXPIRY_DT` datetime DEFAULT NULL,
  `CLIENT__ID` varchar(36) DEFAULT NULL,
  `IS_DEFAULT` varchar(1) DEFAULT NULL,
  `SEQUENCE_NUMBER` int(11) DEFAULT NULL,
  `mstr_system_supp_language__ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CLNT_CSL_idx` (`CLIENT__ID`),
  KEY `FK_MSSL_CSL_idx` (`mstr_system_supp_language__ID`),
  CONSTRAINT `FK_MSSL_CSL` FOREIGN KEY (`mstr_system_supp_language__ID`) REFERENCES `mstr_system_supp_language` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CLNT_CSL` FOREIGN KEY (`CLIENT__ID`) REFERENCES `client` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_supported_languages`
--

LOCK TABLES `client_supported_languages` WRITE;
/*!40000 ALTER TABLE `client_supported_languages` DISABLE KEYS */;
INSERT INTO `client_supported_languages` (`ID`, `DISPLAY_NM`, `EXPIRY_DT`, `CLIENT__ID`, `IS_DEFAULT`, `SEQUENCE_NUMBER`, `mstr_system_supp_language__ID`) VALUES ('1','English',NULL,'1','1',1,NULL),('2','English-AShwini',NULL,'2','1',1,NULL),('2015-01-29 14:58:33','English-Courtland',NULL,'4','1',1,NULL),('4','English-Thermax',NULL,'3','1',1,NULL);
/*!40000 ALTER TABLE `client_supported_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_product`
--

DROP TABLE IF EXISTS `custom_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_product` (
  `ID` varchar(36) NOT NULL,
  `ACTUAL_PRODUCT__ID` varchar(36) DEFAULT NULL,
  `COMMENTS` varchar(999) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_AP_CP_idx` (`ACTUAL_PRODUCT__ID`),
  CONSTRAINT `FK_AP_CP` FOREIGN KEY (`ACTUAL_PRODUCT__ID`) REFERENCES `actual_product` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_product`
--

LOCK TABLES `custom_product` WRITE;
/*!40000 ALTER TABLE `custom_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_product_property_value`
--

DROP TABLE IF EXISTS `custom_product_property_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_product_property_value` (
  `ID` varchar(36) NOT NULL,
  `CUSTOM_PRODUCT__ID` varchar(36) DEFAULT NULL,
  `ACTUAL_PRODUCT_PROPERTY__ID` varchar(36) DEFAULT NULL,
  `THE_VALUE` varchar(999) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_cp_cppv_idx` (`CUSTOM_PRODUCT__ID`),
  KEY `fk_APPT_cppv_idx` (`ACTUAL_PRODUCT_PROPERTY__ID`),
  CONSTRAINT `fk_cp_cppv` FOREIGN KEY (`CUSTOM_PRODUCT__ID`) REFERENCES `custom_product` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_APPT_cppv` FOREIGN KEY (`ACTUAL_PRODUCT_PROPERTY__ID`) REFERENCES `actual_product_property` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_product_property_value`
--

LOCK TABLES `custom_product_property_value` WRITE;
/*!40000 ALTER TABLE `custom_product_property_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_product_property_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `ID` varchar(36) NOT NULL,
  `FIRST_NAME` varchar(45) DEFAULT NULL,
  `LANG_PREF__ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_LANG_C_idx` (`LANG_PREF__ID`),
  CONSTRAINT `FK_LANG_C` FOREIGN KEY (`LANG_PREF__ID`) REFERENCES `mstr_system_supp_language` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`ID`, `FIRST_NAME`, `LANG_PREF__ID`) VALUES ('1','HARSH','1');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_client`
--

DROP TABLE IF EXISTS `customer_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_client` (
  `ID` varchar(36) NOT NULL,
  `CUSTOMER__ID` varchar(36) DEFAULT NULL,
  `CLIENT__ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CLIENT_CC_idx` (`CLIENT__ID`),
  KEY `FK_CUST_CC_idx` (`CUSTOMER__ID`),
  CONSTRAINT `FK_CLIENT_CC` FOREIGN KEY (`CLIENT__ID`) REFERENCES `client` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CUST_CC` FOREIGN KEY (`CUSTOMER__ID`) REFERENCES `customer` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_client`
--

LOCK TABLES `customer_client` WRITE;
/*!40000 ALTER TABLE `customer_client` DISABLE KEYS */;
INSERT INTO `customer_client` (`ID`, `CUSTOMER__ID`, `CLIENT__ID`) VALUES ('2015-01-31 23:36:21','1','2'),('2015-01-31 23:36:29','1','3'),('2015-01-31 23:36:39','1','1');
/*!40000 ALTER TABLE `customer_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_document_category`
--

DROP TABLE IF EXISTS `customer_document_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_document_category` (
  `ID` varchar(36) NOT NULL,
  `DISPLAY_NM` varchar(45) DEFAULT NULL,
  `CLIENT__ID` varchar(36) DEFAULT NULL,
  `PARENT_DOC_CAT__ID` varchar(36) DEFAULT NULL,
  `SEQUENCE_NUMBER` int(11) DEFAULT NULL,
  `DOC_CATEGORY__CD` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_DOC_CAT_idx` (`PARENT_DOC_CAT__ID`),
  KEY `FK_CDC_DOCCAT_idx` (`DOC_CATEGORY__CD`),
  CONSTRAINT `FK_CDC_MDC` FOREIGN KEY (`DOC_CATEGORY__CD`) REFERENCES `mstr_document_category` (`DOCUMENT_CATEGORY_CD`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_document_category`
--

LOCK TABLES `customer_document_category` WRITE;
/*!40000 ALTER TABLE `customer_document_category` DISABLE KEYS */;
INSERT INTO `customer_document_category` (`ID`, `DISPLAY_NM`, `CLIENT__ID`, `PARENT_DOC_CAT__ID`, `SEQUENCE_NUMBER`, `DOC_CATEGORY__CD`) VALUES ('1','Contracts','1',NULL,4,NULL),('10','Others','2',NULL,6,NULL),('11','Receipts','2',NULL,1,NULL),('12','Product Pictures','2',NULL,5,NULL),('2','Manuals','1',NULL,3,NULL),('3','Warranties','1',NULL,2,NULL),('4','Others','1',NULL,6,NULL),('5','Receipts','1',NULL,1,NULL),('6','Product Pictures','1',NULL,5,NULL),('7','Contracts','2',NULL,4,NULL),('8','Manuals','2',NULL,3,NULL),('9','Warranties','2',NULL,2,NULL);
/*!40000 ALTER TABLE `customer_document_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_product_documents`
--

DROP TABLE IF EXISTS `customer_product_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_product_documents` (
  `ID` varchar(36) NOT NULL,
  `ACTUAL_PRODUCT__ID` varchar(36) DEFAULT NULL,
  `DOCUMENT_MATERIAL_TYPE__CD` varchar(36) DEFAULT NULL,
  `MATERIAL_URL` varchar(999) DEFAULT NULL,
  `IS_DEFAULT` char(1) DEFAULT NULL,
  `SEQUENCE_NUMBER` int(11) DEFAULT NULL,
  `DOCUMENT_CATEGORY__CD` varchar(36) DEFAULT NULL,
  `DOCUMENT_NM` varchar(45) DEFAULT NULL,
  `CREATION_DT` datetime DEFAULT NULL,
  `EXPIRY_DT` datetime DEFAULT NULL,
  `VERSION_NUMBER` varchar(45) DEFAULT NULL,
  `LANGUAGE__ID` varchar(36) DEFAULT NULL,
  `DOCUMENT_ID` varchar(45) DEFAULT NULL,
  `DOCUMENT_NUMBER` varchar(45) DEFAULT NULL,
  `CUSTOMER__ID` varchar(36) DEFAULT NULL,
  `DOCUMENT_DESCR` varchar(99) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CPD_AP_idx` (`ACTUAL_PRODUCT__ID`),
  KEY `FK_CPD_C_idx` (`CUSTOMER__ID`),
  KEY `FK_CPD_DC_idx` (`DOCUMENT_CATEGORY__CD`),
  KEY `FK_CPD_MDT_idx` (`DOCUMENT_MATERIAL_TYPE__CD`),
  CONSTRAINT `FK_CPD_MDT` FOREIGN KEY (`DOCUMENT_MATERIAL_TYPE__CD`) REFERENCES `mstr_document_material_type` (`TYPE_CD`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CPD_MDC` FOREIGN KEY (`DOCUMENT_CATEGORY__CD`) REFERENCES `mstr_document_category` (`DOCUMENT_CATEGORY_CD`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CPD_AP` FOREIGN KEY (`ACTUAL_PRODUCT__ID`) REFERENCES `actual_product` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_product_documents`
--

LOCK TABLES `customer_product_documents` WRITE;
/*!40000 ALTER TABLE `customer_product_documents` DISABLE KEYS */;
INSERT INTO `customer_product_documents` (`ID`, `ACTUAL_PRODUCT__ID`, `DOCUMENT_MATERIAL_TYPE__CD`, `MATERIAL_URL`, `IS_DEFAULT`, `SEQUENCE_NUMBER`, `DOCUMENT_CATEGORY__CD`, `DOCUMENT_NM`, `CREATION_DT`, `EXPIRY_DT`, `VERSION_NUMBER`, `LANGUAGE__ID`, `DOCUMENT_ID`, `DOCUMENT_NUMBER`, `CUSTOMER__ID`, `DOCUMENT_DESCR`) VALUES ('1','2015-01-29 20:47:32','PDF','DS',NULL,1,NULL,'My Recipt',NULL,NULL,NULL,NULL,NULL,'1234342','1',NULL);
/*!40000 ALTER TABLE `customer_product_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_address`
--

DROP TABLE IF EXISTS `entity_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_address` (
  `ID` varchar(36) NOT NULL,
  `ADDRESS1` varchar(90) DEFAULT NULL,
  `ADDRESS2` varchar(90) DEFAULT NULL,
  `ADDRESS3` varchar(90) DEFAULT NULL,
  `CITY` varchar(90) DEFAULT NULL,
  `STATE` varchar(90) DEFAULT NULL,
  `COUNTRY` varchar(45) DEFAULT NULL,
  `ZIPCODE` varchar(45) DEFAULT NULL,
  `LATITUDE` float DEFAULT NULL,
  `LONGITUDE` float DEFAULT NULL,
  `ALTITUDE` float DEFAULT NULL,
  `ENTITY__ID` varchar(36) DEFAULT NULL,
  `DISPLAY_SEQUENCE` int(11) DEFAULT NULL,
  `ADDRESS_TYPE__ID` char(4) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_address`
--

LOCK TABLES `entity_address` WRITE;
/*!40000 ALTER TABLE `entity_address` DISABLE KEYS */;
INSERT INTO `entity_address` (`ID`, `ADDRESS1`, `ADDRESS2`, `ADDRESS3`, `CITY`, `STATE`, `COUNTRY`, `ZIPCODE`, `LATITUDE`, `LONGITUDE`, `ALTITUDE`, `ENTITY__ID`, `DISPLAY_SEQUENCE`, `ADDRESS_TYPE__ID`) VALUES ('1','8233 W Rock Springs Dr.',NULL,NULL,'Peoria','AZ','USA','85383',1.001,103.234,1213.1,'c2170bb8-eed3-4ca3-91d7-374a4abbb5a5',1,NULL),('2','QWEQWE',NULL,NULL,'QWE','AA','USA','11111',1,11,1111,'39d8f2f5-6454-40c7-8318-5b852c39df73',1,NULL);
/*!40000 ALTER TABLE `entity_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_cmnctn_type`
--

DROP TABLE IF EXISTS `entity_cmnctn_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_cmnctn_type` (
  `ID` varchar(36) NOT NULL,
  `ENTITY__ID` varchar(36) DEFAULT NULL,
  `DISP_NM` varchar(45) DEFAULT NULL,
  `CHANNEL` varchar(10) DEFAULT NULL,
  `IS_DEFAULT` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_cmnctn_type`
--

LOCK TABLES `entity_cmnctn_type` WRITE;
/*!40000 ALTER TABLE `entity_cmnctn_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_cmnctn_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_phone`
--

DROP TABLE IF EXISTS `entity_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_phone` (
  `ID` varchar(36) NOT NULL,
  `COUNTRY_CODE` varchar(3) DEFAULT NULL,
  `AREA_CODE` int(11) DEFAULT NULL,
  `NEXT3DIGITS` int(11) DEFAULT NULL,
  `NEXT4DIGITS` int(11) DEFAULT NULL,
  `EXT` int(11) DEFAULT NULL,
  `ENTITY__ID` varchar(36) DEFAULT NULL,
  `DISPLAY_SEQUENCE` int(11) DEFAULT NULL,
  `PHONE_TYPE__ID` char(4) DEFAULT NULL,
  `PHONE_NUMBER` int(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_phone`
--

LOCK TABLES `entity_phone` WRITE;
/*!40000 ALTER TABLE `entity_phone` DISABLE KEYS */;
INSERT INTO `entity_phone` (`ID`, `COUNTRY_CODE`, `AREA_CODE`, `NEXT3DIGITS`, `NEXT4DIGITS`, `EXT`, `ENTITY__ID`, `DISPLAY_SEQUENCE`, `PHONE_TYPE__ID`, `PHONE_NUMBER`) VALUES ('1','+1',303,564,5174,NULL,'c2170bb8-eed3-4ca3-91d7-374a4abbb5a5',1,'MOB',860899144),('2','+1',847,298,1398,101,'39d8f2f5-6454-40c7-8318-5b852c39df73',1,'LAN',847298139),('6237f86e-7bb8-4593-b6f3-c8be779b0ee6','+1',303,564,5174,NULL,'39d8f2f5-6454-40c7-8318-5b852c39df73',2,'MOB',860899123);
/*!40000 ALTER TABLE `entity_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_website_info`
--

DROP TABLE IF EXISTS `entity_website_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_website_info` (
  `ID` varchar(36) NOT NULL,
  `WEBSITE_URL` varchar(999) DEFAULT NULL,
  `WEBSITE_LBL` varchar(100) DEFAULT NULL,
  `ENTITY__ID` varchar(36) DEFAULT NULL,
  `DISPLAY_SEQUENCE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_website_info`
--

LOCK TABLES `entity_website_info` WRITE;
/*!40000 ALTER TABLE `entity_website_info` DISABLE KEYS */;
INSERT INTO `entity_website_info` (`ID`, `WEBSITE_URL`, `WEBSITE_LBL`, `ENTITY__ID`, `DISPLAY_SEQUENCE`) VALUES ('23432423432','http://aaa.com','sssa','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5',1),('7576e54b-e685-43b7-9c83-1e2135ce9360','http://aaa.com','aaa','a1f0323a-72f1-4dc9-aac0-6ad66e185eb9',1),('e213f932-f0d3-4e73-8b9d-ebbb84eb6040','http://aaa.com','aaa','39d8f2f5-6454-40c7-8318-5b852c39df73',1);
/*!40000 ALTER TABLE `entity_website_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturer` (
  `ID` varchar(36) NOT NULL,
  `DISP_NM` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` (`ID`, `DISP_NM`) VALUES ('1','Dell'),('2','Kenmore'),('3','GE');
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_cmnctn_type`
--

DROP TABLE IF EXISTS `meta_cmnctn_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_cmnctn_type` (
  `ID` int(11) NOT NULL,
  `DISP_NM` varchar(45) DEFAULT NULL,
  `CHANNEL` varchar(10) DEFAULT NULL,
  `IS_DEFAULT` char(1) DEFAULT NULL,
  `META_ENTITY_TYPE__CD` char(4) DEFAULT NULL,
  `VISIBLE` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_MCT_CUST_TYPE_idx` (`META_ENTITY_TYPE__CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_cmnctn_type`
--

LOCK TABLES `meta_cmnctn_type` WRITE;
/*!40000 ALTER TABLE `meta_cmnctn_type` DISABLE KEYS */;
INSERT INTO `meta_cmnctn_type` (`ID`, `DISP_NM`, `CHANNEL`, `IS_DEFAULT`, `META_ENTITY_TYPE__CD`, `VISIBLE`) VALUES (1,'Home Phone-1','PHONE','N','PERS','Y'),(2,'Home Phone-2','PHONE','N','PERS','Y'),(3,'Cell Phone','PHONE','Y','PERS','Y'),(4,'Primary Home','ADDRESS','Y','PERS','Y'),(6,'Personal Email','EMAIL','Y','PERS','Y'),(7,'Customer Service','PHONE','N','CMN','N');
/*!40000 ALTER TABLE `meta_cmnctn_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_entity_type`
--

DROP TABLE IF EXISTS `meta_entity_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_entity_type` (
  `ID` int(11) NOT NULL,
  `DISP_NM` varchar(45) DEFAULT NULL,
  `DISP_CODE` char(4) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_entity_type`
--

LOCK TABLES `meta_entity_type` WRITE;
/*!40000 ALTER TABLE `meta_entity_type` DISABLE KEYS */;
INSERT INTO `meta_entity_type` (`ID`, `DISP_NM`, `DISP_CODE`) VALUES (1,'Personal','PERS'),(2,'Business-Silver','BN-S'),(3,'Business-Gold','BN-G'),(4,'Business-Diamond','BN-D'),(5,'Business','BSNS');
/*!40000 ALTER TABLE `meta_entity_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mstr_document_category`
--

DROP TABLE IF EXISTS `mstr_document_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mstr_document_category` (
  `ID` varchar(36) NOT NULL,
  `DISPLAY_NM` varchar(45) DEFAULT NULL,
  `PARENT_DOC_CAT__ID` varchar(36) DEFAULT NULL,
  `SEQUENCE_NUMBER` int(11) DEFAULT NULL,
  `DOCUMENT_CATEGORY_CD` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `DOCUMENT_CATEGORY_CD_UNIQUE` (`DOCUMENT_CATEGORY_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mstr_document_category`
--

LOCK TABLES `mstr_document_category` WRITE;
/*!40000 ALTER TABLE `mstr_document_category` DISABLE KEYS */;
INSERT INTO `mstr_document_category` (`ID`, `DISPLAY_NM`, `PARENT_DOC_CAT__ID`, `SEQUENCE_NUMBER`, `DOCUMENT_CATEGORY_CD`) VALUES ('1','Warranties',NULL,1,'WARRANTIES');
/*!40000 ALTER TABLE `mstr_document_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mstr_document_material_type`
--

DROP TABLE IF EXISTS `mstr_document_material_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mstr_document_material_type` (
  `ID` varchar(36) NOT NULL,
  `DISP_NM` varchar(45) DEFAULT NULL,
  `EXPIRY_DT` datetime DEFAULT NULL,
  `MIME_TYPE` varchar(45) DEFAULT NULL,
  `TYPE_CD` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TYPE_CD_UNIQUE` (`TYPE_CD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mstr_document_material_type`
--

LOCK TABLES `mstr_document_material_type` WRITE;
/*!40000 ALTER TABLE `mstr_document_material_type` DISABLE KEYS */;
INSERT INTO `mstr_document_material_type` (`ID`, `DISP_NM`, `EXPIRY_DT`, `MIME_TYPE`, `TYPE_CD`) VALUES ('1','PDF',NULL,NULL,'PDF'),('2','DOC',NULL,NULL,'DOC'),('3','MP4',NULL,NULL,'MP4'),('4','EXCEL',NULL,NULL,'EXCEL');
/*!40000 ALTER TABLE `mstr_document_material_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mstr_lang_flds`
--

DROP TABLE IF EXISTS `mstr_lang_flds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mstr_lang_flds` (
  `ID` varchar(36) NOT NULL,
  `MSL__ID` varchar(36) DEFAULT NULL,
  `FLD_NM` varchar(99) DEFAULT NULL,
  `FLD_VALUE` varchar(99) DEFAULT NULL,
  `EXPIRY_DT` datetime DEFAULT NULL,
  `CREATION_DT` datetime DEFAULT NULL,
  `FLD_GROUP_NM` varchar(45) DEFAULT NULL,
  `CLIENT__ID` varchar(36) DEFAULT NULL,
  `PAGE__CD` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_MSSL_MLF_idx` (`MSL__ID`),
  KEY `FK_CLNT_MLF_idx` (`CLIENT__ID`),
  CONSTRAINT `FK_CLNT_MLF` FOREIGN KEY (`CLIENT__ID`) REFERENCES `client` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_MSSL_MLF` FOREIGN KEY (`MSL__ID`) REFERENCES `mstr_system_supp_language` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mstr_lang_flds`
--

LOCK TABLES `mstr_lang_flds` WRITE;
/*!40000 ALTER TABLE `mstr_lang_flds` DISABLE KEYS */;
INSERT INTO `mstr_lang_flds` (`ID`, `MSL__ID`, `FLD_NM`, `FLD_VALUE`, `EXPIRY_DT`, `CREATION_DT`, `FLD_GROUP_NM`, `CLIENT__ID`, `PAGE__CD`) VALUES ('1','1','CUST_PD_PRDT_NM','Product Name',NULL,NULL,'','1','PROD_D'),('10','1','CUST_LOGIN_SIGN_IN_FB','Sign in with Facebook',NULL,NULL,'','1','AUTH_LOGIN'),('11','1','CUST_LOGIN_SIGN_UP','New here? Sign Up',NULL,NULL,'','1','AUTH_LOGIN'),('12','1','CUST_LOGIN_FRGT_PW','Forgot Password ?',NULL,NULL,'','1','AUTH_LOGIN'),('13','1','CUST_LOGIN_SIGN_IN','Sign In',NULL,NULL,'','1','AUTH_LOGIN'),('14','1','CUST_LOGIN_PSWRD_PLCE_HLDR','Password',NULL,NULL,'','1','AUTH_LOGIN'),('15','1','CUST_LOGIN_PLCE_HLDR','E-Mail address',NULL,NULL,'','1','AUTH_LOGIN'),('16','1','CUST_HDR_WELCOME','Welcome',NULL,NULL,'','1','AUTH_LOGIN'),('17','1','CUST_PL_PRDCT_NM','Product Name',NULL,NULL,'','1','PROD_LST'),('18','1','CUST_PL_PRDCT_PRCHSE_DT','Purchase Date',NULL,NULL,'','1','PROD_LST'),('19','1','CUST_PL_EXPRS_IN','Warranty Expires in',NULL,NULL,'','1','PROD_LST'),('2','1','CUST_PD_MAKE','Make',NULL,NULL,'','1','PROD_D'),('20','1','CUST_PL_STORE_NM','Store Name',NULL,NULL,'','1','PROD_LST'),('21','1','CUST_PL_ACTION','Action',NULL,NULL,'','1','PROD_LST'),('22','1','CUST_PL_ADD_PRODUCT','Add New Product',NULL,NULL,'','1','PROD_LST'),('23','1','CUST_PLCUST_TITLE','Warranty List',NULL,NULL,NULL,NULL,NULL),('24','1','CUST_PL_VIEW_DETAILS','View Details',NULL,NULL,NULL,NULL,NULL),('25','1','CUST_PL_EDIT_RECORD','Edit Record',NULL,NULL,NULL,NULL,NULL),('26','1','CUST_PL_DELETE_RECORD','Delete Record',NULL,NULL,NULL,NULL,NULL),('27','1','CUST_PL_MANAGE_CLAIMS','Manage Claims',NULL,NULL,NULL,NULL,NULL),('28','1','CUST_PL_ACTIONS','Actions',NULL,NULL,NULL,NULL,NULL),('29','1','CUST_PL_PROD_LST','Product List',NULL,NULL,NULL,'1','PROD_LST'),('3','1','CUST_PD_SERIAL','Serial #',NULL,NULL,NULL,NULL,NULL),('30','1','CUST_PL_ACTN_VEW_PRDCT','View Product Details',NULL,NULL,NULL,'1','PROD_LST'),('31','1','CUST_PL_ACTN_RAIS_CLM','Raise Claim',NULL,NULL,NULL,'1','PROD_LST'),('32','1','CUST_PL_ACTN_DEL_PROD','Delete Product',NULL,NULL,NULL,'1','PROD_LST'),('4','1','CUST_PD_MODEL','Model',NULL,NULL,NULL,NULL,NULL),('5','1','CUST_PD_YEAR','Year',NULL,NULL,NULL,NULL,NULL),('6','1','CUST_PD_PRDT_DTLS','Purchased product details',NULL,NULL,NULL,NULL,NULL),('7','1','CUST_CUST_TITLE','Warranty Details',NULL,NULL,NULL,NULL,NULL),('8','1','CUST_PD_EDIT_WRNTY','Edit Warranty',NULL,NULL,NULL,NULL,NULL),('9','1','CUST_PL_ADD_PRODUCT','Sign in with Twitter',NULL,NULL,NULL,NULL,'AUTH_LOGIN');
/*!40000 ALTER TABLE `mstr_lang_flds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mstr_product_display_sections`
--

DROP TABLE IF EXISTS `mstr_product_display_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mstr_product_display_sections` (
  `ID` varchar(36) NOT NULL,
  `SECTION_ID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mstr_product_display_sections`
--

LOCK TABLES `mstr_product_display_sections` WRITE;
/*!40000 ALTER TABLE `mstr_product_display_sections` DISABLE KEYS */;
INSERT INTO `mstr_product_display_sections` (`ID`, `SECTION_ID`) VALUES ('1','SEC001'),('2','SEC002'),('3','SEC003'),('4','SEC004'),('5','SEC005');
/*!40000 ALTER TABLE `mstr_product_display_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mstr_product_property`
--

DROP TABLE IF EXISTS `mstr_product_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mstr_product_property` (
  `ID` varchar(36) NOT NULL,
  `PROPERTY_NM` varchar(45) DEFAULT NULL,
  `EXPIRY_DT` datetime DEFAULT NULL,
  `DEFAULT_SEQ_NUMBER` int(11) DEFAULT NULL,
  `MSTR_PROD_DISP_SECN__ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_SECN_MPP_idx` (`MSTR_PROD_DISP_SECN__ID`),
  CONSTRAINT `FK_SECN_MPP` FOREIGN KEY (`MSTR_PROD_DISP_SECN__ID`) REFERENCES `mstr_product_display_sections` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mstr_product_property`
--

LOCK TABLES `mstr_product_property` WRITE;
/*!40000 ALTER TABLE `mstr_product_property` DISABLE KEYS */;
INSERT INTO `mstr_product_property` (`ID`, `PROPERTY_NM`, `EXPIRY_DT`, `DEFAULT_SEQ_NUMBER`, `MSTR_PROD_DISP_SECN__ID`) VALUES ('1','pp01',NULL,1,'1'),('2','pp02',NULL,2,'1'),('2015-01-29 21:14:46','p007',NULL,1,'2'),('2015-01-29 21:15:09','p008',NULL,2,'2'),('2015-01-29 21:15:17','p009',NULL,3,'2'),('2015-01-29 21:15:24','p010',NULL,4,'2'),('2015-01-29 21:19:32','p013',NULL,1,'3'),('2015-01-29 21:19:57','p014',NULL,2,'3'),('2015-01-29 21:20:45','p015',NULL,3,'3'),('2015-01-29 21:21:00','p016',NULL,4,'3'),('2015-01-29 21:21:12','p017',NULL,5,'3'),('2015-01-29 21:21:22','p018',NULL,6,'3'),('3','pp03',NULL,3,'1'),('4','pp04',NULL,4,'1'),('5','pp05',NULL,5,'1'),('6','pp06',NULL,6,'1'),('7','p011',NULL,5,'2'),('8','p012',NULL,6,'2'),('9','p013',NULL,NULL,NULL);
/*!40000 ALTER TABLE `mstr_product_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mstr_property_value_type`
--

DROP TABLE IF EXISTS `mstr_property_value_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mstr_property_value_type` (
  `id` varchar(36) NOT NULL,
  `DISP_NM` varchar(45) DEFAULT NULL,
  `DESCRIPTION` varchar(999) DEFAULT NULL,
  `TYPE_CODE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mstr_property_value_type`
--

LOCK TABLES `mstr_property_value_type` WRITE;
/*!40000 ALTER TABLE `mstr_property_value_type` DISABLE KEYS */;
INSERT INTO `mstr_property_value_type` (`id`, `DISP_NM`, `DESCRIPTION`, `TYPE_CODE`) VALUES ('1','Text',NULL,'TEXT'),('2','Single Select',NULL,'SINGLE_SELECT'),('3','Multi Select',NULL,'MULTI_SELECT'),('4','Link',NULL,'HYPERLINK');
/*!40000 ALTER TABLE `mstr_property_value_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mstr_system_supp_language`
--

DROP TABLE IF EXISTS `mstr_system_supp_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mstr_system_supp_language` (
  `ID` varchar(36) NOT NULL,
  `LANG_NM` varchar(45) DEFAULT NULL,
  `EXPIRY_DT` datetime DEFAULT NULL,
  `ACTIVE_DT` datetime DEFAULT NULL,
  `CREATION_DT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mstr_system_supp_language`
--

LOCK TABLES `mstr_system_supp_language` WRITE;
/*!40000 ALTER TABLE `mstr_system_supp_language` DISABLE KEYS */;
INSERT INTO `mstr_system_supp_language` (`ID`, `LANG_NM`, `EXPIRY_DT`, `ACTIVE_DT`, `CREATION_DT`) VALUES ('1','US English',NULL,NULL,NULL),('2','Spanish',NULL,NULL,NULL),('3','Hindi',NULL,NULL,NULL);
/*!40000 ALTER TABLE `mstr_system_supp_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_x_manufacturer`
--

DROP TABLE IF EXISTS `product_x_manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_x_manufacturer` (
  `ID` varchar(36) NOT NULL,
  `PRODUCT__ID` varchar(36) DEFAULT NULL,
  `MANUFACTURER__ID` varchar(36) DEFAULT NULL,
  `EXPIRY_DT` datetime DEFAULT NULL,
  `CREATION_DT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PROD__ID_PXM_idx` (`PRODUCT__ID`),
  KEY `FK_MANF__ID_PXM_idx` (`MANUFACTURER__ID`),
  CONSTRAINT `FK_PROD__ID_PXM` FOREIGN KEY (`PRODUCT__ID`) REFERENCES `actual_product` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_MANF__ID_PXM` FOREIGN KEY (`MANUFACTURER__ID`) REFERENCES `manufacturer` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_x_manufacturer`
--

LOCK TABLES `product_x_manufacturer` WRITE;
/*!40000 ALTER TABLE `product_x_manufacturer` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_x_manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sold_product`
--

DROP TABLE IF EXISTS `sold_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sold_product` (
  `ID` varchar(36) NOT NULL,
  `SALES_PRICE` float DEFAULT NULL,
  `SALES_DT` datetime DEFAULT NULL,
  `SALES_RECEIPT_NUMBER` varchar(45) DEFAULT NULL,
  `SALES_REP_NM` varchar(45) DEFAULT NULL,
  `CUSTOMER__ID` varchar(20) DEFAULT NULL,
  `SALES_ITEM_NUMBER` varchar(45) DEFAULT NULL,
  `CUSTOM_NM` varchar(45) DEFAULT NULL,
  `SOLD_CURRENCY` varchar(4) DEFAULT NULL,
  `EXPIRY_DT` datetime DEFAULT NULL,
  `CREATION_DT` datetime DEFAULT NULL,
  `IS_CUSTOMIZED` varchar(1) DEFAULT 'N',
  `CUSTOM_PRODUCT__ID` varchar(36) DEFAULT NULL,
  `ACTUAL_PRODUCT__ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_SP_SW_idx1` (`CUSTOMER__ID`),
  CONSTRAINT `FK_CUST_SP` FOREIGN KEY (`CUSTOMER__ID`) REFERENCES `customer` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sold_product`
--

LOCK TABLES `sold_product` WRITE;
/*!40000 ALTER TABLE `sold_product` DISABLE KEYS */;
INSERT INTO `sold_product` (`ID`, `SALES_PRICE`, `SALES_DT`, `SALES_RECEIPT_NUMBER`, `SALES_REP_NM`, `CUSTOMER__ID`, `SALES_ITEM_NUMBER`, `CUSTOM_NM`, `SOLD_CURRENCY`, `EXPIRY_DT`, `CREATION_DT`, `IS_CUSTOMIZED`, `CUSTOM_PRODUCT__ID`, `ACTUAL_PRODUCT__ID`) VALUES ('0824a903-3df2-418f-8369-a522d1fad69f',256.54,'2014-12-14 00:00:00','o8fsXSfNln','John','1','item123','UE66nHlkTb','USD',NULL,'2015-01-20 00:00:39','N',NULL,NULL),('1',12.15,'2014-10-10 00:00:00','Rcpt-1234','Johnny','1','12','Chaise de salle à manger','USD',NULL,NULL,'N',NULL,'2015-01-29 20:47:32'),('168e6efa-7194-42b3-9a94-c9ca5e1542cb',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,'a5863659-67db-4255-a2a2-6d07aa8a1708'),('209a922f-985a-4cfb-b672-461260232050',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('2da42045-1db9-454d-977a-5c08b07b5d9a',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('2e9c4d66-a1fd-4279-a11d-9ec276e87b25',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('33f4ead3-8a07-4477-8357-0a6a8440e82a',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('34f29c9a-598b-4aef-927b-118ce3e373a2',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('3531cfe6-152f-4a62-bcbf-7d59a9cc8c02',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('373c08a2-9104-4628-99e4-ea2561199e33',256.54,'2014-12-14 00:00:00','gYGcVZigHr','John','1','item123','aSsgxSg8q3','USD',NULL,'2015-01-20 00:00:39','N',NULL,NULL),('3a9cad26-a09d-4b9a-a57d-28f8f97db077',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('48502e2e-0980-4f98-9bf7-9d94c76957a8',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','পংক্তিভোজন রুম চেয়ার','USD',NULL,NULL,'N',NULL,NULL),('4d8c2baa-148c-4b54-88b6-145b4878967d',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('4e9aa9b9-523e-44c8-b7b5-bfb9b549c21e',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('531da919-2077-4003-8938-a42de29e0aa2',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('56687ab8-685c-4348-ac6c-8dd16ee62d8d',256.54,'2014-12-14 00:00:00','bzWNY799Fu','John','1','item123','Ah6clSZNMo','USD',NULL,'2015-01-19 11:07:01','N',NULL,NULL),('57939ca5-35b6-4cbb-94bd-83b833925390',256.54,'2014-12-14 00:00:00','25a6hNxTbT','John','1','item123','LQgLT9Rdhn','USD',NULL,'2015-01-19 11:07:01','N',NULL,NULL),('5b116df1-5c3d-4ea7-a86f-979a2e0ade49',256.54,'2014-12-14 00:00:00','CZlGCUuOcB','John','1','item123','QH8K4N5DNU','USD',NULL,NULL,'N',NULL,NULL),('5e7eb455-6878-42af-b005-832e8a972b9e',256.54,'2014-12-14 00:00:00','wZu5HxropI','John','1','item123','zc1Hwgy7qd','USD',NULL,'2015-01-19 11:34:14','N',NULL,NULL),('62952aed-1fcb-4cf1-b43f-7f4fe46f6a13',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('63fd6ce8-d798-49d1-a91d-bdcfe59d5962',256.54,'2014-12-14 00:00:00','fadcKl5rUz','John','1','item123','hE2ohxy2Wj','USD',NULL,'2015-01-19 10:04:06','N',NULL,NULL),('6706521a-a72b-4029-99c5-da843503d685',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('69cb298a-b246-486d-a868-6b17f02b15dd',256.54,'2014-12-14 00:00:00','Qra6EUmPtm','John','1','item123','Br4txWMxta','USD',NULL,NULL,'N',NULL,NULL),('6d7442f2-74f9-46f1-bca8-b9e4671fe3b7',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('70aad5ee-c6b9-43f9-b73a-9745401e3712',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('7891614c-2c54-45b2-9614-2372e6812328',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('7df1e2e3-f162-4d59-8740-e32765b41345',256.54,'2014-12-14 00:00:00','e2mu1huyit','John','1','item123','SA9yXMYqWC','USD',NULL,NULL,'N',NULL,NULL),('7df6e004-e3a7-476c-88ac-ee454a9c2361',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('7f8a1bd9-604a-4c13-8ac2-20df02ee605b',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('82bd969b-05ee-400d-b9ed-c9c46f2f456b',256.54,'2014-12-14 00:00:00','Zatho8LBtY','John','1','item123','8UtbWO496q','USD',NULL,'2015-01-24 06:52:44','N',NULL,NULL),('8b9e9538-0bfa-4be1-868b-6145f831907a',256.54,'2014-12-14 00:00:00','3UsoHpWLUc','John','1','item123','W6WQKslFAB','USD',NULL,'2015-01-19 11:34:14','N',NULL,NULL),('8da8011c-729b-45ef-9427-e5a11d96360e',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('8e6400bb-d568-46b5-acb5-a6d4c4b05c95',256.54,'2014-12-14 00:00:00','pSupXDubUN','John','1','item123','jerRoFD5nW','USD',NULL,'2015-01-19 11:10:47','N',NULL,NULL),('8ee58128-5ff2-40c7-b1c0-0163d2602eb9',256.54,'2014-12-14 00:00:00','aMm9EawxME','John','1','item123','xKQk68eO8b','USD',NULL,NULL,'N',NULL,NULL),('938c82c4-fa83-4dec-8eb5-ab198d71198c',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('9cd5a891-d083-423b-a765-5589d6587678',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD','2015-01-17 18:50:19',NULL,'N',NULL,NULL),('9e11224b-0c3d-463e-8bab-c97b215e2370',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('9f047aaa-8422-45e5-bd4b-2bd0cf2e3b46',256.54,'2014-12-14 00:00:00','ZGHjwYWU8g','John','1','item123','gOKF3oK9QF','USD',NULL,'2015-01-19 11:35:20','N',NULL,NULL),('a2bdf541-ddc6-4bcf-b11b-5f031e3d557d',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('a2ff31c2-6e98-414a-aebc-be53490363ee',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('a72ca43c-9043-4def-9351-0e7286e48f31',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('a74056de-1551-467f-a3a6-cd9af353b2ff',256.54,'2014-12-14 00:00:00','JvyxxhV5A3','John','1','item123','7g1odotkdq','USD',NULL,'2015-01-19 11:34:30','N',NULL,NULL),('ae63c995-5bed-44f4-8343-7f4926f9d9ba',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('b4277984-e175-441e-8413-6606a25a102c',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('b5cc8346-f1a6-4e79-8d2e-28afbb408cb8',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('b6ccea59-f2cd-453a-920d-61c656097f5d',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('b73b63d6-c700-42b7-b960-f01869d7410e',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('b8d921ee-a2d5-4f83-8d54-7a97976f6ba8',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('bc7ef820-79b3-45bf-947f-c3af3d1c4721',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('c0285716-f00e-4f31-b416-038398b69f72',256.54,'2014-12-14 00:00:00','vyKp2UzoPN','John','1','item123','7EbuYRazs1','USD',NULL,NULL,'N',NULL,NULL),('c4d3e426-f7a1-4934-80ac-50d614799d8e',256.54,'2014-12-14 00:00:00','RMa8TZZnZ5','John','1','item123','4Z81dEANvr','USD',NULL,'2015-01-19 10:04:06','N',NULL,NULL),('c5f3c953-24f7-4412-b2b2-ab64185bcf53',256.54,'2014-12-14 00:00:00','Ok18cnGlFR','John','1','item123','6anjklZzQW','USD',NULL,'2015-01-20 09:57:03','N',NULL,NULL),('c8044a7b-033e-4630-87ff-1d9756c652cc',256.54,'2014-12-14 00:00:00','5OAMxaS3UW','John','1','item123','4tu8EC3MnN','USD',NULL,NULL,'N',NULL,NULL),('c86fd93f-5c2a-43e3-a013-b3215e80c229',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('cbb025f5-df31-4418-8854-325cb3031479',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('d065416f-fc4f-4ddb-86ca-b40b58a1da7a',256.54,'2014-12-14 00:00:00','HjAUKZUInK','John','1','item123','jzj6u1CGKf','USD',NULL,'2015-01-19 08:58:08','N',NULL,NULL),('d24215ab-9795-4305-b3a9-a1b446448632',256.54,'2014-12-14 00:00:00','5V8BQLzBrG','John','1','item123','sj9LbQpdhl','USD',NULL,'2015-01-24 06:52:44','N',NULL,NULL),('d2891d92-c5f2-4296-983c-7c7ebc163b42',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('d2e9ee5c-21fe-4c58-af6f-8b00320e8222',256.54,'2014-12-14 00:00:00','vkdLibKmQO','John','1','item123','zGHwhIXq3e','USD',NULL,NULL,'N',NULL,NULL),('e074383b-9f7e-48e6-b383-19ce5cda7ab3',256.54,'2014-12-14 00:00:00','jSeQkubg9J','John','1','item123','Y3wf8wbhrx','USD',NULL,NULL,'N',NULL,NULL),('e250b853-a44d-4fec-81bf-1748d94225af',256.54,'2014-12-14 00:00:00','ixT6y9FRXv','John','1','item123','ik4XJ2omeU','USD',NULL,'2015-01-20 09:57:03','N',NULL,NULL),('e7a3f8e8-7ddf-4705-9c75-c0fb58e6511f',256.54,'2014-12-14 00:00:00','nlhmX5mKjT','John','1','item123','Dqs7TSD4B7','USD',NULL,'2015-01-19 11:08:59','N',NULL,NULL),('f17ddcc8-a1dc-4271-83d0-ece6a84f0af0',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('f40242a2-e97c-47ee-a6ef-2b564a1ae716',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('f8930071-6103-456b-a993-8536e92b6a2f',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('fa732c78-2223-4318-898f-46d18b137254',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL),('fc48c51d-95fe-4003-a762-e75bc2a4c207',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL,'N',NULL,NULL);
/*!40000 ALTER TABLE `sold_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sold_product_document`
--

DROP TABLE IF EXISTS `sold_product_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sold_product_document` (
  `id` varchar(36) NOT NULL,
  `document_URL` varchar(999) DEFAULT NULL,
  `creation_dt` datetime DEFAULT NULL,
  `Document_NM` varchar(45) DEFAULT NULL,
  `sold_warranty__ID` varchar(36) DEFAULT NULL,
  `EXPIRY_DT` datetime DEFAULT NULL,
  `ENTITY_ADDRES__ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_SPD_SP_idx` (`sold_warranty__ID`),
  CONSTRAINT `FK_SPD_SP` FOREIGN KEY (`sold_warranty__ID`) REFERENCES `sold_product` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sold_product_document`
--

LOCK TABLES `sold_product_document` WRITE;
/*!40000 ALTER TABLE `sold_product_document` DISABLE KEYS */;
INSERT INTO `sold_product_document` (`id`, `document_URL`, `creation_dt`, `Document_NM`, `sold_warranty__ID`, `EXPIRY_DT`, `ENTITY_ADDRES__ID`) VALUES ('0d95bd4c-5a83-4a38-b4c5-2046098a0244','http://docurl','2015-01-18 17:28:24','docName','1',NULL,'1'),('25f70bce-021d-44a1-8802-6d46c9b12323','http://docurl','2015-01-10 20:43:10','docName','1',NULL,'1'),('2863381c-ad22-4d6d-8fd8-692c2aac9cdd','http://docurl','2015-01-08 22:54:26','docName','1',NULL,'1'),('3e16b2e7-abab-4148-8db3-ca0497793b8f','http://docurl','2015-01-18 18:50:21','docName','1',NULL,'1'),('431f7687-e51a-4f21-a398-728c0299bfac','http://docurl','2015-01-08 21:59:23','docName','1',NULL,'1'),('45efb0fe-57a4-4d24-ac33-8c384affcc27','http://docurl','2015-01-17 06:27:02','docName','1',NULL,'1'),('4bc9760c-f6d8-40f0-9dbc-81cf8b9c9997','http://docurl','2015-01-04 13:48:36','docName','1',NULL,'1'),('53347e3c-396f-46a1-99fd-1d80a37a05d7','http://docurl','2015-01-18 18:11:59','docName','1',NULL,'1'),('5a5913f5-f52e-4799-9685-5d715593bd8a','http://docurl','2015-01-08 20:12:41','docName','1',NULL,'1'),('5b02e918-d822-4912-9d7c-36b62bd1693c','http://docurl','2015-01-08 21:53:15','docName','1',NULL,'1'),('64a96ec5-eca5-4267-ab28-aac9d47b0f00','http://docurl','2015-01-08 23:00:55','docName','1',NULL,'1'),('659f2ff4-74d6-405a-b029-4f70b37f6f59','http://docurl','2015-01-08 21:59:56','docName','1',NULL,'1'),('6ac1ddb5-088a-425f-87e0-cf7ce8aa55b3','http://docurl','2015-01-08 21:44:12','docName','1',NULL,'1'),('816843e1-c0c0-4df6-95f5-a145f7ae69ce','http://docurl','2015-01-08 22:03:22','docName','1',NULL,'1'),('84b24cdd-a6ad-4a61-b49e-cd180a307d01','http://docurl','2015-01-08 21:58:52','docName','1',NULL,'1'),('88071cad-b6ec-4826-b6e9-7672cccff8cb','http://docurl','2015-01-08 22:23:59','docName','1',NULL,'1'),('89ba5bee-ac1e-4d5c-910d-880cac5d815f','http://docurl','2015-01-08 20:15:31','docName','1',NULL,'1'),('a131647a-0d53-45c1-a791-05e90e098824','http://docurl','2015-01-08 22:03:44','docName','1',NULL,'1'),('b2f8c436-7e48-45f3-9c3e-4e7d2edc67b9','http://docurl','2015-01-08 20:13:06','docName','1',NULL,'1'),('bdf89e01-9285-431b-8acc-4c295336bf59','http://docurl','2015-01-08 22:25:25','docName','1',NULL,'1'),('bf00ce2d-c6b5-46c1-a5d6-661c1fd79db0','http://docurl','2015-01-08 21:59:39','docName','1',NULL,'1'),('c6870598-be8a-4005-aa46-a10ddf7396ac','http://docurl','2015-01-18 18:24:17','docName','1',NULL,'1'),('c96fd1db-c54f-4289-beb9-24402c2deebb','http://docurl','2015-01-04 14:02:07','docName','1',NULL,'1'),('d604188d-1235-4d6e-90d2-8efe8da0519e','http://docurl','2015-01-08 20:15:52','docName','1',NULL,'1'),('deffe548-ee2d-41a8-8c45-0591326d8470','http://docurl','2015-01-18 18:37:37','docName','1',NULL,'1'),('df895564-c067-4c81-af1b-9357ed54e534','http://docurl','2015-01-10 20:47:58','docName','1',NULL,'1'),('e4a01314-ec0f-46a5-b56b-6ebec364bd70','http://docurl','2015-01-08 22:23:18','docName','1',NULL,'1'),('fa2ebd48-ce1c-48e7-bd8c-a306d7d3cf49','http://docurl','2015-01-08 22:54:47','docName','1',NULL,'1'),('fdd0ea9a-47cb-4e40-ac48-4fb34496dcb1','http://docurl','2015-01-08 22:14:31','docName','1',NULL,'1');
/*!40000 ALTER TABLE `sold_product_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sold_warranty`
--

DROP TABLE IF EXISTS `sold_warranty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sold_warranty` (
  `ID` varchar(36) NOT NULL,
  `START_DT` datetime DEFAULT NULL,
  `END_DT` datetime DEFAULT NULL,
  `WRNTY_AMT` float DEFAULT NULL,
  `AUTO_RENEW` char(1) DEFAULT NULL,
  `WARRANTY_NUMBER` varchar(45) DEFAULT NULL,
  `WARRANTY_PROVIDER__ID` varchar(36) DEFAULT NULL,
  `SOLD_WARRANTY_GRP__ID` varchar(36) DEFAULT NULL,
  `EXPIRY_DT` datetime DEFAULT NULL,
  `WARRANTY_NM` varchar(45) DEFAULT NULL,
  `SOLD_PRODUCT__ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_SW_SWG_idx` (`SOLD_WARRANTY_GRP__ID`),
  KEY `FK_SO_SW_idx` (`SOLD_PRODUCT__ID`),
  CONSTRAINT `FK_SO_SW` FOREIGN KEY (`SOLD_PRODUCT__ID`) REFERENCES `sold_product` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SW_SWG` FOREIGN KEY (`SOLD_WARRANTY_GRP__ID`) REFERENCES `sold_warranty_grp` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sold_warranty`
--

LOCK TABLES `sold_warranty` WRITE;
/*!40000 ALTER TABLE `sold_warranty` DISABLE KEYS */;
/*!40000 ALTER TABLE `sold_warranty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sold_warranty_grp`
--

DROP TABLE IF EXISTS `sold_warranty_grp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sold_warranty_grp` (
  `ID` varchar(36) NOT NULL,
  `DISPL_NM` varchar(45) DEFAULT NULL,
  `PARENT_GRP__ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sold_warranty_grp`
--

LOCK TABLES `sold_warranty_grp` WRITE;
/*!40000 ALTER TABLE `sold_warranty_grp` DISABLE KEYS */;
/*!40000 ALTER TABLE `sold_warranty_grp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warranty_provider`
--

DROP TABLE IF EXISTS `warranty_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warranty_provider` (
  `ID` varchar(36) NOT NULL,
  `DISP_NM` varchar(999) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warranty_provider`
--

LOCK TABLES `warranty_provider` WRITE;
/*!40000 ALTER TABLE `warranty_provider` DISABLE KEYS */;
INSERT INTO `warranty_provider` (`ID`, `DISP_NM`) VALUES ('39d8f2f5-6454-40c7-8318-5b852c39df73','cigna');
/*!40000 ALTER TABLE `warranty_provider` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-16 16:18:52
