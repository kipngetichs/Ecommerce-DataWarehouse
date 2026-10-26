

SELECT  CAST(ISNULL(order_id,'N/A')AS VARCHAR(50)) AS order_id
      
  ,      CAST 
            (COALESCE(
                TRY_CONVERT(DATE, TRIM(order_date), 107),
                TRY_CONVERT(DATE, TRIM(order_date), 103),
                TRY_CONVERT(DATE, TRIM(order_date), 111)
            )AS DATE) AS order_date
      ,CAST(ISNULL(customer_id,'N/A') AS VARCHAR(50)) AS customer_id
      ,CAST(ISNULL(customer_name,'N/A') AS VARCHAR(50)) AS customer_name
      ,CAST(CASE
       WHEN CAST(age AS FLOAT) <=0 THEN CAST(age AS FLOAT)* CAST(age AS FLOAT)
          ELSE CAST(age AS FLOAT)
       END AS INT) AS age
      ,CASE
      WHEN gender IN ('f','Female','FEMALE') THEN 'Female'
      WHEN gender IN ('m','Male','MALE') THEN 'Male' 
       ELSE 'Other'
     END AS gender
      ,ISNULL(region,'N/A')region
      ,ISNULL(city,'N/A')city
      ,ISNULL(product_category,'N/A')product_category
      ,ISNULL(product_name,'N/A')product_name
      ,CAST(ISNULL( CASE
       WHEN CAST( quantity AS FLOAT) <= 0 OR CAST( quantity AS FLOAT) IS NULL
       THEN  CAST( quantity AS FLOAT) * CAST( quantity AS FLOAT)
       ELSE CAST( quantity AS FLOAT)
   END,0)AS INT) AS quantity
      ,CAST(ISNULL(CAST(unit_price AS FLOAT),0) AS FLOAT) AS unit_price
      ,CAST(ISNULL(CAST(discount_pct AS FLOAT),0) AS FLOAT) AS discount_pct
      ,CAST(
        CASE
            WHEN TRY_CAST(quantity AS DECIMAL(18, 2)) IS NOT NULL
             AND TRY_CAST(unit_price AS DECIMAL(18, 2)) IS NOT NULL
             AND TRY_CAST(discount_pct AS DECIMAL(18, 4)) IS NOT NULL
            THEN
                TRY_CAST(quantity AS DECIMAL(18, 2))
                * TRY_CAST(unit_price AS DECIMAL(18, 2))
                * (1 - TRY_CAST(discount_pct AS DECIMAL(18, 4)))
            ELSE TRY_CAST(sales_amount AS DECIMAL(18, 2))
        END
        AS DECIMAL(18, 2)
    ) AS sales_amount
      ,CAST(ISNULL(TRY_CAST(profit AS DECIMAL(18,2)),0) AS DECIMAL(18,2))AS profit
      ,CAST(ISNULL(TRY_CAST(ABS(shipping_cost) AS DECIMAL(18,2)),0) AS DECIMAL(18,2)) AS shipping_cost
      ,CAST(ISNULL(payment_method,'N/A') AS VARCHAR(50)) AS payment_method
      ,CAST(ISNULL(TRY_CAST( customer_satisfaction AS DECIMAL(18,2)),0) AS INT)AS customer_satisfaction
      ,CAST(TRY_CAST(return_flag AS BIT) AS BIT)AS return_flag
      ,CAST(ISNULL(order_status,'N/A') AS VARCHAR(50))AS order_status
      ,CAST(ISNULL(TRY_CAST(days_to_ship AS DECIMAL(18,2)),0) AS INT)days_to_ship
  FROM [EcommerceWarehouse].[bronze].[retail_sales_dataset]
