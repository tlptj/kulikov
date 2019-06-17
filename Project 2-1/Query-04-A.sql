SELECT COUNT(*) AS "Number of Orders"
FROM Orders
WHERE Orders.ShipRegion IS NOT NULL;