
IF OBJECT_ID('bronze.retail_sales_dataset','U')IS NOT NULL
      DROP TABLE bronze.retail_sales_dataset


---these query creates Bronze layer table when you run


CREATE TABLE bronze.retail_sales_dataset
(
            order_id                         VARCHAR(50),	
            order_date	                     VARCHAR(50),
            customer_id	                     VARCHAR(50),
            customer_name                    VARCHAR(50),	
            age	                             VARCHAR(50),
            gender	                         VARCHAR(50),
            region	                         VARCHAR(50),
            city	                         VARCHAR(50),
            product_category                 VARCHAR(50),	
            product_name	                 VARCHAR(50),
            quantity	                     VARCHAR(50),
            unit_price	                     VARCHAR(50),
            discount_pct	                 VARCHAR(50),
            sales_amount	                 VARCHAR(50),
            profit	                         VARCHAR(50),
            shipping_cost	                 VARCHAR(50),
            payment_method	                 VARCHAR(50),
            customer_satisfaction            VARCHAR(50),	
            return_flag	                     VARCHAR(50),
            order_status	                 VARCHAR(50),
            days_to_ship                     VARCHAR(50)

)
