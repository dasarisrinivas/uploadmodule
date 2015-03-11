select 
`sold_product`.`ID` as 'SOLD_PRODUCT_ID',
    `sold_product`.`SOLD_WARNTY__ID`,
    `sold_product`.`SALES_PRICE`,
    `sold_product`.`SALES_DT`,
    `sold_product`.`SALES_RECEIPT_NUMBER`,
    `sold_product`.`SALES_REP_NM`,
    `sold_product`.`CUSTOMER__ID`,
    `sold_product`.`SALES_ITEM_NUMBER`,
    `sold_product`.`CUSTOM_NM`,
    `sold_product`.`SOLD_CURRENCY`,
    `sold_product`.`IS_CUSTOMIZED`,
    `sold_product`.`CUSTOM_PRODUCT__ID`,
    `sold_product`.`ACTUAL_PRODUCT__ID` 
 from 
 sold_product where 
 sold_product.id='1' 