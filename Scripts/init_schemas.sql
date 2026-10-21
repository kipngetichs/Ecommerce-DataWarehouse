/* 
creating schemas for ELT process , end to end 
*/


IF OBJECT_ID ('EcommerceWarehouse','U') IS NOT NULL
  DROP DATABASE EcommerceWarehouse

CREATE DATABASE EcommerceWarehouse

GO

CREATE SCHEMA bronze;

GO

CREATE SCHEMA silver;

GO

CREATE SCHEMA gold;

