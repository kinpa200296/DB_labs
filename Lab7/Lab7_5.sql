USE lab3;

SELECT Name
	FROM Organizations
    WHERE Organizations.OrganizationId
		IN (SELECT Clients.OrganizationId
			FROM Clients, 
				(SELECT Orders.ManagerClientId, COUNT(Orders.OrderId) as OrderCount
					FROM Orders
                GROUP BY Orders.ManagerClientId) as ClientOrders
			WHERE ClientOrders.ManagerClientId = Clients.ManagerClientId
		GROUP BY Clients.OrganizationId
        HAVING SUM(ClientOrders.OrderCount) > 5);
