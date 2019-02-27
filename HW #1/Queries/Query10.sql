USE accidents;

-- Query #10: Display all accidents with BMW cars

SELECT 
Accidents.report_ID AS "Report #", 
DATE_FORMAT(Accidents.date, "%M %d, %Y") AS "Date of Accident",
Cars.year AS "Car Year",
Cars.make AS "Make",
Cars.model AS "Model"

FROM Participated
LEFT JOIN Accidents on Participated.report_ID = Accidents.report_ID
LEFT JOIN Cars on Participated.license = Cars.license

WHERE make = "BMW";