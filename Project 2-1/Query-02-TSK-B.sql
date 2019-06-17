-- Show how many orders each employee worked with

SELECT
    Employees.EmployeeID AS "ID",
	Employees.FirstName + ' ' + Employees.LastName AS "Employee",
	COUNT(*) AS "Number of orders"
FROM
    Orders INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY
    Employees.EmployeeID, Employees.FirstName + ' ' + Employees.LastName;