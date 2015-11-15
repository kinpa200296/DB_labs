USE lab3;

INSERT INTO Goods(Name)
VALUES('Сапоги меховые');

SELECT * FROM Goods;

SET @BootsId = (SELECT GoodId From Goods WHERE Name='Сапоги меховые');

INSERT INTO Stock(Specification, Price, Residue, Place, GoodId)
VALUES('Сапоги из натурального меха', 12.123, 5, 'г. Минск ул. Куйбышева д.32', @BootsId);

SELECT * FROM Stock;