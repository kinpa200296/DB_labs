USE lab3;

SELECT Name, TaxNumber, Address
	FROM Organizations
    WHERE Organizations.OrganizationId 
		IN (SELECT Suppliers.OrganizationId FROM Suppliers);
        
SELECT Name
	FROM Goods
    WHERE Goods.GoodId
		NOT IN (SELECT Stock.GoodId	FROM Stock);

SELECT Name
	FROM Goods
    WHERE (SELECT SUM(Stock.Residue)
			FROM Stock
            WHERE Stock.GoodId = Goods.GoodId) <= 100;

SELECT OrderId, InvoiceNumber, OrderDate
	FROM Orders
    WHERE (SELECT COUNT(OrderStocks.OrderId)
			FROM OrderStocks
            WHERE OrderStocks.OrderId = Orders.OrderId) > 2;

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

SELECT Specification
	FROM Stock, Goods
    WHERE Stock.GoodId = Goods.GoodId
		AND Goods.Name = 'Монитор'
        AND Stock.Price = 
			(SELECT MIN(Stock.Price)
				FROM Stock
				WHERE Stock.Residue > 0
					AND Stock.GoodId
						IN (SELECT Goods.GoodId
							FROM Goods
							WHERE Goods.Name = 'Монитор'))
