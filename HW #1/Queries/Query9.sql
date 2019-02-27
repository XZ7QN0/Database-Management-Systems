USE accidents;

-- Query #9: Display all accidents that occurred last month

SELECT * FROM Accidents

WHERE MONTH(date) = 1;