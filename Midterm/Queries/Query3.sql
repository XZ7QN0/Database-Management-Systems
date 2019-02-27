USE University;

-- Query 3: Select list of courses taken by a particular student
-- The options for student's first name are as follows:
-- 	-> John
-- 	-> Ashley
-- 	-> Alice
-- 	-> Katie
--  -> Brie

SELECT 
Students.firstname AS "First Name",
Students.lastname AS "Last Name",
Courses.courseID AS "Course #", 
Courses.title AS "Course Name",
Enrolled.joining_date AS "Enrollment Date"

FROM Enrolled
LEFT JOIN Students ON Enrolled.rollNo = Students.rollNo
LEFT JOIN Courses ON Enrolled.courseID = Courses.courseID

WHERE Students.firstname = "Alice";