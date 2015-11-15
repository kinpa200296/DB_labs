USE lab3;

SELECT count(*) AS OrdersCount
	FROM Orders;

SELECT count(StockId) AS NumberOfPositions, sum(Amount*SellingPrice) AS TotalCost
	FROM OrderStocks
    WHERE OrderId = 5;

SELECT sum(ArriveStock.Amount) AS TotalAmount
	FROM Arrivestock
    WHERE ManagerSupplierId = 3 AND StockId = 4;

SELECT sum(Amount*Price) AS TotalPrice
	FROM ArriveStock
    WHERE ArriveDate BETWEEN 
		timestamp('2010-02-01 00:00:00') 
		AND 
		timestamp('2010-02-28 23:59:59');

SELECT count(StockId) AS NumberOfTypes
	FROM Stock, Goods
    WHERE Goods.GoodId = Stock.GoodId AND Name = 'Монитор';

SELECT count(OrderId) AS OrdersCount
	FROM Orders
    WHERE OrderDate BETWEEN 
		timestamp('2010-01-01 00:00:00') 
		AND 
		timestamp('2010-12-31 23:59:59');

SELECT Clients.ManagerName, count(Orders.OrderId) AS OrdersCount
	FROM Orders
RIGHT JOIN Clients
	ON Clients.ManagerClientId = Orders.ManagerClientId
	GROUP BY Clients.ManagerName
	ORDER BY Clients.ManagerName ASC;

SELECT Goods.Name, sum(Stock.Residue) AS TotalResidue
	FROM Stock
RIGHT JOIN Goods
	ON Stock.GoodId = Goods.GoodId
	GROUP BY Goods.Name
    HAVING TotalResidue < 500;

SELECT Clients.ManagerName, sum(Orders.TotalPrice) AS TotalSpent
	FROM Orders
RIGHT JOIN Clients
	ON Clients.ManagerClientId = Orders.ManagerClientId
    GROUP BY Clients.ManagerName
    HAVING TotalSpent >= 10000;
