USE lab3;

SELECT Specification, Price, Residue
	FROM Stock
    WHERE (GoodId = 101) AND (Residue > 100);