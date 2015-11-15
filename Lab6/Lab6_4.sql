USE lab3;

SELECT sum(Amount*Price) AS TotalPrice
	FROM ArriveStock
    WHERE ArriveDate BETWEEN 
		timestamp('2010-02-01 00:00:00') 
		AND 
		timestamp('2010-02-28 23:59:59');