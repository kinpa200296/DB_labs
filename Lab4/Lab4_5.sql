USE lab3;

INSERT INTO OrderStatus(Status)
VALUES ('Ожидается оплата'), ('Ожидает отправки'), ('Отправлен'), ('Доставлен');

SELECT * FROM OrderStatus;

INSERT INTO Employees(Name, Position, Phone)
VALUES ('Сидоров И. С.', 'Менеджер по продажам', '80174596374');

SELECT * FROM Employees;

SET @Employee = (SELECT EmployeeId FROM Employees WHERE Name='Сидоров И. С.');
SET @Client = (SELECT ManagerClientId From Clients WHERE ManagerName='Смирнов В. В.');

SET @Wait_for_depature = (SELECT StatusId FROM OrderStatus WHERE Status='Ожидает отправки');
SET @Arrived = (SELECT StatusId FROM OrderStatus WHERE Status='Доставлен');

INSERT INTO Orders(InvoiceNumber, OrderDate, TotalPrice, ShipmentDate, Comments, ManagerClientId, StatusId, EmployeeId)
VALUES ('121212', timestamp('2015-10-21 14:24:31'), 1231.123, timestamp('2015-10-23 19:18:17'), 'Завернуть в упаковку', @Client, @Arrived, @Employee),
	('121213', timestamp('2015-10-23 15:24:31'), 321.12, null, 'Завернуть в упаковку', @Client, @Wait_for_depature, @Employee);
    
SELECT * FROM Orders;

SET @Stock = (SELECT StockId FROM Stock WHERE GoodId = (SELECT GoodId FROM Goods WHERE Name = 'Сапоги меховые'));
SET @Order1 = (SELECT OrderId FROM Orders WHERE InvoiceNumber = '121212');
SET @Order2 = (SELECT OrderId FROM Orders WHERE InvoiceNumber = '121213');

INSERT INTO OrderStocks(StockId, OrderId, Amount, SellingPrice)
VALUES (@Stock, @Order1, 3, 410.37),
		(@Stock, @Order2, 1, 321.12);
        
SELECT * FROM OrderStocks;