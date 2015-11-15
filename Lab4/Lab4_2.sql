USE lab3;

SET @BelvestId = (SELECT OrganizationId FROM Organizations WHERE Name='ОАО Белвест');

UPDATE Organizations
SET Boss='Смирнов В. Л.'
WHERE OrganizationId = @BelvestId;

SELECT Name, Boss FROM Organizations;