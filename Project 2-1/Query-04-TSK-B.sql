-- Show Number of customers who made orders

SELECT COUNT(DISTINCT Orders.CustomerID) AS "Number of Customers"
FROM Orders