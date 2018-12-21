SET SQL_SAFE_UPDATES = 0;
use brazil_e_commerce;

show create table website_visit_data;

CREATE TABLE `nolist_products_dataset` (`product_id` text, `product_category_name` text, `product_name_lenght` int(11) DEFAULT NULL, `product_description_lenght` int(11) DEFAULT NULL, `product_photos_qty` int(11) DEFAULT NULL, `product_weight_g` int(11) DEFAULT NULL, `product_length_cm` int(11) DEFAULT NULL, `product_height_cm` int(11) DEFAULT NULL, `product_width_cm` int(11) DEFAULT NULL) ENGINE=InnoDB DEFAULT CHARSET=latin1;
insert into nolist_products_dataset select * from olist_products_dataset;
DROP TABLE `brazil_e_commerce`.`olist_products_dataset`;
alter table nolist_products_dataset rename to olist_products_dataset;

CREATE TABLE `nolist_customers_dataset` ( `customer_id` text, `customer_unique_id` text, `customer_zip_code_prefix` text, `customer_city` text, `customer_state` text) ENGINE=InnoDB DEFAULT CHARSET=latin1;
insert into nolist_customers_dataset select * from olist_customers_dataset;
DROP TABLE `brazil_e_commerce`.`olist_customers_dataset`;
alter table nolist_customers_dataset rename to olist_customers_dataset;

CREATE TABLE `nolist_geolocation_dataset` ( `geolocation_zip_code_prefix` text, `geolocation_lat` double DEFAULT NULL, `geolocation_lng` double DEFAULT NULL, `geolocation_city` text, `geolocation_state` text) ENGINE=InnoDB DEFAULT CHARSET=latin1;
insert into nolist_geolocation_dataset select * from olist_geolocation_dataset;
DROP TABLE `brazil_e_commerce`.`olist_geolocation_dataset`;
alter table nolist_geolocation_dataset rename to olist_geolocation_dataset;

CREATE TABLE `nolist_order_items_dataset` ( `order_id` text, `order_item_id` int(11) DEFAULT NULL, `product_id` text, `seller_id` text, `shipping_limit_date` text, `price` double DEFAULT NULL, `freight_value` double DEFAULT NULL) ENGINE=InnoDB DEFAULT CHARSET=latin1;
insert into nolist_order_items_dataset select * from olist_order_items_dataset;
DROP TABLE `brazil_e_commerce`.`olist_order_items_dataset`;
alter table nolist_order_items_dataset rename to olist_order_items_dataset;

CREATE TABLE `nolist_order_payments_dataset` ( `order_id` text, `payment_sequential` int(11) DEFAULT NULL, `payment_type` text, `payment_installments` int(11) DEFAULT NULL, `payment_value` double DEFAULT NULL) ENGINE=InnoDB DEFAULT CHARSET=latin1;
insert into nolist_order_payments_dataset select * from olist_order_payments_dataset;
DROP TABLE `brazil_e_commerce`.`olist_order_payments_dataset`;
alter table nolist_order_payments_dataset rename to olist_order_payments_dataset;

CREATE TABLE `nolist_order_reviews_dataset` ( `review_id` text, `order_id` text, `review_score` int(11) DEFAULT NULL, `review_comment_title` text, `review_comment_message` text, `review_creation_date` text, `review_answer_timestamp` text) ENGINE=InnoDB DEFAULT CHARSET=latin1;
insert into nolist_order_reviews_dataset select * from olist_order_reviews_dataset;
DROP TABLE `brazil_e_commerce`.`olist_order_reviews_dataset`;
alter table nolist_order_reviews_dataset rename to olist_order_reviews_dataset;

CREATE TABLE `nolist_orders_dataset` ( `order_id` text, `customer_id` text, `order_status` text, `order_purchase_timestamp` text, `order_approved_at` text, `order_delivered_carrier_date` text, `order_delivered_customer_date` text, `order_estimated_delivery_date` text) ENGINE=InnoDB DEFAULT CHARSET=latin1;
insert into nolist_orders_dataset select * from olist_orders_dataset;
DROP TABLE `brazil_e_commerce`.`olist_orders_dataset`;
alter table nolist_orders_dataset rename to olist_orders_dataset;

CREATE TABLE `nolist_sellers_dataset` ( `seller_id` text, `seller_zip_code_prefix` text, `seller_city` text, `seller_state` text) ENGINE=InnoDB DEFAULT CHARSET=latin1;
insert into nolist_sellers_dataset select * from olist_sellers_dataset;
DROP TABLE `brazil_e_commerce`.`olist_sellers_dataset`;
alter table nolist_sellers_dataset rename to olist_sellers_dataset;

CREATE TABLE `nproduct_category_name_translation` ( `﻿product_category_name` text, `product_category_name_english` text) ENGINE=InnoDB DEFAULT CHARSET=latin1;
insert into nproduct_category_name_translation select * from product_category_name_translation;
DROP TABLE `brazil_e_commerce`.`product_category_name_translation`;
alter table nproduct_category_name_translation rename to product_category_name_translation;

CREATE TABLE `nwebsite_visit_data` ( `ID` int(11) DEFAULT NULL, `CustomerName` text, `CustomerType` int(11) DEFAULT NULL, `DateStarted` text, `Duration` double DEFAULT NULL, `gender` text, `Age` int(11) DEFAULT NULL, `Salary` int(11) DEFAULT NULL, `ReviewDuration` text, `RelatedDuration` text, `Purchased` int(11) DEFAULT NULL) ENGINE=InnoDB DEFAULT CHARSET=latin1;
insert into nwebsite_visit_data select * from website_visit_data;
DROP TABLE `brazil_e_commerce`.`website_visit_data`;
alter table nwebsite_visit_data rename to website_visit_data;




create or replace view product_info as 
select olist_products_dataset.product_id, olist_products_dataset.product_category_name, olist_products_dataset.product_photos_qty 
from olist_products_dataset
 join (
	select order_id, product_id, seller_id, price, freight_value
    from olist_order_items_dataset
) olist_order_items_dataset using (product_id)
 join (
	select order_id, customer_id
    from olist_orders_dataset
) olist_orders_dataset on olist_order_items_dataset.order_id = olist_orders_dataset.order_id
 join (
	select `product_category_name_translation`.`﻿product_category_name`, product_category_name_translation.product_category_name_english
    from product_category_name_translation
) product_category_name_translation on olist_products_dataset.product_category_name = `product_category_name_translation`.`﻿product_category_name`
 join (
	select customer_id, customer_zip_code_prefix, customer_city, customer_state 
    from olist_customers_dataset
) olist_customers_dataset on olist_orders_dataset.customer_id = olist_customers_dataset.customer_id
 join (
	select geolocation_zip_code_prefix, geolocation_lat, geolocation_lng, geolocation_city, geolocation_state
    from olist_geolocation_dataset
) olist_geolocation_dataset on olist_customers_dataset.customer_zip_code_prefix = olist_geolocation_dataset.geolocation_zip_code_prefix;

select * from product_info;
