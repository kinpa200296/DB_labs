USE lab3;

SELECT Goods.Name, sum(Stock.Residue) AS TotalResidue
	FROM Stock
RIGHT JOIN Goods
	ON Stock.GoodId = Goods.GoodId
	GROUP BY Goods.Name
    HAVING TotalResidue < 500;