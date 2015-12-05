USE lab3;

SELECT OrderId, InvoiceNumber, OrderDate
	FROM Orders
    WHERE (SELECT COUNT(OrderStocks.OrderId)
			FROM OrderStocks
            WHERE OrderStocks.OrderId = Orders.OrderId) > 2;
