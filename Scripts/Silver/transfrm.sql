

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
      ,CAST(CASE
        WHEN product_name = 'Dal (1kg)'       THEN 'prd000'
        WHEN product_name = 'Hair Oil'         THEN 'prd001'
        WHEN product_name = 'Smartwatch'       THEN 'prd002'
        WHEN product_name = 'Desk'             THEN 'prd003'
        WHEN product_name = 'Rice (5kg)'       THEN 'prd004'
        WHEN product_name = 'Dumbbells'        THEN 'prd005'
        WHEN product_name = 'Laptop'           THEN 'prd006'
        WHEN product_name = 'Jacket'           THEN 'prd007'
        WHEN product_name = 'Wardrobe'         THEN 'prd008'
        WHEN product_name IS NULL              THEN 'prd009'
        WHEN product_name = 'Face Cream'       THEN 'prd010'
        WHEN product_name = 'Sofa'             THEN 'prd011'
        WHEN product_name = 'Shampoo'          THEN 'prd012'
        WHEN product_name = 'Perfume'          THEN 'prd013'
        WHEN product_name = 'Comic Book'       THEN 'prd014'
        WHEN product_name = 'Textbook'         THEN 'prd015'
        WHEN product_name = 'Smartphone'       THEN 'prd016'
        WHEN product_name = 'Bed Frame'        THEN 'prd017'
        WHEN product_name = 'Yoga Mat'          THEN 'prd018'
        WHEN product_name = 'Fiction Novel'    THEN 'prd019'
        WHEN product_name = 'Sunscreen'        THEN 'prd020'
        WHEN product_name = 'Cook Book'        THEN 'prd021'
        WHEN product_name = 'Bookshelf'        THEN 'prd022'
        WHEN product_name = 'Self-Help Book'   THEN 'prd023'
        WHEN product_name = 'Chair'             THEN 'prd024'
        WHEN product_name = 'Cricket Bat'      THEN 'prd025'
        WHEN product_name = 'Sugar'             THEN 'prd026'
        WHEN product_name = 'Camera'            THEN 'prd027'
        WHEN product_name = 'Tablet'            THEN 'prd028'
        WHEN product_name = 'T-Shirt'           THEN 'prd029'
        WHEN product_name = 'Football'          THEN 'prd030'
        WHEN product_name = 'Lipstick'          THEN 'prd031'
        WHEN product_name = 'Tea'               THEN 'prd032'
        WHEN product_name = 'Dress'             THEN 'prd033'
        WHEN product_name = 'Cycle'             THEN 'prd034'
        WHEN product_name = 'Kurta'             THEN 'prd035'
        WHEN product_name = 'Biography'         THEN 'prd036'
        WHEN product_name = 'Saree'             THEN 'prd037'
        WHEN product_name = 'Cooking Oil'       THEN 'prd038'
        WHEN product_name = 'Flour'              THEN 'prd039'
        WHEN product_name = 'Headphones'        THEN 'prd040'
        WHEN product_name = 'Jeans'              THEN 'prd041'
        WHEN product_name = 'Tennis Racket'     THEN 'prd042'
        ELSE 'UNKNOWN'
    END AS VARCHAR(50)) AS product_id
    ,CAST(CASE
    WHEN product_category = 'Books'        THEN 'prdc00'
    WHEN product_category = 'Sports'       THEN 'prdc01'
    WHEN product_category IS NULL          THEN 'prdc02'
    WHEN product_category = 'Furniture'    THEN 'prdc03'
    WHEN product_category = 'Groceries'     THEN 'prdc04'
    WHEN product_category = 'Beauty'       THEN 'prdc05'
    WHEN product_category = 'Electronics'  THEN 'prdc06'
    WHEN product_category = 'Clothing'     THEN 'prdc07'
    ELSE 'UNKNOWN'
END AS VARCHAR(50)) AS product_category_id
,CAST(CASE
    WHEN city = 'Pune'          THEN '000'
    WHEN city = 'Bhubaneswar'   THEN '001'
    WHEN city = 'Hyderabad'     THEN '002'
    WHEN city = 'Raipur'        THEN '003'
    WHEN city = 'Guwahati'      THEN '004'
    WHEN city = 'Patna'         THEN '005'
    WHEN city = 'Ludhiana'      THEN '006'
    WHEN city = 'Chandigarh'    THEN '007'
    WHEN city IS NULL           THEN '008'
    WHEN city = 'Ahmedabad'     THEN '009'
    WHEN city = 'Indore'        THEN '010'
    WHEN city = 'Bangalore'     THEN '011'
    WHEN city = 'Kochi'         THEN '012'
    WHEN city = 'Mumbai'        THEN '013'
    WHEN city = 'Surat'         THEN '014'
    WHEN city = 'Chennai'       THEN '015'
    WHEN city = 'Nagpur'        THEN '016'
    WHEN city = 'Kolkata'       THEN '017'
    WHEN city = 'Amritsar'      THEN '018'
    WHEN city = 'Delhi'         THEN '019'
    WHEN city = 'Bhopal'        THEN '020'
    ELSE 'UNKNOWN'
END AS VARCHAR(50)) AS city_id
  FROM [EcommerceWarehouse].[bronze].[retail_sales_dataset]
