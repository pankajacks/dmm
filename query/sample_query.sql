-- Active: 1756297632438@@127.0.0.1@3306@retailoltp

SELECT o.OrderID, c.FirstName, c.LastName, p.ProductName, od.Quantity, od.Discount, o.OrderDate, o.Status
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
ORDER BY o.OrderDate;