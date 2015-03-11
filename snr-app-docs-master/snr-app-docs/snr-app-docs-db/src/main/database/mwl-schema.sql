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
  CONSTRAINT `FK_CLNT_AP` FOREIGN KEY (`CLIENT__ID`) REFERENCES `client` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_LANG_AP` FOREIGN KEY (`ACTUAL_PRODUCT_TYPE__ID`) REFERENCES `actual_product_type` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actual_product`
--

LOCK TABLES `actual_product` WRITE;
/*!40000 ALTER TABLE `actual_product` DISABLE KEYS */;
INSERT INTO `actual_product` (`ID`, `DISP_NM`, `RECORD_SRC`, `CLIENT__ID`, `LANGUAGE__ID`, `ACTUAL_PRODUCT_TYPE__ID`) VALUES ('05e0a6ff-8386-47b8-93b5-88c9590aefa3',NULL,'CUST',NULL,NULL,NULL),('0b7092d6-8b0a-4600-aeeb-72276c8cfd63',NULL,'CUST',NULL,NULL,NULL),('0bed7dbe-7b32-4234-8ec5-5c49f62f1078',NULL,'CUST',NULL,NULL,NULL),('0ca1308e-b2de-4e6a-b51c-4e7576f7bdf2',NULL,'CUST',NULL,NULL,NULL),('1','Refreigrator','CUST',NULL,NULL,NULL),('10edda72-6426-477d-a62b-86bf9cdbdf82',NULL,'CUST',NULL,NULL,NULL),('132587bc-bfea-445e-afd5-e1bfbdb98880',NULL,'CUST',NULL,NULL,NULL),('1487e358-e512-4904-821b-b88586e71d8b',NULL,'CUST',NULL,NULL,NULL),('16fea6b4-6ed3-4eb5-9c0d-c38218f7db49',NULL,'CUST',NULL,NULL,NULL),('194fd82b-9899-4f04-adb6-84c66bdd1e06',NULL,'CUST',NULL,NULL,NULL),('1c2118fb-6b93-4522-8fec-2e4c809d0962',NULL,'CUST',NULL,NULL,NULL),('1d69346e-1087-47c9-a0f3-e5647856f241',NULL,'CUST',NULL,NULL,NULL),('2','Dish Washer','CUST',NULL,NULL,NULL),('2015-01-29 20:47:32','Computer i7 Core/16GB RAM/1TB','CLNT','2','2',NULL),('2015-01-29 20:48:19','Computer i5 Core/12GB RAM/2TB','CLNT','2','2',NULL),('2015-01-29 20:52:28','Hard Drive-1TB-Toshiba','CLNT','2','2',NULL),('2015-01-29 20:53:36','Dell Monitor 17\'\'','CLNT','2','2',NULL),('2015-01-29 20:54:58','Samsung Monitor 17\'\'','CLNT','2','2',NULL),('2015-01-29 20:55:31','Laptop-ASUS-01234 ','CLNT','2','2',NULL),('2015-01-29 20:56:02','Laptop-Sony-SN012','CLNT','2','2',NULL),('242d648b-3abc-4117-bc2f-ed27b3b2cd1c',NULL,'CUST',NULL,NULL,NULL),('262b38fc-92b1-41c0-8a0d-f7db25fbab63',NULL,'CUST',NULL,NULL,NULL),('2a7bd5b0-b16b-40ad-9677-96896544a432',NULL,'CUST',NULL,NULL,NULL),('3','Computer','CUST',NULL,NULL,NULL),('30061d15-3c3f-4492-b3c0-ec924c66997c',NULL,'CUST',NULL,NULL,NULL),('33b5ac01-26c3-419d-94b8-ae27503ce436',NULL,'CUST',NULL,NULL,NULL),('34616e9d-65fe-4fc4-a0ab-4b7eaa125b42',NULL,'CUST',NULL,NULL,NULL),('351e5f21-a8ee-4a3f-a0f4-ff7f20110f76',NULL,'CUST',NULL,NULL,NULL),('3ba2d7ff-58b4-4a08-a6ee-e4ca183df076',NULL,'CUST',NULL,NULL,NULL),('4e33516b-315a-4ebd-9577-0d9d45473de8',NULL,'CUST',NULL,NULL,NULL),('4f40c999-92fb-47bd-b0bf-06eee59b1e3c',NULL,'CUST',NULL,NULL,NULL),('4f666eeb-f0f8-4408-985d-d924cdd96df5',NULL,'CUST',NULL,NULL,NULL),('5632d0db-2eb7-40f6-bdc1-4389382a279b',NULL,'CUST',NULL,NULL,NULL),('597431bd-1a79-4de0-aa59-0640f9b2b7eb',NULL,'CUST',NULL,NULL,NULL),('5fc34cc1-f668-470c-a819-4fbd93b9455d',NULL,'CUST',NULL,NULL,NULL),('60f7093e-ca5b-45a4-bdab-e53b18ae0a3a',NULL,'CUST',NULL,NULL,NULL),('61fc2142-2734-42b1-b1ff-3d59ccdc1d31',NULL,'CUST',NULL,NULL,NULL),('63a38649-53a0-4d4a-8f86-17529a2b9103',NULL,'CUST',NULL,NULL,NULL),('63de557a-58db-4f8f-bc7f-129d42aa924c',NULL,'CUST',NULL,NULL,NULL),('64edd3f2-c17b-420f-a0a6-6e725ddfa216',NULL,'CUST',NULL,NULL,NULL),('674fc0cb-d036-4c63-8d5b-e3f3d3e837ca',NULL,'CUST',NULL,NULL,NULL),('68a18da9-06ff-49ba-8bd5-480b02fe292a',NULL,'CUST',NULL,NULL,NULL),('6fe06c17-e070-41a6-accb-7215b01b295e',NULL,'CUST',NULL,NULL,NULL),('772314c6-3fa8-4988-974b-c67555206675',NULL,'CUST',NULL,NULL,NULL),('79800c18-851b-40e7-a9aa-bcd34252c805',NULL,'CUST',NULL,NULL,NULL),('7c394dab-9ddd-4bfd-b017-80240c5a75aa',NULL,'CUST',NULL,NULL,NULL),('7c497a02-57c6-44e3-97ee-2d911b80ec07',NULL,'CUST',NULL,NULL,NULL),('7d1573ed-f91f-4886-8f81-96817c0e120b',NULL,'CUST',NULL,NULL,NULL),('7e1ec7bc-81d7-495d-841e-36a74a4c7d46',NULL,'CUST',NULL,NULL,NULL),('887afda2-89af-4d71-b272-9b62865a8e8f',NULL,'CUST',NULL,NULL,NULL),('8b3cb122-57bd-44a5-91aa-ed59e99cd584',NULL,'CUST',NULL,NULL,NULL),('8c68beda-91c0-4563-be2f-dfc3f079a140',NULL,'CUST',NULL,NULL,NULL),('8e56ef40-e21c-44d6-8e25-1c31529f80bc',NULL,'CUST',NULL,NULL,NULL),('8f3630ed-97ce-4b99-a832-3b85e733a664',NULL,'CUST',NULL,NULL,NULL),('913aff8b-3bc6-4b91-98aa-19b433579ac0',NULL,'CUST',NULL,NULL,NULL),('9198d708-ae43-4a72-a98b-c1af547cf084',NULL,'CUST',NULL,NULL,NULL),('91c9e389-29b2-4985-a2eb-7ab1a14743a5',NULL,'CUST',NULL,NULL,NULL),('94bfa0c5-f1d3-40a6-9961-f55ce7511d76',NULL,'CUST',NULL,NULL,NULL),('958cea34-0804-4e20-9c5b-7bd07162337a',NULL,'CUST',NULL,NULL,NULL),('9a1d79a9-a6d6-4c16-af2d-10327c335e07',NULL,'CUST',NULL,NULL,NULL),('9dd37235-bd64-457c-9128-dc6b1b253df0',NULL,'CUST',NULL,NULL,NULL),('a5863659-67db-4255-a2a2-6d07aa8a1708',NULL,'CUST',NULL,NULL,NULL),('a8282015-3ccf-4f34-9848-029328dc18df',NULL,'CUST',NULL,NULL,NULL),('a940b888-12f4-4589-a0ce-2132c5caa9d8',NULL,'CUST',NULL,NULL,NULL),('adce6c55-65bf-46be-b72d-faf67875da1a',NULL,'CUST',NULL,NULL,NULL),('af3bda72-2574-4649-b3b8-06c36961f37f',NULL,'CUST',NULL,NULL,NULL),('afe5c008-02c8-4b1b-856d-ee9ccefb4ed0',NULL,'CUST',NULL,NULL,NULL),('b52b1d8a-8889-4eb6-8ed7-1fe0b31d03a2',NULL,'CUST',NULL,NULL,NULL),('b5348051-dabf-42da-b6ec-5f1e15e8920e',NULL,'CUST',NULL,NULL,NULL),('b86bfb5e-3a3f-480c-bc5a-3beec7f3650b',NULL,'CUST',NULL,NULL,NULL),('b8a07969-ec8d-409b-9464-df31345c7bb7',NULL,'CUST',NULL,NULL,NULL),('ba36fe83-9f96-4cde-bb07-90d5d93d29af',NULL,'CUST',NULL,NULL,NULL),('ba752971-b131-4fe1-aba3-aa77d05548f3',NULL,'CUST',NULL,NULL,NULL),('bd6c0894-bfbb-45f5-bc9e-e614cdb9044b',NULL,'CUST',NULL,NULL,NULL),('c19fda48-b434-4c18-b885-0bd5257c4ede',NULL,'CUST',NULL,NULL,NULL),('cd01e60b-91fe-4881-935d-0913c54891c3',NULL,'CUST',NULL,NULL,NULL),('d34df074-a723-433b-86d5-e0f3b2d3b7da',NULL,'CUST',NULL,NULL,NULL),('d4a828bf-5e34-44ad-a053-d1908704eb6a',NULL,'CUST',NULL,NULL,NULL),('dc48a349-e322-4c10-b1a8-99b2c7ee724f',NULL,'CUST',NULL,NULL,NULL),('ded4d49b-c3ce-42ff-aa72-3b9ac2c8be3a',NULL,'CUST',NULL,NULL,NULL),('e804f22b-5126-4be4-bec9-ef7e7e90620b',NULL,'CUST',NULL,NULL,NULL),('ee36e814-b7e1-4256-9e0e-7c45214f61d9',NULL,'CUST',NULL,NULL,NULL),('f0450e8d-9153-412f-b61a-b10df93332e9',NULL,'CUST',NULL,NULL,NULL),('f55ec9e9-c260-45eb-a57b-ba615ba6316a',NULL,'CUST',NULL,NULL,NULL),('fa88bb4a-253c-4b65-b6e2-316186ef0567',NULL,'CUST',NULL,NULL,NULL),('fc22f2ae-7d1d-4358-ab68-9d0a27ff30fc',NULL,'CUST',NULL,NULL,NULL),('fca1644a-fbf1-40f7-bd29-4d43ba2adc0b',NULL,'CUST',NULL,NULL,NULL);
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
  `DOCUMENT_MATERIAL_TYPE__ID` varchar(36) DEFAULT NULL,
  `MATERIAL_URL` varchar(999) DEFAULT NULL,
  `IS_DEFAULT` char(1) DEFAULT NULL,
  `SEQUENCE_NUMBER` int(11) DEFAULT NULL,
  `DOCUMENT_CATEGORY__ID` varchar(36) DEFAULT NULL,
  `DOCUMENT_NM` varchar(45) DEFAULT NULL,
  `CREATION_DT` datetime DEFAULT NULL,
  `EXPIRY_DT` datetime DEFAULT NULL,
  `VERSION_NUMBER` varchar(45) DEFAULT NULL,
  `LANGUAGE__ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_APM_AP_idx` (`ACTUAL_PRODUCT__ID`),
  KEY `FK_DOC_CATGRY_APD_idx` (`DOCUMENT_CATEGORY__ID`),
  KEY `FK_DOC_MATR_APD_idx` (`DOCUMENT_MATERIAL_TYPE__ID`),
  KEY `FK_LANG_APD_idx` (`LANGUAGE__ID`),
  CONSTRAINT `FK_LANG_APD` FOREIGN KEY (`LANGUAGE__ID`) REFERENCES `client_supported_languages` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_APM_AP` FOREIGN KEY (`ACTUAL_PRODUCT__ID`) REFERENCES `actual_product` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_DOC_CATGRY_APD` FOREIGN KEY (`DOCUMENT_CATEGORY__ID`) REFERENCES `document_category` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_DOC_MAT_APD` FOREIGN KEY (`DOCUMENT_MATERIAL_TYPE__ID`) REFERENCES `mstr_document_material_type` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actual_product_documents`
--

LOCK TABLES `actual_product_documents` WRITE;
/*!40000 ALTER TABLE `actual_product_documents` DISABLE KEYS */;
INSERT INTO `actual_product_documents` (`ID`, `ACTUAL_PRODUCT__ID`, `DOCUMENT_MATERIAL_TYPE__ID`, `MATERIAL_URL`, `IS_DEFAULT`, `SEQUENCE_NUMBER`, `DOCUMENT_CATEGORY__ID`, `DOCUMENT_NM`, `CREATION_DT`, `EXPIRY_DT`, `VERSION_NUMBER`, `LANGUAGE__ID`) VALUES ('1','1','2','http://placehold.it/250/ffffff/000000','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2','8c68beda-91c0-4563-be2f-dfc3f079a140','2','http://placehold.it/250/ffffff/000000','Y',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2015-01-29 20:56:42','2015-01-29 20:47:32','1','http://www.tinaja.com/glib/pdflink.pdf','1',1,'2','Computer Manual','2015-01-30 00:00:00',NULL,'1.0.0','2'),('2015-01-29 20:57:37','2015-01-29 20:47:32','1','http://www.wave.org.au/jupgrade/images/sample.pdf','0',2,'1','Computer Purchase Bill','2015-01-30 00:00:00',NULL,'1.0.0','2'),('2015-01-29 21:09:41','2015-01-29 20:47:32','1','http://desportoescolar.dge.mec.pt/sites/default/files/newsletters/newsletter1.pdf','0',1,'3','Warranty Document','2015-01-30 00:00:00',NULL,'1.0.0','2'),('2015-01-29 21:10:23','2015-01-29 20:48:19','1','http://desportoescolar.dge.mec.pt/sites/default/files/newsletters/newsletter1.pdf','1',1,'1','Payment Receipt','2015-01-30 00:00:00',NULL,'1.0.0','2'),('2015-01-29 21:11:15','2015-01-29 20:48:19','1','http://desportoescolar.dge.mec.pt/sites/default/files/newsletters/newsletter1.pdf','0',NULL,'2','Manual','2015-01-30 00:00:00',NULL,'','2'),('2015-01-29 21:11:41','2015-01-29 20:48:19','1','','0',NULL,'3','Warranty information','2015-01-30 00:00:00',NULL,'','2'),('2015-01-29 21:12:01','2015-01-29 20:52:28','1','http://desportoescolar.dge.mec.pt/sites/default/files/newsletters/newsletter1.pdf','1',1,'3','Warranty Details','2015-01-30 00:00:00',NULL,'1.0','2'),('2015-01-29 21:12:33','2015-01-29 20:53:36','1','http://desportoescolar.dge.mec.pt/sites/default/files/newsletters/newsletter1.pdf','0',1,'2','Monitor Manual','2015-01-30 00:00:00',NULL,'','2'),('2015-01-29 21:13:00','2015-01-29 20:53:36','1','','0',NULL,'1','Payment Receipt','2015-01-30 00:00:00',NULL,'','2');
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
INSERT INTO `actual_product_property` (`ID`, `DISPLAY_NM`, `LANGUAGE__ID`, `SEQUENCE_NUMBER`, `ACTUAL_PRODUCT_TYPE__ID`, `MSTR_PRODUCT_PROPERTY__ID`, `MSTR_PRODUCT_PROPERTY_VAL_TYP__ID`, `DEFAULT_VALUE`) VALUES ('111','qwqw','1',2,NULL,'3','1','a'),('2015-01-29 21:22:05','Computer Make','2',1,NULL,'1','1','Enter Computer Make'),('2015-01-29 21:22:49','Hard Drive Capacity','2',2,NULL,'2','1',''),('2015-01-29 21:23:22','RAM','2',NULL,NULL,'3','1','');
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
  PRIMARY KEY (`ID`),
  KEY `FK_PRP_APPV_idx` (`ACTUAL_PRODUCT_PROPERTY__ID`),
  CONSTRAINT `FK_PRP_APPV` FOREIGN KEY (`ACTUAL_PRODUCT_PROPERTY__ID`) REFERENCES `actual_product_property` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actual_product_property_value`
--

LOCK TABLES `actual_product_property_value` WRITE;
/*!40000 ALTER TABLE `actual_product_property_value` DISABLE KEYS */;
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
  PRIMARY KEY (`ID`),
  KEY `FK_APP_APPVM_idx` (`ACTUAL_PRODUCT_PROPERTY__ID`),
  KEY `FK_LANG_APPVM_idx` (`LANGUAGE__ID`),
  CONSTRAINT `FK_LANG_APPVM` FOREIGN KEY (`LANGUAGE__ID`) REFERENCES `client_supported_languages` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_APP_APPVM` FOREIGN KEY (`ACTUAL_PRODUCT_PROPERTY__ID`) REFERENCES `actual_product_property` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actual_product_property_value_md`
--

LOCK TABLES `actual_product_property_value_md` WRITE;
/*!40000 ALTER TABLE `actual_product_property_value_md` DISABLE KEYS */;
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
  PRIMARY KEY (`ID`)
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
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` (`ID`, `DISPLAY_NM`) VALUES ('1','Base Client'),('2','Ashwini-Computers'),('3','Thermax'),('4','Courtland Homes');
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
  PRIMARY KEY (`ID`),
  KEY `FK_CLNT_CSL_idx` (`CLIENT__ID`),
  CONSTRAINT `FK_CLNT_CSL` FOREIGN KEY (`CLIENT__ID`) REFERENCES `client` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_supported_languages`
--

LOCK TABLES `client_supported_languages` WRITE;
/*!40000 ALTER TABLE `client_supported_languages` DISABLE KEYS */;
INSERT INTO `client_supported_languages` (`ID`, `DISPLAY_NM`, `EXPIRY_DT`, `CLIENT__ID`, `IS_DEFAULT`, `SEQUENCE_NUMBER`) VALUES ('1','English',NULL,'1','1',1),('2','English-AShwini',NULL,'2','1',1),('2015-01-29 14:58:20','English-Thermax',NULL,'3','1',1),('2015-01-29 14:58:33','English-Courtland',NULL,'4','1',1);
/*!40000 ALTER TABLE `client_supported_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_category`
--

DROP TABLE IF EXISTS `document_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_category` (
  `ID` varchar(36) NOT NULL,
  `DISPLAY_NM` varchar(45) DEFAULT NULL,
  `CLIENT__ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_category`
--

LOCK TABLES `document_category` WRITE;
/*!40000 ALTER TABLE `document_category` DISABLE KEYS */;
INSERT INTO `document_category` (`ID`, `DISPLAY_NM`, `CLIENT__ID`) VALUES ('1','Contracts','1'),('2','Manuals','1'),('3','Warranties','1');
/*!40000 ALTER TABLE `document_category` ENABLE KEYS */;
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
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mstr_document_material_type`
--

LOCK TABLES `mstr_document_material_type` WRITE;
/*!40000 ALTER TABLE `mstr_document_material_type` DISABLE KEYS */;
INSERT INTO `mstr_document_material_type` (`ID`, `DISP_NM`, `EXPIRY_DT`, `MIME_TYPE`) VALUES ('1','PDF',NULL,NULL),('2','DOC',NULL,NULL),('3','MP4',NULL,NULL),('4','EXCEL',NULL,NULL);
/*!40000 ALTER TABLE `mstr_document_material_type` ENABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mstr_property_value_type`
--

LOCK TABLES `mstr_property_value_type` WRITE;
/*!40000 ALTER TABLE `mstr_property_value_type` DISABLE KEYS */;
INSERT INTO `mstr_property_value_type` (`id`, `DISP_NM`, `DESCRIPTION`) VALUES ('1','Text',NULL),('2','Single Select',NULL),('3','Multi Select',NULL);
/*!40000 ALTER TABLE `mstr_property_value_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_seller`
--

DROP TABLE IF EXISTS `product_seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_seller` (
  `ID` varchar(36) NOT NULL,
  `PRODUCT__ID` varchar(36) DEFAULT NULL,
  `SELLER__ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PS_AP_idx` (`PRODUCT__ID`),
  KEY `FK_PS_S_idx` (`SELLER__ID`),
  CONSTRAINT `FK_PS_AP` FOREIGN KEY (`PRODUCT__ID`) REFERENCES `actual_product` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_PS_S` FOREIGN KEY (`SELLER__ID`) REFERENCES `seller` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_seller`
--

LOCK TABLES `product_seller` WRITE;
/*!40000 ALTER TABLE `product_seller` DISABLE KEYS */;
INSERT INTO `product_seller` (`ID`, `PRODUCT__ID`, `SELLER__ID`) VALUES ('02a29cec-f70d-4231-a180-a86ea1281ebb','61fc2142-2734-42b1-b1ff-3d59ccdc1d31','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('0319360a-4ba7-4890-808b-08f6aecd2b72','a8282015-3ccf-4f34-9848-029328dc18df','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('0a4eceb3-97c4-4049-a232-2e54a0aff3fc','fc22f2ae-7d1d-4358-ab68-9d0a27ff30fc','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('1','1','1'),('13478499-6224-46cf-8921-d14ab34ac534','60f7093e-ca5b-45a4-bdab-e53b18ae0a3a','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('14302106-0895-4b2b-928f-f9f5a4a5b881','2a7bd5b0-b16b-40ad-9677-96896544a432','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('2','2','2'),('24663097-d320-450d-ba3c-8b5eb75e2874','64edd3f2-c17b-420f-a0a6-6e725ddfa216','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('272399e5-13fa-4a53-b932-2d980c153d1b','94bfa0c5-f1d3-40a6-9961-f55ce7511d76','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('29ba82e0-68e6-4595-9d06-6c0fbb22615d','b52b1d8a-8889-4eb6-8ed7-1fe0b31d03a2','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('29ff5f18-a73e-493e-b46b-204ed37fc713','9dd37235-bd64-457c-9128-dc6b1b253df0','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('29ffb3ca-e42f-4286-afc2-a51d46a9d7ed','0bed7dbe-7b32-4234-8ec5-5c49f62f1078','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('3173ab7c-0d41-42fc-a6f3-152a6329bc54','b5348051-dabf-42da-b6ec-5f1e15e8920e','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('3645219c-0680-4d98-b901-f7e68e115662','4f40c999-92fb-47bd-b0bf-06eee59b1e3c','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('38539d9a-6f52-4c9f-94e4-aeac72937f6d','afe5c008-02c8-4b1b-856d-ee9ccefb4ed0','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('3ac88f83-82e2-44a4-b29b-77489ebd6c04','f0450e8d-9153-412f-b61a-b10df93332e9','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('428501f0-de11-4345-8a8c-8788ee96a8ce','ee36e814-b7e1-4256-9e0e-7c45214f61d9','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('47886944-910b-48a4-b4f8-e1ac9c7a5fc9','6fe06c17-e070-41a6-accb-7215b01b295e','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('4b00e8d9-4852-4ff5-be45-64d1b25e042b','fa88bb4a-253c-4b65-b6e2-316186ef0567','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('4bba60a3-6cef-4438-9309-65f4ca052fe7','b86bfb5e-3a3f-480c-bc5a-3beec7f3650b','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('4bee98b0-fe3e-45e8-a0f4-9153e9851dec','b8a07969-ec8d-409b-9464-df31345c7bb7','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('4d97bfd2-bceb-4113-86cf-17c88013cb66','8f3630ed-97ce-4b99-a832-3b85e733a664','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('51d94156-e492-4bc8-a430-e59666f6374f','132587bc-bfea-445e-afd5-e1bfbdb98880','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('5a3eeb01-a1f4-4765-9edf-055641d47444','c19fda48-b434-4c18-b885-0bd5257c4ede','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('5efdc424-1fea-46eb-81d2-910377fb0256','242d648b-3abc-4117-bc2f-ed27b3b2cd1c','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('61d02e09-f9b2-45f7-979e-afa476a4554d','7d1573ed-f91f-4886-8f81-96817c0e120b','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('61f32289-2f57-42b2-bcdc-cdfd28f8a471','8c68beda-91c0-4563-be2f-dfc3f079a140','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('65f2f8ad-9785-48ff-825b-7aee266bc7cd','9a1d79a9-a6d6-4c16-af2d-10327c335e07','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('6d23e058-7c5e-4b5a-a00f-ae7754059423','913aff8b-3bc6-4b91-98aa-19b433579ac0','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('6ea33777-5182-4583-a5e3-f26c94f2f19b','5fc34cc1-f668-470c-a819-4fbd93b9455d','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('712725b4-ae37-4ba2-9448-7eb830c49246','958cea34-0804-4e20-9c5b-7bd07162337a','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('7472964f-0a9d-4b5b-a29b-4d27896b38f0','ba752971-b131-4fe1-aba3-aa77d05548f3','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('76730540-8690-4cf0-baee-7fd2f4ee3157','cd01e60b-91fe-4881-935d-0913c54891c3','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('7cb5ba50-5c6a-4257-8f5f-627fe30066cf','597431bd-1a79-4de0-aa59-0640f9b2b7eb','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('7df928c8-0035-4065-9be5-e6717fe71e7e','ba36fe83-9f96-4cde-bb07-90d5d93d29af','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('8237b129-1f63-4c2b-9c67-2eba8b17e95c','d34df074-a723-433b-86d5-e0f3b2d3b7da','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('8819e5c8-5ed1-406c-896e-868e950d6acd','fca1644a-fbf1-40f7-bd29-4d43ba2adc0b','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('8837b2a9-4c3f-4e67-91ec-99e520d07bc2','772314c6-3fa8-4988-974b-c67555206675','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('8af155eb-31fb-4e1b-918e-ec16ed2e2447','16fea6b4-6ed3-4eb5-9c0d-c38218f7db49','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('8bb7e99f-d0f2-4167-ba07-19358f83a0c8','674fc0cb-d036-4c63-8d5b-e3f3d3e837ca','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('93c9f4ea-3a06-40b5-8064-7bfd243315a3','f55ec9e9-c260-45eb-a57b-ba615ba6316a','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('95366a5e-25f8-427f-a59d-b4ac61fa9706','d4a828bf-5e34-44ad-a053-d1908704eb6a','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('98b8ebba-d6e8-44ae-9169-f05683d38bd7','0ca1308e-b2de-4e6a-b51c-4e7576f7bdf2','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('9cb49b75-0d38-4a15-8938-b310172544a6','34616e9d-65fe-4fc4-a0ab-4b7eaa125b42','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('9f2612f6-3be3-4dbf-b36c-df7c142e53a4','4f666eeb-f0f8-4408-985d-d924cdd96df5','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('a00c9700-bd63-4899-bbe6-6b0474bced04','dc48a349-e322-4c10-b1a8-99b2c7ee724f','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('a7b7dcf6-2a24-49c6-abfe-3996cb594aed','adce6c55-65bf-46be-b72d-faf67875da1a','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('aa32626b-10f1-46a7-ad58-3922911b178c','79800c18-851b-40e7-a9aa-bcd34252c805','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('abda0db0-46f0-4e4c-bdf6-886daaac3d2d','30061d15-3c3f-4492-b3c0-ec924c66997c','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('adb94fd5-a7dc-4521-ac2b-40eeda623ef3','e804f22b-5126-4be4-bec9-ef7e7e90620b','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('afd6ef47-7fc8-4558-95de-41738527fb8b','33b5ac01-26c3-419d-94b8-ae27503ce436','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('b37eacc1-6249-4319-9349-a0ad93bc73a7','af3bda72-2574-4649-b3b8-06c36961f37f','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('b3c7c8c7-7283-447c-a606-e43bf1a8a93f','1487e358-e512-4904-821b-b88586e71d8b','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('b63498d7-5b44-4f33-865d-34959a02703d','3ba2d7ff-58b4-4a08-a6ee-e4ca183df076','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('bf467e13-b896-4d55-ac36-a6c127dddaea','7c394dab-9ddd-4bfd-b017-80240c5a75aa','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('c52c401f-ef82-4164-9611-024ddeefbc7f','4e33516b-315a-4ebd-9577-0d9d45473de8','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('c6518578-9ad7-4037-894e-abffc4a1b3e3','68a18da9-06ff-49ba-8bd5-480b02fe292a','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('c9a29e03-ae9e-4d4f-b35a-d8c3c2860abc','63de557a-58db-4f8f-bc7f-129d42aa924c','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('cdc75f57-f094-44c8-902f-b6ad604a1aba','05e0a6ff-8386-47b8-93b5-88c9590aefa3','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('cf9c9286-7e78-4837-b78a-11dfa68d0a76','a5863659-67db-4255-a2a2-6d07aa8a1708','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('d328047a-4ba3-46f6-89ab-7909d3425d40','0b7092d6-8b0a-4600-aeeb-72276c8cfd63','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('d32b8e89-2ea9-4497-9f4d-3fc4964772ae','10edda72-6426-477d-a62b-86bf9cdbdf82','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('d7846e49-56f0-4fc6-aee7-603f49a55905','351e5f21-a8ee-4a3f-a0f4-ff7f20110f76','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('d87b6129-670c-4223-bb22-c2d6cd382cbe','bd6c0894-bfbb-45f5-bc9e-e614cdb9044b','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('dd704851-1f89-4663-ad8e-fcd3a1738fa7','63a38649-53a0-4d4a-8f86-17529a2b9103','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('dd90d863-77ed-48bd-994d-80fc62d87c06','91c9e389-29b2-4985-a2eb-7ab1a14743a5','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('e08464f7-05e1-4474-abac-dbc1d204a7a1','262b38fc-92b1-41c0-8a0d-f7db25fbab63','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('e329bb48-2ba9-4a0f-a295-b23744bbb66b','7c497a02-57c6-44e3-97ee-2d911b80ec07','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('e5647167-fd7d-4bbb-8d9b-98d497d67d56','8e56ef40-e21c-44d6-8e25-1c31529f80bc','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('e5675bdf-0dc4-4507-b551-4219c473d5d4','1d69346e-1087-47c9-a0f3-e5647856f241','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('eac053b8-4096-4d56-bc1c-ed58a19e68cd','194fd82b-9899-4f04-adb6-84c66bdd1e06','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('ec2188d9-bbe8-4f7a-b16d-d4b599bef6fc','a940b888-12f4-4589-a0ce-2132c5caa9d8','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('f41bf000-f8e1-4b79-a249-997ad6497d8d','5632d0db-2eb7-40f6-bdc1-4389382a279b','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5'),('fbf7e4a9-499e-49d2-88f0-9f5250eec85e','887afda2-89af-4d71-b272-9b62865a8e8f','c2170bb8-eed3-4ca3-91d7-374a4abbb5a5');
/*!40000 ALTER TABLE `product_seller` ENABLE KEYS */;
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
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller` (
  `ID` varchar(36) NOT NULL,
  `DISP_NM` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` (`ID`, `DISP_NM`) VALUES ('1','Best Buy'),('2','Costco'),('3','Sams'),('c2170bb8-eed3-4ca3-91d7-374a4abbb5a5','my wallmart');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sold_product`
--

DROP TABLE IF EXISTS `sold_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sold_product` (
  `ID` varchar(36) NOT NULL,
  `PRODUCT_SELLER__ID` varchar(36) DEFAULT NULL,
  `SOLD_WARNTY__ID` varchar(36) DEFAULT NULL,
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
  PRIMARY KEY (`ID`),
  KEY `FK_SP_SW_idx` (`SOLD_WARNTY__ID`),
  KEY `FK_SP_PS_idx` (`PRODUCT_SELLER__ID`),
  CONSTRAINT `FK_SP_PS` FOREIGN KEY (`PRODUCT_SELLER__ID`) REFERENCES `product_seller` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SP_SW` FOREIGN KEY (`SOLD_WARNTY__ID`) REFERENCES `sold_warranty` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sold_product`
--

LOCK TABLES `sold_product` WRITE;
/*!40000 ALTER TABLE `sold_product` DISABLE KEYS */;
INSERT INTO `sold_product` (`ID`, `PRODUCT_SELLER__ID`, `SOLD_WARNTY__ID`, `SALES_PRICE`, `SALES_DT`, `SALES_RECEIPT_NUMBER`, `SALES_REP_NM`, `CUSTOMER__ID`, `SALES_ITEM_NUMBER`, `CUSTOM_NM`, `SOLD_CURRENCY`, `EXPIRY_DT`, `CREATION_DT`) VALUES ('0824a903-3df2-418f-8369-a522d1fad69f','cf9c9286-7e78-4837-b78a-11dfa68d0a76','33c113da-d38b-40be-98f9-ccc764729387',256.54,'2014-12-14 00:00:00','o8fsXSfNln','John','21331456623','item123','UE66nHlkTb','USD',NULL,'2015-01-20 00:00:39'),('1','1','1',12.15,'2014-10-10 00:00:00','Rcpt-1234','Johnny','1','12','Chaise de salle à manger','USD',NULL,NULL),('168e6efa-7194-42b3-9a94-c9ca5e1542cb','61f32289-2f57-42b2-bcdc-cdfd28f8a471','fbea3bb2-89ad-4338-9eed-4318a2b32068',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','cust_product_name','USD',NULL,NULL),('209a922f-985a-4cfb-b672-461260232050','d7846e49-56f0-4fc6-aee7-603f49a55905','5f050ace-7766-4070-9fba-7a5e56a5225a',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('2da42045-1db9-454d-977a-5c08b07b5d9a','51d94156-e492-4bc8-a430-e59666f6374f','89953dbd-89da-4e4e-a1ea-afa79a2e3c77',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('2e9c4d66-a1fd-4279-a11d-9ec276e87b25','8819e5c8-5ed1-406c-896e-868e950d6acd','9719db4f-3a2d-44f6-8875-1a1bfff9281c',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('33f4ead3-8a07-4477-8357-0a6a8440e82a','c52c401f-ef82-4164-9611-024ddeefbc7f','aa885181-ea39-4a6e-8709-16693e979e90',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('34f29c9a-598b-4aef-927b-118ce3e373a2','712725b4-ae37-4ba2-9448-7eb830c49246','6f05368a-a71e-43b9-8448-106cdacb2332',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('3531cfe6-152f-4a62-bcbf-7d59a9cc8c02','02a29cec-f70d-4231-a180-a86ea1281ebb','8e935a11-6ca3-45e4-acaa-bca0de934960',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('373c08a2-9104-4628-99e4-ea2561199e33','b37eacc1-6249-4319-9349-a0ad93bc73a7','944c3a62-1f58-4862-9bc8-255896074368',256.54,'2014-12-14 00:00:00','gYGcVZigHr','John','21331456623','item123','aSsgxSg8q3','USD',NULL,'2015-01-20 00:00:39'),('3a9cad26-a09d-4b9a-a57d-28f8f97db077','e5675bdf-0dc4-4507-b551-4219c473d5d4','b7f034e0-3967-413a-8659-10354b2ea96f',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('48502e2e-0980-4f98-9bf7-9d94c76957a8','24663097-d320-450d-ba3c-8b5eb75e2874','0734b295-e940-43e1-b13a-462388336351',256.54,'2014-12-14 00:00:00','rec4566','John','1','item123','পংক্তিভোজন রুম চেয়ার','USD',NULL,NULL),('4d8c2baa-148c-4b54-88b6-145b4878967d','4b00e8d9-4852-4ff5-be45-64d1b25e042b','ecb67526-8228-44e6-a1e6-a2997f1bdf0a',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('4e9aa9b9-523e-44c8-b7b5-bfb9b549c21e','8837b2a9-4c3f-4e67-91ec-99e520d07bc2','14c68712-2fcb-489e-a289-dad4479f5e38',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('531da919-2077-4003-8938-a42de29e0aa2','d328047a-4ba3-46f6-89ab-7909d3425d40','08440e6b-f997-46d9-aabb-1f860e2ab3e7',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('56687ab8-685c-4348-ac6c-8dd16ee62d8d','0a4eceb3-97c4-4049-a232-2e54a0aff3fc','b7379570-8894-4250-8ba2-014a01eff3ff',256.54,'2014-12-14 00:00:00','bzWNY799Fu','John','21331456623','item123','Ah6clSZNMo','USD',NULL,'2015-01-19 11:07:01'),('57939ca5-35b6-4cbb-94bd-83b833925390','bf467e13-b896-4d55-ac36-a6c127dddaea','2aab9b55-0cbf-4adb-978f-37434e1c1c64',256.54,'2014-12-14 00:00:00','25a6hNxTbT','John','21331456623','item123','LQgLT9Rdhn','USD',NULL,'2015-01-19 11:07:01'),('5b116df1-5c3d-4ea7-a86f-979a2e0ade49','6ea33777-5182-4583-a5e3-f26c94f2f19b','ea777a3a-a74d-46fb-9783-4b711c0f25ef',256.54,'2014-12-14 00:00:00','CZlGCUuOcB','John','21331456623','item123','QH8K4N5DNU','USD',NULL,NULL),('5e7eb455-6878-42af-b005-832e8a972b9e','aa32626b-10f1-46a7-ad58-3922911b178c','efef0eb0-78ea-4396-b281-7ed5992b7175',256.54,'2014-12-14 00:00:00','wZu5HxropI','John','21331456623','item123','zc1Hwgy7qd','USD',NULL,'2015-01-19 11:34:14'),('62952aed-1fcb-4cf1-b43f-7f4fe46f6a13','428501f0-de11-4345-8a8c-8788ee96a8ce','d6bfcfad-28c0-4ad9-988f-d417f7ae58bc',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('63fd6ce8-d798-49d1-a91d-bdcfe59d5962','47886944-910b-48a4-b4f8-e1ac9c7a5fc9','87d3be38-4946-42e5-8b12-8277c13fad76',256.54,'2014-12-14 00:00:00','fadcKl5rUz','John','21331456623','item123','hE2ohxy2Wj','USD',NULL,'2015-01-19 10:04:06'),('6706521a-a72b-4029-99c5-da843503d685','65f2f8ad-9785-48ff-825b-7aee266bc7cd','e9aa8460-b9bf-44c2-9012-05767416d2dc',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('69cb298a-b246-486d-a868-6b17f02b15dd','9f2612f6-3be3-4dbf-b36c-df7c142e53a4','9873a9a7-7f9a-4d51-a3bb-87a5472c6c90',256.54,'2014-12-14 00:00:00','Qra6EUmPtm','John','21331456623','item123','Br4txWMxta','USD',NULL,NULL),('6d7442f2-74f9-46f1-bca8-b9e4671fe3b7','4bee98b0-fe3e-45e8-a0f4-9153e9851dec','812e0e99-f833-4229-aca1-fc18ca7a86a9',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('70aad5ee-c6b9-43f9-b73a-9745401e3712','ec2188d9-bbe8-4f7a-b16d-d4b599bef6fc','4cd8e069-b7d6-4389-95ac-12757e83a847',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('7891614c-2c54-45b2-9614-2372e6812328','272399e5-13fa-4a53-b932-2d980c153d1b','e896b7ea-c015-4b92-ac94-ce1e91de3bd7',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('7df1e2e3-f162-4d59-8740-e32765b41345','8bb7e99f-d0f2-4167-ba07-19358f83a0c8','7c67c753-3086-488c-80a8-3e4e95aaae92',256.54,'2014-12-14 00:00:00','e2mu1huyit','John','21331456623','item123','SA9yXMYqWC','USD',NULL,NULL),('7df6e004-e3a7-476c-88ac-ee454a9c2361','7472964f-0a9d-4b5b-a29b-4d27896b38f0','8a4f85b0-8e68-480a-81b6-14f28afbf3b6',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('7f8a1bd9-604a-4c13-8ac2-20df02ee605b','4d97bfd2-bceb-4113-86cf-17c88013cb66','fad9e71f-6acb-4914-a0e6-f4c0a4ce98b7',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('82bd969b-05ee-400d-b9ed-c9c46f2f456b','dd90d863-77ed-48bd-994d-80fc62d87c06','dea9477e-50b9-4724-8c83-19c832c89dbc',256.54,'2014-12-14 00:00:00','Zatho8LBtY','John','21331456623','item123','8UtbWO496q','USD',NULL,'2015-01-24 06:52:44'),('8b9e9538-0bfa-4be1-868b-6145f831907a','c6518578-9ad7-4037-894e-abffc4a1b3e3','32c83786-aa1e-46ff-b173-b42432722278',256.54,'2014-12-14 00:00:00','3UsoHpWLUc','John','21331456623','item123','W6WQKslFAB','USD',NULL,'2015-01-19 11:34:14'),('8da8011c-729b-45ef-9427-e5a11d96360e','fbf7e4a9-499e-49d2-88f0-9f5250eec85e','3271749c-374d-4fcf-9fc1-8f7c890b2888',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('8e6400bb-d568-46b5-acb5-a6d4c4b05c95','8237b129-1f63-4c2b-9c67-2eba8b17e95c','73aacf48-780f-45b9-8569-a0f87c290c7c',256.54,'2014-12-14 00:00:00','pSupXDubUN','John','21331456623','item123','jerRoFD5nW','USD',NULL,'2015-01-19 11:10:47'),('8ee58128-5ff2-40c7-b1c0-0163d2602eb9','0319360a-4ba7-4890-808b-08f6aecd2b72','0734b295-e940-43e1-b13a-462388336351',256.54,'2014-12-14 00:00:00','aMm9EawxME','John','21331456623','item123','xKQk68eO8b','USD',NULL,NULL),('938c82c4-fa83-4dec-8eb5-ab198d71198c','24663097-d320-450d-ba3c-8b5eb75e2874','6b1e2dc8-8573-44e4-a0f3-d5410e87411b',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('9cd5a891-d083-423b-a765-5589d6587678','cdc75f57-f094-44c8-902f-b6ad604a1aba','332e2434-39fa-4d8d-8c0c-09aa7aff94c4',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD','2015-01-17 18:50:19',NULL),('9e11224b-0c3d-463e-8bab-c97b215e2370','5a3eeb01-a1f4-4765-9edf-055641d47444','754fce6d-350d-4182-92d0-5efd2a23cca8',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('9f047aaa-8422-45e5-bd4b-2bd0cf2e3b46','abda0db0-46f0-4e4c-bdf6-886daaac3d2d','d0b198f8-5d95-4e6e-a563-1a45176ce279',256.54,'2014-12-14 00:00:00','ZGHjwYWU8g','John','21331456623','item123','gOKF3oK9QF','USD',NULL,'2015-01-19 11:35:20'),('a2bdf541-ddc6-4bcf-b11b-5f031e3d557d','4bba60a3-6cef-4438-9309-65f4ca052fe7','54402cb5-48a2-478c-b663-463a6c7c716e',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('a2ff31c2-6e98-414a-aebc-be53490363ee','adb94fd5-a7dc-4521-ac2b-40eeda623ef3','43af4b8d-fde1-40de-b5ad-f20d64fd58c2',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('a72ca43c-9043-4def-9351-0e7286e48f31','e329bb48-2ba9-4a0f-a295-b23744bbb66b','72919642-355f-4b0b-9cda-3808939d8840',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('a74056de-1551-467f-a3a6-cd9af353b2ff','a7b7dcf6-2a24-49c6-abfe-3996cb594aed','99880836-033d-4e24-9c7a-679d2da0b16c',256.54,'2014-12-14 00:00:00','JvyxxhV5A3','John','21331456623','item123','7g1odotkdq','USD',NULL,'2015-01-19 11:34:30'),('ae63c995-5bed-44f4-8343-7f4926f9d9ba','76730540-8690-4cf0-baee-7fd2f4ee3157','fdc640ca-dce1-489b-9f58-66d2ca0440da',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('b4277984-e175-441e-8413-6606a25a102c','9cb49b75-0d38-4a15-8938-b310172544a6','a38a92b3-7ade-4049-9364-da25c8473c78',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('b5cc8346-f1a6-4e79-8d2e-28afbb408cb8','29ff5f18-a73e-493e-b46b-204ed37fc713','7a1cff69-b8bd-4187-afe0-cb12ec93bd9f',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('b6ccea59-f2cd-453a-920d-61c656097f5d','8af155eb-31fb-4e1b-918e-ec16ed2e2447','1c639c25-09bc-4ab1-bea0-b8b4d1c81ef1',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('b73b63d6-c700-42b7-b960-f01869d7410e','95366a5e-25f8-427f-a59d-b4ac61fa9706','587f00eb-a941-431e-ab0c-82411407b556',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('b8d921ee-a2d5-4f83-8d54-7a97976f6ba8','7df928c8-0035-4065-9be5-e6717fe71e7e','3df76f86-a3bd-4458-99bf-fa5f7733b867',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('bc7ef820-79b3-45bf-947f-c3af3d1c4721','a00c9700-bd63-4899-bbe6-6b0474bced04','ee820837-3612-4fd5-aa32-dcad5ef2f07c',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('c0285716-f00e-4f31-b416-038398b69f72','3645219c-0680-4d98-b901-f7e68e115662','4a30cf7c-5b0a-40a7-a0cb-f97611510f21',256.54,'2014-12-14 00:00:00','vyKp2UzoPN','John','21331456623','item123','7EbuYRazs1','USD',NULL,NULL),('c4d3e426-f7a1-4934-80ac-50d614799d8e','29ba82e0-68e6-4595-9d06-6c0fbb22615d','23c7b2ec-72d3-43c6-9e65-ae4883436743',256.54,'2014-12-14 00:00:00','RMa8TZZnZ5','John','21331456623','item123','4Z81dEANvr','USD',NULL,'2015-01-19 10:04:06'),('c5f3c953-24f7-4412-b2b2-ab64185bcf53','b3c7c8c7-7283-447c-a606-e43bf1a8a93f','c4ba5b9f-1c21-4529-b983-0ddd14c6c7d8',256.54,'2014-12-14 00:00:00','Ok18cnGlFR','John','21331456623','item123','6anjklZzQW','USD',NULL,'2015-01-20 09:57:03'),('c8044a7b-033e-4630-87ff-1d9756c652cc','14302106-0895-4b2b-928f-f9f5a4a5b881','5ad4f056-4206-40d1-b856-4e783437f5ab',256.54,'2014-12-14 00:00:00','5OAMxaS3UW','John','21331456623','item123','4tu8EC3MnN','USD',NULL,NULL),('c86fd93f-5c2a-43e3-a013-b3215e80c229','3ac88f83-82e2-44a4-b29b-77489ebd6c04','05df2e33-1754-41b6-8de8-2770e2688b53',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('cbb025f5-df31-4418-8854-325cb3031479','afd6ef47-7fc8-4558-95de-41738527fb8b','41011fe6-db70-4a00-a088-846f62b30341',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('d065416f-fc4f-4ddb-86ca-b40b58a1da7a','d87b6129-670c-4223-bb22-c2d6cd382cbe','2ffcde47-9798-4a74-aa70-3e6f512ebe95',256.54,'2014-12-14 00:00:00','HjAUKZUInK','John','21331456623','item123','jzj6u1CGKf','USD',NULL,'2015-01-19 08:58:08'),('d24215ab-9795-4305-b3a9-a1b446448632','7cb5ba50-5c6a-4257-8f5f-627fe30066cf','7766c6ce-4814-4b99-ab6a-b07e2c921bae',256.54,'2014-12-14 00:00:00','5V8BQLzBrG','John','21331456623','item123','sj9LbQpdhl','USD',NULL,'2015-01-24 06:52:44'),('d2891d92-c5f2-4296-983c-7c7ebc163b42','38539d9a-6f52-4c9f-94e4-aeac72937f6d','48dd58aa-8207-4bf8-af80-397d037638b7',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('d2e9ee5c-21fe-4c58-af6f-8b00320e8222','98b8ebba-d6e8-44ae-9169-f05683d38bd7','b4297489-fb8d-46c7-bb88-f84939ac9c63',256.54,'2014-12-14 00:00:00','vkdLibKmQO','John','21331456623','item123','zGHwhIXq3e','USD',NULL,NULL),('e074383b-9f7e-48e6-b383-19ce5cda7ab3','d32b8e89-2ea9-4497-9f4d-3fc4964772ae','98a06bb7-7200-4a66-8164-62950eb77448',256.54,'2014-12-14 00:00:00','jSeQkubg9J','John','21331456623','item123','Y3wf8wbhrx','USD',NULL,NULL),('e250b853-a44d-4fec-81bf-1748d94225af','93c9f4ea-3a06-40b5-8064-7bfd243315a3','1db8b30b-b746-4a1f-ba0a-d91b8a89683d',256.54,'2014-12-14 00:00:00','ixT6y9FRXv','John','21331456623','item123','ik4XJ2omeU','USD',NULL,'2015-01-20 09:57:03'),('e7a3f8e8-7ddf-4705-9c75-c0fb58e6511f','dd704851-1f89-4663-ad8e-fcd3a1738fa7','9c4cc1ce-69d4-411c-864d-a3d558a9e1e1',256.54,'2014-12-14 00:00:00','nlhmX5mKjT','John','21331456623','item123','Dqs7TSD4B7','USD',NULL,'2015-01-19 11:08:59'),('f17ddcc8-a1dc-4271-83d0-ece6a84f0af0','6d23e058-7c5e-4b5a-a00f-ae7754059423','0bb55179-d5eb-4a47-ba05-e64ae6b51f23',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('f40242a2-e97c-47ee-a6ef-2b564a1ae716','e5647167-fd7d-4bbb-8d9b-98d497d67d56','9edbb6e8-2478-4094-b42d-24dff1ad3c9c',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('f8930071-6103-456b-a993-8536e92b6a2f','3173ab7c-0d41-42fc-a6f3-152a6329bc54','337ed820-74ff-4865-b942-19b7d8c0ed36',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('fa732c78-2223-4318-898f-46d18b137254','29ffb3ca-e42f-4286-afc2-a51d46a9d7ed','15ef06dc-330e-4bbe-bb41-2dffa83993c3',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL),('fc48c51d-95fe-4003-a762-e75bc2a4c207','61d02e09-f9b2-45f7-979e-afa476a4554d','e42388dd-2a1d-48d7-8a20-5e9ac2e7cb89',256.54,'2014-12-14 00:00:00','rec4566','John','21331456623','item123','cust_product_name','USD',NULL,NULL);
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
  PRIMARY KEY (`ID`),
  KEY `FK_SW_SWG_idx` (`SOLD_WARRANTY_GRP__ID`),
  CONSTRAINT `FK_SW_SWG` FOREIGN KEY (`SOLD_WARRANTY_GRP__ID`) REFERENCES `sold_warranty_grp` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sold_warranty`
--

LOCK TABLES `sold_warranty` WRITE;
/*!40000 ALTER TABLE `sold_warranty` DISABLE KEYS */;
INSERT INTO `sold_warranty` (`ID`, `START_DT`, `END_DT`, `WRNTY_AMT`, `AUTO_RENEW`, `WARRANTY_NUMBER`, `WARRANTY_PROVIDER__ID`, `SOLD_WARRANTY_GRP__ID`, `EXPIRY_DT`) VALUES ('05df2e33-1754-41b6-8de8-2770e2688b53','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N','rtyrtyrtyr','39d8f2f5-6454-40c7-8318-5b852c39df73',NULL,NULL),('0734b295-e940-43e1-b13a-462388336351','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'c565d786-1146-4cff-8a38-87d70a71913d',NULL,NULL),('08440e6b-f997-46d9-aabb-1f860e2ab3e7','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,NULL,NULL,NULL),('0b216177-bf46-4d70-a42d-ca89206a5842','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'c565d786-1146-4cff-8a38-87d70a71913d',NULL,NULL),('0bb55179-d5eb-4a47-ba05-e64ae6b51f23','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,NULL,NULL,NULL),('1',NULL,'2014-01-01 00:00:00',1.15,'N','WRNT-2014/11/12/023242-1','Walmart Warranties',NULL,NULL),('14c68712-2fcb-489e-a289-dad4479f5e38','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'c565d786-1146-4cff-8a38-87d70a71913d',NULL,NULL),('15ef06dc-330e-4bbe-bb41-2dffa83993c3','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'7345ccab-8d33-40b3-bbbe-a4fa6d22b7e4',NULL,NULL),('1c639c25-09bc-4ab1-bea0-b8b4d1c81ef1','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'c565d786-1146-4cff-8a38-87d70a71913d',NULL,NULL),('1db8b30b-b746-4a1f-ba0a-d91b8a89683d','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'39d8f2f5-6454-40c7-8318-5b852c39df73',NULL,NULL),('23c7b2ec-72d3-43c6-9e65-ae4883436743','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'c565d786-1146-4cff-8a38-87d70a71913d',NULL,NULL),('2aab9b55-0cbf-4adb-978f-37434e1c1c64','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'c565d786-1146-4cff-8a38-87d70a71913d',NULL,NULL),('2baa976a-cc2e-43c2-8525-03c785ad2dc9','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,NULL,NULL,NULL),('2ffcde47-9798-4a74-aa70-3e6f512ebe95','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'c565d786-1146-4cff-8a38-87d70a71913d',NULL,NULL),('3271749c-374d-4fcf-9fc1-8f7c890b2888','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'c565d786-1146-4cff-8a38-87d70a71913d',NULL,NULL),('32c83786-aa1e-46ff-b173-b42432722278','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'a1f0323a-72f1-4dc9-aac0-6ad66e185eb9',NULL,NULL),('332e2434-39fa-4d8d-8c0c-09aa7aff94c4','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,NULL,NULL,NULL),('337ed820-74ff-4865-b942-19b7d8c0ed36','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'8279b2a3-b16c-4526-848d-68318721e69f',NULL,NULL),('33c113da-d38b-40be-98f9-ccc764729387','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'39d8f2f5-6454-40c7-8318-5b852c39df73',NULL,NULL),('3df76f86-a3bd-4458-99bf-fa5f7733b867','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,NULL,NULL,NULL),('3e398078-32cc-41ca-b700-7dceb5236be6','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,NULL,NULL,NULL),('41011fe6-db70-4a00-a088-846f62b30341','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'8279b2a3-b16c-4526-848d-68318721e69f',NULL,NULL),('43af4b8d-fde1-40de-b5ad-f20d64fd58c2','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,NULL,NULL,NULL),('48dd58aa-8207-4bf8-af80-397d037638b7','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'75592bce-b08b-45be-b2ce-925f58c9bdf1',NULL,NULL),('4a30cf7c-5b0a-40a7-a0cb-f97611510f21','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'c565d786-1146-4cff-8a38-87d70a71913d',NULL,NULL),('4b662bb2-ca04-4b44-931d-e6400cd8660a','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'0e67327e-0ee8-4eae-9508-8add1bcd7620',NULL,NULL),('4cd8e069-b7d6-4389-95ac-12757e83a847','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'c565d786-1146-4cff-8a38-87d70a71913d',NULL,NULL),('5289e9de-9e38-4c69-8d96-93f7657831c4','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'c565d786-1146-4cff-8a38-87d70a71913d',NULL,NULL),('54402cb5-48a2-478c-b663-463a6c7c716e','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,NULL,NULL,NULL),('587f00eb-a941-431e-ab0c-82411407b556','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'8279b2a3-b16c-4526-848d-68318721e69f',NULL,NULL),('5ad4f056-4206-40d1-b856-4e783437f5ab','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'c565d786-1146-4cff-8a38-87d70a71913d',NULL,NULL),('5f050ace-7766-4070-9fba-7a5e56a5225a','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,NULL,NULL,NULL),('6b1e2dc8-8573-44e4-a0f3-d5410e87411b','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,NULL,NULL,NULL),('6f05368a-a71e-43b9-8448-106cdacb2332','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,NULL,NULL,NULL),('72919642-355f-4b0b-9cda-3808939d8840','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,NULL,NULL,NULL),('73aacf48-780f-45b9-8569-a0f87c290c7c','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'a1f0323a-72f1-4dc9-aac0-6ad66e185eb9',NULL,NULL),('754fce6d-350d-4182-92d0-5efd2a23cca8','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'c565d786-1146-4cff-8a38-87d70a71913d',NULL,NULL),('7766c6ce-4814-4b99-ab6a-b07e2c921bae','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'39d8f2f5-6454-40c7-8318-5b852c39df73',NULL,NULL),('77f79639-7d1f-42b7-868f-0d94397f0f36','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,NULL,NULL,NULL),('7a1cff69-b8bd-4187-afe0-cb12ec93bd9f','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,NULL,NULL,NULL),('7c67c753-3086-488c-80a8-3e4e95aaae92','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'c565d786-1146-4cff-8a38-87d70a71913d',NULL,NULL),('812e0e99-f833-4229-aca1-fc18ca7a86a9','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,NULL,NULL,NULL),('8308537e-2c7d-4724-94ba-200a6bb06cae','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'c565d786-1146-4cff-8a38-87d70a71913d',NULL,NULL),('87d3be38-4946-42e5-8b12-8277c13fad76','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'c565d786-1146-4cff-8a38-87d70a71913d',NULL,NULL),('89953dbd-89da-4e4e-a1ea-afa79a2e3c77','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,NULL,NULL,NULL),('8a4f85b0-8e68-480a-81b6-14f28afbf3b6','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'e4e5592a-fc9d-456b-b1b2-074c14a61414',NULL,NULL),('8e935a11-6ca3-45e4-acaa-bca0de934960','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,NULL,NULL,NULL),('944c3a62-1f58-4862-9bc8-255896074368','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'39d8f2f5-6454-40c7-8318-5b852c39df73',NULL,NULL),('9719db4f-3a2d-44f6-8875-1a1bfff9281c','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'7345ccab-8d33-40b3-bbbe-a4fa6d22b7e4',NULL,NULL),('9873a9a7-7f9a-4d51-a3bb-87a5472c6c90','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'c565d786-1146-4cff-8a38-87d70a71913d',NULL,NULL),('98a06bb7-7200-4a66-8164-62950eb77448','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'c565d786-1146-4cff-8a38-87d70a71913d',NULL,NULL),('99880836-033d-4e24-9c7a-679d2da0b16c','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'a1f0323a-72f1-4dc9-aac0-6ad66e185eb9',NULL,NULL),('9c4cc1ce-69d4-411c-864d-a3d558a9e1e1','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'c565d786-1146-4cff-8a38-87d70a71913d',NULL,NULL),('9edbb6e8-2478-4094-b42d-24dff1ad3c9c','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,NULL,NULL,NULL),('a170aae5-3583-4f47-b27d-601590ca7dbb','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,NULL,NULL,NULL),('a38a92b3-7ade-4049-9364-da25c8473c78','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,NULL,NULL,NULL),('aa885181-ea39-4a6e-8709-16693e979e90','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'a63f50c6-b723-4970-936d-0d8e09bcc5f0',NULL,NULL),('b4297489-fb8d-46c7-bb88-f84939ac9c63','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'c565d786-1146-4cff-8a38-87d70a71913d',NULL,NULL),('b7379570-8894-4250-8ba2-014a01eff3ff','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'c565d786-1146-4cff-8a38-87d70a71913d',NULL,NULL),('b7f034e0-3967-413a-8659-10354b2ea96f','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'8279b2a3-b16c-4526-848d-68318721e69f',NULL,NULL),('c4ba5b9f-1c21-4529-b983-0ddd14c6c7d8','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'39d8f2f5-6454-40c7-8318-5b852c39df73',NULL,NULL),('caf59f8a-351a-4afe-82a5-3288493bb4a6','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'c565d786-1146-4cff-8a38-87d70a71913d',NULL,NULL),('d0b198f8-5d95-4e6e-a563-1a45176ce279','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N','hfghfghfg','39d8f2f5-6454-40c7-8318-5b852c39df73',NULL,NULL),('d2c63583-9bc1-4276-896a-0d10449671ce','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'c565d786-1146-4cff-8a38-87d70a71913d',NULL,NULL),('d6bfcfad-28c0-4ad9-988f-d417f7ae58bc','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,NULL,NULL,NULL),('dea9477e-50b9-4724-8c83-19c832c89dbc','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'39d8f2f5-6454-40c7-8318-5b852c39df73',NULL,NULL),('e42388dd-2a1d-48d7-8a20-5e9ac2e7cb89','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,NULL,NULL,NULL),('e896b7ea-c015-4b92-ac94-ce1e91de3bd7','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,NULL,NULL,NULL),('e9aa8460-b9bf-44c2-9012-05767416d2dc','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,NULL,NULL,NULL),('ea777a3a-a74d-46fb-9783-4b711c0f25ef','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'c565d786-1146-4cff-8a38-87d70a71913d',NULL,NULL),('ecb67526-8228-44e6-a1e6-a2997f1bdf0a','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,NULL,NULL,NULL),('ee820837-3612-4fd5-aa32-dcad5ef2f07c','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'c565d786-1146-4cff-8a38-87d70a71913d',NULL,NULL),('efef0eb0-78ea-4396-b281-7ed5992b7175','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,'a1f0323a-72f1-4dc9-aac0-6ad66e185eb9',NULL,NULL),('fad9e71f-6acb-4914-a0e6-f4c0a4ce98b7','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,NULL,NULL,NULL),('fbea3bb2-89ad-4338-9eed-4318a2b32068','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N','gdfgdfg','39d8f2f5-6454-40c7-8318-5b852c39df73',NULL,NULL),('fdc640ca-dce1-489b-9f58-66d2ca0440da','2014-12-14 00:00:00','2015-12-15 00:00:00',78.14,'N',NULL,NULL,NULL,NULL);
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

-- Dump completed on 2015-01-30 15:22:57
