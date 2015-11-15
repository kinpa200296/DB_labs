USE lab3;

SELECT count(StockId) AS NumberOfTypes
	FROM Stock, Goods
    WHERE Goods.GoodId = Stock.GoodId AND Name = 'Монитор';