create or replace view product_info as
select olist_products_dataset.product_id, olist_products_dataset.product_category_name, olist_products_dataset.product_photos_qty 
from olist_products_dataset
inner join (
	select order_id, product_id, seller_id, price, freight_value
    from olist_order_items_dataset
) olist_order_items_dataset using (product_id)
inner join (
	select order_id, customer_id
    from olist_orders_dataset
) olist_orders_dataset on olist_order_items_dataset.order_id = olist_orders_dataset.order_id
inner join (
	select product_category_name, product_category_name_english
    from product_category_name_translation
) product_category_name_translation on olist_products_dataset.product_category_name = product_category_name_translation.product_category_name
inner join (
	select customer_id, customer_zip_code_prefix, customer_city, customer_state 
    from olist_customers_dataset
) olist_customers_dataset on olist_orders_dataset.customer_id = olist_customers_dataset.customer_id
inner join (
	select geolocation_zip_code_prefix, geolocation_lat, geolocation_lng, geolocation_city, geolocation_state
    from olist_geolocation_dataset
) olist_geolocation_dataset on olist_customers_dataset.customer_zip_code_prefix = olist_geolocation_dataset.geolocation_zip_code_prefix;


