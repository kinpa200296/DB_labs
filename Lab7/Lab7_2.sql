USE lab3;

SELECT Name
	FROM Goods
    WHERE Goods.GoodId
		NOT IN (SELECT Stock.GoodId	FROM Stock);
