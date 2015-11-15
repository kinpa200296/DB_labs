USE lab3;

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