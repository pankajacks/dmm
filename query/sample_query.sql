-- Active: 1756297632438@@127.0.0.1@3306@retailoltp



-- On retailoltp database
SELECT o.OrderID, c.FirstName, c.LastName, p.ProductName, od.Quantity, od.Discount, o.OrderDate, o.Status
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
ORDER BY o.OrderDate;


-- On retaildwh database
------------------------------------------
-- Total revenue per month
Select Year, Month, sum(SalesAmount) as TotalRevenue
From factsales f
Join dimdate d
On f.DateKey = d.DateKey
Group By Year, Month
Order By Year, Month


-- Top 5 customers by sales
SELECT FullName, SUM(f.SalesAmount) AS TotalSales
FROM FactSales f
JOIN DimCustomer c
ON f.CustomerKey = c.CustomerKey
GROUP BY c.CustomerKey, c.FullName
ORDER BY TotalSales DESC
Limit 5;


-- Product categories generate the most profit
SELECT Category, SUM(f.Profit) AS TotalProfit
FROM FactSales f
JOIN DimProduct p 
    ON f.ProductKey = p.ProductKey
GROUP BY Category
ORDER BY TotalProfit DESC;
