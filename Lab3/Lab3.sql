CREATE DATABASE lab3;
USE lab3;

CREATE TABLE Goods(
	GoodId INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL);
    
CREATE TABLE OrderStatus(
	StatusId INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Status VARCHAR(30) NOT NULL);

CREATE TABLE Employees(
	EmployeeId INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Name VARCHAR(40) NOT NULL,
    Position VARCHAR(20) NOT NULL,
    Phone VARCHAR(15) NOT NULL);

CREATE TABLE Organizations(
	OrganizationId INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    TaxNumber VARCHAR(15) NOT NULL,
    Name VARCHAR(25) NOT NULL,
    Boss VARCHAR(40) NOT NULL,
    Adress VARCHAR(45) NOT NULL,
    Phone VARCHAR(15) NOT NULL);
    
CREATE TABLE Clients(
	ManagerClientId INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ManagerName VARCHAR(40) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Fax VARCHAR(15) NULL,
    OrganizationId INT UNSIGNED NOT NULL,
    FOREIGN KEY (OrganizationId) REFERENCES Organizations(OrganizationId));

CREATE TABLE Suppliers(
	ManagerSupplierId INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ManagerName VARCHAR(40) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Fax VARCHAR(15) NULL,
    OrganizationId INT UNSIGNED NOT NULL,
    FOREIGN KEY (OrganizationId) REFERENCES Organizations(OrganizationId));

CREATE TABLE Stock(
	StockId INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Specification VARCHAR(30) NOT NULL,
    Price FLOAT UNSIGNED NOT NULL,
    Residue INT UNSIGNED NOT NULL,
    Place VARCHAR(45) NOT NULL,
	GoodId INT UNSIGNED NOT NULL,
    FOREIGN KEY (GoodId) REFERENCES Goods(GoodId));

CREATE TABLE ArriveStock(
	StockId INT UNSIGNED NOT NULL,
    FOREIGN KEY (StockId) REFERENCES Stock(StockId),
    ArriveDate TIMESTAMP NOT NULL,
    CONSTRAINT ArriveStockId PRIMARY KEY (StockId, ArriveDate),
    ManagerSupplierId INT UNSIGNED NOT NULL,
    FOREIGN KEY (ManagerSupplierId) REFERENCES Suppliers(ManagerSupplierId),
    InvoiceNumber VARCHAR(25) NOT NULL,
    Amount INT UNSIGNED NOT NULL,
    Price FLOAT UNSIGNED NOT NULL,
    InspectorId INT UNSIGNED NOT NULL,
    FOREIGN KEY (InspectorId) REFERENCES Employees(EmployeeId));

CREATE TABLE Orders(
	OrderId INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    InvoiceNumber VARCHAR(25) NOT NULL,
    OrderDate TIMESTAMP NOT NULL,
    TotalPrice FLOAT UNSIGNED NOT NULL,
    ShipmentDate TIMESTAMP NULL,
    Comments VARCHAR(100) NOT NULL,
	ManagerClientId INT UNSIGNED NOT NULL,
    FOREIGN KEY (ManagerClientId) REFERENCES Clients(ManagerClientId),
    StatusId INT UNSIGNED NOT NULL,
    FOREIGN KEY (StatusId) REFERENCES OrderStatus(StatusId),
    EmployeeId INT UNSIGNED NOT NULL,
    FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId));

CREATE TABLE OrderStocks(
	StockId INT UNSIGNED NOT NULL,
    FOREIGN KEY (StockId) REFERENCES Stock(StockId),
    OrderId INT UNSIGNED NOT NULL,
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId),
    CONSTRAINT OrderStockId PRIMARY KEY (StockId, OrderId),
    Amount INT UNSIGNED NOT NULL,
    SellingPrice FLOAT UNSIGNED NOT NULL);