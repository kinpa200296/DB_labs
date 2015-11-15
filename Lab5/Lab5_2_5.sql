USE lab3;

SELECT Goods.Name, Stock.Specification, Stock.Price, OrderStocks.SellingPrice, Stock.Residue, OrderStocks.Amount
	FROM OrderStocks
INNER JOIN Stock
	ON OrderStocks.StockId = Stock.StockId
INNER JOIN Goods
	ON Stock.GoodId = Goods.GoodId
	WHERE OrderId = 13;