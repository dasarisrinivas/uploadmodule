select distinct sold_product.creation_dt,sold_product.CUSTOM_NM ,sold_product.SALES_PRICE,sold_product.SOLD_CURRENCY,sold_product.sales_receipt_number,sold_product.SALES_REP_NM,sold_product.SALES_DT ,
sold_warranty.id as warranty_id,sold_warranty.AUTO_RENEW,sold_warranty.END_DT,sold_warranty.START_DT, sold_warranty.WARRANTY_NUMBER,sold_warranty.WARRANTY_PROVIDER__ID,sold_warranty.WRNTY_AMT, 
seller_phone.AREA_CODE as seller_area_code,seller_phone.COUNTRY_CODE as seller_country_code,seller_phone.EXT as seller_phone_ext,seller_phone.NEXT3DIGITS as seller_next3digits, seller_phone.NEXT4DIGITS as seller_next4digits,
seller_website.WEBSITE_LBL as seller_website_lbl,seller_website.WEBSITE_URL as seller_website_url, 
seller_address.ADDRESS1 as seller_address1,seller_address.ADDRESS2 as seller_address2,seller_address.ADDRESS3 as seller_address3,seller_address.CITY as seller_address_city , seller_address.STATE as seller_address_state,seller_address.ZIPCODE as seller_address_zipcode ,
wrnty_prvder_phone.PHONE_NUMBER AS wrnty_prvder_phone_num,wrnty_prvder_phone.AREA_CODE as wrnty_prvder_phone_area_code,wrnty_prvder_phone.COUNTRY_CODE as wrnty_prvder_phone_country_code ,wrnty_prvder_phone.EXT as wrnty_prvder_phone_ext,wrnty_prvder_phone.NEXT3DIGITS as wrnty_prvder_phone_next3digits,wrnty_prvder_phone.NEXT4DIGITS as wrnty_prvder_phone_next4digits ,
wrnty_prvder_website_info.WEBSITE_LBL as wrnty_prvder_website_lbl,wrnty_prvder_website_info.WEBSITE_URL as wrnty_prvder_website_url, 
wrnty_prvder_address.ADDRESS1 as wrnty_prvder_address1,wrnty_prvder_address.ADDRESS2 as wrnty_prvder_address2,wrnty_prvder_address.ADDRESS3 as wrnty_prvder_address3,wrnty_prvder_address.CITY as wrnty_prvder_address_city , wrnty_prvder_address.STATE as wrnty_prvder_address_state,wrnty_prvder_address.ZIPCODE as wrnty_prvder_address_zipcode ,
product_seller.PRODUCT__ID,seller.DISP_NM as seller_nm, 
actual_product.MAKE,actual_product.MODEL,actual_product.SERIAL_NUMBER
from 
sold_warranty,sold_product,product_seller,warranty_provider ,
actual_product,entity_phone as seller_phone,entity_website_info as seller_website ,entity_address as seller_address  ,
entity_phone as wrnty_prvder_phone,entity_website_info as wrnty_prvder_website_info  ,entity_address as wrnty_prvder_address  ,
seller 
where 
sold_warranty.ID='fbea3bb2-89ad-4338-9eed-4318a2b32068' and  
sold_warranty.warranty_provider__ID=warranty_provider.id and
sold_product.SOLD_WARNTY__ID=sold_warranty.ID and  
sold_product.PRODUCT_SELLER__ID=product_seller.ID and 
product_seller.PRODUCT__ID = actual_product.ID and  
product_seller.SELLER__ID=seller.ID and
product_seller.SELLER__ID=seller_phone.ENTITY__ID and  
seller_phone.DISPLAY_SEQUENCE=1 and 
seller_website.ENTITY__ID=product_seller.SELLER__ID and 
seller_website.DISPLAY_SEQUENCE=1 and  
seller_address.ENTITY__ID=product_seller.SELLER__ID and
warranty_provider.ID=wrnty_prvder_phone.ENTITY__ID and  
wrnty_prvder_phone.DISPLAY_SEQUENCE=1 and
warranty_provider.ID=wrnty_prvder_address.ENTITY__ID and
wrnty_prvder_address.DISPLAY_SEQUENCE=1 and 
wrnty_prvder_website_info.ENTITY__ID=warranty_provider.ID and 
wrnty_prvder_website_info.DISPLAY_SEQUENCE=1   
