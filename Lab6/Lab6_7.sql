USE lab3;

SELECT Clients.ManagerName, count(Orders.OrderId) AS OrdersCount
	FROM Orders
RIGHT JOIN Clients
	ON Clients.ManagerClientId = Orders.ManagerClientId
	GROUP BY Clients.ManagerName
	ORDER BY Clients.ManagerName ASC;