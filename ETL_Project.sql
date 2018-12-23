/* query used to create joined food tables */

create database food_data;
use food_data;
select ofd_clean_norm_df.*, ofd_clean_norm_df.`OFD_ID`, `Area Abbreviation`, `Area Code`, `Area`, `Item Code`, `FAO_Category`, `Element Code`,
 `Element`, `Unit`, `latitude`, `longitude`, `Y1961`, `Y1962`, `Y1963`, `Y1964`, `Y1965`, `Y1966`, `Y1967`, `Y1968`, `Y1969`, `Y1970`, `Y1971`,
 `Y1972`, `Y1973`, `Y1974`, `Y1975`, `Y1976`, `Y1977`, `Y1978`, `Y1979`, `Y1980`, `Y1981`, `Y1982`, `Y1983`, `Y1984`, `Y1985`, `Y1986`, `Y1987`,
 `Y1988`, `Y1989`, `Y1990`, `Y1991`, `Y1992`, `Y1993`, `Y1994`, `Y1995`, `Y1996`, `Y1997`, `Y1998`, `Y1999`, `Y2000`, `Y2001`, `Y2002`, `Y2003`,
 `Y2004`, `Y2005`, `Y2006`, `Y2007`, `Y2008`, `Y2009`, `Y2010`, `Y2011`, `Y2012`, `Y2013`, `normalized_category`
from ofd_clean_norm_df
join fao_norm_df using(normalized_category);


drop table fao_ofd_df;
create table fao_ofd_df as
select `created_t`, `url`, `creator`, `created_datetime`, `code`, `countries_en`, `countries_tags`, `countries`, `product_name`, `brands`, 
	   `brands_tags`, `energy_100g`, `proteins_100g`, `salt_100g`, `sodium_100g`, `ingredients_that_may_be_from_palm_oil_n`, `ingredients_from_palm_oil_n`, 
       `fat_100g`, `sugars_100g`, `carbohydrates_100g`, `saturated-fat_100g`, `nutrition-score-fr_100g`, `nutrition_grade_fr`, `nutrition-score-uk_100g`, 
       `fiber_100g`, `serving_size`, `additives_tags`, `cholesterol_100g`, `trans-fat_100g`, `calcium_100g`, `vitamin-c_100g`, `iron_100g`, `vitamin-a_100g`, 
       `pnns_groups_2`, `pnns_groups_1`, `quantity`, `categories_tags`, `main_category_en`, `main_category`, `categories`, `categories_en`, `packaging_tags`, 
       `packaging`, `image_url`, `image_small_url`, `purchase_places`, `labels_en`, `labels`, `labels_tags`, `generic_name`, `stores`, `manufacturing_places`, 
       `manufacturing_places_tags`, `allergens`, `OFD_ID`, `OFD_Category`, `FAO_ID`, `Area Abbreviation`, `Area Code`, 
       `Area`, `Item Code`, `FAO_Category`, `Element Code`, `Element`, `Unit`, `latitude`, `longitude`, `Y1961`, `Y1962`, `Y1963`, `Y1964`, `Y1965`, `Y1966`, 
       `Y1967`, `Y1968`, `Y1969`, `Y1970`, `Y1971`, `Y1972`, `Y1973`, `Y1974`, `Y1975`, `Y1976`, `Y1977`, `Y1978`, `Y1979`, `Y1980`, `Y1981`, `Y1982`, `Y1983`, 
       `Y1984`, `Y1985`, `Y1986`, `Y1987`, `Y1988`, `Y1989`, `Y1990`, `Y1991`, `Y1992`, `Y1993`, `Y1994`, `Y1995`, `Y1996`, `Y1997`, `Y1998`, `Y1999`, `Y2000`, 
       `Y2001`, `Y2002`, `Y2003`, `Y2004`, `Y2005`, `Y2006`, `Y2007`, `Y2008`, `Y2009`, `Y2010`, `Y2011`, `Y2012`, `Y2013`, fao_norm_df.`normalized_category`
from ofd_clean_norm_df
join fao_norm_df on ofd_clean_norm_df.normalized_category = fao_norm_df.normalized_category
limit 1000;

/* queries used to work with brazil e-commerce data which turned out to be a dead end because of limited food-related categories in data */


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


INTO LOCAL OUTFILE '/var/lib/mysql-files/orders.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';