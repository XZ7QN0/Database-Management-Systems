USE University;

-- Query 1: Select all the students enrolled in a course
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
Courses.title AS "Course Name"

FROM Enrolled
LEFT JOIN Students ON Enrolled.rollNo = Students.rollNo
LEFT JOIN Courses ON Enrolled.courseID = Courses.courseID

WHERE Courses.courseID = "827MS";