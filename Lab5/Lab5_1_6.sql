USE lab3;

SELECT Specification, Price
	FROM Stock
    WHERE (GoodId = 500)
    ORDER BY Price DESC;