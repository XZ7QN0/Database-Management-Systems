USE accidents;

-- Query #13: Get all drivers' ID that were in an accident last month

SELECT 
Persons.driver_ID AS "Driver License ID",
Persons.firstname AS "First Name",
Persons.lastname AS "Last Name",
Accidents.date AS "Accident Date",
Participated.damage_amount AS "Damages"

FROM Participated
LEFT JOIN Cars ON Participated.license = Cars.license
LEFT JOIN Persons ON Participated.driver_ID = Persons.driver_ID
LEFT JOIN Accidents ON Participated.report_ID = Accidents.report_ID

WHERE MONTH(Accidents.date) = 1;