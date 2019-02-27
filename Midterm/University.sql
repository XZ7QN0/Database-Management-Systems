
DROP DATABASE IF EXISTS University;

CREATE DATABASE IF NOT EXISTS University;
USE University;

--
-- Database: 'University'
--

-- --------------------------------------------------------

--
-- Table structure for table 'Students'
--

DROP TABLE IF EXISTS Students;
CREATE TABLE IF NOT EXISTS Students (
  rollNo integer NOT NULL,
  firstname varchar(40) NOT NULL,
  lastname varchar(40) NOT NULL,
  street varchar(40) NOT NULL,
  city varchar(40) NOT NULL,
  state varchar(30) NOT NULL,
  zip varchar(15) NOT NULL,
  PRIMARY KEY  (rollNo)
) ENGINE=MyISAM DEFAULT CHARSET=UTF8MB4;
             
--
-- Dumping data for table 'Students'
--  
    
INSERT INTO Students (rollNo, firstname, lastname, street, city, state, zip) VALUES
(10759, 'John',   'Abraham',   '1234 Willow Street',  'San Francisco', 'California', 94103),
(29236, 'Ashley', 'Smith',     '826 Carlos Way',      'Downey',        'California', 90241),
(23643, 'Alice',  'Anderson',  '1291 Brannon Street', 'Mira Loma',     'California', 91752),
(29364, 'Katie',  'Thompson',  '314 Luke Lane',       'Springfield',   'California', 90646),
(50284, 'Brie',   'Johansson', '3560 Rhode Island',   'Los Angeles',   'California', 90001);

--
-- Table structure for table 'Courses'
--

DROP TABLE IF EXISTS Courses;
CREATE TABLE IF NOT EXISTS Courses (
  courseID varchar(5) NOT NULL,
  title varchar(30) NOT NULL,
  PRIMARY KEY (courseID)
) ENGINE=MyISAM DEFAULT CHARSET=UTF8MB4;

--
-- Dumping data for table 'Courses'
-- 

INSERT INTO Courses (courseID, title) VALUES
('104PD', 'Database Placements'  ),
('728LR', 'Logic and Reasoning'  ),
('835NW', 'New World Programming'),
('827MS', 'Microsoft Servers'    ),
('435QL', 'SQL Conceptualization');

--
-- Table structure for table 'Enrolled'
-- Table 'Enrolled' is a relationship set between tables Students and Courses
-- 

DROP TABLE IF EXISTS Enrolled;

CREATE TABLE IF NOT EXISTS Enrolled (
rollNo integer NOT NULL,
courseID varchar(5) NOT NULL,
joining_date date NOT NULL,
PRIMARY KEY (rollNo, courseID),
INDEX studentID (rollNo ASC),
INDEX cID (courseID ASC),
CONSTRAINT studentID
	FOREIGN KEY (rollNo) 
    REFERENCES Students(rollNo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
CONSTRAINT cID
	FOREIGN KEY (courseID) 
    REFERENCES Courses(courseID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
UNIQUE (rollNo, courseID)
)ENGINE=MyISAM DEFAULT CHARSET=UTF8MB4;

INSERT INTO Enrolled (rollNo, courseID, joining_date) VALUES
(10759, '104PD', '2019-01-10'),
(29236, '728LR', '2019-01-10'),
(23643, '835NW', '2019-01-10'),
(29364, '827MS', '2019-01-10'),
(50284, '435QL', '2019-01-17'),
(10759, '728LR', '2019-01-26'),
(29236, '835NW', '2019-01-13'),
(23643, '827MS', '2019-01-26'),
(29364, '435QL', '2019-01-13'),
(50284, '104PD', '2019-01-17'),
(10759, '835NW', '2019-01-26'),
(29236, '827MS', '2019-01-13'),
(23643, '435QL', '2019-01-17'),
(29364, '104PD', '2019-01-13'),
(50284, '827MS', '2019-01-26');