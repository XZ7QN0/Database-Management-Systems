USE University;

-- Query 4: Select all the students in California

SELECT 
Students.firstname AS "First Name",
Students.lastname AS "Last Name",
Students.city AS "City",
Students.state AS "State"

FROM Students

WHERE Students.state = "California";