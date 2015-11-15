USE lab3;

SELECT Goods.GoodId, Goods.Name
	FROM Goods
LEFT JOIN Stock
	ON Stock.GoodId = Goods.GoodId
    WHERE Stock.Residue = 0 OR Stock.StockId IS NULL;