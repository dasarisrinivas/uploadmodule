select sold_product.creation_dt,sold_product.CUSTOM_NM,sold_product.sales_price, SOLD_PRODUCT.SOLD_CURRENCY, seller.DISP_NM as seller_name,
sold_warranty.END_DT as warranty_end_dt,sold_warranty.ID as warranty_id,actual_product_material.material_url as logo_url,
actual_product_material.material_type 
from 
sold_product,product_seller ,seller,sold_warranty,
actual_product,actual_product_material 
where 
CUSTOMER__ID=1 AND 
SOLD_PRODUCT.PRODUCT_SELLER__ID=product_seller.ID and 
product_seller.SELLER__ID=seller.ID and 
sold_product.SOLD_WARNTY__ID=sold_warranty.ID and 
product_seller.PRODUCT__ID=actual_product.ID and  
actual_product.ID=actual_product_material.actual_product__id and  
actual_product_material.is_default='Y'