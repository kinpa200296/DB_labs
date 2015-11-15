USE lab3;

SELECT 'Монитор' AS Name, Specification, Residue
	FROM Stock, Goods
    WHERE Goods.GoodId = Stock.GoodId AND Name = 'Монитор';