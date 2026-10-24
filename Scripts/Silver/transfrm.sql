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
      ,[sales_amount]
      ,[profit]
      ,[shipping_cost]
      ,[payment_method]
      ,[customer_satisfaction]
      ,[return_flag]
      ,[order_status]
      ,[days_to_ship]
  FROM [EcommerceWarehouse].[bronze].[retail_sales_dataset]
