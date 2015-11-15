USE lab3;

SELECT count(OrderId) AS OrdersCount
	FROM Orders
    WHERE OrderDate BETWEEN 
		timestamp('2010-01-01 00:00:00') 
		AND 
		timestamp('2010-12-31 23:59:59');