-- Active: 1756297632438@@127.0.0.1@3306@retailoltp

-- Drop customers table if it exists
DROP TABLE IF EXISTS Customers;

-- Create customers table
CREATE TABLE Customers (
    CustomerID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20),
    Region VARCHAR(50)
);


-- Add primary key to customers table and auto increment to CustomerID
ALTER TABLE Customers
MODIFY CustomerID INT AUTO_INCREMENT PRIMARY KEY;


-- Enable local_infile for loading data from local files
SHOW GLOBAL VARIABLES LIKE 'local_infile';

-- If it's off, enable it
SET GLOBAL local_infile=1;

-- Load data into mysql customers table from a csv file
LOAD DATA LOCAL INFILE 'C:/sql_tmp/case_study_pandas_data_analytics/customer.csv'
INTO TABLE Customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(FirstName, LastName, Email, Phone, Region);

-- Verify data load
SELECT COUNT(*) FROM Customers; 


-- Preview some rows
SELECT * FROM Customers LIMIT 100;