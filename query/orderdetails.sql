-- Active: 1756297632438@@127.0.0.1@3306@retailoltp

--drop table if exists orderdetails;
drop table if exists OrderDetails;

-- Create orderdetails table
CREATE TABLE OrderDetails (
    OrderDetailID INT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Discount DECIMAL(10,2)    
);

-- add primary key constraint and auto increment to OrderDetailID
ALTER TABLE OrderDetails
MODIFY OrderDetailID INT AUTO_INCREMENT PRIMARY KEY;


-- add foreign key constraint to OrderID and ProductID
ALTER TABLE OrderDetails
ADD CONSTRAINT fk_OrderID FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
ADD CONSTRAINT fk_ProductID FOREIGN KEY (ProductID) REFERENCES Products(ProductID);

-- Enable local_infile for loading data from local files
SHOW GLOBAL VARIABLES LIKE 'local_infile';

-- If it's off, enable it
-- SET GLOBAL local_infile=1;

-- Load data into mysql orderdetails table from a csv file
LOAD DATA LOCAL INFILE 'C:/sql_tmp/case_study_pandas_data_analytics/orderdetails.csv'
INTO TABLE OrderDetails
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(OrderID, ProductID, Quantity, Discount);


-- Query to verify data load
SELECT * FROM OrderDetails LIMIT 10;

-- Count total rows in orderdetails table
SELECT COUNT(*) AS TotalRows FROM OrderDetails;