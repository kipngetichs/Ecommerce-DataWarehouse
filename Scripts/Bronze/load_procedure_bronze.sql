

----Run these stored procudure to load bronze table for source.




CREATE OR ALTER PROCEDURE  bronze.load_bronze  AS
 

BEGIN

TRUNCATE TABLE bronze.retail_sales_dataset
BULK INSERT bronze.retail_sales_dataset
FROM 'C:\Users\StanleySONGOK\OneDrive - DCBI.aero\Desktop\My projects\EcommerceWarehouse\retail_sales_dataset.csv'

WITH (
FORMAT='csv',
FIELDTERMINATOR=',',
FIRSTROW=2,
ROWTERMINATOR='0x0a',
TABLOCK
)

END
