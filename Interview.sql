
DROP DATABASE IF EXISTS interview;

CREATE DATABASE IF NOT EXISTS interview;
USE interview;

--
-- Database: 'interview'
--

-- --------------------------------------------------------

--
-- Table structure for table 'Employee'
--

DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
  Employee_ID integer NOT NULL,
  First_name varchar(40) NOT NULL,
  Last_name varchar(40) NOT NULL,
  Salary Decimal (10,2),
  Joining_date date,
  Department varchar(40) NOT NULL,
  PRIMARY KEY  (Employee_ID)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
             
--
-- Dumping data for table 'nwCustomers'
--  
    
INSERT INTO Employee (Employee_ID, First_Name, Last_Name, Salary, Joining_date, Department) VALUES
(1, 'John', 'Abraham', 1000000, '2013-01-01', 'Banking'),
(2, 'Michael', 'Clarke', 800000, '2013-01-01', 'Insurance'),
(3, 'Tony', 'Thomas', 700000, '2013-02-01', 'Banking'),
(4, 'Tom', 'Jose', 600000, '2013-02-01', 'Insurance'),
(5, 'Jerry', 'Pinto', 650000, '2013-02-01', 'Insurance'),
(6, 'Philip', 'Mathew', 750000, '2013-01-01', 'Services'),
(7, 'TestName1', '123', 650000, '2013-01-01', 'Services'),
(8, 'TestName2', 'Lname%', 600000, '2013-02-01', 'Insurance');


DROP TABLE IF EXISTS Incentives;
CREATE TABLE Incentives (
  Employee_REF_ID integer NOT NULL,
  Incentive_date date,
  Incentive_amount Decimal (10,2),
  Foreign KEY  (Employee_REF_ID) REFERENCES Employee(Employee_Id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO Incentives (Employee_REF_ID, Incentive_date, Incentive_amount) VALUES
(1, '2013-02-01', 5000),
(2, '2013-02-01', 3000),
(3, '2013-02-01', 4000),
(1, '2013-01-01', 4500),
(2, '2013-01-01', 4500);

