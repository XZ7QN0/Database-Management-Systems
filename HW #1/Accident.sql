
DROP DATABASE IF EXISTS accidents;

CREATE DATABASE IF NOT EXISTS accidents;
USE accidents;

--
-- Database: 'accidents'
--

-- --------------------------------------------------------

--
-- Table structure for table 'Persons'
--

DROP TABLE IF EXISTS Persons;
CREATE TABLE Persons (
  driver_ID integer NOT NULL,
  firstname varchar(40) NOT NULL,
  middlename varchar(40),
  lastname varchar(40) NOT NULL,
  street varchar(40) NOT NULL,
  city varchar(40) NOT NULL,
  state varchar(30) NOT NULL,
  zip varchar(15) NOT NULL,
  PRIMARY KEY  (driver_ID)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
             
--
-- Dumping data for table 'Persons'
--  
    
INSERT INTO Persons (driver_ID, firstname, middlename, lastname, street, city, state, zip) VALUES
(10759, 'John', 'Jacob', 'Abraham', '1234 Willow Street', 'San Francisco', 'California', 94103),
(29236, 'Ashley', 'Kristy', 'Smith', '826 Carlos Way', 'Downey', 'California', 90241),
(23643, 'Alice', 'Merry', 'Anderson', '1291 Brannon Street', 'Mira Loma', 'California', 91752),
(29364, 'Katie', 'Happy', 'Thompson', '314 Luke Lane', 'Springfield', 'California', 90646),
(50284, 'Brianna', 'Alexandra', 'Johnson', '3560 Rhode Island Avenue', 'Los Angeles', 'California', 90001),
(62363, 'Joseph', 'Abel', 'Anders', '3098 Ocello Street', 'San Diego', 'California', 92103),
(72348, 'Matthew', 'Robert', 'Lancer', '1479 Edsel Road', 'Los Angeles', 'California', 90017),
(85368, 'Oliver', 'Adam', 'Williams', '2883 Maxwell Farm Road', 'Weed', 'California', 96094),
(67459, 'Arthur', 'Peter', 'McCoy', '4165 Meadow Lane', 'Napa', 'California', 94559),
(17840, 'Ryan', 'Anthony', 'Pluto', '3425 Woodland Terrace', 'Sacramento', 'California', 95814);

--
-- Table structure for table 'Cars'
--

DROP TABLE IF EXISTS Cars;
CREATE TABLE Cars (
  license varchar(7) NOT NULL,
  make varchar(20) NOT NULL,
  model varchar(20) NOT NULL,
  color varchar(20) NOT NULL,
  year integer NOT NULL,
  PRIMARY KEY (license)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'Cars'
-- 

INSERT INTO Cars (license, make, model, color, year) VALUES
('B3605NF', 'BMW', '535xi', 'gray', 2014),
('Z943J24', 'Lexus', '535xi', 'blue', 2018),
('NW9739B', 'BMW', '330i', 'blue', 2010),
('9DN7AR3', 'Scion', 'xB', 'black', 2006),
('97AD62H', 'Mercedes', 'CLA250', 'red', 2016),
('9ASG7E3', 'Honda', 'Civic', 'black', 2018),
('HW72BT4', 'BMW', 'i8', 'white', 2017),
('3HOE400', 'Audi', '535xi', 'gray', 2014),
('9DF8ASE', 'BMW', 'M5', 'green', 2019),
('D72NR42', 'Toyota', 'RAV4', 'gold', 2009);

--
-- Table structure for table 'Accidents'
--

DROP TABLE IF EXISTS Accidents;
CREATE TABLE Accidents (
  report_ID varchar(7) NOT NULL,
  street varchar(40) NOT NULL,
  city varchar(40) NOT NULL,
  state varchar(30) NOT NULL,
  zip varchar(15) NOT NULL,
  date date NOT NULL,
  PRIMARY KEY (report_ID)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table 'Accidents'
-- 

INSERT INTO Accidents (report_ID, street, city, state, zip, date) VALUES
('174E6', '9115 Ann Drive', 'Harrison Township', 'MI', '48045', '2019-01-08'),
('802D7', '745 W. Anderssen Street', 'Santa Cruz', 'CA', '94303', '2019-01-09'),
('026K4', '75 Baker Drive', 'New Lenox', 'IL', '60451', '2019-01-11'),
('725M3', '970 W. St Margarets Street', 'Westport', 'CT', '06880', '2019-01-26'),
('645F9', '82 Meadowbrook Road', 'Avon Lake', 'OH', '44012', '2019-02-02'),
('345T7', '8739 Indian Summer Road', 'Muskegon', 'MI', '49441', '2019-02-05'),
('815N5', '9432 Greenrose Avenue', 'Rocky Mount', 'NC', '27804', '2019-02-08'),
('812W6', '728 Lancaster Avenue', 'Oxnard', 'CA', '93035', '2019-02-16');

--
-- Table structure for table 'Owns'
-- Table 'Owns' is a relationship set between tables Persons and Cars
-- 

DROP TABLE IF EXISTS Owns;
CREATE TABLE IF NOT EXISTS Owns (
driver_ID integer NOT NULL,
license varchar(7) NOT NULL,
PRIMARY KEY (driver_ID, license),
INDEX Driver_ID (driver_ID ASC),
INDEX License_ID (license ASC),
CONSTRAINT Driver_ID
	FOREIGN KEY (driver_ID) 
    REFERENCES Persons(driver_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
CONSTRAINT License_ID
	FOREIGN KEY (license) 
    REFERENCES Cars(license)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
UNIQUE (driver_ID, license)
)ENGINE=MyISAM DEFAULT CHARSET=UTF8MB4;

INSERT INTO Owns (driver_ID, license) VALUES
(10759, 'NW9739B'),
(29236, 'HW72BT4'),
(23643, 'D72NR42'),
(29364, 'B3605NF'),
(50284, '9ASG7E3'),
(62363, '9DF8ASE'),
(72348, 'Z943J24'),
(85368, '97AD62H'),
(67459, '9DN7AR3'),
(17840, '3HOE400');

--
-- Table structure for table 'Participated'
-- Table 'Participated' is a relationship set between tables Persons, Cars, and Accidents
-- 

DROP TABLE IF EXISTS Participated;
CREATE TABLE Participated (
driver_ID integer NOT NULL,
license varchar(7) NOT NULL,
report_ID varchar(7) NOT NULL,
damage_amount integer NOT NULL,
PRIMARY KEY (driver_ID, license, report_ID),
FOREIGN KEY (driver_ID) REFERENCES Persons(driver_ID),
FOREIGN KEY (license) REFERENCES Cars(license),
FOREIGN KEY (report_ID) REFERENCES Accidents(report_ID),
UNIQUE (driver_ID, license, report_ID)
)ENGINE=MyISAM DEFAULT CHARSET=UTF8MB4;

INSERT INTO Participated(driver_ID, license, report_ID, damage_amount) VALUES
(10759, 'NW9739B', '812W6', 893),
(29236, 'HW72BT4', '815N5', 753),
(23643, 'D72NR42', '345T7', 927),
(29364, 'B3605NF', '645F9', 659),
(85368, '97AD62H', '725M3', 648),
(50284, '9ASG7E3', '026K4', 1275),
(67459, '9DN7AR3', '802D7', 1129),
(72348, 'Z943J24', '174E6', 1739);