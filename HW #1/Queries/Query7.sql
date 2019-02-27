USE accidents;

-- Query #7: Select all BMW cars from table Cars, listing out owner's names as well

SELECT 
Persons.firstname AS "First Name", 
Persons.middlename as "Middle Name", 
Persons.lastname AS "Last Name", 
Cars.year AS "Year",
Cars.make AS "Make",
Cars.model AS "Model"

FROM Owns
LEFT JOIN Persons on Owns.driver_ID = Persons.driver_ID
LEFT JOIN Cars on Owns.license = Cars.license

WHERE make = "BMW";