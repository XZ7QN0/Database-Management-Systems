USE University;

-- Query 2: Select all the students enrolled in a particular date
-- The options for joining_date are as follows:
-- 	-> 2019-01-10
-- 	-> 2019-01-13
-- 	-> 2019-01-17
-- 	-> 2019-01-26

SELECT 
Students.firstname AS "First Name",
Students.lastname AS "Last Name",
Courses.courseID AS "Course #", 
Courses.title AS "Course Name",
Enrolled.joining_date AS "Enrollment Date"

FROM Enrolled
LEFT JOIN Students ON Enrolled.rollNo = Students.rollNo
LEFT JOIN Courses ON Enrolled.courseID = Courses.courseID

WHERE Enrolled.joining_date = "2019-01-17";