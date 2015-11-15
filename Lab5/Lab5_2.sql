USE lab3;

SELECT OrderId, InvoiceNumber, OrderDate, TotalPrice
	FROM Orders, Employees
    WHERE Orders.EmployeeId = Employees.EmployeeId AND Name = 'Ружанская О.Л.'
		AND OrderDate BETWEEN 
			timestamp('2010-02-01 00:00:00') 
			AND 
			timestamp('2010-02-28 23:59:59');

SELECT 'Монитор' AS Name, Specification, Residue
	FROM Stock, Goods
    WHERE Goods.GoodId = Stock.GoodId AND Name = 'Монитор';

SELECT 'Монитор' AS Name, Stock.Specification, ArriveStock.ArriveDate, ArriveStock.Amount
	FROM Stock
INNER JOIN ArriveStock
	ON Stock.StockId = ArriveStock.StockId
INNER JOIN Goods
    ON Goods.GoodId = Stock.GoodId AND Goods.Name = 'Монитор'
	ORDER BY Specification ASC, ArriveDate ASC;

SELECT 'Телевизор' AS Name, Stock.Specification, ArriveStock.ArriveDate, ArriveStock.Amount, Suppliers.OrganizationId
	FROM Stock
INNER JOIN Arrivestock
	ON ArriveStock.StockId = Stock.StockId
INNER JOIN Suppliers
	ON Suppliers.ManagerSupplierId = ArriveStock.ManagerSupplierId
INNER JOIN Goods
    ON Goods.GoodId = Stock.GoodId AND Goods.Name = 'Телевизор'
INNER JOIN Organizations
	ON Organizations.OrganizationId = Suppliers.OrganizationId AND Organizations.Name = 'УП "Белкантон"';

SELECT Goods.Name, Stock.Specification, Stock.Price, OrderStocks.SellingPrice, Stock.Residue, OrderStocks.Amount
	FROM OrderStocks
INNER JOIN Stock
	ON OrderStocks.StockId = Stock.StockId
INNER JOIN Goods
	ON Stock.GoodId = Goods.GoodId
	WHERE OrderId = 13;

SELECT Clients.ManagerName, Orders.OrderId
	FROM Clients
INNER JOIN Orders
	ON Clients.ManagerClientId = Orders.ManagerClientId
    ORDER BY Clients.ManagerName ASC;

SELECT Clients.ManagerName, Orders.OrderId
	FROM Clients
LEFT JOIN Orders
	ON Clients.ManagerClientId = Orders.ManagerClientId
    ORDER BY Clients.ManagerName ASC;

SELECT Goods.GoodId, Goods.Name
	FROM Goods
LEFT JOIN Stock
	ON Stock.GoodId = Goods.GoodId
    WHERE Stock.Residue = 0 OR Stock.StockId IS NULL;

