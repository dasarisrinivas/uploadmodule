/*MSTR_ORDER_STATUS/*
-- Query: SELECT * FROM letssharebooks.MSTR_ADDRESS_TYPE
LIMIT 0, 1000

-- Date: 2014-07-24 07:15
*/
INSERT INTO `MSTR_ADDRESS_TYPE` (`ID`,`DISPLAY_NM`) VALUES ('1','Home Address');
INSERT INTO `MSTR_ADDRESS_TYPE` (`ID`,`DISPLAY_NM`) VALUES ('2','Office Communication Address');
INSERT INTO `MSTR_ADDRESS_TYPE` (`ID`,`DISPLAY_NM`) VALUES ('3','Registered Address');
/*
-- Query: SELECT * FROM letssharebooks.MSTR_COMM_CHANNEL
LIMIT 0, 1000

-- Date: 2014-07-24 07:15
*/
INSERT INTO `MSTR_COMM_CHANNEL` (`ID`,`DISPLAY_NM`) VALUES ('1','Email');
INSERT INTO `MSTR_COMM_CHANNEL` (`ID`,`DISPLAY_NM`) VALUES ('2','Mail');
INSERT INTO `MSTR_COMM_CHANNEL` (`ID`,`DISPLAY_NM`) VALUES ('3','Fax');
INSERT INTO `MSTR_COMM_CHANNEL` (`ID`,`DISPLAY_NM`) VALUES ('4','Text');
INSERT INTO `MSTR_COMM_CHANNEL` (`ID`,`DISPLAY_NM`) VALUES ('5','Call');

/*
-- Query: SELECT * FROM letssharebooks.MSTR_COUNTRY
LIMIT 0, 1000

-- Date: 2014-07-24 07:16
*/
INSERT INTO `MSTR_COUNTRY` (`ID`,`DISPLAY_NM`,`COUNTRY_CODE`,`CURRENCY_DISPLAY`) VALUES ('1','USA','US',NULL);
INSERT INTO `MSTR_COUNTRY` (`ID`,`DISPLAY_NM`,`COUNTRY_CODE`,`CURRENCY_DISPLAY`) VALUES ('2','India','IND',NULL);
INSERT INTO `MSTR_COUNTRY` (`ID`,`DISPLAY_NM`,`COUNTRY_CODE`,`CURRENCY_DISPLAY`) VALUES ('3','UK','UK',NULL);
/*
-- Query: SELECT * FROM letssharebooks.MSTR_DURATION
LIMIT 0, 1000

-- Date: 2014-07-24 07:17
*/
INSERT INTO `MSTR_DURATION` (`ID`,`DURATION_DISPLAY_NM`,`DURATION_VALUE`,`COUNTRY_ID`) VALUES ('1','45 Days',45,'1');
INSERT INTO `MSTR_DURATION` (`ID`,`DURATION_DISPLAY_NM`,`DURATION_VALUE`,`COUNTRY_ID`) VALUES ('2','60 Days',60,'1');
INSERT INTO `MSTR_DURATION` (`ID`,`DURATION_DISPLAY_NM`,`DURATION_VALUE`,`COUNTRY_ID`) VALUES ('3','90 Days',90,'1');
INSERT INTO `MSTR_DURATION` (`ID`,`DURATION_DISPLAY_NM`,`DURATION_VALUE`,`COUNTRY_ID`) VALUES ('4','1 month',30,'2');
INSERT INTO `MSTR_DURATION` (`ID`,`DURATION_DISPLAY_NM`,`DURATION_VALUE`,`COUNTRY_ID`) VALUES ('5','2 months',60,'2');
INSERT INTO `MSTR_DURATION` (`ID`,`DURATION_DISPLAY_NM`,`DURATION_VALUE`,`COUNTRY_ID`) VALUES ('6','3 months',90,'2');
INSERT INTO `MSTR_DURATION` (`ID`,`DURATION_DISPLAY_NM`,`DURATION_VALUE`,`COUNTRY_ID`) VALUES ('7','1 Semester',90,'3');
INSERT INTO `MSTR_DURATION` (`ID`,`DURATION_DISPLAY_NM`,`DURATION_VALUE`,`COUNTRY_ID`) VALUES ('8','2 Semesters',180,'3');
/*
-- Query: SELECT * FROM letssharebooks.MSTR_MARKET_TYPE
LIMIT 0, 1000

-- Date: 2014-07-24 07:17
*/
INSERT INTO `MSTR_MARKET_TYPE` (`ID`,`MARKET_TYPE_DISPLAY_NM`) VALUES ('1','Rental');
INSERT INTO `MSTR_MARKET_TYPE` (`ID`,`MARKET_TYPE_DISPLAY_NM`) VALUES ('2','Sell');
/*
-- Query: SELECT * FROM letssharebooks.MSTR_ORDER_STATUS
LIMIT 0, 1000

-- Date: 2014-07-24 07:18
*/
INSERT INTO `MSTR_ORDER_STATUS` (`ID`,`DISPLAY_NM`) VALUES ('1','New');
INSERT INTO `MSTR_ORDER_STATUS` (`ID`,`DISPLAY_NM`) VALUES ('2','Reviewed');
INSERT INTO `MSTR_ORDER_STATUS` (`ID`,`DISPLAY_NM`) VALUES ('3','Under Processing');
INSERT INTO `MSTR_ORDER_STATUS` (`ID`,`DISPLAY_NM`) VALUES ('4','Processed');
INSERT INTO `MSTR_ORDER_STATUS` (`ID`,`DISPLAY_NM`) VALUES ('5','Delivered');
INSERT INTO `MSTR_ORDER_STATUS` (`ID`,`DISPLAY_NM`) VALUES ('6','Cancelled');
/*
-- Query: SELECT * FROM letssharebooks.MSTR_PRODUCT_CONDITION
LIMIT 0, 1000

-- Date: 2014-07-24 07:19
*/
INSERT INTO `MSTR_PRODUCT_CONDITION` (`ID`,`PRODUCT_CONDITION_DISPLAY_NM`) VALUES ('1','New');
INSERT INTO `MSTR_PRODUCT_CONDITION` (`ID`,`PRODUCT_CONDITION_DISPLAY_NM`) VALUES ('2','Like New');
INSERT INTO `MSTR_PRODUCT_CONDITION` (`ID`,`PRODUCT_CONDITION_DISPLAY_NM`) VALUES ('3','Used');
INSERT INTO `MSTR_PRODUCT_CONDITION` (`ID`,`PRODUCT_CONDITION_DISPLAY_NM`) VALUES ('4','Non Useable');
/*
-- Query: SELECT * FROM letssharebooks.MSTR_PRODUCT_TYPE
LIMIT 0, 1000

-- Date: 2014-07-24 07:19
*/
INSERT INTO `MSTR_PRODUCT_TYPE` (`ID`,`DISPLAY_NM`,`COUNTRY_ID`) VALUES ('1','Books','1');
INSERT INTO `MSTR_PRODUCT_TYPE` (`ID`,`DISPLAY_NM`,`COUNTRY_ID`) VALUES ('2','Games','1');
INSERT INTO `MSTR_PRODUCT_TYPE` (`ID`,`DISPLAY_NM`,`COUNTRY_ID`) VALUES ('3','Books','2');
INSERT INTO `MSTR_PRODUCT_TYPE` (`ID`,`DISPLAY_NM`,`COUNTRY_ID`) VALUES ('4','Games','2');
INSERT INTO `MSTR_PRODUCT_TYPE` (`ID`,`DISPLAY_NM`,`COUNTRY_ID`) VALUES ('5','Books','3');
/*
-- Query: SELECT * FROM letssharebooks.MSTR_SHIPPING_OPTIONS
LIMIT 0, 1000

-- Date: 2014-07-24 07:20
*/
INSERT INTO `MSTR_SHIPPING_OPTIONS` (`ID`,`COUNTRY_ID`,`DISPLAY_NM`) VALUES ('1','1','Next day Delivery');
INSERT INTO `MSTR_SHIPPING_OPTIONS` (`ID`,`COUNTRY_ID`,`DISPLAY_NM`) VALUES ('2','1','2 day delivery');
INSERT INTO `MSTR_SHIPPING_OPTIONS` (`ID`,`COUNTRY_ID`,`DISPLAY_NM`) VALUES ('3','1','3-5 day delivery');
INSERT INTO `MSTR_SHIPPING_OPTIONS` (`ID`,`COUNTRY_ID`,`DISPLAY_NM`) VALUES ('4','2','Next day Delivery');
INSERT INTO `MSTR_SHIPPING_OPTIONS` (`ID`,`COUNTRY_ID`,`DISPLAY_NM`) VALUES ('5','2','2 day delivery');
INSERT INTO `MSTR_SHIPPING_OPTIONS` (`ID`,`COUNTRY_ID`,`DISPLAY_NM`) VALUES ('6','2','3-5 day delivery');
INSERT INTO `MSTR_SHIPPING_OPTIONS` (`ID`,`COUNTRY_ID`,`DISPLAY_NM`) VALUES ('7','3','Next day Delivery');
INSERT INTO `MSTR_SHIPPING_OPTIONS` (`ID`,`COUNTRY_ID`,`DISPLAY_NM`) VALUES ('8','3','2 day delivery');
INSERT INTO `MSTR_SHIPPING_OPTIONS` (`ID`,`COUNTRY_ID`,`DISPLAY_NM`) VALUES ('9','3','3-5 day delivery');
/*
-- Query: SELECT * FROM letssharebooks.MSTR_SHIPPING_PROVIDER_OPTIONS
LIMIT 0, 1000

-- Date: 2014-07-24 07:21
*/
INSERT INTO `MSTR_SHIPPING_PROVIDER_OPTIONS` (`ID`,`COUNTRY_ID`,`DISPLAY_NM`,`STATUS_CHECK_WEBSITE`,`DISPLAY_ORDER`,`IS_DEFAULT`) VALUES ('1','1','USPS','usps.com',1,'Y');
INSERT INTO `MSTR_SHIPPING_PROVIDER_OPTIONS` (`ID`,`COUNTRY_ID`,`DISPLAY_NM`,`STATUS_CHECK_WEBSITE`,`DISPLAY_ORDER`,`IS_DEFAULT`) VALUES ('2','1','UPS','ups.com',2,'N');
INSERT INTO `MSTR_SHIPPING_PROVIDER_OPTIONS` (`ID`,`COUNTRY_ID`,`DISPLAY_NM`,`STATUS_CHECK_WEBSITE`,`DISPLAY_ORDER`,`IS_DEFAULT`) VALUES ('3','1','FedEx','fedex.com',3,'N');
INSERT INTO `MSTR_SHIPPING_PROVIDER_OPTIONS` (`ID`,`COUNTRY_ID`,`DISPLAY_NM`,`STATUS_CHECK_WEBSITE`,`DISPLAY_ORDER`,`IS_DEFAULT`) VALUES ('4','2','Royal Mail','google.co.uk',1,'Y');
INSERT INTO `MSTR_SHIPPING_PROVIDER_OPTIONS` (`ID`,`COUNTRY_ID`,`DISPLAY_NM`,`STATUS_CHECK_WEBSITE`,`DISPLAY_ORDER`,`IS_DEFAULT`) VALUES ('5','3','Indian Mail','google.co.in',1,'Y');
