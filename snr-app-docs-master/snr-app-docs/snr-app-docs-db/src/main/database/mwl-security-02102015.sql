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
INSERT INTO `app_pages` (`ID`, `PAGE_NM`, `DESCRIPTION`, `PAGE_PATH`, `APP_PAGE_GROUP__ID`, `PAGE_CD`) VALUES ('1','Product List','','','1',NULL),('2','Product Details','','','1',NULL),('3','Product-Product Specs','','','4',NULL),('4','Product-Documents','','','4',NULL),('5','Product-Claims','','','4',NULL),('6','Login',NULL,NULL,NULL,NULL),('7','Forgot Password',NULL,NULL,NULL,NULL),('8','New Registration',NULL,NULL,NULL,NULL);
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
INSERT INTO `client_access_x_avail_page_grp` (`ID`, `CLIENT__ID`, `APP_PAGE_GROUP__ID`) VALUES ('1','1','1'),('2','1','2'),('3','1','3'),('4','2','1'),('5','2','2'),('6','2','3');
/*!40000 ALTER TABLE `client_access_x_avail_page_grp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `client_pages`
--

DROP TABLE IF EXISTS `client_pages`;
/*!50001 DROP VIEW IF EXISTS `client_pages`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `client_pages` (
  `page_nm` tinyint NOT NULL,
  `page_cd` tinyint NOT NULL,
  `role_nm` tinyint NOT NULL,
  `client__id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

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
INSERT INTO `client_roles` (`ID`, `CLIENT__ID`, `ROLE_NM`, `DESCRIPTION`, `CREATION_DT`, `EXPIRY_DT`, `SEQUENCE_NUMBER`, `SUPERIORITY_LEVEL`) VALUES ('1','2','ASWNI-Super Admins','',NULL,NULL,1,NULL),('2','2','ASWNI-Administrator','',NULL,NULL,2,NULL),('2015-02-09 11:57:38','2','ASWNI-Customer','',NULL,NULL,NULL,NULL),('3','2','ASWNI-Manager','',NULL,NULL,3,NULL),('4','2','ASWNI-Customer Service Agent','',NULL,NULL,4,NULL),('5','1','Customer','',NULL,NULL,NULL,NULL),('6','1','Super Admins','',NULL,NULL,NULL,NULL),('7','1','Administrator','',NULL,NULL,NULL,NULL),('8','1','Customer Service Agent','',NULL,NULL,NULL,NULL);
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
INSERT INTO `client_roles_x_aval_page_roles` (`ID`, `CLIENT_ROLE__ID`, `AAPGXAROLE__ID`) VALUES ('1','2015-02-09 11:57:38','3'),('2','2015-02-09 11:57:38','4'),('2015-02-04 16:08:32','2015-02-09 11:57:38','1'),('2015-02-04 16:10:05','2015-02-09 11:57:38','2015-02-09 11:46:31'),('6','2015-02-09 11:57:38','2015-02-09 11:46:40'),('7','2015-02-09 11:57:38','2015-02-09 11:46:50');
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
INSERT INTO `customer_x_client_role` (`id`, `CUSTOMER__ID`, `CLIENT_role__ID`) VALUES ('1','1','2015-02-09 11:57:38'),('2','1','5');
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

--
-- Final view structure for view `client_pages`
--

/*!50001 DROP TABLE IF EXISTS `client_pages`*/;
/*!50001 DROP VIEW IF EXISTS `client_pages`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mpfb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `client_pages` AS select `available_page_roles`.`page_nm` AS `page_nm`,`available_page_roles`.`page_cd` AS `page_cd`,`available_page_roles`.`role_nm` AS `role_nm`,`client_roles`.`CLIENT__ID` AS `client__id` from ((`available_page_roles` join `client_roles_x_aval_page_roles`) join `client_roles`) where ((`available_page_roles`.`available_app_page_x_app_role_id` = `client_roles_x_aval_page_roles`.`AAPGXAROLE__ID`) and (`client_roles`.`ID` = `client_roles_x_aval_page_roles`.`CLIENT_ROLE__ID`)) */;
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

-- Dump completed on 2015-02-10  9:02:58
