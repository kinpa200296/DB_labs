USE lab3;

INSERT INTO OrderStatus(Status)
VALUES ('Ожидается оплата'), ('Ожидает отправки'), ('Отправлен'), ('Доставлен');

SET @Wait_for_money = (SELECT MIN(StatusId) FROM OrderStatus WHERE Status='Ожидается оплата');
SET @Wait_for_depature = (SELECT MIN(StatusId) FROM OrderStatus WHERE Status='Ожидает отправки');
SET @Depature = (SELECT MIN(StatusId) FROM OrderStatus WHERE Status='Отправлен');

INSERT INTO Goods(Name)
VALUES  ('Сырок глазированный 50г'), ('Сметана 28% 400г'), ('Молоко 3,4% 1л'), ('Творог зернистый 200г'),
		('Комбо клавиатура + мышь'), ('Системный блок офисный'), ('Монитор "Интеграл"'), ('Офисный стол'), ('Офисный стул'),
        ('Arduino Starter Kit'), ('Arduino Nano'), ('Arduino Battery Case'), ('Arduino MicroSD shield');
        
INSERT INTO Employees(Name, Position, Phone)
VALUES  ('Сидоров И. С.', 'Менеджер по продажам', '80174596374'),
		('Иванов К. А.', 'Управляющий складами', '80177458962');

SET @Employee = (SELECT MIN(EmployeeId) FROM Employees WHERE Name='Сидоров И. С.');
SET @Inspector = (SELECT MIN(EmployeeId) FROM Employees WHERE Name='Иванов К. А.');

INSERT INTO Organizations(TaxNumber, Name, Boss, Adress, Phone)
VALUES  (7000000123, 'ОАО Бабушкина Крынка', 'Петров С. С.', 'г.Минск, ул. Широкая д.34', '80177124345'),
        (7000487223, 'ЗАО ПинскДрев', 'Иванов А. А.', 'г. Пинск, ул. Прямая д.32' , '80238456248'),
        (7000859223, 'ЗАО Интеграл', 'Смирнов В. К.', 'г. Минск, ул. Гикало д.5', '80175489618'),
        (7080488904, 'ООО Китай Импорт', 'Хитров А. Е', 'г. Минск, ул. Машиностроителей д.14', '80175486248'),
        (7000131223, 'Завод стройматериалов', 'Сидоров Д. Д.', 'г.Минск, ул. Сурганова д.12', '80172312465'),
        (7091274012, 'Бизнес-центр "Аналитик"', 'Верный Д. А.', 'г. Минск, ул. Чюрлениса д. 16', '80178453489'),
        (7086549264, 'Радио-магазин "Резистор"', 'Слон Е. Ю.', 'г. Минск, ул. Веры Хоружей д. 66', '8017854932');
               
INSERT INTO Suppliers(ManagerName, Phone, OrganizationId)
VALUES  ('Иванов И. И.', '80176452137', (SELECT MIN(OrganizationId) FROM Organizations WHERE Name='ОАО Бабушкина Крынка')),
		('Смирнов К. К.', '80238468513', (SELECT MIN(OrganizationId) FROM Organizations WHERE Name='ЗАО ПинскДрев')),
        ('Земной С. С.', '80175493487', (SELECT MIN(OrganizationId) FROM Organizations WHERE Name='ЗАО Интеграл')),
        ('Добрый И. К.', '80176325796', (SELECT MIN(OrganizationId) FROM Organizations WHERE Name='ООО Китай Импорт'));

INSERT INTO Clients(ManagerName, Phone, OrganizationId)
VALUES  ('Петров С. К.', '80176319875', (SELECT MIN(OrganizationId) FROM Organizations WHERE Name='Завод стройматериалов')),
		('Сидоров К. Е.', '80176584621', (SELECT MIN(OrganizationId) FROM Organizations WHERE Name='Бизнес-центр "Аналитик"')),
        ('Смирный А. Е.', '80173258746', (SELECT MIN(OrganizationId) FROM Organizations WHERE Name='Радио-магазин "Резистор"'));

INSERT INTO Stock(Specification, Price, Residue, Place, GoodId)
VALUES  ('Обычный ванильный сырок', 200, 3.4, 'г. Минск ул. Куйбышева д.32', (SELECT MIN(GoodId) FROM Goods WHERE Name='Сырок глазированный 50г')),
		('Сметана 28% жирности', 100, 5.5, 'г. Минск ул. Куйбышева д.32', (SELECT MIN(GoodId) FROM Goods WHERE Name='Сметана 28% 400г')),
        ('Молоко порошковое', 100, 5.2, 'г. Минск ул. Куйбышева д.32', (SELECT MIN(GoodId) FROM Goods WHERE Name='Молоко 3,4% 1л')),
        ('Творог зернистый', 100, 4.1, 'г. Минск ул. Куйбышева д.32', (SELECT MIN(GoodId) FROM Goods WHERE Name='Творог зернистый 200г')),
        ('Проводная клавиатура и мышь', 50, 26.2, 'г. Минск ул. Захарова д.23', (SELECT MIN(GoodId) FROM Goods WHERE Name='Комбо клавиатура + мышь')),
        ('Системный блок', 50, 262.5, 'г. Минск ул. Захарова д.23', (SELECT MIN(GoodId) FROM Goods WHERE Name='Системный блок офисный')),
        ('Монитор LG с наклекой Интеграл', 50, 105.4, 'г. Минск ул. Захарова д.23', (SELECT MIN(GoodId) FROM Goods WHERE Name='Монитор "Интеграл"')),
        ('Стол из ДСП', 100, 210.2, 'г. Минск ул. Ленина д.64', (SELECT MIN(GoodId) FROM Goods WHERE Name='Офисный стол')),
        ('Стул на колесиках', 100, 105.7, 'г. Минск ул. Ленина д.64', (SELECT MIN(GoodId) FROM Goods WHERE Name='Офисный стул')),
        ('Arduino Starter Kit', 20, 50.6, 'г. Минск ул. Широкая д.24', (SELECT MIN(GoodId) FROM Goods WHERE Name='Arduino Starter Kit')),
        ('Arduino Nano', 100, 7.1, 'г. Минск ул. Широкая д.24', (SELECT MIN(GoodId) FROM Goods WHERE Name='Arduino Nano')),
        ('Arduino Battery Case', 1000, 5.4, 'г. Минск ул. Широкая д.24', (SELECT MIN(GoodId) FROM Goods WHERE Name='Arduino Battery Case')),
        ('Arduino MicroSD shield', 5000, 3.1, 'г. Минск ул. Широкая д.24', (SELECT MIN(GoodId) FROM Goods WHERE Name='Arduino MicroSD shield'));

INSERT INTO ArriveStock(StockId, ArriveDate, ManagerSupplierId, InvoiceNumber, Amount, Price, InspectorId)
VALUES  ((SELECT MIN(StockId) FROM Stock WHERE GoodId=(SELECT MIN(GoodId) FROM Goods WHERE Name='Сырок глазированный 50г')), 
			timestamp('2015-10-21 14:24:31'),
			(SELECT MIN(ManagerSupplierId) FROM Suppliers WHERE OrganizationId=(SELECT MIN(OrganizationId) FROM Organizations WHERE Name='ОАО Бабушкина Крынка')),
			'00001', 200, 2.5, @Inspector),
            
		((SELECT MIN(StockId) FROM Stock WHERE GoodId=(SELECT MIN(GoodId) FROM Goods WHERE Name='Сметана 28% 400г')),
			timestamp('2015-10-21 14:24:31'),
			(SELECT MIN(ManagerSupplierId) FROM Suppliers WHERE OrganizationId=(SELECT MIN(OrganizationId) FROM Organizations WHERE Name='ОАО Бабушкина Крынка')),
			'00002', 100, 4.6, @Inspector),
            
        ((SELECT MIN(StockId) FROM Stock WHERE GoodId=(SELECT MIN(GoodId) FROM Goods WHERE Name='Молоко 3,4% 1л')),
			timestamp('2015-10-21 14:24:31'),
			(SELECT MIN(ManagerSupplierId) FROM Suppliers WHERE OrganizationId=(SELECT MIN(OrganizationId) FROM Organizations WHERE Name='ОАО Бабушкина Крынка')),
			'00003', 100, 4.3, @Inspector),
            
        ((SELECT MIN(StockId) FROM Stock WHERE GoodId=(SELECT MIN(GoodId) FROM Goods WHERE Name='Творог зернистый 200г')),
			timestamp('2015-10-21 14:24:31'),
			(SELECT MIN(ManagerSupplierId) FROM Suppliers WHERE OrganizationId=(SELECT MIN(OrganizationId) FROM Organizations WHERE Name='ОАО Бабушкина Крынка')),
			'00004', 100, 3.4, @Inspector),
            
        ((SELECT MIN(StockId) FROM Stock WHERE GoodId=(SELECT MIN(GoodId) FROM Goods WHERE Name='Комбо клавиатура + мышь')), 
			timestamp('2015-06-4 20:14:00'),
			(SELECT MIN(ManagerSupplierId) FROM Suppliers WHERE OrganizationId=(SELECT MIN(OrganizationId) FROM Organizations WHERE Name='ЗАО Интеграл')),
			'00005', 50, 25.4, @Inspector),
            
        ((SELECT MIN(StockId) FROM Stock WHERE GoodId=(SELECT MIN(GoodId) FROM Goods WHERE Name='Системный блок офисный')),
			timestamp('2015-06-4 20:14:00'),
			(SELECT MIN(ManagerSupplierId) FROM Suppliers WHERE OrganizationId=(SELECT MIN(OrganizationId) FROM Organizations WHERE Name='ЗАО Интеграл')),
			'00006', 50, 254.6, @Inspector),
            
        ((SELECT MIN(StockId) FROM Stock WHERE GoodId=(SELECT MIN(GoodId) FROM Goods WHERE Name='Монитор "Интеграл"')),
			timestamp('2015-06-4 20:14:00'),
			(SELECT MIN(ManagerSupplierId) FROM Suppliers WHERE OrganizationId=(SELECT MIN(OrganizationId) FROM Organizations WHERE Name='ЗАО Интеграл')),
			'00007', 50, 102.5, @Inspector),
            
        ((SELECT MIN(StockId) FROM Stock WHERE GoodId=(SELECT MIN(GoodId) FROM Goods WHERE Name='Офисный стол')),
			timestamp('2015-04-17 10:17:54'),
			(SELECT MIN(ManagerSupplierId) FROM Suppliers WHERE OrganizationId=(SELECT MIN(OrganizationId) FROM Organizations WHERE Name='ЗАО ПинскДрев')),
			'00008', 100, 200.5, @Inspector),
            
        ((SELECT MIN(StockId) FROM Stock WHERE GoodId=(SELECT MIN(GoodId) FROM Goods WHERE Name='Офисный стул')),
			timestamp('2015-04-17 10:17:54'),
			(SELECT MIN(ManagerSupplierId) FROM Suppliers WHERE OrganizationId=(SELECT MIN(OrganizationId) FROM Organizations WHERE Name='ЗАО ПинскДрев')),
			'00009', 100, 100.8, @Inspector),
        
        ((SELECT MIN(StockId) FROM Stock WHERE GoodId=(SELECT MIN(GoodId) FROM Goods WHERE Name='Arduino Starter Kit')),
			timestamp('2015-08-16 13:14:36'),
			(SELECT MIN(ManagerSupplierId) FROM Suppliers WHERE OrganizationId=(SELECT MIN(OrganizationId) FROM Organizations WHERE Name='ООО Китай Импорт')),
			'00010', 20, 35.8, @Inspector),
        
        ((SELECT MIN(StockId) FROM Stock WHERE GoodId=(SELECT MIN(GoodId) FROM Goods WHERE Name='Arduino Nano')),
			timestamp('2015-08-16 13:14:36'),
			(SELECT MIN(ManagerSupplierId) FROM Suppliers WHERE OrganizationId=(SELECT MIN(OrganizationId) FROM Organizations WHERE Name='ООО Китай Импорт')),
			'00011', 100, 3.84, @Inspector),
        
        ((SELECT MIN(StockId) FROM Stock WHERE GoodId=(SELECT MIN(GoodId) FROM Goods WHERE Name='Arduino Battery Case')),
			timestamp('2015-08-16 13:14:36'),
			(SELECT MIN(ManagerSupplierId) FROM Suppliers WHERE OrganizationId=(SELECT MIN(OrganizationId) FROM Organizations WHERE Name='ООО Китай Импорт')),
			'00012', 1000, 2.54, @Inspector),
        
        ((SELECT MIN(StockId) FROM Stock WHERE GoodId=(SELECT MIN(GoodId) FROM Goods WHERE Name='Arduino MicroSD shield')),
			timestamp('2015-08-16 13:14:36'),
			(SELECT MIN(ManagerSupplierId) FROM Suppliers WHERE OrganizationId=(SELECT MIN(OrganizationId) FROM Organizations WHERE Name='ООО Китай Импорт')),
			'00013', 5000, 1.18, @Inspector);

INSERT INTO Orders(InvoiceNumber, OrderDate, TotalPrice, ShipmentDate, Comments, ManagerClientId, StatusId, EmployeeId)
VALUES  ('10001', timestamp('2015-10-25 14:18:26'), 1600, timestamp('2015-10-30 15:16:17'), 'Срок доставки 10 дней', 
		(SELECT MIN(ManagerClientId) FROM Clients WHERE OrganizationId=(SELECT MIN(OrganizationId) FROM Organizations WHERE Name='Завод стройматериалов')),
        @Depature, @Employee),
        
       ('10002', timestamp('2015-10-26 17:29:02'), 36500, null, 'Доставка и установка', 
		(SELECT MIN(ManagerClientId) FROM Clients WHERE OrganizationId=(SELECT MIN(OrganizationId) FROM Organizations WHERE Name='Бизнес-центр "Аналитик"')),
        @Wait_for_depature, @Employee),
        
        ('10003', timestamp('2015-10-30 13:11:49'), 3250, null, 'Проверить целостность упаковки', 
		(SELECT MIN(ManagerClientId) FROM Clients WHERE OrganizationId=(SELECT MIN(OrganizationId) FROM Organizations WHERE Name='Радио-магазин "Резистор"')),
        @Wait_for_money, @Employee);
        
INSERT INTO OrderStocks(StockId, OrderId, Amount, SellingPrice)
VALUES  ((SELECT MIN(StockId) FROM Stock WHERE GoodId=(SELECT MIN(GoodId) FROM Goods WHERE Name='Сырок глазированный 50г')),
		(SELECT MIN(OrderId) FROM Orders WHERE InvoiceNumber='10001'), 150, 3.4),
        
        ((SELECT MIN(StockId) FROM Stock WHERE GoodId=(SELECT MIN(GoodId) FROM Goods WHERE Name='Сметана 28% 400г')),
		(SELECT MIN(OrderId) FROM Orders WHERE InvoiceNumber='10001'), 80, 5.5),
        
        ((SELECT MIN(StockId) FROM Stock WHERE GoodId=(SELECT MIN(GoodId) FROM Goods WHERE Name='Молоко 3,4% 1л')),
		(SELECT MIN(OrderId) FROM Orders WHERE InvoiceNumber='10001'), 70, 5.2),
        
        ((SELECT MIN(StockId) FROM Stock WHERE GoodId=(SELECT MIN(GoodId) FROM Goods WHERE Name='Творог зернистый 200г')),
		(SELECT MIN(OrderId) FROM Orders WHERE InvoiceNumber='10001'), 50, 4.1),
        
        ((SELECT MIN(StockId) FROM Stock WHERE GoodId=(SELECT MIN(GoodId) FROM Goods WHERE Name='Комбо клавиатура + мышь')),
		(SELECT MIN(OrderId) FROM Orders WHERE InvoiceNumber='10002'), 40, 26.1),
        
        ((SELECT MIN(StockId) FROM Stock WHERE GoodId=(SELECT MIN(GoodId) FROM Goods WHERE Name='Системный блок офисный')),
		(SELECT MIN(OrderId) FROM Orders WHERE InvoiceNumber='10002'), 40, 261.4),
        
        ((SELECT MIN(StockId) FROM Stock WHERE GoodId=(SELECT MIN(GoodId) FROM Goods WHERE Name='Монитор "Интеграл"')),
		(SELECT MIN(OrderId) FROM Orders WHERE InvoiceNumber='10002'), 40, 104.2),
        
        ((SELECT MIN(StockId) FROM Stock WHERE GoodId=(SELECT MIN(GoodId) FROM Goods WHERE Name='Офисный стол')),
		(SELECT MIN(OrderId) FROM Orders WHERE InvoiceNumber='10002'), 60, 208.6),
        
        ((SELECT MIN(StockId) FROM Stock WHERE GoodId=(SELECT MIN(GoodId) FROM Goods WHERE Name='Офисный стул')),
		(SELECT MIN(OrderId) FROM Orders WHERE InvoiceNumber='10002'), 60, 104.3),
        
        ((SELECT MIN(StockId) FROM Stock WHERE GoodId=(SELECT MIN(GoodId) FROM Goods WHERE Name='Arduino Starter Kit')),
		(SELECT MIN(OrderId) FROM Orders WHERE InvoiceNumber='10003'), 10, 51.6),
        
        ((SELECT MIN(StockId) FROM Stock WHERE GoodId=(SELECT MIN(GoodId) FROM Goods WHERE Name='Arduino Nano')),
		(SELECT MIN(OrderId) FROM Orders WHERE InvoiceNumber='10003'), 70, 8.1),
        
        ((SELECT MIN(StockId) FROM Stock WHERE GoodId=(SELECT MIN(GoodId) FROM Goods WHERE Name='Arduino Battery Case')),
		(SELECT MIN(OrderId) FROM Orders WHERE InvoiceNumber='10003'), 100, 5.6),
        
        ((SELECT MIN(StockId) FROM Stock WHERE GoodId=(SELECT MIN(GoodId) FROM Goods WHERE Name='Arduino MicroSD shield')),
		(SELECT MIN(OrderId) FROM Orders WHERE InvoiceNumber='10003'), 500, 3.2);

