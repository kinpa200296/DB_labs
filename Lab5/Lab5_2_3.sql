USE lab3;

SELECT 'Монитор' AS Name, Stock.Specification, ArriveStock.ArriveDate, ArriveStock.Amount
	FROM Stock
INNER JOIN ArriveStock
	ON Stock.StockId = ArriveStock.StockId
INNER JOIN Goods
    ON Goods.GoodId = Stock.GoodId AND Goods.Name = 'Монитор'
	ORDER BY Specification ASC, ArriveDate ASC;