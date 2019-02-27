USE accidents;

-- Query #11: Get the total damage amount from this year's accidents

SELECT SUM(damage_amount) FROM Participated
LEFT JOIN Accidents ON Participated.report_ID = Accidents.report_ID

WHERE YEAR(Accidents.date) = 2019;