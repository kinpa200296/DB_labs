USE lab3;

SELECT sum(ArriveStock.Amount) AS TotalAmount
	FROM Arrivestock
    WHERE ManagerSupplierId = 3 AND StockId = 4;