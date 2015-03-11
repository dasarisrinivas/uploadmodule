CREATE DATABASE  IF NOT EXISTS `letssharebooks` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `letssharebooks`;
-- MySQL dump 10.13  Distrib 5.6.17, for osx10.6 (i386)
--
-- Host: sensenrespond.com    Database: letssharebooks
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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `ID` varchar(16) NOT NULL,
  `UPDATED_DATE` datetime DEFAULT NULL,
  `CREATION_DATE` datetime DEFAULT NULL,
  `USER_NM` varchar(45) DEFAULT NULL,
  `PUBLIC_CUSTOMER_ID` varchar(16) DEFAULT NULL,
  `CUSTOMER_RATING` float DEFAULT NULL,
  `REVIEW_COUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('1',NULL,NULL,'Raju','1',1,1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address`
--

DROP TABLE IF EXISTS `customer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address` (
  `ID` varchar(16) NOT NULL,
  `CUSTOMER_ID` varchar(16) NOT NULL,
  `ADDRESS1` varchar(999) NOT NULL,
  `ADDRESS2` varchar(999) DEFAULT NULL,
  `ADDRESS3` varchar(99) DEFAULT NULL,
  `CITY` varchar(999) NOT NULL,
  `STATE` varchar(999) NOT NULL,
  `COUNTRY` varchar(999) NOT NULL,
  `ZIPCODE` varchar(999) DEFAULT NULL,
  `ADDRESS_TYPE_ID` varchar(16) NOT NULL,
  `IS_DEFAULT` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CUSTOMER_ID_FK001_idx` (`CUSTOMER_ID`),
  KEY `ADDRESS_TYPE_ID_FK001_idx` (`ADDRESS_TYPE_ID`),
  CONSTRAINT `CUSTOMER_ID_FK001` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address`
--

LOCK TABLES `customer_address` WRITE;
/*!40000 ALTER TABLE `customer_address` DISABLE KEYS */;
INSERT INTO `customer_address` VALUES ('1','1','155 Concord Dr. S','','','Oswego','IL','USA','60543','1','1'),('2','1','2','2','2','2','2','2','2','2','0');
/*!40000 ALTER TABLE `customer_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_reviews`
--

DROP TABLE IF EXISTS `customer_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_reviews` (
  `ID` varchar(16) NOT NULL,
  `CUSTOMER_ID` varchar(16) NOT NULL,
  `VENDOR_ORDER_ID` varchar(16) NOT NULL,
  `REVIEW_DT` datetime NOT NULL,
  `REVIEW_COMMENTS` varchar(999) NOT NULL,
  `IS_POSITIVE` char(1) DEFAULT NULL,
  `RATING` float DEFAULT NULL,
  `CUSTOMER_RESPONSE_DT` datetime DEFAULT NULL,
  `CUSTOMER_RESPONSE` varchar(999) DEFAULT NULL,
  `IS_REVIEW_DISPLAYABLE` char(1) NOT NULL,
  `IS_RESPONSE_DISPLAYABLE` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CUSTOMER_ID_FK005_idx` (`CUSTOMER_ID`),
  KEY `VENDOR_ORDER_ID_FK0001_idx` (`VENDOR_ORDER_ID`),
  CONSTRAINT `VENDOR_ORDER_ID_FK0001` FOREIGN KEY (`VENDOR_ORDER_ID`) REFERENCES `orders` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CUSTOMER_ID_FK005` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_reviews`
--

LOCK TABLES `customer_reviews` WRITE;
/*!40000 ALTER TABLE `customer_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketable_product`
--

DROP TABLE IF EXISTS `marketable_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marketable_product` (
  `ID` varchar(16) NOT NULL,
  `PRODUCT_ID` varchar(16) NOT NULL,
  `ITEM_CONDITION_TYPE` varchar(45) DEFAULT NULL,
  `COMMENTS` varchar(999) DEFAULT NULL,
  `VENDOR_ID` varchar(16) NOT NULL,
  `MARKET_TYPE_ID` varchar(16) NOT NULL,
  `QUANTITY_AVAILABLE` int(11) NOT NULL DEFAULT '1',
  `MARKETABLE_START_DT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `PRODUCT_ID__FK002_idx` (`PRODUCT_ID`),
  KEY `VENDOR_ID__FK001_idx` (`VENDOR_ID`),
  KEY `MARKET_TYPE_ID_FK003_idx` (`MARKET_TYPE_ID`),
  CONSTRAINT `PRODUCT_ID__FK002` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `VENDOR_ID__FK001` FOREIGN KEY (`VENDOR_ID`) REFERENCES `vendor` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketable_product`
--

LOCK TABLES `marketable_product` WRITE;
/*!40000 ALTER TABLE `marketable_product` DISABLE KEYS */;
INSERT INTO `marketable_product` VALUES ('1','1','1','1','1','1',1,NULL),('2','2','1','LIKE NEW','1','1',1,NULL);
/*!40000 ALTER TABLE `marketable_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketable_product_display_assets`
--

DROP TABLE IF EXISTS `marketable_product_display_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marketable_product_display_assets` (
  `ID` varchar(16) NOT NULL,
  `MARKETABLE_PRODUCT_ID` varchar(16) DEFAULT NULL,
  `ASSET_TYPE` char(1) DEFAULT NULL,
  `ASSET_DISPLAY_NM` varchar(45) DEFAULT NULL,
  `ASSET` blob,
  `DISPLAY_SEQ` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `MARKETABLE_PRODUCT_ID__FK89_idx` (`MARKETABLE_PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketable_product_display_assets`
--

LOCK TABLES `marketable_product_display_assets` WRITE;
/*!40000 ALTER TABLE `marketable_product_display_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketable_product_display_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketable_product_price_options`
--

DROP TABLE IF EXISTS `marketable_product_price_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marketable_product_price_options` (
  `ID` varchar(16) NOT NULL,
  `MARKETABLE_PRODUCT_ID` varchar(16) DEFAULT NULL,
  `DURATION_ID` varchar(16) DEFAULT NULL,
  `PRICE` float DEFAULT NULL,
  `DISCOUNT` float DEFAULT NULL,
  `SAVINGS` float DEFAULT NULL,
  `RENTAL_LOST_PRICE` float DEFAULT NULL,
  `RENTAL_DAMAGE_PRICE` float DEFAULT NULL,
  `RENTAL_ON_HOLD_PRICE` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketable_product_price_options`
--

LOCK TABLES `marketable_product_price_options` WRITE;
/*!40000 ALTER TABLE `marketable_product_price_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketable_product_price_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketable_product_shipping_options`
--

DROP TABLE IF EXISTS `marketable_product_shipping_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marketable_product_shipping_options` (
  `ID` varchar(16) NOT NULL,
  `MARKETABLE_PRODUCT_ID` varchar(16) DEFAULT NULL,
  `SHIPPING_OPTIONS_ID` varchar(16) DEFAULT NULL,
  `PRICE` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketable_product_shipping_options`
--

LOCK TABLES `marketable_product_shipping_options` WRITE;
/*!40000 ALTER TABLE `marketable_product_shipping_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketable_product_shipping_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mstr_category`
--

DROP TABLE IF EXISTS `mstr_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mstr_category` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(45) DEFAULT NULL,
  `EXPIRY_DT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mstr_category`
--

LOCK TABLES `mstr_category` WRITE;
/*!40000 ALTER TABLE `mstr_category` DISABLE KEYS */;
INSERT INTO `mstr_category` VALUES (1,'ADDRESS_TYPE',NULL),(2,'COMM_CHANNEL',NULL),(3,'DURATION',NULL),(4,'MARKET_TYPE',NULL),(5,'ORDER_STATUS',NULL),(6,'PRODUCT_CONDITION',NULL),(7,'PRODUCT_TYPE',NULL),(8,'SHIPPING_OPTIONS',NULL),(9,'SHIPPING_PROVIDER',NULL);
/*!40000 ALTER TABLE `mstr_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mstr_country`
--

DROP TABLE IF EXISTS `mstr_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mstr_country` (
  `ID` varchar(16) NOT NULL,
  `DISPLAY_NM` varchar(45) NOT NULL,
  `COUNTRY_CODE` char(3) NOT NULL,
  `CURRENCY_DISPLAY` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mstr_country`
--

LOCK TABLES `mstr_country` WRITE;
/*!40000 ALTER TABLE `mstr_country` DISABLE KEYS */;
INSERT INTO `mstr_country` VALUES ('1','USA','US',NULL),('2','India','IND',NULL),('3','UK','UK',NULL);
/*!40000 ALTER TABLE `mstr_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mstr_data`
--

DROP TABLE IF EXISTS `mstr_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mstr_data` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(45) DEFAULT NULL,
  `DISPLAY_NM` varchar(45) DEFAULT NULL,
  `DESCR` varchar(999) DEFAULT NULL,
  `COUNTRY_ID` varchar(16) DEFAULT NULL,
  `MSTR_CATEGORY_ID` varchar(16) DEFAULT NULL,
  `EXPIRY_DT` datetime DEFAULT NULL,
  `DISPLAY_SEQUENCE` int(11) DEFAULT NULL,
  `NUMBER_DATA_VALUE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mstr_data`
--

LOCK TABLES `mstr_data` WRITE;
/*!40000 ALTER TABLE `mstr_data` DISABLE KEYS */;
INSERT INTO `mstr_data` VALUES (1,'Home Address','Home Address',NULL,'1','1',NULL,1,NULL),(2,'Office Communication Address','Office Communication Address',NULL,'1','1',NULL,2,NULL),(3,'Registered Address','Registered Address',NULL,'1','1',NULL,3,NULL),(4,'Email','Email',NULL,'1','2',NULL,1,NULL),(5,'Mail','Mail',NULL,'1','2',NULL,2,NULL),(6,'Fax','Fax',NULL,'1','2',NULL,3,NULL),(7,'Text','Text',NULL,'1','2',NULL,4,NULL),(8,'Call','Call',NULL,'1','2',NULL,5,NULL),(9,'45 Days','45 Days',NULL,'1','3',NULL,1,45),(10,'60 Days','60 Days',NULL,'1','3',NULL,2,60),(11,'90 Days','90 Days',NULL,'1','3',NULL,3,90),(12,'Rental','Rental',NULL,'1','4',NULL,1,NULL),(13,'Sell','Sell',NULL,'1','4',NULL,2,NULL),(14,'New','New',NULL,'1','5',NULL,1,NULL),(15,'Order Received','Order Received',NULL,'1','5',NULL,2,NULL),(16,'Under Processing','Under Processing',NULL,'1','5',NULL,3,NULL),(17,'Processed','Processed',NULL,'1','5',NULL,4,NULL),(18,'Delivered','Delivered',NULL,'1','5',NULL,5,NULL),(19,'Cancelled','Cancelled',NULL,'1','5',NULL,6,NULL),(20,'Order Shipped','Order Shipped',NULL,'1','5',NULL,7,NULL),(21,'New','New',NULL,'1','6',NULL,1,NULL),(22,'Like New','Like New',NULL,'1','6',NULL,2,NULL),(23,'Used','Used',NULL,'1','6',NULL,3,NULL),(24,'Non Useable','Non Useable',NULL,'1','6',NULL,4,NULL),(25,'Books','Books',NULL,'1','7',NULL,1,NULL),(26,'Next day Delivery','Next day Delivery',NULL,'1','8',NULL,1,NULL),(27,'2 day delivery','2 day delivery',NULL,'1','8',NULL,2,NULL),(28,'3-5 day delivery','3-5 day delivery',NULL,'1','8',NULL,3,NULL),(29,'USPS','USPS',NULL,'1','9',NULL,1,NULL),(30,'UPS','UPS',NULL,'1','9',NULL,2,NULL),(31,'FedEx','FedEx',NULL,'1','9',NULL,NULL,NULL);
/*!40000 ALTER TABLE `mstr_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item_group_shipping_details`
--

DROP TABLE IF EXISTS `order_item_group_shipping_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_item_group_shipping_details` (
  `ID` varchar(16) NOT NULL,
  `SHIPPING_OPTION_ID` varchar(16) DEFAULT NULL,
  `TRACKING_NUMBER` varchar(999) DEFAULT NULL,
  `TRACKING_NUMBER_LAST_UPDATED_DT` datetime DEFAULT NULL,
  `STATUS_UPDATED_DATE` datetime DEFAULT NULL,
  `ORDER_GROUP_STATUS_ID` varchar(16) DEFAULT NULL,
  `STATUS_DESCRIPTION` varchar(999) DEFAULT NULL,
  `SHIPPING_AMOUNT` float DEFAULT NULL,
  `SHIPPING_DT` datetime DEFAULT NULL,
  `DELIVERY_DT` datetime DEFAULT NULL,
  `TAX_AMOUNT` float DEFAULT NULL,
  `TOTAL_ITEM_GROUP_AMOUNT` float DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SHIPPING_OPTIONS_ID__FK001_idx` (`SHIPPING_OPTION_ID`),
  KEY `CURRENT_STATUS_ID__FK001_idx` (`ORDER_GROUP_STATUS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item_group_shipping_details`
--

LOCK TABLES `order_item_group_shipping_details` WRITE;
/*!40000 ALTER TABLE `order_item_group_shipping_details` DISABLE KEYS */;
INSERT INTO `order_item_group_shipping_details` VALUES ('071d6757-a97d-4','1',NULL,'2014-08-04 06:41:06','2014-08-04 06:41:06','1','this is a status description',12.23,'2014-08-04 06:41:06','2014-08-04 06:41:06',NULL,NULL),('1','26','1','2009-05-18 00:00:00','2009-05-18 00:00:00','17','ww',1,NULL,NULL,NULL,NULL),('1de9936f-5bf2-4','1',NULL,'2014-08-05 06:21:55','2014-08-05 06:21:55','1','this is a status description',12.23,'2014-08-05 06:21:55','2014-08-05 06:21:55',NULL,NULL),('2','26','1','2009-05-18 00:00:00','2009-05-18 00:00:00','2','qw',NULL,NULL,NULL,NULL,NULL),('3a01b6e7-0b8d-4','1',NULL,'2014-08-04 21:54:52','2014-08-04 21:54:52','1','this is a status description',12.23,'2014-08-04 21:54:52','2014-08-04 21:54:52',NULL,NULL),('4b6b3bee-1a2d-4','1',NULL,'2014-08-05 06:54:27','2014-08-05 06:54:27','1','this is a status description',12.23,'2014-08-05 06:54:27','2014-08-05 06:54:27',NULL,NULL),('625195cf-6f90-4','1',NULL,'2014-08-04 21:35:21','2014-08-04 21:35:21','1','this is a status description',12.23,'2014-08-04 21:35:21','2014-08-04 21:35:21',NULL,NULL),('6ec374a8-f967-4','1',NULL,'2014-08-03 22:47:17','2014-08-03 22:47:17','1','this is a status description',12.23,'2014-08-03 22:47:17','2014-08-03 22:47:17',NULL,NULL),('6eeb4567-b59c-4','1',NULL,'2014-08-06 00:26:53','2014-08-06 00:26:53','1','this is a status description',12.23,'2014-08-06 00:26:53','2014-08-06 00:26:53',NULL,NULL),('824088ca-5f89-4','1',NULL,'2014-08-03 22:43:57','2014-08-03 22:43:57','1','this is a status description',12.23,'2014-08-03 22:43:57','2014-08-03 22:43:57',NULL,NULL),('84527c81-8840-4','1',NULL,'2014-08-05 22:25:34','2014-08-05 22:25:34','1','this is a status description',12.23,'2014-08-05 22:25:34','2014-08-05 22:25:34',NULL,NULL),('85efd768-d405-4','1',NULL,'2014-08-05 06:47:08','2014-08-05 06:47:08','1','this is a status description',12.23,'2014-08-05 06:47:08','2014-08-05 06:47:08',NULL,NULL),('8b0ea295-7386-4','1',NULL,'2014-08-05 07:10:41','2014-08-05 07:10:41','1','this is a status description',12.23,'2014-08-05 07:10:41','2014-08-05 07:10:41',NULL,NULL),('984004da-1dfd-4','1',NULL,'2014-08-04 06:43:00','2014-08-04 06:43:00','1','this is a status description',12.23,'2014-08-04 06:43:00','2014-08-04 06:43:00',NULL,NULL),('aad2c70e-70ee-4','1',NULL,'2014-08-05 06:17:30','2014-08-05 06:17:30','1','this is a status description',12.23,'2014-08-05 06:17:30','2014-08-05 06:17:30',NULL,NULL),('af7b0511-aa5e-4','1',NULL,'2014-08-04 06:45:23','2014-08-04 06:45:23','1','this is a status description',12.23,'2014-08-04 06:45:23','2014-08-04 06:45:23',NULL,NULL),('b1a8c640-1cad-4','1',NULL,'2014-08-05 23:46:32','2014-08-05 23:46:32','1','this is a status description',12.23,'2014-08-05 23:46:32','2014-08-05 23:46:32',NULL,NULL),('b33dcaec-f504-4','1',NULL,'2014-08-04 21:31:47','2014-08-04 21:31:47','1','this is a status description',12.23,'2014-08-04 21:31:47','2014-08-04 21:31:47',NULL,NULL),('ca3bbab9-b0e8-4','1',NULL,'2014-08-05 22:13:06','2014-08-05 22:13:06','1','this is a status description',12.23,'2014-08-05 22:13:06','2014-08-05 22:13:06',NULL,NULL),('d11fee78-3cb8-4','1',NULL,'2014-08-03 23:08:39','2014-08-03 23:08:39','1','this is a status description',12.23,'2014-08-03 23:08:39','2014-08-03 23:08:39',NULL,NULL),('d868fee2-4ab7-4','1',NULL,'2014-08-05 07:09:08','2014-08-05 07:09:08','1','this is a status description',12.23,'2014-08-05 07:09:08','2014-08-05 07:09:08',NULL,NULL),('f64ea598-e3c4-4','1',NULL,'2014-08-04 21:25:30','2014-08-04 21:25:30','1','this is a status description',12.23,'2014-08-04 21:25:30','2014-08-04 21:25:30',NULL,NULL),('f6932d1c-f91e-4','1',NULL,'2014-08-03 23:09:56','2014-08-03 23:09:56','1','this is a status description',12.23,'2014-08-03 23:09:56','2014-08-03 23:09:56',NULL,NULL),('f7e5f096-0cbf-4','1',NULL,'2014-08-06 00:13:29','2014-08-06 00:13:29','1','this is a status description',12.23,'2014-08-06 00:13:29','2014-08-06 00:13:29',NULL,NULL);
/*!40000 ALTER TABLE `order_item_group_shipping_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `ID` varchar(16) NOT NULL,
  `ORDER_ID` varchar(16) NOT NULL,
  `MARKETABLE_PRODUCT_ID` varchar(16) NOT NULL,
  `SALE_AMOUNT` float DEFAULT NULL,
  `QUANTITY` int(11) NOT NULL,
  `ITEM_TAX_AMOUNT` float DEFAULT NULL,
  `ORDER_ITEM_GROUP_ID` varchar(16) DEFAULT NULL,
  `VENDOR_ID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `VENDOR_ORDER_ID__FK001_idx` (`ORDER_ID`),
  KEY `MARKETABLE_PRODUCT_ID__FK002_idx` (`MARKETABLE_PRODUCT_ID`),
  CONSTRAINT `MARKETABLE_PRODUCT_ID_FK01` FOREIGN KEY (`MARKETABLE_PRODUCT_ID`) REFERENCES `marketable_product` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ORDER_ID__FK001` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES ('04ab6203-1936-4','1','1',12.12,1,1.22,'1','1'),('0e4a5036-de55-4','1','1',12.12,1,1.22,'1','1'),('1','1','1',11,1,NULL,'1',NULL),('2','1','2',111,2,NULL,'1',NULL),('46a91d30-9943-4','1','1',12.12,1,1.22,'1','1'),('49b586a1-745f-4','1','1',12.12,1,1.22,'1','1'),('4ddeab2b-fa58-4','1','1',12.12,1,1.22,'1','1'),('5bdf5964-c272-4','1','1',12.12,1,1.22,'1',NULL),('6453f191-e25a-4','1','1',12.12,1,1.22,'1','1'),('66da32b6-60cf-4','1','1',12.12,1,1.22,'1','1'),('7086b0e9-39e5-4','1','1',12.12,1,1.22,'1','1'),('7cbf0cc0-c4f2-4','1','1',12.12,1,1.22,'1','1'),('8a8114f8-a5b0-4','1','1',12.12,1,1.22,'1',NULL),('95b6bf3a-0724-4','1','1',12.12,1,1.22,'1','1'),('a82899a6-5c98-4','1','1',12.12,1,1.22,'1','1'),('be7d74a2-92bd-4','1','1',12.12,1,1.22,'1','1'),('c342211f-3574-4','1','1',12.12,1,1.22,'1','1'),('c7da585d-a5f5-4','1','1',12.12,1,1.22,'1','1'),('d6c23ea1-13e7-4','1','1',12.12,1,1.22,'1',NULL),('e6b5df62-1577-4','1','1',12.12,1,1.22,'1','1'),('ebc0bdeb-1182-4','1','1',12.12,1,1.22,'1','1'),('f65ec751-99cf-4','1','1',12.12,1,1.22,'1','1');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `ID` varchar(16) NOT NULL,
  `PUBLIC_ORDER_ID` varchar(16) NOT NULL,
  `ORDER_DT` datetime NOT NULL,
  `TOTAL_ORDER_AMOUNT` float NOT NULL,
  `TOTAL_SHIPPING_AMOUNT` float DEFAULT NULL,
  `TOTAL_TAX_AMOUNT` float DEFAULT NULL,
  `CUSTOMER_ID` varchar(16) NOT NULL,
  `NO_OF_ITEMS` int(11) DEFAULT NULL,
  `CUSTOMER_SHIPPING_ADDRESS_ID` varchar(16) DEFAULT NULL,
  `ORDER_BEFORE_TAX_AMOUNT` float DEFAULT NULL,
  `ORDER_STATUS_ID` varchar(16) DEFAULT NULL,
  `CREATION_DT` datetime DEFAULT NULL,
  `UPDATED_DT` datetime DEFAULT NULL,
  `CREATION_USERID` varchar(16) DEFAULT NULL,
  `UPDATED_USERID` varchar(16) DEFAULT NULL,
  `EXPIRY_DT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CUSTOMER_SHIPPING_ADDRESS_ID__fk002_idx` (`CUSTOMER_SHIPPING_ADDRESS_ID`),
  KEY `ORDER_STATUS_ID__FK0002_idx` (`ORDER_STATUS_ID`),
  CONSTRAINT `CUSTOMER_SHIPPING_ADDRESS_ID__fk002` FOREIGN KEY (`CUSTOMER_SHIPPING_ADDRESS_ID`) REFERENCES `customer_address` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('00d0ebea-aee7-4','663b5aab-0384-4','2014-08-04 06:45:23',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('0802d066-0cc2-4','8b4f42fc-4822-4','2014-08-03 22:40:40',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('0b69d1f0-cc0c-4','a1ec63ac-57c2-4','2014-08-04 21:25:30',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('0db0b224-c062-4','9ffb79db-301f-4','2014-08-03 21:47:21',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('0f460afb-a9dd-4','4344b129-95c9-4','2014-08-03 22:28:45',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('1','1','2009-05-18 00:00:00',1,1,1,'1',1,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('13965f99-1449-4','1b43b419-9ef3-4','2014-08-03 22:12:58',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('18ee0f83-6106-4','e3a9a964-0729-4','2014-08-05 06:54:27',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('1c2cbed1-9207-4','788f63ad-b89b-4','2014-08-04 06:43:00',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('2','2','2014-05-18 00:00:00',1,2,1,'1',1,'1',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2c4114d2-9d58-4','685e77b3-bc6e-4','2014-08-04 21:54:52',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('34ee4528-f81c-4','d5c89f58-79e4-4','2014-08-03 22:07:00',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('3798576f-3c17-4','ab06a901-666a-4','2014-08-03 22:11:03',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('3fe848c6-46bb-4','2b20ee17-8bd8-4','2014-08-03 21:40:20',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('446a596b-effb-4','205274ea-1677-4','2014-08-03 23:08:39',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('4cf5b5cd-0335-4','015551d1-f40e-4','2014-08-03 22:07:52',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('5489b288-ab55-4','3a7ffc8b-a7f6-4','2014-08-04 21:31:47',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('54935faf-d607-4','ec04f004-6b20-4','2014-08-03 22:35:12',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('57664867-7f4d-4','c19584c5-5b8d-4','2014-08-05 06:17:30',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('606eb523-dc7c-4','8b89a9cd-346d-4','2014-08-03 22:09:34',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('6479922f-9365-4','6efa6062-a22f-4','2014-08-05 07:09:08',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('8088f2ae-685f-4','1913f10d-61b1-4','2014-08-04 21:35:21',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('89f32e82-58c4-4','b1eeb358-6c8f-4','2014-08-06 00:26:52',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('8d488b9a-3af0-4','284896ba-5459-4','2014-08-03 22:43:57',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('8f9eb650-1854-4','6808c266-51f7-4','2014-08-03 22:21:54',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('956a6359-f18a-4','edd40736-859d-4','2014-08-05 07:10:41',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('9e0b72c3-b0a2-4','cf5760e0-9d54-4','2014-08-05 22:13:08',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('a5ed1316-44f5-4','d8b645c7-521b-4','2014-08-03 08:52:06',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('a67a0cde-6fcf-4','3a02eb4d-54ae-4','2014-08-03 23:09:56',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('a7867700-bafa-4','f3c797f2-8e61-4','2014-08-05 22:25:36',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('ba0fd77a-d88d-4','07539025-25e3-4','2014-08-03 21:45:23',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('bddeb06b-4c63-4','cbedd004-ea11-4','2014-08-03 22:47:17',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('bef757e8-98b1-4','0638e2fc-86ea-4','2014-08-03 21:41:43',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('d617f3df-29c2-4','ccc0864f-6986-4','2014-08-05 23:46:33',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('e744e7a9-0424-4','ca79b863-56b9-4','2014-08-03 21:44:39',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('eb953b0b-f081-4','799f5feb-f654-4','2014-08-05 06:21:55',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('f239da99-264f-4','5f75a2e2-9daf-4','2014-08-05 06:47:08',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('f825202b-75af-4','c26b780d-b72f-4','2014-08-03 21:42:32',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL),('fada8c5c-986d-4','eed45bf8-2b6c-4','2014-08-06 00:13:25',21.11,3.95,4.25,'1',1,'1',11.21,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_void`
--

DROP TABLE IF EXISTS `orders_void`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_void` (
  `ID` varchar(16) NOT NULL,
  `ORDER_ID` varchar(16) DEFAULT NULL,
  `REASON_TO_VOID` varchar(999) DEFAULT NULL,
  `VOID_REASON_CATEGORY` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ORDERS_ID_idx` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_void`
--

LOCK TABLES `orders_void` WRITE;
/*!40000 ALTER TABLE `orders_void` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_void` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `ID` varchar(16) NOT NULL,
  `F_NAME` varchar(999) DEFAULT NULL,
  `M_NAME` varchar(999) DEFAULT NULL,
  `L_NAME` varchar(999) DEFAULT NULL,
  `EMAIL1` varchar(45) DEFAULT NULL,
  `EMAIL2` varchar(45) DEFAULT NULL,
  `USER_ID` varchar(45) DEFAULT NULL,
  `FACEBOOK_ID` varchar(45) DEFAULT NULL,
  `TWEETER_ID` varchar(45) DEFAULT NULL,
  `CUSTOMER_ID` varchar(16) DEFAULT NULL,
  `VENDOR_ID` varchar(16) DEFAULT NULL,
  `COUNTRY_ID` varchar(16) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `CUSTOMER_ID__FK012_idx` (`CUSTOMER_ID`),
  KEY `VENDOR_ID__FK012_idx` (`VENDOR_ID`),
  CONSTRAINT `CUSTOMER_ID__FK012` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `VENDOR_ID__FK012` FOREIGN KEY (`VENDOR_ID`) REFERENCES `vendor` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `ID` varchar(16) NOT NULL,
  `PRODUCT_NM` varchar(999) DEFAULT NULL,
  `PRODUCT_DISPLAY_NM` varchar(999) NOT NULL,
  `PRODUCT_PUBLIC_ID` varchar(45) NOT NULL,
  `PRODUCT_SUMMARY` varchar(999) DEFAULT NULL,
  `LIST_PRICE` float NOT NULL,
  `PRODUCT_TYPE_ID` varchar(16) NOT NULL,
  `EXPIRY_DT` datetime DEFAULT NULL,
  `CREATED_USERID` varchar(45) DEFAULT NULL,
  `UPDATED_USERID` varchar(45) DEFAULT NULL,
  `LAST_UPDATED_DATETIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('1','Open ESB for beginners','Open ESB for beginners','1','This is also another book.',20.15,'1',NULL,NULL,NULL,NULL),('2','SOA for Dummies','SOA for Dummies','2','This is a book',32.15,'1',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_propertys`
--

DROP TABLE IF EXISTS `product_propertys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_propertys` (
  `ID` varchar(16) NOT NULL,
  `PROPERTY_NM` varchar(45) DEFAULT NULL,
  `PROPERTY_DISPLAY_NM` varchar(45) NOT NULL,
  `PRODUCT_ID` varchar(16) NOT NULL,
  `IS_PROPERTY_TAGGABLE` char(1) DEFAULT NULL,
  `DISPLAY_SEQ` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `PRODUCT__ID_FK_idx` (`PRODUCT_ID`),
  CONSTRAINT `PRODUCT__ID_FK` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_propertys`
--

LOCK TABLES `product_propertys` WRITE;
/*!40000 ALTER TABLE `product_propertys` DISABLE KEYS */;
INSERT INTO `product_propertys` VALUES ('1','Book Name','Book Name','1','Y',1),('2','Author','Author','1','Y',2),('3','ISBN-10','ISBN-10','1','Y',3),('4','ISBN-13','ISBN-13','1','Y',4),('5','Publisher','Publisher','1','Y',5),('6','Language','Language','1','Y',6),('7','Edition','Edition','1','Y',7),('8','Product Dimensions','Product Dimensions','1','N',8),('9','Shipping Weight','Shipping Weight','1','N',9);
/*!40000 ALTER TABLE `product_propertys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_propertys_value`
--

DROP TABLE IF EXISTS `product_propertys_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_propertys_value` (
  `ID` varchar(16) NOT NULL,
  `PRODUCT_ID` varchar(16) NOT NULL,
  `PRODUCT_PROPERTYS_ID` varchar(16) NOT NULL,
  `PRODUCT_VALUE` varchar(45) NOT NULL,
  `EXPIRY_DT` datetime DEFAULT NULL,
  `CREATED_USERID` varchar(45) DEFAULT NULL,
  `UPDATED_USERID` varchar(45) DEFAULT NULL,
  `LAST_UPDATED_DATETIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `PRODUCT__ID_FK001_idx` (`PRODUCT_ID`),
  KEY `PRODUCT_PROP_ID__FK001_idx` (`PRODUCT_PROPERTYS_ID`),
  CONSTRAINT `PRODUCT_PROP_ID__FK001` FOREIGN KEY (`PRODUCT_PROPERTYS_ID`) REFERENCES `product_propertys` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PRODUCT__ID_FK001` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_propertys_value`
--

LOCK TABLES `product_propertys_value` WRITE;
/*!40000 ALTER TABLE `product_propertys_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_propertys_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_reviews`
--

DROP TABLE IF EXISTS `product_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_reviews` (
  `ID` varchar(16) NOT NULL,
  `PRODUCT_ID` varchar(16) DEFAULT NULL,
  `PRODUCT_REVIEW_DESCR` varchar(999) DEFAULT NULL,
  `RATING` int(11) DEFAULT NULL,
  `IS_POSITIVE` char(1) DEFAULT NULL,
  `WILL_RECOMMEND` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_reviews`
--

LOCK TABLES `product_reviews` WRITE;
/*!40000 ALTER TABLE `product_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_tags`
--

DROP TABLE IF EXISTS `product_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_tags` (
  `ID` varchar(16) NOT NULL,
  `MARKETABLE_PRODUCT_ID` varchar(16) NOT NULL,
  `VENDOR_ID` varchar(16) DEFAULT NULL,
  `TAG_KEY` varchar(999) NOT NULL,
  `TAG_VALUE` varchar(999) NOT NULL,
  `EXPIRY_DT` datetime DEFAULT NULL,
  `CREATED_USERID` varchar(45) DEFAULT NULL,
  `UPDATED_USERID` varchar(45) DEFAULT NULL,
  `LAST_UPDATED_DATETIME` datetime DEFAULT NULL,
  `PRODUCT_ID` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `MARKETABLE_PRODUCT_ID__FK004_idx` (`MARKETABLE_PRODUCT_ID`),
  KEY `VENDOR_ID__FK004_idx` (`VENDOR_ID`),
  CONSTRAINT `MARKETABLE_PRODUCT_ID__FK004` FOREIGN KEY (`MARKETABLE_PRODUCT_ID`) REFERENCES `marketable_product` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `VENDOR_ID__FK004` FOREIGN KEY (`VENDOR_ID`) REFERENCES `vendor` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_tags`
--

LOCK TABLES `product_tags` WRITE;
/*!40000 ALTER TABLE `product_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `renew_options`
--

DROP TABLE IF EXISTS `renew_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `renew_options` (
  `ID` varchar(16) NOT NULL,
  `IS_AUTO_RENEW` char(1) DEFAULT NULL,
  `IS_RENEWABLE` char(1) DEFAULT NULL,
  `MAX_RENEW_COUNT` int(11) DEFAULT NULL,
  `MARKETABLE_PRODUCT_ID` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `MARKETABLE_PRODUCT_ID__FK001_idx` (`MARKETABLE_PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `renew_options`
--

LOCK TABLES `renew_options` WRITE;
/*!40000 ALTER TABLE `renew_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `renew_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor` (
  `ID` varchar(16) NOT NULL,
  `VENDOR_EMAIL` varchar(999) NOT NULL,
  `DISPLAY_NM` varchar(999) NOT NULL,
  `VENDOR_RATING` float DEFAULT NULL,
  `REVIEW_COUNT` int(11) DEFAULT NULL,
  `CREATION_DT` datetime DEFAULT NULL,
  `UPDATED_DT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES ('1','1','1',1,1,NULL,NULL);
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_reviews`
--

DROP TABLE IF EXISTS `vendor_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_reviews` (
  `ID` varchar(16) NOT NULL,
  `VENDOR_ID` varchar(16) NOT NULL,
  `VENDOR_ORDER_ID` varchar(16) NOT NULL,
  `REVIEW_DT` datetime NOT NULL,
  `REVIEW_COMMENTS` varchar(999) NOT NULL,
  `IS_POSITIVE` char(1) DEFAULT NULL,
  `RATING` float DEFAULT NULL,
  `VENDOR_RESPONSE_DT` datetime DEFAULT NULL,
  `VENDOR_RESPONSE` varchar(999) DEFAULT NULL,
  `IS_REVIEW_DISPLAYABLE` char(1) NOT NULL,
  `IS_RESPONSE_DISPLAYABLE` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `VENDOR_ID_FK005_idx` (`VENDOR_ID`),
  KEY `VENDOR_ORDER_ID_FK002_idx` (`VENDOR_ORDER_ID`),
  CONSTRAINT `VENDOR_ORDER_ID_FK002` FOREIGN KEY (`VENDOR_ORDER_ID`) REFERENCES `orders` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `VENDOR_ID_FK005` FOREIGN KEY (`VENDOR_ID`) REFERENCES `vendor` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_reviews`
--

LOCK TABLES `vendor_reviews` WRITE;
/*!40000 ALTER TABLE `vendor_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_address_typ_mstr`
--

DROP TABLE IF EXISTS `vw_address_typ_mstr`;
/*!50001 DROP VIEW IF EXISTS `vw_address_typ_mstr`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_address_typ_mstr` (
  `ID` tinyint NOT NULL,
  `NAME` tinyint NOT NULL,
  `DISPLAY_NM` tinyint NOT NULL,
  `DESCR` tinyint NOT NULL,
  `COUNTRY_ID` tinyint NOT NULL,
  `MSTR_CATEGORY_ID` tinyint NOT NULL,
  `EXPIRY_DT` tinyint NOT NULL,
  `DISPLAY_SEQUENCE` tinyint NOT NULL,
  `NUMBER_DATA_VALUE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_comm_channel_mstr`
--

DROP TABLE IF EXISTS `vw_comm_channel_mstr`;
/*!50001 DROP VIEW IF EXISTS `vw_comm_channel_mstr`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_comm_channel_mstr` (
  `ID` tinyint NOT NULL,
  `NAME` tinyint NOT NULL,
  `DISPLAY_NM` tinyint NOT NULL,
  `DESCR` tinyint NOT NULL,
  `COUNTRY_ID` tinyint NOT NULL,
  `MSTR_CATEGORY_ID` tinyint NOT NULL,
  `EXPIRY_DT` tinyint NOT NULL,
  `DISPLAY_SEQUENCE` tinyint NOT NULL,
  `NUMBER_DATA_VALUE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_duration_mstr`
--

DROP TABLE IF EXISTS `vw_duration_mstr`;
/*!50001 DROP VIEW IF EXISTS `vw_duration_mstr`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_duration_mstr` (
  `ID` tinyint NOT NULL,
  `NAME` tinyint NOT NULL,
  `DISPLAY_NM` tinyint NOT NULL,
  `DESCR` tinyint NOT NULL,
  `COUNTRY_ID` tinyint NOT NULL,
  `MSTR_CATEGORY_ID` tinyint NOT NULL,
  `EXPIRY_DT` tinyint NOT NULL,
  `DISPLAY_SEQUENCE` tinyint NOT NULL,
  `NUMBER_DATA_VALUE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_market_type_mstr`
--

DROP TABLE IF EXISTS `vw_market_type_mstr`;
/*!50001 DROP VIEW IF EXISTS `vw_market_type_mstr`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_market_type_mstr` (
  `ID` tinyint NOT NULL,
  `NAME` tinyint NOT NULL,
  `DISPLAY_NM` tinyint NOT NULL,
  `DESCR` tinyint NOT NULL,
  `COUNTRY_ID` tinyint NOT NULL,
  `MSTR_CATEGORY_ID` tinyint NOT NULL,
  `EXPIRY_DT` tinyint NOT NULL,
  `DISPLAY_SEQUENCE` tinyint NOT NULL,
  `NUMBER_DATA_VALUE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_order_status_mstr`
--

DROP TABLE IF EXISTS `vw_order_status_mstr`;
/*!50001 DROP VIEW IF EXISTS `vw_order_status_mstr`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_order_status_mstr` (
  `ID` tinyint NOT NULL,
  `NAME` tinyint NOT NULL,
  `DISPLAY_NM` tinyint NOT NULL,
  `DESCR` tinyint NOT NULL,
  `COUNTRY_ID` tinyint NOT NULL,
  `MSTR_CATEGORY_ID` tinyint NOT NULL,
  `EXPIRY_DT` tinyint NOT NULL,
  `DISPLAY_SEQUENCE` tinyint NOT NULL,
  `NUMBER_DATA_VALUE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_product_condition_mstr`
--

DROP TABLE IF EXISTS `vw_product_condition_mstr`;
/*!50001 DROP VIEW IF EXISTS `vw_product_condition_mstr`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_product_condition_mstr` (
  `ID` tinyint NOT NULL,
  `NAME` tinyint NOT NULL,
  `DISPLAY_NM` tinyint NOT NULL,
  `DESCR` tinyint NOT NULL,
  `COUNTRY_ID` tinyint NOT NULL,
  `MSTR_CATEGORY_ID` tinyint NOT NULL,
  `EXPIRY_DT` tinyint NOT NULL,
  `DISPLAY_SEQUENCE` tinyint NOT NULL,
  `NUMBER_DATA_VALUE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_product_type_mstr`
--

DROP TABLE IF EXISTS `vw_product_type_mstr`;
/*!50001 DROP VIEW IF EXISTS `vw_product_type_mstr`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_product_type_mstr` (
  `ID` tinyint NOT NULL,
  `NAME` tinyint NOT NULL,
  `DISPLAY_NM` tinyint NOT NULL,
  `DESCR` tinyint NOT NULL,
  `COUNTRY_ID` tinyint NOT NULL,
  `MSTR_CATEGORY_ID` tinyint NOT NULL,
  `EXPIRY_DT` tinyint NOT NULL,
  `DISPLAY_SEQUENCE` tinyint NOT NULL,
  `NUMBER_DATA_VALUE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_shipping_options_mstr`
--

DROP TABLE IF EXISTS `vw_shipping_options_mstr`;
/*!50001 DROP VIEW IF EXISTS `vw_shipping_options_mstr`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_shipping_options_mstr` (
  `ID` tinyint NOT NULL,
  `NAME` tinyint NOT NULL,
  `DISPLAY_NM` tinyint NOT NULL,
  `DESCR` tinyint NOT NULL,
  `COUNTRY_ID` tinyint NOT NULL,
  `MSTR_CATEGORY_ID` tinyint NOT NULL,
  `EXPIRY_DT` tinyint NOT NULL,
  `DISPLAY_SEQUENCE` tinyint NOT NULL,
  `NUMBER_DATA_VALUE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_shipping_provider_mstr`
--

DROP TABLE IF EXISTS `vw_shipping_provider_mstr`;
/*!50001 DROP VIEW IF EXISTS `vw_shipping_provider_mstr`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_shipping_provider_mstr` (
  `ID` tinyint NOT NULL,
  `NAME` tinyint NOT NULL,
  `DISPLAY_NM` tinyint NOT NULL,
  `DESCR` tinyint NOT NULL,
  `COUNTRY_ID` tinyint NOT NULL,
  `MSTR_CATEGORY_ID` tinyint NOT NULL,
  `EXPIRY_DT` tinyint NOT NULL,
  `DISPLAY_SEQUENCE` tinyint NOT NULL,
  `NUMBER_DATA_VALUE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_address_typ_mstr`
--

/*!50001 DROP TABLE IF EXISTS `vw_address_typ_mstr`*/;
/*!50001 DROP VIEW IF EXISTS `vw_address_typ_mstr`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mpfb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_address_typ_mstr` AS select `mstr_data`.`ID` AS `ID`,`mstr_data`.`NAME` AS `NAME`,`mstr_data`.`DISPLAY_NM` AS `DISPLAY_NM`,`mstr_data`.`DESCR` AS `DESCR`,`mstr_data`.`COUNTRY_ID` AS `COUNTRY_ID`,`mstr_data`.`MSTR_CATEGORY_ID` AS `MSTR_CATEGORY_ID`,`mstr_data`.`EXPIRY_DT` AS `EXPIRY_DT`,`mstr_data`.`DISPLAY_SEQUENCE` AS `DISPLAY_SEQUENCE`,`mstr_data`.`NUMBER_DATA_VALUE` AS `NUMBER_DATA_VALUE` from `mstr_data` where (`mstr_data`.`MSTR_CATEGORY_ID` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_comm_channel_mstr`
--

/*!50001 DROP TABLE IF EXISTS `vw_comm_channel_mstr`*/;
/*!50001 DROP VIEW IF EXISTS `vw_comm_channel_mstr`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mpfb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_comm_channel_mstr` AS select `mstr_data`.`ID` AS `ID`,`mstr_data`.`NAME` AS `NAME`,`mstr_data`.`DISPLAY_NM` AS `DISPLAY_NM`,`mstr_data`.`DESCR` AS `DESCR`,`mstr_data`.`COUNTRY_ID` AS `COUNTRY_ID`,`mstr_data`.`MSTR_CATEGORY_ID` AS `MSTR_CATEGORY_ID`,`mstr_data`.`EXPIRY_DT` AS `EXPIRY_DT`,`mstr_data`.`DISPLAY_SEQUENCE` AS `DISPLAY_SEQUENCE`,`mstr_data`.`NUMBER_DATA_VALUE` AS `NUMBER_DATA_VALUE` from `mstr_data` where (`mstr_data`.`MSTR_CATEGORY_ID` = '2') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_duration_mstr`
--

/*!50001 DROP TABLE IF EXISTS `vw_duration_mstr`*/;
/*!50001 DROP VIEW IF EXISTS `vw_duration_mstr`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mpfb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_duration_mstr` AS select `mstr_data`.`ID` AS `ID`,`mstr_data`.`NAME` AS `NAME`,`mstr_data`.`DISPLAY_NM` AS `DISPLAY_NM`,`mstr_data`.`DESCR` AS `DESCR`,`mstr_data`.`COUNTRY_ID` AS `COUNTRY_ID`,`mstr_data`.`MSTR_CATEGORY_ID` AS `MSTR_CATEGORY_ID`,`mstr_data`.`EXPIRY_DT` AS `EXPIRY_DT`,`mstr_data`.`DISPLAY_SEQUENCE` AS `DISPLAY_SEQUENCE`,`mstr_data`.`NUMBER_DATA_VALUE` AS `NUMBER_DATA_VALUE` from `mstr_data` where (`mstr_data`.`MSTR_CATEGORY_ID` = '3') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_market_type_mstr`
--

/*!50001 DROP TABLE IF EXISTS `vw_market_type_mstr`*/;
/*!50001 DROP VIEW IF EXISTS `vw_market_type_mstr`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mpfb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_market_type_mstr` AS select `mstr_data`.`ID` AS `ID`,`mstr_data`.`NAME` AS `NAME`,`mstr_data`.`DISPLAY_NM` AS `DISPLAY_NM`,`mstr_data`.`DESCR` AS `DESCR`,`mstr_data`.`COUNTRY_ID` AS `COUNTRY_ID`,`mstr_data`.`MSTR_CATEGORY_ID` AS `MSTR_CATEGORY_ID`,`mstr_data`.`EXPIRY_DT` AS `EXPIRY_DT`,`mstr_data`.`DISPLAY_SEQUENCE` AS `DISPLAY_SEQUENCE`,`mstr_data`.`NUMBER_DATA_VALUE` AS `NUMBER_DATA_VALUE` from `mstr_data` where (`mstr_data`.`MSTR_CATEGORY_ID` = '4') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_order_status_mstr`
--

/*!50001 DROP TABLE IF EXISTS `vw_order_status_mstr`*/;
/*!50001 DROP VIEW IF EXISTS `vw_order_status_mstr`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mpfb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_order_status_mstr` AS select `mstr_data`.`ID` AS `ID`,`mstr_data`.`NAME` AS `NAME`,`mstr_data`.`DISPLAY_NM` AS `DISPLAY_NM`,`mstr_data`.`DESCR` AS `DESCR`,`mstr_data`.`COUNTRY_ID` AS `COUNTRY_ID`,`mstr_data`.`MSTR_CATEGORY_ID` AS `MSTR_CATEGORY_ID`,`mstr_data`.`EXPIRY_DT` AS `EXPIRY_DT`,`mstr_data`.`DISPLAY_SEQUENCE` AS `DISPLAY_SEQUENCE`,`mstr_data`.`NUMBER_DATA_VALUE` AS `NUMBER_DATA_VALUE` from `mstr_data` where (`mstr_data`.`MSTR_CATEGORY_ID` = '5') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_product_condition_mstr`
--

/*!50001 DROP TABLE IF EXISTS `vw_product_condition_mstr`*/;
/*!50001 DROP VIEW IF EXISTS `vw_product_condition_mstr`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mpfb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_product_condition_mstr` AS select `mstr_data`.`ID` AS `ID`,`mstr_data`.`NAME` AS `NAME`,`mstr_data`.`DISPLAY_NM` AS `DISPLAY_NM`,`mstr_data`.`DESCR` AS `DESCR`,`mstr_data`.`COUNTRY_ID` AS `COUNTRY_ID`,`mstr_data`.`MSTR_CATEGORY_ID` AS `MSTR_CATEGORY_ID`,`mstr_data`.`EXPIRY_DT` AS `EXPIRY_DT`,`mstr_data`.`DISPLAY_SEQUENCE` AS `DISPLAY_SEQUENCE`,`mstr_data`.`NUMBER_DATA_VALUE` AS `NUMBER_DATA_VALUE` from `mstr_data` where (`mstr_data`.`MSTR_CATEGORY_ID` = '6') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_product_type_mstr`
--

/*!50001 DROP TABLE IF EXISTS `vw_product_type_mstr`*/;
/*!50001 DROP VIEW IF EXISTS `vw_product_type_mstr`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mpfb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_product_type_mstr` AS select `mstr_data`.`ID` AS `ID`,`mstr_data`.`NAME` AS `NAME`,`mstr_data`.`DISPLAY_NM` AS `DISPLAY_NM`,`mstr_data`.`DESCR` AS `DESCR`,`mstr_data`.`COUNTRY_ID` AS `COUNTRY_ID`,`mstr_data`.`MSTR_CATEGORY_ID` AS `MSTR_CATEGORY_ID`,`mstr_data`.`EXPIRY_DT` AS `EXPIRY_DT`,`mstr_data`.`DISPLAY_SEQUENCE` AS `DISPLAY_SEQUENCE`,`mstr_data`.`NUMBER_DATA_VALUE` AS `NUMBER_DATA_VALUE` from `mstr_data` where (`mstr_data`.`MSTR_CATEGORY_ID` = '7') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_shipping_options_mstr`
--

/*!50001 DROP TABLE IF EXISTS `vw_shipping_options_mstr`*/;
/*!50001 DROP VIEW IF EXISTS `vw_shipping_options_mstr`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mpfb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_shipping_options_mstr` AS select `mstr_data`.`ID` AS `ID`,`mstr_data`.`NAME` AS `NAME`,`mstr_data`.`DISPLAY_NM` AS `DISPLAY_NM`,`mstr_data`.`DESCR` AS `DESCR`,`mstr_data`.`COUNTRY_ID` AS `COUNTRY_ID`,`mstr_data`.`MSTR_CATEGORY_ID` AS `MSTR_CATEGORY_ID`,`mstr_data`.`EXPIRY_DT` AS `EXPIRY_DT`,`mstr_data`.`DISPLAY_SEQUENCE` AS `DISPLAY_SEQUENCE`,`mstr_data`.`NUMBER_DATA_VALUE` AS `NUMBER_DATA_VALUE` from `mstr_data` where (`mstr_data`.`MSTR_CATEGORY_ID` = '8') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_shipping_provider_mstr`
--

/*!50001 DROP TABLE IF EXISTS `vw_shipping_provider_mstr`*/;
/*!50001 DROP VIEW IF EXISTS `vw_shipping_provider_mstr`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mpfb`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_shipping_provider_mstr` AS select `mstr_data`.`ID` AS `ID`,`mstr_data`.`NAME` AS `NAME`,`mstr_data`.`DISPLAY_NM` AS `DISPLAY_NM`,`mstr_data`.`DESCR` AS `DESCR`,`mstr_data`.`COUNTRY_ID` AS `COUNTRY_ID`,`mstr_data`.`MSTR_CATEGORY_ID` AS `MSTR_CATEGORY_ID`,`mstr_data`.`EXPIRY_DT` AS `EXPIRY_DT`,`mstr_data`.`DISPLAY_SEQUENCE` AS `DISPLAY_SEQUENCE`,`mstr_data`.`NUMBER_DATA_VALUE` AS `NUMBER_DATA_VALUE` from `mstr_data` where (`mstr_data`.`MSTR_CATEGORY_ID` = '9') */;
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

-- Dump completed on 2014-08-06  9:04:56
