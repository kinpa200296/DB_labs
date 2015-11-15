USE lab3;

INSERT INTO Organizations(TaxNumber, Name, Boss, Adress, Phone)
VALUES(7000000001, 'ОАО Белвест', 'Иванов А. А.', 'г.Минск, пр-т Победителей д.64', '80177234568');

SET @BelvestId = (SELECT OrganizationId FROM Organizations WHERE Name='ОАО Белвест');

UPDATE Organizations
SET Boss='Смирнов В. Л.'
WHERE OrganizationId = @BelvestId;

INSERT INTO Goods(Name)
VALUES('Сапоги меховые');

SET @BootsId = (SELECT GoodId From Goods WHERE Name='Сапоги меховые');

INSERT INTO Stock(Specification, Price, Residue, Place, GoodId)
VALUES('Сапоги из натурального меха', 12.123, 5, 'г. Минск ул. Куйбышева д.32', @BootsId);

INSERT INTO Organizations(TaxNumber, Name, Boss, Adress, Phone)
VALUES(7000000123, 'ОАО Бабушкина Крынка', 'Петров С. С.', 'г.Минск, пр-т Дзержинского д.34', '80177124345'),
		(7000131223, 'Завод стройматериалов', 'Сидоров Д. Д.', 'г.Минск, ул. Сурганова д.12', '80172312465');

SET @Krynka = (SELECT OrganizationId FROM Organizations WHERE Name='ОАО Бабушкина Крынка');
SET @Factory = (SELECT OrganizationId FROM Organizations WHERE Name='Завод стройматериалов');

INSERT INTO Suppliers(ManagerName, Phone, OrganizationId)
VALUES('Иванов И. И.', '80175486592', @Krynka);

INSERT INTO Clients(ManagerName, Phone, OrganizationId)
VALUES('Смирнов В. В.', '80177859435', @Factory);

INSERT INTO OrderStatus(Status)
VALUES ('Ожидается оплата'), ('Ожидает отправки'), ('Отправлен'), ('Доставлен');

INSERT INTO Employees(Name, Position, Phone)
VALUES ('Сидоров И. С.', 'Менеджер по продажам', '80174596374');

SET @Employee = (SELECT EmployeeId FROM Employees WHERE Name='Сидоров И. С.');
SET @Client = (SELECT ManagerClientId From Clients WHERE ManagerName='Смирнов В. В.');

SET @Wait_for_depature = (SELECT StatusId FROM OrderStatus WHERE Status='Ожидает отправки');
SET @Arrived = (SELECT StatusId FROM OrderStatus WHERE Status='Доставлен');

INSERT INTO Orders(InvoiceNumber, OrderDate, TotalPrice, ShipmentDate, Comments, ManagerClientId, StatusId, EmployeeId)
VALUES ('121212', timestamp('2015-10-21 14:24:31'), 1231.123, timestamp('2015-10-23 19:18:17'), 'Завернуть в упаковку', @Client, @Arrived, @Employee),
	('121213', timestamp('2015-10-23 15:24:31'), 321.12, null, 'Завернуть в упаковку', @Client, @Wait_for_depature, @Employee);

SET @Stock = (SELECT StockId FROM Stock WHERE GoodId = (SELECT GoodId FROM Goods WHERE Name = 'Сапоги меховые'));
SET @Order1 = (SELECT OrderId FROM Orders WHERE InvoiceNumber = '121212');
SET @Order2 = (SELECT OrderId FROM Orders WHERE InvoiceNumber = '121213');

INSERT INTO OrderStocks(StockId, OrderId, Amount, SellingPrice)
VALUES (@Stock, @Order1, 3, 410.37),
		(@Stock, @Order2, 1, 321.12);
        
DELETE FROM OrderStocks;
DELETE FROM Orders;