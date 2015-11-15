USE lab3;

SELECT OrderId, InvoiceNumber, OrderDate, TotalPrice
	FROM Orders, Employees
    WHERE Orders.EmployeeId = Employees.EmployeeId AND Name = 'Ружанская О.Л.'
		AND OrderDate BETWEEN 
			timestamp('2010-02-01 00:00:00') 
			AND 
			timestamp('2010-02-28 23:59:59');