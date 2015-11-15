USE lab3;

SELECT Clients.ManagerName, sum(Orders.TotalPrice) AS TotalSpent
	FROM Orders
RIGHT JOIN Clients
	ON Clients.ManagerClientId = Orders.ManagerClientId
    GROUP BY Clients.ManagerName
    HAVING TotalSpent >= 10000;