USE lab3;

INSERT INTO Organizations(TaxNumber, Name, Boss, Adress, Phone)
VALUES(7000000123, 'ОАО Бабушкина Крынка', 'Петров С. С.', 'г.Минск, пр-т Дзержинского д.34', '80177124345'),
		(7000131223, 'Завод стройматериалов', 'Сидоров Д. Д.', 'г.Минск, ул. Сурганова д.12', '80172312465');
        
SELECT * FROM Organizations;

SET @Krynka = (SELECT OrganizationId FROM Organizations WHERE Name='ОАО Бабушкина Крынка');
SET @Factory = (SELECT OrganizationId FROM Organizations WHERE Name='Завод стройматериалов');

INSERT INTO Suppliers(ManagerName, Phone, OrganizationId)
VALUES('Иванов И. И.', '80175486592', @Krynka);

SELECT * FROM Suppliers;

INSERT INTO Clients(ManagerName, Phone, OrganizationId)
VALUES('Смирнов В. В.', '80177859435', @Factory);

SELECT * FROM Clients;