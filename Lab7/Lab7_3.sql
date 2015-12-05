USE lab3;

SELECT Name
	FROM Goods
    WHERE (SELECT SUM(Stock.Residue)
			FROM Stock
            WHERE Stock.GoodId = Goods.GoodId) <= 100;
