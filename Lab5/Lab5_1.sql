USE lab3;

SELECT * FROM Organizations;

SELECT Name, TaxNumber, Boss 
	FROM Organizations
    ORDER BY Name ASC;

SELECT * FROM Organizations
	WHERE Name = 'ООО "Гранит"';

SELECT * FROM Organizations
	WHERE Name LIKE 'ООО %';

SELECT Specification, Price, Residue
	FROM Stock
    WHERE (GoodId = 101) AND (Residue > 100);

SELECT Specification, Price
	FROM Stock
    WHERE (GoodId = 500)
    ORDER BY Price DESC;
