SELECT COUNT(DISTINCT Orders.CustomerID) AS "Number of Customers"
FROM Orders
WHERE Orders.ShipRegion IS NOT NULL;