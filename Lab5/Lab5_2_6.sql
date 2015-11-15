USE lab3;

SELECT Clients.ManagerName, Orders.OrderId
	FROM Clients
INNER JOIN Orders
	ON Clients.ManagerClientId = Orders.ManagerClientId
    ORDER BY Clients.ManagerName ASC;