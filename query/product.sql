-- Active: 1756297632438@@127.0.0.1@3306@retailoltp
-- Drop Products table if it exists
DROP TABLE IF EXISTS Products;


-- create products table and load data from csv file
CREATE TABLE Products (
    ProductID INT, 
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    UnitPrice DECIMAL(10,2),
    CostPrice DECIMAL(10,2)
);

-- Add primary key constraint to Products table and auto increment
ALTER TABLE Products
MODIFY ProductID INT AUTO_INCREMENT PRIMARY KEY;


-- Enable local_infile for loading data from local files
SHOW GLOBAL VARIABLES LIKE 'local_infile';

-- If it's off, enable it
-- SET GLOBAL local_infile=1;

-- Load data into mysql products table from a csv file

-- empty table before loading data
TRUNCATE TABLE Products;

LOAD DATA LOCAL INFILE 'C:/sql_tmp/case_study_pandas_data_analytics/products.csv'
INTO TABLE Products
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(ProductName, Category, UnitPrice, CostPrice);

-- Verify data load
SELECT COUNT(*) FROM Products;

-- Preview some rows
SELECT * FROM Products LIMIT 100;