-- Drop Orders table if it exists
DROP TABLE IF EXISTS Orders;

-- Create Orders table and load data from CSV file
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Status VARCHAR(20)
);


-- Add foreign key constraint to Orders table
ALTER TABLE Orders
ADD FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);

-- Enable local_infile for loading data from local files
SHOW GLOBAL VARIABLES LIKE 'local_infile';

-- If it's off, enable it
-- SET GLOBAL local_infile=1;

-- Load data into mysql orders table from a csv file
LOAD DATA LOCAL INFILE 'C:/sql_tmp/case_study_pandas_data_analytics/orders.csv'
INTO TABLE Orders
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(CustomerID, OrderDate, Status);

-- Verify data load
SELECT COUNT(*) FROM orders;

-- Preview some rows
SELECT * FROM orders LIMIT 100;
