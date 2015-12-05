USE lab3;

SELECT Name, TaxNumber, Address
	FROM Organizations
    WHERE Organizations.OrganizationId 
		IN (SELECT Suppliers.OrganizationId FROM Suppliers);
