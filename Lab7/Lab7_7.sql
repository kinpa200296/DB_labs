USE lab3;

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
