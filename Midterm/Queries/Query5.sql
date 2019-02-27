USE University;

-- Query 5: Select all the students in California taking a particular course
-- The options for courseID are as follows:
-- 	-> 104PD
-- 	-> 728LR
-- 	-> 835NW
-- 	-> 827MS 
-- 	-> 435QL

SELECT 
Students.firstname AS "First Name",
Students.lastname AS "Last Name",
Courses.courseID AS "Course #", 
Courses.title AS "Course Name",
Students.city AS "City",
Students.state AS "State"

FROM Enrolled
LEFT JOIN Students ON Enrolled.rollNo = Students.rollNo
LEFT JOIN Courses ON Enrolled.courseID = Courses.courseID

WHERE Students.state = "California" AND Courses.courseID = "827MS";