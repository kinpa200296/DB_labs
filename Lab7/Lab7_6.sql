USE lab3;

SELECT Name
	FROM Organizations
    WHERE Organizations.OrganizationId
		IN (SELECT Clients.OrganizationId
				FROM Clients
				WHERE Clients.ManagerClientId
					IN (SELECT Orders.ManagerClientId
						FROM Orders
						WHERE Orders.OrderId 
							IN (SELECT OrderStocks.OrderId
								FROM OrderStocks
								WHERE OrderStocks.StockId = 12))
			GROUP BY Clients.OrganizationId);
