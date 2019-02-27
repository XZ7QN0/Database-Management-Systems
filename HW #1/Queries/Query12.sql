USE accidents;

-- Query #12: Get the total damage amount from all BMW cars

SELECT SUM(damage_amount) FROM Participated
LEFT JOIN Cars ON Participated.license = Cars.license

WHERE Cars.make = "BMW";