USE ShopDb

--INNER JOIN--
		
SELECT c.CustomerID, c.FirstName, o.OrderAmount
FROM Customers c INNER JOIN Orders o
ON c.CustomerId = o.CustomerId
ORDER BY c.CustomerID

--WHERE--

SELECT o.OrderId, o.OrderDate, c.FirstName, c.LastName, o.OrderAmount
FROM ORDERS o INNER JOIN CUSTOMERS c 
ON o.CustomerId = c.CustomerId
WHERE c.City = 'New York';	

--AGGREGATE Function

SELECT c.FirstName, c.LastName, COUNT(o.OrderId) AS OrderCount
FROM CUSTOMERS c LEFT JOIN ORDERS o 
ON c.CustomerId = o.CustomerId
GROUP BY c.FirstName, c.LastName
ORDER BY OrderCount DESC;

SELECT c.CustomerId, c.FirstName, c.LastName, SUM(o.OrderAmount) as 'TotalOrderAmount'
FROM CUSTOMERS c INNER JOIN ORDERS o 
ON c.CustomerId = o.CustomerId
GROUP BY c.CustomerId, c.FirstName, c.LastName;


SELECT c.CustomerId, c.FirstName, c.LastName, SUM(o.OrderAmount) as 'TotalOrderAmount'
FROM CUSTOMERS c INNER JOIN ORDERS o 
ON c.CustomerId = o.CustomerId
GROUP BY c.CustomerId, c.FirstName, c.LastName
HAVING SUM(o.OrderAmount) > 100;


SELECT c.CustomerId, c.FirstName, c.LastName, SUM(o.OrderAmount) as 'TotalOrderAmount'
FROM CUSTOMERS c INNER JOIN ORDERS o 
ON c.CustomerId = o.CustomerId
WHERE o.OrderDate >= '2019-01-01'
GROUP BY c.CustomerId,  c.FirstName, c.LastName
HAVING SUM(o.OrderAmount) > 100;