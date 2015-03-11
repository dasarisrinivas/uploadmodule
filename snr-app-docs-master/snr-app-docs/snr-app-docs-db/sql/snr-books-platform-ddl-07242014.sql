CREATE TABLE `MSTR_ADDRESS_TYPE` (
  `ID` varchar(16) NOT NULL,
  `DISPLAY_NM` varchar(999) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `MSTR_COMM_CHANNEL` (
  `ID` varchar(16) NOT NULL,
  `DISPLAY_NM` varchar(999) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `MSTR_COUNTRY` (
  `ID` varchar(16) NOT NULL,
  `DISPLAY_NM` varchar(45) NOT NULL,
  `COUNTRY_CODE` char(3) NOT NULL,
  `CURRENCY_DISPLAY` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `MSTR_DURATION` (
  `ID` varchar(16) NOT NULL,
  `DURATION_DISPLAY_NM` varchar(999) DEFAULT NULL,
  `DURATION_VALUE` int(11) DEFAULT NULL,
  `COUNTRY_ID` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `COUNTRY_ID_idx` (`COUNTRY_ID`),
  CONSTRAINT `COUNTRY_ID` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `MSTR_COUNTRY` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `MSTR_MARKET_TYPE` (
  `ID` varchar(16) NOT NULL,
  `MARKET_TYPE_DISPLAY_NM` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `MSTR_ORDER_STATUS` (
  `ID` varchar(16) NOT NULL,
  `DISPLAY_NM` varchar(999) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `MSTR_PRODUCT_CONDITION` (
  `ID` varchar(16) NOT NULL,
  `PRODUCT_CONDITION_DISPLAY_NM` varchar(999) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `MSTR_PRODUCT_TYPE` (
  `ID` varchar(16) NOT NULL,
  `DISPLAY_NM` varchar(45) DEFAULT NULL,
  `COUNTRY_ID` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `COUNTRY_ID__FK0101_idx` (`COUNTRY_ID`),
  CONSTRAINT `COUNTRY_ID__FK0101` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `MSTR_COUNTRY` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `MSTR_SHIPPING_OPTIONS` (
  `ID` varchar(16) NOT NULL,
  `COUNTRY_ID` varchar(16) DEFAULT NULL,
  `DISPLAY_NM` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `MSTR_SHIPPING_PROVIDER_OPTIONS` (
  `ID` varchar(16) NOT NULL,
  `COUNTRY_ID` varchar(16) NOT NULL,
  `DISPLAY_NM` varchar(999) NOT NULL,
  `STATUS_CHECK_WEBSITE` varchar(999) NOT NULL,
  `DISPLAY_ORDER` int(11) NOT NULL,
  `IS_DEFAULT` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `COUNTRY_ID__FK001_idx` (`COUNTRY_ID`),
  CONSTRAINT `COUNTRY_ID__FK001` FOREIGN KEY (`COUNTRY_ID`) REFERENCES `MSTR_COUNTRY` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `CUSTOMER` (
  `ID` varchar(16) NOT NULL,
  `UPDATED_DATE` datetime DEFAULT NULL,
  `CREATION_DATE` datetime DEFAULT NULL,
  `DISPLAY_NM` varchar(45) DEFAULT NULL,
  `PUBLIC_CUSTOMER_ID` varchar(16) DEFAULT NULL,
  `CUSTOMER_RATING` float DEFAULT NULL,
  `REVIEW_COUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `CUSTOMER_ADDRESS` (
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
  CONSTRAINT `ADDRESS_TYPE_ID_FK001` FOREIGN KEY (`ADDRESS_TYPE_ID`) REFERENCES `MSTR_ADDRESS_TYPE` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CUSTOMER_ID_FK001` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `CUSTOMER` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `ORDERS` (
  `ID` varchar(16) NOT NULL,
  `PUBLIC_ORDER_ID` varchar(16) NOT NULL,
  `ORDER_DT` datetime NOT NULL,
  `TOTAL_ORDER_VALUE` float NOT NULL,
  `TOTAL_SHIPPING_CHARGES_VALUE` float DEFAULT NULL,
  `TOTAL_TAX_VALUE` float DEFAULT NULL,
  `CUSTOMER_ID` varchar(16) NOT NULL,
  `NO_OF_ITEMS` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `CUSTOMER_REVIEWS` (
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
  CONSTRAINT `CUSTOMER_ID_FK005` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `CUSTOMER` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `VENDOR` (
  `ID` varchar(16) NOT NULL,
  `VENDOR_EMAIL` varchar(999) NOT NULL,
  `DISPLAY_NM` varchar(999) NOT NULL,
  `VENDOR_RATING` float DEFAULT NULL,
  `REVIEW_COUNT` int(11) DEFAULT NULL,
  `CREATION_DT` datetime DEFAULT NULL,
  `UPDATED_DT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `VENDOR_REVIEWS` (
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
  CONSTRAINT `VENDOR_ID_FK005` FOREIGN KEY (`VENDOR_ID`) REFERENCES `VENDOR` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `PRODUCT` (
  `ID` varchar(16) NOT NULL,
  `PRODUCT_NM` varchar(999) DEFAULT NULL,
  `PRODUCT_DISPLAY_NM` varchar(999) NOT NULL,
  `PRODUCT_PUBLIC_ID` varchar(45) NOT NULL,
  `PRODUCT_SUMMARY` varchar(999) DEFAULT NULL,
  `LIST_PRICE` float NOT NULL,
  `PRODUCT_TYPE_ID` varchar(16) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `PRODUCT_PROPERTYS` (
  `ID` varchar(16) NOT NULL,
  `PROPERTY_NM` varchar(45) DEFAULT NULL,
  `PROPERTY_DISPLAY_NM` varchar(45) NOT NULL,
  `PRODUCT_ID` varchar(16) NOT NULL,
  `IS_PROPERTY_TAGGABLE` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `PRODUCT__ID_FK_idx` (`PRODUCT_ID`),
  CONSTRAINT `PRODUCT__ID_FK` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `PRODUCT_PROPERTYS_VALUE` (
  `ID` varchar(16) NOT NULL,
  `PRODUCT_ID` varchar(16) NOT NULL,
  `PRODUCT_PROPERTYS_ID` varchar(16) NOT NULL,
  `PRODUCT_VALUE` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `PRODUCT__ID_FK001_idx` (`PRODUCT_ID`),
  KEY `PRODUCT_PROP_ID__FK001_idx` (`PRODUCT_PROPERTYS_ID`),
  CONSTRAINT `PRODUCT_PROP_ID__FK001` FOREIGN KEY (`PRODUCT_PROPERTYS_ID`) REFERENCES `PRODUCT_PROPERTYS` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PRODUCT__ID_FK001` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `MARKETABLE_PRODUCT` (
  `ID` varchar(16) NOT NULL,
  `PRODUCT_ID` varchar(16) NOT NULL,
  `ITEM_CONDITION_TYPE` varchar(45) DEFAULT NULL,
  `COMMENTS` varchar(999) DEFAULT NULL,
  `VENDOR_ID` varchar(16) NOT NULL,
  `MARKET_TYPE_ID` varchar(16) NOT NULL,
  `QUANTITY_AVAILABLE` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `PRODUCT_ID__FK002_idx` (`PRODUCT_ID`),
  KEY `VENDOR_ID__FK001_idx` (`VENDOR_ID`),
  KEY `MARKET_TYPE_ID_FK003_idx` (`MARKET_TYPE_ID`),
  CONSTRAINT `MARKET_TYPE_ID_FK003` FOREIGN KEY (`MARKET_TYPE_ID`) REFERENCES `MSTR_MARKET_TYPE` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PRODUCT_ID__FK002` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `PRODUCT` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `VENDOR_ID__FK001` FOREIGN KEY (`VENDOR_ID`) REFERENCES `VENDOR` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `MARKETABLE_PRODUCT_PRICE_OPTIONS` (
  `ID` varchar(16) NOT NULL,
  `MARKETABLE_PRODUCT_ID` varchar(16) DEFAULT NULL,
  `DURATION_ID` varchar(16) DEFAULT NULL,
  `SALE_PRICE` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `MARKETABLE_PRODUCT_SHIPPING_OPTIONS` (
  `ID` varchar(16) NOT NULL,
  `MARKETABLE_PRODUCT_ID` varchar(16) DEFAULT NULL,
  `SHIPPING_OPTIONS_ID` varchar(16) DEFAULT NULL,
  `PRICE` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `PRODUCT_RENTAL_PRICE_OPTNS` (
  `ID` varchar(16) NOT NULL,
  `MARKETABLE_PRODUCT_ID` varchar(16) NOT NULL,
  `DURATION_ID` varchar(16) NOT NULL,
  `RENTAL_PRICE` float NOT NULL,
  `DISCOUNT` float DEFAULT NULL,
  `SAVING` float DEFAULT NULL,
  `SHIPPING_CHARGES` float DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `DURATION_ID__FK001_idx` (`DURATION_ID`),
  KEY `MARKETABLE_PRODUCT_ID__FK001_idx` (`MARKETABLE_PRODUCT_ID`),
  CONSTRAINT `MARKETABLE_PRODUCT_ID__FK001` FOREIGN KEY (`MARKETABLE_PRODUCT_ID`) REFERENCES `MARKETABLE_PRODUCT` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `DURATION_ID__FK001` FOREIGN KEY (`DURATION_ID`) REFERENCES `MSTR_DURATION` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `PRODUCT_SELLING_PRICE_OPTIONS` (
  `ID` varchar(16) NOT NULL,
  `MARKETABLE_PRODUCT_ID` varchar(16) NOT NULL,
  `SELLING_PRICE` float NOT NULL,
  `DISCOUNT` float DEFAULT NULL,
  `SAVING` float DEFAULT NULL,
  `SHIPPING_CHARGES` float DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `MARKETABLE_PRODUCT_ID__FK001_idx` (`MARKETABLE_PRODUCT_ID`),
  CONSTRAINT `MARKETABLE_PRODUCT_ID__FK002` FOREIGN KEY (`MARKETABLE_PRODUCT_ID`) REFERENCES `MARKETABLE_PRODUCT` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `PRODUCT_TAGS` (
  `ID` varchar(16) NOT NULL,
  `MARKETABLE_PRODUCT_ID` varchar(16) NOT NULL,
  `VENDOR_ID` varchar(16) NOT NULL,
  `TAG_KEY` varchar(999) NOT NULL,
  `TAG_VALUE` varchar(999) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `MARKETABLE_PRODUCT_ID__FK004_idx` (`MARKETABLE_PRODUCT_ID`),
  KEY `VENDOR_ID__FK004_idx` (`VENDOR_ID`),
  CONSTRAINT `VENDOR_ID__FK004` FOREIGN KEY (`VENDOR_ID`) REFERENCES `VENDOR` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `MARKETABLE_PRODUCT_ID__FK004` FOREIGN KEY (`MARKETABLE_PRODUCT_ID`) REFERENCES `MARKETABLE_PRODUCT` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `ORDER_ITEMS` (
  `ID` varchar(16) NOT NULL,
  `ORDER_ID` varchar(16) NOT NULL,
  `MARKETABLE_PRODUCT_ID` varchar(16) NOT NULL,
  `SALE_PRICE` float DEFAULT NULL,
  `QUANTITY` int(11) NOT NULL,
  `CUSTOMER_SHIPPING_ADDRESS_ID` varchar(16) NOT NULL,
  `VENDOR_ID` varchar(16) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `VENDOR_ORDER_ID__FK001_idx` (`ORDER_ID`),
  KEY `CUSTOMER_ADDRESS_ID__FK001_idx` (`CUSTOMER_SHIPPING_ADDRESS_ID`),
  KEY `MARKETABLE_PRODUCT_ID__FK002_idx` (`MARKETABLE_PRODUCT_ID`),
  KEY `VENDOR_ID__FK0002_idx` (`VENDOR_ID`),
  CONSTRAINT `VENDOR_ID__FK0002` FOREIGN KEY (`VENDOR_ID`) REFERENCES `VENDOR` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CUSTOMER_ADDRESS_ID__FK001` FOREIGN KEY (`CUSTOMER_SHIPPING_ADDRESS_ID`) REFERENCES `CUSTOMER_ADDRESS` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `MARKETABLE_PRODUCT_ID_FK01` FOREIGN KEY (`MARKETABLE_PRODUCT_ID`) REFERENCES `MARKETABLE_PRODUCT` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ORDER_ID__FK001` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `ORDER_ITEM_SHIPPING_DETAILS` (
  `ID` int(11) NOT NULL,
  `ORDER_ITEMS_ID` varchar(16) DEFAULT NULL,
  `SHIPPING_OPTION_ID` varchar(16) DEFAULT NULL,
  `TRACKING_NUMBER` varchar(999) DEFAULT NULL,
  `TRACKING_NUMBER_LAST_UPDATED_DT` datetime DEFAULT NULL,
  `STATUS_UPDATED_DATE` datetime DEFAULT NULL,
  `ORDER_STATUS_ID` varchar(16) DEFAULT NULL,
  `STATUS_DESCRIPTION` varchar(999) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `VENDOR_ORDER_ITEMS_ID__FK001_idx` (`ORDER_ITEMS_ID`),
  KEY `SHIPPING_OPTIONS_ID__FK001_idx` (`SHIPPING_OPTION_ID`),
  KEY `CURRENT_STATUS_ID__FK001_idx` (`ORDER_STATUS_ID`),
  CONSTRAINT `ORDER_ITEMS_ID__FK001` FOREIGN KEY (`ORDER_ITEMS_ID`) REFERENCES `ORDER_ITEMS` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ORDER_STATUS_ID__FK001` FOREIGN KEY (`ORDER_STATUS_ID`) REFERENCES `MSTR_ORDER_STATUS` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `SHIPPING_OPTIONS_ID__FK001` FOREIGN KEY (`SHIPPING_OPTION_ID`) REFERENCES `mstr_shipping_provider_options` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `PERSON` (
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
  CONSTRAINT `CUSTOMER_ID__FK012` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `CUSTOMER` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `VENDOR_ID__FK012` FOREIGN KEY (`VENDOR_ID`) REFERENCES `VENDOR` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
