USE lab3;

SELECT Clients.ManagerName, Orders.OrderId
	FROM Clients
LEFT JOIN Orders
	ON Clients.ManagerClientId = Orders.ManagerClientId
    ORDER BY Clients.ManagerName ASC;