USE lab3;

SELECT count(StockId) AS NumberOfPositions, sum(Amount*SellingPrice) AS TotalCost
	FROM OrderStocks
    WHERE OrderId = 5;